import '../../domain/entities/user.dart';

class AuthState {
  /// Indique si une action est en cours (login, logout, etc.)
  final bool isLoading;

  /// Utilisateur connecté (null si non connecté)
  final User? user;

  /// Message d’erreur éventuel
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  /// Permet de créer un nouvel état à partir de l’ancien
  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}
