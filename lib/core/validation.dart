class Validation {
  static String? validateNotEmpty({String? value, String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field cannot be empty';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final emptyCheck = validateNotEmpty(
      value: value,
      message: 'Please enter your email',
    );
    if (emptyCheck != null) {
      return emptyCheck;
    }

    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegExp.hasMatch(value!)) {
      return 'Please enter a valid email address';
    }

    return null; // Input is valid
  }
}
