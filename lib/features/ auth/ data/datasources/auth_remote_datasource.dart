import 'package:dio/dio.dart';
import '../models/user_model.dart';


class AuthRemoteDataSource {

  final Dio dio;

  AuthRemoteDataSource(this.dio);


  /// Login → retourne un UserModel
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        'auth/api/token/',
        data: {'email': email, 'password': password},
      );

      // Si on arrive ici, c'est que le code est 2xx
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      // On attrape spécifiquement les erreurs liées à Dio
      throw _handleDioError(e);
    } catch (e) {
      // On attrape les autres erreurs (ex: erreur de parsing JSON)
      throw Exception('Erreur imprévue : $e');
    }
  }


  /// Get current user → retourne un UserModel
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await dio.get('/auth/me/');

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      // On attrape spécifiquement les erreurs liées à Dio
      throw _handleDioError(e);
    } catch (e) {
      // On attrape les autres erreurs (ex: erreur de parsing JSON)
      throw Exception('Erreur imprévue : $e');
    }
  }


  /// Logout
  Future<void> logout() async {
    await dio.post('/auth/logout/');
  }


/*  Future<UserModelCreateAccount> createAccount(String email, String password, String ville,
      String numeroTel, String nom, String prenom) async {
    try {
      final response = await dio.post(
          '/auth/me/',
          data : { email : email , password : password , ville : ville , numeroTel : numeroTel, nom : nom , prenom : prenom }
      );

      return UserModelCreateAccount.fromJson(response.data);
    } on DioException catch (e) {
      // On attrape spécifiquement les erreurs liées à Dio
      throw _handleDioError(e);
    } catch (e) {
      // On attrape les autres erreurs (ex: erreur de parsing JSON)
      throw Exception('Erreur imprévue : $e');
    }
  }
}*/

}

Exception _handleDioErrors(DioException e) {
  if (e.type == DioExceptionType.badResponse) {
    final message = e.response?.data['message'] ?? 'Échec de la connexion';
    return Exception(message);
  }
  return Exception('Problème de réseau, réessayez plus tard.');
}

Exception _handleDioError(DioException e) {
  if (e.type == DioExceptionType.badResponse) {
    final dynamic data = e.response?.data;

    // On vérifie si 'data' est bien une Map (un dictionnaire) avant d'utiliser ['message']
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? 'Échec de la connexion';
      return Exception(message);
    }

    // Si c'est juste du texte brut
    if (data is String) {
      return Exception(data);
    }
  }

  return Exception('Problème de réseau ou serveur injoignable.');
}