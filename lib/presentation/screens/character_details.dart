import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_film/business_logic/cubit/character/character_cubit.dart';
import 'package:flutter_film/constant/colors.dart';
import 'package:flutter_film/data/models/character.dart';
import 'package:flutter_film/presentation/widgets/builDivider.dart';
import 'package:flutter_film/presentation/widgets/charcterInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600.h,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(color: MyColor.white),
        ),
        background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget chechIfLoadedorNot(CharacterState state) {
    if (state is DimensionLoaded) {
      return displayRandomNameOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomNameOrEmptySpace(state) {
    var name = (state).dimension;
    if (name.length != 0) {
     int randomName= Random().nextInt(name.length -1);
      // int randomName = Random().nextInt(name.lenght - 1);
      return Center(
        child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              color: MyColor.white,
              shadows: [
                Shadow(
                  blurRadius: 7,
                  color: MyColor.yellow,
                  offset: Offset(0,0)
                )
              ]
            ),
            child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText(name[randomName].name),
            ])),
      );
    }else{
      return Container(color: MyColor.yellow,);
    }

  }

  Widget showProgressIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: MyColor.yellow,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getName(character.name);
    return Scaffold(
      backgroundColor: MyColor.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Charcterinfo(title: 'Kind :', value: character.species),
                  Buildivider(
                    endIndent: 285.w,
                  ),
                  Charcterinfo(title: 'status :', value: character.status),
                  Buildivider(
                    endIndent: 230.w,
                  ),
                  Charcterinfo(title: 'created :', value: character.created),
                  Buildivider(
                    endIndent: 200,
                  ),
                  Charcterinfo(title: 'url :', value: character.url),
                  Buildivider(
                    endIndent: 280,
                  ),
                  Charcterinfo(title: 'gender :', value: character.gender),
                  Buildivider(
                    endIndent: 250,
                  ),
                  character.type.isEmpty
                      ? Container()
                      : Charcterinfo(title: "type :", value: character.type),
                  Buildivider(endIndent: 300),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<CharacterCubit, CharacterState>(
                    builder: (context, state) {
                      return chechIfLoadedorNot(state);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
            )
          ]))
        ],
      ),
    );
  }
}
