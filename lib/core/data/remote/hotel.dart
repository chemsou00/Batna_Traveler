import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/class/crud.dart';

class HotelData {
  Crud crud;

  HotelData(this.crud);

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


class HotelReadData {
  Crud crud;
  HotelReadData(this.crud);
  postData() async {
    var response = await crud.postData(AppLink.hotelRead, {});
    return response.fold((l) => l, (r) => r);
  }
}

class HotelDeleteData {
  Crud crud;

  HotelDeleteData(this.crud);

  postData(String id) async {
    var response = await crud.postData(AppLink.hotelDelete, {
      "id": id
    });
    return response.fold((l) => l, (r) => r);
  }
}
