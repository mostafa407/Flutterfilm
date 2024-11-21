import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_film/business_logic/cubit/character/character_cubit.dart';
import 'package:flutter_film/constant/colors.dart';
import 'package:flutter_film/data/models/character.dart';
import 'package:flutter_film/presentation/widgets/character_item.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
  late List<Character> searchAllCharacters;
  bool isSearched = false;
  final searchTextController = TextEditingController();

  Widget _builSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColor.grey,
      decoration: InputDecoration(
          hintText: "find a character.....",
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyColor.grey, fontSize: 18)),
      onChanged: (searchedChanged) {
        addSearchForItemToSearchedList(searchedChanged);
      },
    );
  }

  void addSearchForItemToSearchedList(String searchedChanged) {
    searchAllCharacters = allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedChanged))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearched) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: MyColor.grey,
          ),
        )
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(
              Icons.search,
              color: MyColor.grey,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearched = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearched = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharacterCubit>(context).getAllFilm()!;
  }

  Widget widgetBlocBuilder() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacters = (state).characters;
          return buildLoded();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColor.yellow,
      ),
    );
  }

  Widget buildLoded() {
    return SingleChildScrollView(
      child: Container(
        color: MyColor.grey,
        child: Column(
          children: [buildCharacterList()],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchTextController.text.isEmpty
          ? allCharacters.length
          : searchAllCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchAllCharacters[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      "Characters",
      style: TextStyle(color: MyColor.grey),
    );
  }

  Widget buildNoInternetWidget(){
    return Center(
      child: Container(
        color: MyColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Can\'t connect",style: TextStyle(
              fontSize: 20,
              color: MyColor.grey,

            ),),
            Image.asset("assets/images/no_internet.png",fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.yellow,
        title: isSearched ? _builSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
            connectivityBuilder:  (
                BuildContext context,
                List<ConnectivityResult> connectivity,
                Widget child,
            ){
              final bool connected = !connectivity.contains(ConnectivityResult.none);
                if(connected){
                  return widgetBlocBuilder();
                }else{
                  return buildNoInternetWidget();
                }
            },
            child: showLoadingIndicator()),

      );

      //widgetBlocBuilder(),

  }
}
