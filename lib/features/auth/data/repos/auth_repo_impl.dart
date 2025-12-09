import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/errors/exception_custom.dart';
import 'package:fruit_app/core/supabase/database_service.dart';
import 'package:fruit_app/core/supabase/auth_services.dart';
import 'package:fruit_app/core/utils/backend_end_points.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  // final FirbaseAuthService firbaseAuthService;
  final DatabaseService databaseService;
  final AuthSupabaseServices authSupabaseServices;

  AuthRepoImpl({
    required this.databaseService,
    // required this.firbaseAuthService,
    required this.authSupabaseServices,
  });
  // Create user with email and password

  //! finish
  @override
  Future<Either<Failure, UserEntities>> createEmialAndPassword(
    String emailAddress,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await authSupabaseServices.signUpWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
        name: name,
      );
      log("user${user}");
      var userEntity = UserEntities(
        imageUrl: '',
        name: name,
        emailAddress: emailAddress,
        uId: user.id,
      );

      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await authSupabaseServices.deleteUser(user.id);
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await authSupabaseServices.deleteUser(user.id);
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  //! finish
  // Sign in with email and password supabase
  @override
  Future<Either<Failure, UserEntities>> signinEmialAndPassword(
    String emailAddress,
    String password,
  ) async {
    User? user;
    try {
      user = await authSupabaseServices.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );
      UserEntities userEntities = await getUserData(documentId: user.id);
      await saveUserData(user: userEntities);
      return right(userEntities);
    } on ExceptionCustom catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  // Sign in with Google supabase
  //! finish
  @override
  Future<Either<Failure, UserEntities>> signinWithGoogle() async {
    User? user;
    try {
      user = await authSupabaseServices.signWithGoogle();

      var userEntity = UserModel.fromFirbaseUser(user);

      var isUserExists = await databaseService.isUserExists(
        path: BackendEndPoints.isUserExists,
        documentId: user.id,
      );

      if (isUserExists) {
        await addUserData(user: userEntity);
      } else {
        await getUserData(documentId: user.id);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await authSupabaseServices.deleteUser(user.id);
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('AuthRepoImpl.signinWithGoogle: ${e.toString()}');
      if (user != null) {
        await authSupabaseServices.deleteUser(user.id);
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  /// Sign in with Facebook supabase
  @override
  Future<Either<Failure, UserEntities>> signinWithFacebook() async {
    User? user;
    try {
      user = await authSupabaseServices.signInWithFacebook();
      var userEntity = UserModel.fromFirbaseUser(user);

      var isUserExists = await databaseService.isUserExists(
        path: BackendEndPoints.isUserExists,
        documentId: user.id,
      );

      if (isUserExists) {
        await addUserData(user: userEntity);
      } else {
        await getUserData(documentId: user.id);
      }
      await saveUserData(user: userEntity);

      return right(userEntity);
    } on ExceptionCustom catch (e) {
      if (user != null) {
        await authSupabaseServices.deleteUser(user.id);
      }
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      if (user != null) {
        await authSupabaseServices.deleteUser(user.id);
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  /// add user data to database
  //! finish
  @override
  Future<void> addUserData({required UserEntities user}) async {
    await databaseService.addData(
      data: UserModel.fromEntity(user).toMap(),
      path: BackendEndPoints.addUserData,
      documentId: user.uId,
    );
  }

  /// get user data from database
  //! finish
  @override
  Future<UserEntities> getUserData({required String documentId}) async {
    var userData = await databaseService.getData(
      documentId: documentId,
      path: BackendEndPoints.getUserData,
    );
    return UserModel.fromJson(userData);
  }

  //! finish
  @override
  Future saveUserData({required UserEntities user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await storage.write(kUserData, jsonData);
  }
}
