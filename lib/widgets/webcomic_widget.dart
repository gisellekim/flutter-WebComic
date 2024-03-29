import 'package:flutter/material.dart';
import 'package:webcomic/widgets/detail_screen.dart';

class Webcomic extends StatelessWidget {
  final String title, thumb, id;

  const Webcomic({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              width: 250,
              child: Image.network(
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              title,
              softWrap: false,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
