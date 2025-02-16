import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garry_potter_api/character_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CharacterCubit extends Cubit<List<Character>> {
  CharacterCubit() : super([]);

  final String apiUrl = 'https://garry-potter-api.herokuapp.com/characters';

  Future<void> fetchCharacters() async {
    final box = Hive.box('charactersBox');

    // Проверяем подключение к интернету
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // Если интернета нет, загружаем данные из локального хранилища
      if (box.containsKey('characters')) {
        final localData = box.get('characters');
        final characters = List<Character>.from(
          localData.map((x) => Character.fromJson(x)),
        );
        emit(characters);
      }
      return;
    }

    // Загрузка данных из API
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final characters = data.map((json) => Character.fromJson(json)).toList();

      // Сохраняем данные в Hive
      box.put('characters', data);

      emit(characters);
    } else {
      throw Exception('Failed to load characters');
    }
  }
}