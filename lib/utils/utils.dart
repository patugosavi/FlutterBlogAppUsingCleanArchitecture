import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/router/router_imports.gr.dart';

class Utils {
  static Future<void> manipulateLogin(context) async {
    var token = await getToken();
    if (token != null) {
      AutoRouter.of(context).push(const GeneralRoute());
    } else {
      AutoRouter.of(context).push(const OnBoardRoute());
    }
  }

  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<void> clearAllSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  static Future<void> saveLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("locale", locale.toString());
  }

  static Future<Locale?> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var localString = prefs.getString("locale");
    switch (localString) {
      case 'ne-NP':
        return const Locale('ne', 'NP');
      case 'hi-IN':
        return const Locale('hi', 'IN');
      case 'ar-AE':
        return const Locale('ar', 'AE');
      default:
        return const Locale('en', 'US');
    }
  }
}
