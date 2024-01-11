class AuthValidators {
  String? userNameValidator(String? value) {
    if (value != null && value.length > 3) {
      return null;
    } else {
      return "User Name must be more than 3 charecters";
    }
  }

// password validator
  String? passwordVlidator(String? value) {
    final String password = value as String;

    if (password.isEmpty || password.length <= 5) {
      return " password must have at least6 charecters";
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value != null) {
      final bool emailValid = RegExp(
              r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$')
          .hasMatch(value);
      if (emailValid) {
        return null;
      }
    }
    return "Emial is Not Valid";
  }
}
