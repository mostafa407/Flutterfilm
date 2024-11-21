import 'package:flutter/material.dart';
import 'package:flutter_film/constant/colors.dart';
import 'package:flutter_film/constant/string.dart';
import 'package:flutter_film/data/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(characterDetailsScreen,arguments: character);
        },
        child: GridTile(
          child: Hero(
          tag: character.id  
          ,child: Container(
                color: MyColor.grey,
                child: character.image.isNotEmpty ?
                FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/Loaded.gif',
                  image: character.image,
                  fit: BoxFit.cover,):Image.asset("assets/images/m.png"),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text("${character.name}",style: TextStyle(
              height: 1.3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: MyColor.white
            ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
