import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Store? _instance;
  static SharedPreferences? _sharedPreferences;

  static const String keyAccessToken = 'accessToken';
  static const String keyIsFirstEntry = 'isFirstEntry';
  static const String keyIsLoggedIn = 'isLoggedIn';
  static const String keyIsClosedAboutChildren = 'isClosedAboutChildren';
  static const String keyCityId = 'cityId';

  static Future<Store> getInstance() async {
    _instance ??= Store();
    _sharedPreferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  Future<void> setToken(String token) async =>
      await _sharedPreferences!.setString(
        keyAccessToken,
        token,
      );

  String? getToken() => _sharedPreferences!.getString(keyAccessToken);

  Future<bool> clearAll() => _sharedPreferences!.clear();

  bool isFirstEntry() {
    return _sharedPreferences!.getBool(keyIsFirstEntry) ?? true;
  }

  bool isLoggedIn() {
    return _sharedPreferences!.getBool(keyIsLoggedIn) ?? false;
  }

  bool isClosedAboutChildren() {
    return _sharedPreferences!.getBool(keyIsClosedAboutChildren) ?? false;
  }

  Future<void> signOut() async {
    await _sharedPreferences!.remove(keyAccessToken);
    await _sharedPreferences!.remove(keyIsLoggedIn);
  }

  Future<void> setFirstEntry() async => await _sharedPreferences!.setBool(
        keyIsFirstEntry,
        false,
      );

  Future<void> setLoggedIn(bool isLoggedIn) async =>
      await _sharedPreferences!.setBool(
        keyIsLoggedIn,
        isLoggedIn,
      );

  Future<void> closedAboutChildren() async => await _sharedPreferences!.setBool(
        keyIsClosedAboutChildren,
        true,
      );

  int? get cityId => _sharedPreferences!.getInt(keyCityId);

  Future<void> setCityId(int cityId) async => await _sharedPreferences!.setInt(
        keyCityId,
        cityId,
      );
}
