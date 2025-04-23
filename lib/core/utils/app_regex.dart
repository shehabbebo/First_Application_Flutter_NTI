class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,}$',
    ).hasMatch(password);
  }

  // static bool isPasswordValid(String password) {
  //   return RegExp(r'^\d{9,}$').hasMatch(password);
  // }

  static bool hasLowerCase(String input) {
    return input.contains(RegExp(r'[a-z]'));
  }

  static bool hasUpperCase(String input) {
    return input.contains(RegExp(r'[A-Z]'));
  }

  static bool hasNumber(String input) {
    return input.contains(RegExp(r'\d'));
  }

  static bool hasSpecialCharacter(String input) {
    return input.contains(RegExp(r'[!@#\$&*~]'));
  }

  static bool hasMinLength(String input, [int minLength = 8]) {
    return input.length >= minLength;
  }
}
