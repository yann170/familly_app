import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  /// Appelle le repository pour connecter un utilisateur
  /// Retourne l'entité User si succès
  Future<User> execute({required String email, required String password}) {
    return repository.login(email: email, password: password);
  }
}
