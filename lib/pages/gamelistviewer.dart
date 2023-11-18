import 'package:the_backlog/components/custom_list_tile.dart';
import 'package:the_backlog/services/get_http.dart';
import 'package:flutter/material.dart';

import '../models/game_list.dart';
import '../models/game.dart';

class GameListViewer extends StatefulWidget {
  const GameListViewer({super.key});

  @override
  State<GameListViewer> createState() => _GameListViewerState();
}

class _GameListViewerState extends State<GameListViewer> {
  @override
  Widget build(BuildContext context) {
    final gameName = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: FutureBuilder<GameList>(
          future: fetchGame(gameName),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.count,
                  itemBuilder: (context, index) {
                    final Game sendingGame =
                        Game.fromJson(snapshot.data!.games![index]);
                    return CustomListTile(listGame: sendingGame);
                  });
            }
          },
        ),
      ),
    );
  }
}
