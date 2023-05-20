import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/controller/admin/event_controller.dart';
import 'package:batna_traveler/view/admin/add_screen.dart';
import 'package:batna_traveler/view/admin/widgets/restaurant_info_card.dart';
import 'package:batna_traveler/view/admin/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/search_bar.dart';
import 'widgets/events_info_card.dart';
import 'widgets/hotel_info_card.dart';

class ShowAllData extends StatelessWidget {
  const ShowAllData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Get.arguments["title"];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRouts.addNewData, arguments: {
              "title": title,
            });
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('$title Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SearchBar(),
            Text(
              'All Result',
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 1.5),
            ),
            Flexible(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 3));
                },
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (title == "Hotel") {
                        return HotelInfoCard(
                          index: index,
                          name: "jawhara",
                          address: "Alger 1er November",
                          image:
                              "https://th.bing.com/th/id/OIP.lt8QrXojtriF3zjsuPUXrgHaFj?pid=ImgDet&rs=1",
                          phone: "033556699",
                          id: 13,
                          rate: 4.3,
                          rooms: 80,
                        );
                      } else if (title == "Restaurant") {
                        return const RestaurantInfoCard(
                            name: "elmorjan",
                            address: "Boumerdas sqdhgqsqdhgsdhg",
                            phone: "044774455",
                            tables: 25,
                            id: 12,
                            rate: 3.8,
                            image:
                                "https://popmenucloud.com/cdn-cgi/image/width=1200,height=1200,fit=scale-down,format=auto,quality=60/ybtkwpfh/04ab0d84-f7b6-4fc3-b76d-34cb9a5fd35e.jpg");
                      } else if (title == "Users") {
                        return const UserInfoCard(
                            name: "name",
                            phone: "phone",
                            email: "email",
                            image: "image",
                            id: 12,
                            role: 1);
                      } else if (title == "Events") {
                        return const EventInfoCard();
                      }
                      return const SizedBox();
                    }),
              ),
            ),
          ],
        ),
      ),
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
