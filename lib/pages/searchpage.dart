import 'package:flutter/material.dart';

import '../components/custom_appbar.dart';
import '../components/custom_list_tile.dart';
import '../services/fetch_games_list.dart';
import '../models/game_list.dart';
import '../models/game.dart';
import '../components/custom_drawer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.subtitle});
  final String subtitle;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final gameName = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: CustomAppbar(subtitle: widget.subtitle),
      body: Center(
        child: FutureBuilder<GameList>(
          future: fetchGamesList(gameName),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Unable to Fetch Data'),
              );
            }
            if (snapshot.data == null) {
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            } else {
              return ListView.separated(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: snapshot.data!.count,
                itemBuilder: (context, index) {
                  final Game searchedGame =
                      Game.fromJson(snapshot.data!.games![index]);
                  return CustomListTile(
                    listGame: searchedGame,
                    tapDisabled: false,
                    dismissable: false,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
