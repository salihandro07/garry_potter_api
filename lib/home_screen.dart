import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    request();
    return Column(children: [],);
  }


  void request() async {
    final dio = Dio();
    Response response;
    response = await dio.get('https://potterapi-fedeperin.vercel.app/en/characters');
    print(response.data.toString());
  }
}
