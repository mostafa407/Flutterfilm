// import 'package:flutter/material.dart';
// import 'package:flutter_film/constant/colors.dart';
// import 'package:flutter_film/data/models/character.dart';
// import 'package:flutter_film/presentation/screens/character_screen.dart';
// class buildSearchField extends StatelessWidget {
//   final Character character;
//   final CharacterScreen characterScreen;
//   const buildSearchField({super.key, required this.character, required this.characterScreen});
//
//   @override
//   Widget build(BuildContext context) {
//     late List<Character> searchAllCharacters;
//
//     final searchTextController= TextEditingController();
//     return Scaffold(
//       body:TextField(
//         controller: searchTextController,
//         cursorColor: MyColor.grey,
//         decoration: InputDecoration(
//           hintText: "find a character.....",
//           border: InputBorder.none,
//           hintStyle: TextStyle(
//             color: MyColor.grey,fontSize: 18
//           )
//         ),
//         onChanged: (searchedChanged) {
//         addSearchForItemToSearchedList(searchedChanged);
//         },
//       ),
//     );
//   }
// }
//
// void addSearchForItemToSearchedList(String searchedChanged,List<Character>searchAllCharacters) {
//
// }
