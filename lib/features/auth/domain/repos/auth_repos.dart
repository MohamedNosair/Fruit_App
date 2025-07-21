import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/faliure.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';

abstract class AuthRepos {
  Future<Either<Faliure, UserEntities>> createEmialAndPassword(
    String emailAddress,
    String password,
    String name,
  );
}
