import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/errors/exception_custom.dart';
import 'package:fruit_app/core/firebase/database_service.dart';
import 'package:fruit_app/core/firebase/firbase_service.dart';
import 'package:fruit_app/core/utils/backend_end_points.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';

class AuthRepoImpl extends AuthRepo {
  final FirbaseAuthService firbaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firbaseAuthService,
  });
  //// Create user with email and password
  @override
  Future<Either<Failure, UserEntities>> createEmialAndPassword(
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
      await saveUserData(user: userData);
      return right(userData);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      log('AuthRepoImpl.createUserWithEmailAndPassword${e.toString()}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  //// Sign in with email and password
  @override
  Future<Either<Failure, UserEntities>> signinEmialAndPassword(
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
      await saveUserData(user: userData);
      return right(userData);
    } on ExceptionCustom catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  //// Sign in with Google
  @override
  Future<Either<Failure, UserEntities>> signinWithGoogle() async {
    User? user;

    try {
      user = await firbaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirbaseUser(user);

      var isUserExists = await databaseService.isUserExists(
        path: BackendEndPoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(documentId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('AuthRepoImpl.signinWithGoogle: ${e.toString()}');
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  /// Sign in with Facebook
  @override
  Future<Either<Failure, UserEntities>> signinWithFacebook() async {
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
      await saveUserData(user: userModel);
      return right(userModel);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      if (user != null) {
        await firbaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  /// add user data to database
  @override
  Future<void> addUserData({required UserEntities user}) async {
    await databaseService.addData(
      data: UserModel.fromEntity(user).toMap(),
      path: BackendEndPoints.addUserData,
      documentId: user.uId,
    );
  }

  /// get user data from database
  @override
  Future<UserEntities> getUserData({required String documentId}) async {
    var userData = await databaseService.getData(
      documentId: documentId,
      path: BackendEndPoints.getUserData,

    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntities user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await storage.write(kUserData, jsonData);
  }
}
