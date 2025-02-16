import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garry_potter_api/character_model.dart';

import 'character_cubit.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Characters'),
      ),
      body: BlocBuilder<CharacterCubit, List<Character>>(
        builder: (context, characters) {
          if (characters.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(character.image),
                ),
                title: Text(character.name),
                subtitle: Text(character.house),
              );
            },
          );
        },
      ),
    );
  }
}