import 'package:batna_traveler/view/admin/widgets/restaurant/restaurant_info_card.dart';
import 'package:batna_traveler/view/admin/widgets/users/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes/routs.dart';
import '../../controller/hotel_controller.dart';
import '../components/search_bar.dart';
import 'widgets/event/events_info_card.dart';
import 'widgets/hotel/hotel_info_card.dart';

class ShowAllData extends StatelessWidget {
  const ShowAllData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Get.arguments["title"];
    var controller = Get.put(ShowDataController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(AppRouts.addNewData, arguments: {
            "title": title,
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Create'),
      ),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('$title Page')),
      body: GetBuilder<ShowDataController>(builder: (logic) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SearchBar(),
              Text(
                'All Result',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(height: 1.5),
              ),
              Flexible(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    controller.update();
                  },
                  child: FutureBuilder(
                      future: controller.getData(title),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          List<dynamic> data = snapshot.data["data"];
                          print(data);
                          return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                if (title == "Hotel") {
                                  return HotelInfoCard(
                                    data: data,
                                    isAdmin: true,
                                    index: index,
                                  );
                                } else if (title == "Restaurant") {
                                  return RestaurantInfoCard(
                                      isAdmin: true, index: index, data: data);
                                } else if (title == "Users") {
                                  return UserInfoCard(
                                    data : data ,
                                    index : index,
                                  );
                                } else if (title == "Events") {
                                  return EventInfoCard(
                                    data: data,
                                    index: index,
                                    isAdmin: true,
                                  );
                                }
                                return const SizedBox();
                              });
                        }
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// toNewDataPage(String title){
//   if (title == "Hotel") {
//     return const Center(child: Text("Add Hotel"));
//   } else if (title == "Restaurant") {
//     return const Center(child: Text("Add Restaurant"));
//   }
//   else if (title == "Users") {
//     return const Center(child: Text("Add User"));
//   }
//   if (title == "Events") {
//     Get.put(EventConfigController());
//     return EventAdd(controller: Get.find());
//   }
//   return const SizedBox();
// }
