import 'package:flutter/material.dart';

import '../models/game.dart';
import '../components/custom_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _gameList = [
    {
      'id': 2236,
      'game_title': 'Super Mario Sunshine',
      'release_date': '2002-08-25',
      'platform': 2,
      'region_id': 2,
      'country_id': 0,
      'developers': [6043],
    },
    {
      'id': 73159,
      'game_title': 'Super Mario 64 [Player\'s Choice]',
      'release_date': '1996-09-29',
      'platform': 3,
      'region_id': 2,
      'country_id': 0,
      'developers': [6043],
    },
  ];

  TextEditingController titleFieldController = TextEditingController();

  void _addGame(String gameTitle) {
    setState(() {
      _gameList.add({
        'game_title': gameTitle,
        'developers': [3],
        'platform': 2,
        'dateAdded': DateTime.now().toString()
      });
      titleFieldController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _gameList.length,
        itemBuilder: (BuildContext context, int index) {
          final Game sendingGame = Game.fromJson(_gameList[index]);
          return CustomListTile(listGame: sendingGame);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        tooltip: 'Add Game',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Games'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleFieldController,
                decoration: const InputDecoration(labelText: "Game Title"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Search'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/GameListViewer',
                    arguments: titleFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
