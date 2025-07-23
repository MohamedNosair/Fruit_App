import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/faliure.dart';
import 'package:fruit_app/core/exception/exception_custom.dart';
import 'package:fruit_app/core/firebase/firbase_service.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';

class AuthRepoImpl extends AuthRepo {
  final FirbaseAuthService firbaseAuthService;

  AuthRepoImpl({required this.firbaseAuthService});

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
      log('AuthRepoImpl.createUserWithEmailAndPassword${e.toString()}');
      return left(ServerFaluire(message: e.message));
    }
  }



  @override
  Future<Either<Faliure, UserEntities>> signinEmialAndPassword(
    String emailAddress,
    String password,
  )async {
      try {
      var user = await firbaseAuthService.sigininWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );

      return right(UserModel.fromFirbaseUser(user));
    } on ExceptionCustom catch (e) {
      log('AuthRepoImpl.sigininWithEmailAndPassword${e.toString()}');
      return left(ServerFaluire(message: e.message));
    }
  }
  
  @override
  Future<Either<Faliure, UserEntities>> signinWithGoogle()async {
        try {
      var user = await firbaseAuthService.signInWithGoogle();

      return right(UserModel.fromFirbaseUser(user));
    } catch (e) {
      log('#####${e.toString()}');
      return left(ServerFaluire(message: e.toString()));
    }

  }
}
