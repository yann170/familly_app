import 'package:familly_apps/features/%20auth/%20data/models/user_model.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login({required String email, required String password}) async {
    final userModel = await remoteDataSource.login(email, password);
    return userModel; // UserModel est compatible avec User
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
  }

  @override
  Future<User> getCurrentUser() async {
    final userModel = await remoteDataSource.getCurrentUser();
    return userModel;
  }

 /* @override
  Future<UserModelCreateAccount> createAccount({required String email, required String nom, required String numeroTel,required String password,required String prenom, required String ville}) async{
    final userCreateAccount = await remoteDataSource.createAccount( email, nom, numeroTel,password, prenom, ville, );
    return userCreateAccount;
  }
*/

}
