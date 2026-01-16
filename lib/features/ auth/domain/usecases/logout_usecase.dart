import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  /// Déconnecte l'utilisateur en cours
  Future<void> execute() async {
    return repository.logout();
  }
}