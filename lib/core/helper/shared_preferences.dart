import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_tasks/core/helper/extensions.dart';
import 'package:users_tasks/core/networking/cache_constants.dart';

class AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferences({required this.sharedPreferences});

  Future<void> setAccessToken({required String accessToken}) async {
    sharedPreferences.setData(
        key: CacheConstants.accessToken, value: accessToken);
    getAccessToken();
  }

  dynamic getAccessToken() {
    String accessToken =
        sharedPreferences.getString(CacheConstants.accessToken) ?? "";
    return accessToken;
  }

  Future<bool> clearAll() async {
    return await sharedPreferences.clear();
  }

  bool checkTokenExpire() {
    final String token = getAccessToken();
    if (token.isEmpty) {
      return true;
    } else if (token.isNotEmpty) {
      final bool isTokenExpired = JwtDecoder.isExpired(token);
      return isTokenExpired;
    } else {
      return false;
    }
  }
}
