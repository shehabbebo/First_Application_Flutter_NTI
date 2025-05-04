import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/cashe/cache_keys.dart';

abstract class TranslationKeys {
  static const Locale localeEN = Locale(CacheKeys.keyEN);
  static const Locale localeAR = Locale(CacheKeys.keyAR);
  static const welcomeToDoIt = "welcome To\nDo It !";
  static const readyToConquer =
      "Ready to conquer your tasks? Let's Do It together.";
  static const letStart = "Let’s Start";
  static const register = "Register";
  static const LogIn = "Log In";
  static const hello = "hello";
  static const SignUp = "SignUp";
  static const addTask = "addTask";
  static const title = "title";
}
