
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String get fileName => kReleaseMode ? '.env.production' : '.env.development';
  static String get publicApiKey =>  dotenv.env['PUBLICAPIKEY'] ?? "MY_FALLBACK";
  static String get privateKey =>  dotenv.env['PRIVATEKEY'] ?? "MY_FALLBACK";
  static String get basePath =>  dotenv.env['BASEURL'] ?? "MY_FALLBACK";
}