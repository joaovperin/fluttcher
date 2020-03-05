/// Generic validators
class Validators {
  static String password(String value, PasswordStrength method) {
    return method.validate(value);
  }

  static String email(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }
}

/// Enum to store password strength possibilities
enum PasswordStrength { size_8 }

/// Extends methods to the enum
extension PasswordStrengthExtension on PasswordStrength {
  String validate(value) {
    switch (this) {
      case PasswordStrength.size_8:
        return value < 8 ? 'Password must be longer than 8 characters' : null;
      default:
        throw 'Invalid usage';
    }
  }
}
