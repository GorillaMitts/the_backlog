import 'package:the_backlog/pages/gamelistviewer.dart';
import 'package:flutter/material.dart';
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
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Video Game Backlog'),
      routes: {'/GameListViewer': (context) => const GameListViewer()},
    );
  }
}
