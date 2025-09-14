mixin ValidationMixin {
  String? validatePassword(String value) {
    if (value.length < 8 || !value.contains('@')) {
      return 'Password must be at least 8 characters.';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!value.contains('@') && value.length < 5) {
      return 'Please enter a valid email.';
    }
    return null;
  }
}
