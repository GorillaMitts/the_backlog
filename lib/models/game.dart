class Game {
  final int? id;
  final String? gameTitle;
  final String? releaseDate;
  final int? platform;
  final int? regionId;
  final int? countryId;
  final List? developers;

  const Game({
    required this.id,
    required this.gameTitle,
    required this.releaseDate,
    required this.platform,
    required this.regionId,
    required this.countryId,
    required this.developers,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int?,
      gameTitle: json['game_title'] as String?,
      releaseDate: json['release_date'] as String?,
      platform: json['platform'] as int?,
      regionId: json['region_id'] as int?,
      countryId: json['country_id'] as int?,
      developers: json['developers'] as List?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'game_title': gameTitle,
      'release_date': releaseDate,
      'platform': platform,
      'region_id': regionId,
      'country_id': countryId,
      'developers': developers,
    };
  }
}
