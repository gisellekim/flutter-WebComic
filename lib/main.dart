import 'package:flutter/material.dart';
import 'package:webcomic/screens/home_screen.dart';
import 'package:webcomic/services/api_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
