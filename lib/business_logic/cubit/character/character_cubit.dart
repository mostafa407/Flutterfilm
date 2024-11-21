import 'package:bloc/bloc.dart';
import 'package:flutter_film/data/models/character.dart';
import 'package:flutter_film/data/models/dimension.dart';
import 'package:flutter_film/data/repository/character_reposotory.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  List<Character>characters=[];


  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character>getAllFilm(){
    charactersRepository.getAllFilm().then((characters){
      emit(CharacterLoaded(characters));
      this.characters=characters;
    });
    return characters;
  }
  void getName(String charName){
    charactersRepository.getStatus(charName).then((dimension){
      emit(DimensionLoaded(dimension));

    });
  }
}
