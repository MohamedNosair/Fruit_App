import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({
    required super.name,
    required super.emailAddress,
    required super.uId,
  });

  factory UserModel.fromFirbaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      emailAddress: user.email ?? '',
      uId: user.uid,
    
    );
  }
}
