import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garry_potter_api/character_cubit.dart';
import 'package:garry_potter_api/characters_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('charactersBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit()..fetchCharacters(),
      child: MaterialApp(
        title: 'Harry Potter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CharactersScreen(),
      ),
    );
  }
}