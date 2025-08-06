import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/faliure.dart';
import 'package:fruit_app/core/exception/exception_custom.dart';
import 'package:fruit_app/core/firebase/database_service.dart';
import 'package:fruit_app/core/firebase/firbase_service.dart';
import 'package:fruit_app/core/utils/backend_end_points.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepoImpl extends AuthRepo {
  final FirbaseAuthService firbaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firbaseAuthService,
  });
  //// Create user with email and password
  @override
  Future<Either<Faliure, UserEntities>> createEmialAndPassword(
    String emailAddress,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firbaseAuthService.createEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );
      var userModel = UserEntities(
        imageUrl: '',
        name: name,
        emailAddress: emailAddress,
        uId: user.uid,
      );
      await addUserData(user: userModel);
      var userData = await getUserData(documentId: user.uid);
      return right(userData);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      log('AuthRepoImpl.createUserWithEmailAndPassword${e.toString()}');
      return left(ServerFaluire(message: e.message));
    } catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFaluire(message: e.toString()));
    }
  }

  //// Sign in with email and password
  @override
  Future<Either<Faliure, UserEntities>> signinEmialAndPassword(
    String emailAddress,
    String password,
  ) async {
    User? user;
    try {
      user = await firbaseAuthService.sigininWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );
      var userData = await getUserData(documentId: user.uid);
      return right(userData);
    } on ExceptionCustom catch (e) {
      return left(ServerFaluire(message: e.message));
    }
  }

  //// Sign in with Google
  @override
  Future<Either<Faliure, UserEntities>> signinWithGoogle() async {
    User? user;
    try {
      user = await firbaseAuthService.signInWithGoogle();
      var userModel = UserEntities(
        imageUrl: user.photoURL ?? '',
        name: user.displayName ?? '',
        emailAddress: user.email ?? '',
        uId: user.uid,
      );

      var isUserExists = await databaseService.isUserExists(
        path: BackendEndPoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await addUserData(user: userModel);
      } else {
        await getUserData(documentId: user.uid);
      }
      return right(userModel);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFaluire(message: e.message));
    } catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFaluire(message: e.toString()));
    }
  }

  /// Sign in with Facebook
  @override
  Future<Either<Faliure, UserEntities>> signinWithFacebook() async {
    User? user;
    try {
      user = await firbaseAuthService.signInWithFacebook();
      var userModel = UserEntities(
        imageUrl: user.photoURL ?? '',
        name: user.displayName ?? '',
        emailAddress: user.email ?? '',
        uId: user.uid,
      );
      await addUserData(user: userModel);
      return right(userModel);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFaluire(message: e.toString()));
    } catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFaluire(message: e.toString()));
    }
  }

  ///
  @override
  Future<void> addUserData({required UserEntities user}) async {
    await databaseService.addData(
      data: user.toMap(),
      path: BackendEndPoints.addUserData,
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntities> getUserData({required String documentId}) async {
    var userData = await databaseService.getData(
      path: BackendEndPoints.getUserData,
      documentId: documentId,
    );
    return UserModel.fromJson(userData);
  }
}
