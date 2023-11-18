class GameList {
  final int? count;
  final List? games;

  const GameList({required this.count, required this.games});
  factory GameList.fromJson(Map<String, dynamic> json) {
    return GameList(
        count: json['count'] as int?, games: json['games'] as List?);
  }
}
