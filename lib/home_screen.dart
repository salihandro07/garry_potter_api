import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    request();
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(child: Column(
        children: [
          FutureBuilder(
              future: request(),
              builder: (context, snapshot) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(itemBuilder: (context, index) {
                    final image = snapshot.data![index];
                    return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(image));
                  }, itemCount: snapshot.data!.length),
                );
              }
          ),
        ],
      )),
      );
  }


  Future<List<String>> request() async {
    final dio = Dio();
    Response response;
    response = await dio.get('https://potterapi-fedeperin.vercel.app/en/characters');
    List<String> images = response.data.map<String>((
        item) => item['image'] as String).toList();
    print(response.data.toString());
    return images;
  }
}
