import 'package:flutter/material.dart';

import '../services/database.dart';
import '../models/game.dart';
import '../components/custom_list_tile.dart';
import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.subtitle});
  final String subtitle;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: CustomAppbar(subtitle: widget.subtitle),
      body: FutureBuilder<List<Game>>(
          future: DatabaseHelper.instance.getGames(),
          builder: (BuildContext context, AsyncSnapshot<List<Game>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No games in your backlog.",
                          textAlign: TextAlign.center,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text('Tap '),
                            Icon(Icons.search),
                            Text(' to add games.'),
                          ],
                        )
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final Game backloggedGame = snapshot.data![index];
                      return CustomListTile(
                        listGame: backloggedGame,
                        tapDisabled: true,
                        dismissable: true,
                      );
                    },
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        tooltip: 'Add Game',
        child: const Icon(Icons.search),
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
                        arguments: titleFieldController.text)
                    .then((_) => setState(() {}));
                titleFieldController.text = '';
              },
            ),
          ],
        );
      },
    );
  }
}
