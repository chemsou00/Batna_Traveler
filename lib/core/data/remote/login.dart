
import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/class/crud.dart';

class SignInData {
  Crud crud;
  SignInData(this.crud);
  postData(String email,String password) async {
    var response = await crud.postData(AppLink.signIn, {
      "email" : email,
      "password" : password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
