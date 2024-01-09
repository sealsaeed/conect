import 'package:conect/app/features_modules/auth/domain/providers/state/auth_state.dart';
import 'package:conect/app/features_modules/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(super.state, this._authRepository);

  final AuthRepo _authRepository;
  Future register(
      {required String email,
      required String username,
      required String password}) async {
    state = state.copyWith(isLoading: true);

    try {
      User? user = await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        await user.updateDisplayName(username);
        state.copyWith(isLoading: false, isAuth: true);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future GoogleSign() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await _authRepository.signInWithGoogle();
      if (user != null) {
        state = state.copyWith(isLoading: false, isAuth: true);
        return true;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw e.toString();
    }
  }

  Future signout() async {
    try {} catch (e) {}
  }
}
