import 'package:batna_traveler/controller/admin/hotel_controller.dart';
import 'package:batna_traveler/controller/admin/restaurant_controller.dart';
import 'package:batna_traveler/controller/show_data_controller.dart';
import 'package:batna_traveler/view/admin/widgets/restaurant/restaurant_info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../admin/widgets/event/events_info_card.dart';
import '../admin/widgets/hotel/hotel_info_card.dart';
import '../components/search_bar.dart';

class ShowData extends StatelessWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Get.arguments["title"];
    var controller = Get.put(ShowDataController());
    return Scaffold(
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
                          List<dynamic> data = snapshot.data["data"] ?? [];
                          print(data);
                          return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                if (title == "Hotel") {
                                  Get.put(HotelController());
                                  return HotelInfoCard(
                                    controller: Get.find(),
                                    data: data,
                                    isAdmin: false,
                                    index: index,
                                  );
                                } else if (title == "Restaurant") {
                                  Get.put(RestaurantController());
                                  return RestaurantInfoCard(
                                    controller: Get.find(),
                                      index: index, data: data);
                                } else if (title == "Events") {
                                  //Get.put(HotelController());
                                  return EventInfoCard(
                                    controller: Get.find(),
                                    index: index,
                                    data: data,
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
