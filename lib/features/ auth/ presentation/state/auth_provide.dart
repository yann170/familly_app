import 'package:flutter/material.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import 'auth_state.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthState _state = const AuthState();
  AuthState get state => _state;

  AuthProvider({
    required this.loginUseCase,
    required this.logoutUseCase,
  });

  /// Action : login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    _state = _state.copyWith(
      isLoading: true,
      error: null,
    );
    notifyListeners();

    try {
      final user = await loginUseCase.execute(
        email: email,
        password: password,
      );

      _state = _state.copyWith(
        isLoading: false,
        user: user,
      );
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
    notifyListeners();
  }

  /// Action : logout
  Future<void> logout() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    await logoutUseCase.execute();

    _state = const AuthState();
    notifyListeners();
  }
}
