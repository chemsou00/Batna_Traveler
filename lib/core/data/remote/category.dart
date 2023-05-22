



import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/class/crud.dart';

class CategoryData {
  Crud crud;

  CategoryData(this.crud);

  postData(String name,
      String address,
      String phone,
      String rooms,
      String rank,) async {
    var response = await crud.postData(AppLink.hotelCreate, {
      "name": name,
      "image": address,
    });
    return response.fold((l) => l, (r) => r);
  }
}


class CategoryReadData {
  Crud crud;
  CategoryReadData(this.crud);
  postData() async {
    var response = await crud.postData(AppLink.categoryRead, {});
    return response.fold((l) => l, (r) => r);
  }
}

class CategoryDeleteData {
  Crud crud;
  CategoryDeleteData(this.crud);
  postData(String id) async {
    var response = await crud.postData(AppLink.hotelDelete, {
      "id": id
    });
    return response.fold((l) => l, (r) => r);
  }
}
