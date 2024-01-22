import 'package:flutter/material.dart';
import 'package:webcomic/models/webcomic_model.dart';
import 'package:webcomic/services/api_service.dart';
import 'package:webcomic/widgets/webcomic_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebComicModel>> webcomics = ApiService.getTodaysComics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        foregroundColor: Colors.grey,
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
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        surfaceTintColor: Colors.white,
        child: Center(
          child: Column(
            children: [
              Text(
                "Giselle Kim",
                style: TextStyle(color: Colors.black38),
              ),
              Text(
                "2024",
                style: TextStyle(color: Colors.black38),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebComicModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webcomic = snapshot.data![index];
        return Webcomic(
            title: webcomic.title, thumb: webcomic.thumb, id: webcomic.id);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}

Widget checkImage(String url) {
  try {
    return Image.network(url);
  } catch (e) {
    return const Icon(Icons.image);
  }
}
