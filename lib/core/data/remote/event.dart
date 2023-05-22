import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/class/crud.dart';

class EventData {
  Crud crud;

  EventData(this.crud);

  postData(
    String title,
    String content,
    String start,
    String end,
    String price,
  ) async {
    var response = await crud.postData(AppLink.eventCreate, {
      "title": title,
      "content": content,
      "start": start,
      "end": end,
      "price" : price

    });
    return response.fold((l) => l, (r) => r);
  }
}


class EventReadData {
  Crud crud;
  EventReadData(this.crud);
  postData(
  ) async {
    var response = await crud.postData(AppLink.eventRead,{});
    return response.fold((l) => l, (r) => r);
  }
}
class EventDeleteData {
  Crud crud;
  EventDeleteData(this.crud);
  postData(String id,
      ) async {
    var response = await crud.postData(AppLink.eventDelete,{
      "id" : id
    });
    return response.fold((l) => l, (r) => r);
  }
}
