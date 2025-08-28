import 'dart:convert';

import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';

UserEntities getDataOfUser()  {
  String jsonString = storage.read(kUserData);
  var userdata = UserModel.fromJson(jsonDecode(jsonString));
  return userdata;
}


