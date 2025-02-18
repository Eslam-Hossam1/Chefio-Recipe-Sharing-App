import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvConfig {
  static String get webServerClientId => dotenv.env['Web_Server_Client_ID']!;
  static String get webClientId => dotenv.env['Web_Client_ID']!;
}
