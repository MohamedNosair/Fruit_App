import 'package:fruit_app/core/utils/constant.dart';

class UserEntities {
  final String name, emailAddress , uId, imageUrl;

  UserEntities({required this.imageUrl, required this.name, required this.emailAddress, required this.uId});

   toMap() {
    return {
      kname: name,
      kemailAddress: emailAddress,
      kuId: uId,
      kimageUrl: imageUrl,
    };
  }
  
}
