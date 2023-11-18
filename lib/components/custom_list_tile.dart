import 'package:flutter/material.dart';

import '../models/game.dart';

class CustomListTile extends StatelessWidget {
  final Game listGame;

  const CustomListTile({super.key, required this.listGame});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 100.0,
        width: 100.0,
        child: Image.network(
            'https://cdn.thegamesdb.net/images/thumb/boxart/front/${listGame.id}-1.jpg'),
      ),
      title: Text('${listGame.gameTitle}'),
      subtitle: Text(
        listGame.releaseDate!,
      ),
      trailing: SizedBox(
        height: 40.0,
        width: 40.0,
        child: Image.network(
            'https://cdn.thegamesdb.net/images/thumb/platform/boxart/${listGame.platform}-1.jpg'),
      ),
    );
  }
}
