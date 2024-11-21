import 'package:flutter_film/data/models/character.dart';
import 'package:flutter_film/data/models/dimension.dart';
import 'package:flutter_film/data/web_servec/web_services.dart';

class CharactersRepository{
   final CharacterWebService characterWebService;
   CharactersRepository(this.characterWebService);

   Future<List<Character>>getAllFilm()async{
     final characters=await characterWebService.getAllFilm();
     return characters.map((character)=>Character.fromJson(character)).toList();
   }
  Future<List<Dimension>>getStatus(String  charName) async{
     final dimensions=await characterWebService.getStatus(charName);
     return dimensions.map((charQuery)=>Dimension.fromJson(charQuery)).toList();
  }
}