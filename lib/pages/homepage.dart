import 'package:flutter/material.dart';

import '../models/game.dart';
import '../components/custom_list_tile.dart';
import '../components/custom_appbar_title.dart';
import '../components/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.subtitle});
  final String subtitle;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: CustomAppbarTitle(
          subtitle: widget.subtitle,
        ),
      ),
      body: ListView.separated(
        itemCount: _gameList.length,
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          final Game backloggedGame = Game.fromJson(_gameList[index]);
          return CustomListTile(listGame: backloggedGame);
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
                titleFieldController.text = '';
              },
            ),
          ],
        );
      },
    );
  }
}
