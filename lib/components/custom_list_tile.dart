import 'package:flutter/material.dart';

import '../models/game.dart';

class CustomListTile extends StatelessWidget {
  final Game listGame;

  const CustomListTile({super.key, required this.listGame});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      leading: SizedBox(
        height: 200.0,
        width: 50.0,
        child: Image.network(
            'https://cdn.thegamesdb.net/images/thumb/boxart/front/${listGame.id}-1.jpg'),
      ),
      title: Text('${listGame.gameTitle}',
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Released: ${listGame.releaseDate}'),
      trailing: SizedBox(
        height: 40.0,
        width: 40.0,
        child: Text(
          listGame.platform.toString(),
        ),
      ),
    );
  }
}
