// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthState {
  final bool? isAuth;
  final bool? isLoading;
  final String? error;

  AuthState({
    this.isAuth,
    this.isLoading,
    this.error,
  });
// تسمحلي بدال لا اسوي => instance من الكلاس اخذ كوبي منه بدون لا اغير قيمهم او اصفرهم ف يحتفظ بالقيم الاساسيه انا اخذ كوبي

  AuthState copyWith({
    bool? isAuth,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuth: isAuth ?? this.isAuth,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
