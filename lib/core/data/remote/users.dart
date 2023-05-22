import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/class/crud.dart';

class UserData {
  Crud crud;

  UserData(this.crud);

  postData(String name,
      String address,
      String phone,
      String rooms,
      String rank,) async {
    var response = await crud.postData(AppLink.hotelCreate, {
      "name": name,
      "address": address,
      "phone": phone,
      "rooms": rooms,
      "rank": rank
    });
    return response.fold((l) => l, (r) => r);
  }
}


class UserReadData {
  Crud crud;
  UserReadData(this.crud);
  postData() async {
    var response = await crud.postData(AppLink.usersRead, {});
    return response.fold((l) => l, (r) => r);
  }
}

class UserDeleteData {
  Crud crud;

  UserDeleteData(this.crud);

  postData(String id) async {
    var response = await crud.postData(AppLink.usersDelete, {
      "id": id
    });
    return response.fold((l) => l, (r) => r);
  }
}
