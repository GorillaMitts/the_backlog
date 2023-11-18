import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../../.env')
abstract class Env {
  @EnviedField(varName: 'GAMES_DB_API_KEY', obfuscate: true)
  static String gamesDB_apiKey = _Env.key1;
}
