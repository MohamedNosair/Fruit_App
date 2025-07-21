import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/faliure.dart';
import 'package:fruit_app/core/exception/exception_custom.dart';
import 'package:fruit_app/core/firebase/firbase_service.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';

class AuthRepoImpl extends AuthRepos {
  final FirbaseAuthService firbaseAuthService;

  AuthRepoImpl(this.firbaseAuthService);
  @override
  Future<Either<Faliure, UserEntities>> createEmialAndPassword(
    String emailAddress,
    String password,
    String name,
  ) async {
    
    try {
      var user = await firbaseAuthService.createEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );

      return right(UserModel.fromFirbaseUser(user));
    } on ExceptionCustom catch (e) {
      return left(ServerFaluire(message: e.message));
    }
  }
}
