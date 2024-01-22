import 'package:flutter/material.dart';
import 'package:webcomic/models/webcomic_model.dart';
import 'package:webcomic/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebComicModel>> webcomics = ApiService.getTodaysComics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "Today's Comic",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webcomics,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('Data');
          }
          return const Text('Loading');
        },
      ),
    );
  }
}
