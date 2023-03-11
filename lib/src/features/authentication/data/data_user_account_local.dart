import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinder/src/features/authentication/domain/user_account.dart';

class DataUserAccountLocal {
  static const userAccountKey = 'userAccountKey';

  static getDataUserAccountFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(userAccountKey) ?? '';
    return jsonDecode(result);
  }

  static Future<void> setDataUserAccountToStorage(
    UserAccount userAccount,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userAccountKey, jsonEncode(userAccount.toMap()));
  }
}

class UserAccountRegister {
  static const userAccountRegister = 'userAccountRegister';

  static Future<bool> getUserAccountRegister() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userAccountRegister) ?? false;
  }

  static Future<void> setUserAccountRegister({required bool isRegister}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userAccountRegister, isRegister);
  }

  static Future<void> userAccountLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userAccountRegister);
  }
}
