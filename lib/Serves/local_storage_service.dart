import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;
  LocalStorageService._internal();

  static SharedPreferences? _prefs;

  // Initialize shared preferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save data
  Future<bool> saveData(String key, String data) async {
    if (_prefs == null) await init();
    return await _prefs!.setString(key, data);
  }

  // Get data
  String? getData(String key) {
    return _prefs?.getString(key);
  }

  // Remove data
  Future<bool> removeData(String key) async {
    if (_prefs == null) await init();
    return await _prefs!.remove(key);
  }

  // Check if key exists
  bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }

  // Clear all data
  Future<bool> clearAll() async {
    if (_prefs == null) await init();
    return await _prefs!.clear();
  }
}
