import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  /// Retourne l'utilisateur connecté
  Future<User> execute() {
    return repository.getCurrentUser();
  }
}
