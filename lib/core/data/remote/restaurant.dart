
import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/class/crud.dart';

class RestaurantData {
  Crud crud;

  RestaurantData(this.crud);

  postData(String name,
      String address,
      String phone,
      String tables,
      String rank
      ) async {
    var response = await crud.postData(AppLink.restaurantCreate, {
      "name": name,
      "address": address,
      "phone": phone,
      "tables": tables,
      "rank": rank
    });
    return response.fold((l) => l, (r) => r);
  }
}


class RestaurantReadData {
  Crud crud;
  RestaurantReadData(this.crud);
  postData() async {
    var response = await crud.postData(AppLink.hotelRead, {});
    return response.fold((l) => l, (r) => r);
  }
}

class RestaurantDeleteData {
  Crud crud;

  RestaurantDeleteData(this.crud);

  postData(String id) async {
    var response = await crud.postData(AppLink.hotelDelete, {
      "id": id
    });
    return response.fold((l) => l, (r) => r);
  }
}
