import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_film/business_logic/cubit/character/character_cubit.dart';
import 'package:flutter_film/constant/string.dart';
import 'package:flutter_film/data/models/character.dart';
import 'package:flutter_film/data/repository/character_reposotory.dart';
import 'package:flutter_film/data/web_servec/web_services.dart';
import 'package:flutter_film/presentation/screens/character_details.dart';
import 'package:flutter_film/presentation/screens/character_screen.dart';

class AppRoute {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRoute() {
    charactersRepository = CharactersRepository(CharacterWebService());
    characterCubit = CharacterCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => characterCubit,
                child: CharacterScreen(),
              ),
        );
      case characterDetailsScreen:
        final charcter=settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) =>
                BlocProvider(
                  create: (context) => CharacterCubit(charactersRepository),
                  child: CharacterDetailsScreen(character: charcter),
                ),
        );

    }
  }
}
