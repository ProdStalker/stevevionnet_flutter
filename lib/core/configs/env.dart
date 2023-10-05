import 'package:envied/envied.dart';
import 'package:flutter/foundation.dart';

part 'env.g.dart';

@Envied(path: kReleaseMode ? ".env" : ".env")
abstract class Env {
  @EnviedField(varName: 'TELEGRAM_BOT_TOKEN', defaultValue: '', obfuscate: true)
  static final String telegramBotToken = _Env.telegramBotToken;
  @EnviedField(varName: 'TELEGRAM_CHAT_ID', defaultValue: '', obfuscate: true)
  static final String telegramChatId = _Env.telegramChatId;
}