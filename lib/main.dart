import 'package:flutter/material.dart';
import 'pages/searchpage.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const TheBacklog());
}

class TheBacklog extends StatelessWidget {
  const TheBacklog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backlog',
      theme: ThemeData.dark(
        // colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const HomePage(
        subtitle: 'Home',
      ),
      routes: {
        '/GameListViewer': (context) => const SearchPage(subtitle: 'Search')
      },
    );
  }
}
