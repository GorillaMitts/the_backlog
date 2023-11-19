import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../../.env')
abstract class Env {
  @EnviedField(varName: 'GAMES_DB_API_KEY', obfuscate: true)
  static String gamesDBapiKey = _Env.key1;
}
