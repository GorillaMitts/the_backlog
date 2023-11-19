import 'package:flutter/material.dart';

import '../services/database.dart';
import '../models/game.dart';

class CustomListTile extends StatelessWidget {
  final Game listGame;
  final bool tapDisabled;
  final bool dismissable;

  const CustomListTile(
      {super.key,
      required this.listGame,
      required this.tapDisabled,
      required this.dismissable});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        listGame.id.toString(),
      ),
      background: Container(
        color: Colors.red,
        child: Row(children: [
          Expanded(
            child: Container(),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.delete),
          )
        ]),
      ),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: SizedBox(
          height: 200.0,
          width: 50.0,
          child: Hero(
            tag: listGame.id.toString(),
            child: Image.network(
                'https://cdn.thegamesdb.net/images/thumb/boxart/front/${listGame.id}-1.jpg'),
          ),
        ),
        title: Text(
          '${listGame.gameTitle}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Released: ${listGame.releaseDate}'),
        trailing: dismissable
            ? const Icon(Icons.drag_indicator)
            : Text(
                listGame.platform.toString(),
              ),
        onTap: tapDisabled
            ? null
            : () async {
                await DatabaseHelper.instance.add(listGame).then(
                      (val) => Navigator.pop(context),
                    );
              },
      ),
      onDismissed: (direction) {
        DatabaseHelper.instance.remove(listGame.id!);

        // Then show a snackbar.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${listGame.gameTitle} was deleted',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
