
import 'package:get/get.dart';

validInput(String val, int max, int min, String type) {
  if (val.isEmpty)return "Can't be Empty";
  if (type == "username") {
    if (!GetUtils.isUsername(val)) return "Not Valid UserName";
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) return "Not Valid Email";
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) return "Not Valid phoneNumber";
  }
  if (val.length<min) return "Can't be less Then $min";
  if (val.length>max) return "Can't be more Then $max";

}
validationSamePassword(String value , String password) {
  if (value != password) {
    return 'Password is not matching';
  }
}