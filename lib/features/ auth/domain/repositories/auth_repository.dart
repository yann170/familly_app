import '../entities/user.dart';

abstract class AuthRepository {
  /// Authentifie un utilisateur avec email et mot de passe
  /// Retourne l'utilisateur connecté
  Future<User> login({
    required String email,
    required String password,
  });

  /// Déconnecte l'utilisateur
  /// Supprime la session en cours
  Future<void> logout();
/*

  Future<UserCreateAccount> createAccount({
    required String email,
    required String password,
    required String ville,
    required String numeroTel,
    required String nom,
    required String prenom
});
*/


  /// Retourne l'utilisateur actuellement connecté
  /// Lance une erreur si aucun utilisateur n'est connecté
  Future<User> getCurrentUser();
}


