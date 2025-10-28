import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntities>> createEmialAndPassword(
    String emailAddress,
    String password,
    String name,
  );

  Future<Either<Failure, UserEntities>> signinEmialAndPassword(
    String emailAddress,
    String password,
  
  );
  Future<Either<Failure, UserEntities>> signinWithGoogle();
  Future<Either<Failure, UserEntities>> signinWithFacebook();

  Future<void> addUserData({required UserEntities user});
  Future<void> saveUserData({required UserEntities user});
  Future <UserEntities> getUserData({ required String documentId});
 
}
