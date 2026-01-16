/*
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class createAccountUseCase {
  final AuthRepository repository;

  createAccountUseCase(this.repository);

  /// Appelle le repository pour connecter un utilisateur
  /// Retourne l'entité User si succès
  Future<User> execute({
    required String email,
    required String password,
    required String confirmPassword,
    required String ville,
    required String numeroTel,
    required String nom,
    required String prenom
  }) {
    return repository.createAccount(
        email: email,
        password: password,
        ville: ville,
        numeroTel: numeroTel,
        nom: nom,
        prenom: prenom
    );
  }
}*/
