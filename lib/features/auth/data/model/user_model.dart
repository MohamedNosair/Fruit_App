import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({
    required super.imageUrl,
    required super.name,
    required super.emailAddress,
    required super.uId,
  });

  factory UserModel.fromFirbaseUser(User? user) {
    return UserModel(
      name: user?.displayName ?? '',
      emailAddress: user?.email ?? '',
      uId: user?.uid ?? '',
      imageUrl: user?.photoURL ?? '',
    
    );
  }


  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[kname] ?? '',
      emailAddress: json[kemailAddress] ?? '',
      uId: json[kuId] ?? '',
      imageUrl: json[kimageUrl] ?? '',
    );
  }

 factory UserModel.fromEntity(UserEntities user) {
    return UserModel(
      name: user.name,
      emailAddress: user.emailAddress,
      uId: user.uId,
      imageUrl: user.imageUrl,
    );
  }

 toMap() {
    return {
      kname: name,
      kemailAddress: emailAddress,
      kuId: uId,
      kimageUrl: imageUrl,
    };
  }

}
