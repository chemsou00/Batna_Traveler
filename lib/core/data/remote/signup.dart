

import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String username,String email,String password,String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username" : username,
      "email" : email,
      "phone" : phone,
      "password" : password,
    });
    return response.fold((l) => l, (r) => r);
  }
}


