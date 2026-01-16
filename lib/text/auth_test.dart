import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import '../features/ auth/ data/datasources/auth_remote_datasource.dart';

void main() {
  test('Doit retourner un UserModel quand le login réussit', () async {
    // 1. On configure Dio comme dans ton injection_container
    final dio = Dio(BaseOptions(baseUrl: 'https://reunion-backend-eu5v.onrender.com/'));
    final dataSource = AuthRemoteDataSource(dio);

    // 2. On appelle la méthode directement (sans UI !)
    final result = await dataSource.login('test@email.com', 'password123');

    // 3. On vérifie si ça marche
    expect(result.email, 'test@email.com');
    print('Succès ! Nom de l\'utilisateur : ${result.email}');
  });
}