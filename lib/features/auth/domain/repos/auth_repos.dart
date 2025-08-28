import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/faliure.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';

abstract class AuthRepo {
  Future<Either<Faliure, UserEntities>> createEmialAndPassword(
    String emailAddress,
    String password,
    String name,
  );

  Future<Either<Faliure, UserEntities>> signinEmialAndPassword(
    String emailAddress,
    String password,
  
  );
  Future<Either<Faliure, UserEntities>> signinWithGoogle();
  Future<Either<Faliure, UserEntities>> signinWithFacebook();

  Future<void> addUserData({required UserEntities user});
  Future<void> saveUserData({required UserEntities user});
  Future <UserEntities> getUserData({ required String documentId});
 
}
