part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

final class CharacterInitial extends CharacterState {}
final class CharacterLoaded extends CharacterState{
  final List<Character>characters;
  CharacterLoaded(this.characters);
}
class CharacterSuccessState extends CharacterState{}
class CharacterErrorState extends CharacterState{
  String message;
  CharacterErrorState(this.message);
}
class DimensionLoaded extends CharacterState{
  final List<Dimension> dimension;
  DimensionLoaded(this.dimension);
}

