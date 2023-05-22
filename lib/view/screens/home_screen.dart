import 'dart:developer';

import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/controller/show_data_controller.dart';
import 'package:batna_traveler/view/admin/admin_panel_home.dart';
import 'package:batna_traveler/view/components/custom_drawer.dart';
import 'package:batna_traveler/view/components/home_widgets.dart';
import 'package:batna_traveler/view/components/search_bar.dart';
import 'package:batna_traveler/view/components/spacer_between-categories.dart';
import 'package:batna_traveler/view/screens/events_screen.dart';
import 'package:batna_traveler/view/screens/show_data.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<IconData> myIcons = [
  Icons.hotel,
  Icons.restaurant,
  Icons.beach_access,
  Icons.spa,
  Icons.landscape,
  Icons.restaurant,
  Icons.hotel_outlined
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: const [
            Icon(Icons.notifications_none),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        drawer: const SafeArea(child: CustomDrawer()),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GetBuilder<HomeController>(builder: (logic) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  SpacerBetween(
                    title: "Categories",
                    onTap: () {
                      log('See all Categories onTAPED');
                    },
                  ),
                  SizedBox(
                    height: 80,
                    child: FutureBuilder(
                        future: controller.getCategories(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasData) {
                            List<dynamic> data = snapshot.data["data"];
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return CategoryCard(
                                  title: data[index]["category_name"],
                                  iconData: myIcons[index],
                                  index: index,
                                  onPressed: () {
                                    Get.to(() => const ShowData(), arguments: {
                                      "title": data[index]["category_name"],
                                    });
                                  },
                                );
                              },
                            );
                          }
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }),
                  ),
                  SpacerBetween(
                      title: 'Events',
                      onTap: () {
                        log('See all Events onTAPED');
                      }),
                  Expanded(
                    child: RefreshIndicator(
                      backgroundColor: AppColors.kSecandaryColor,
                      onRefresh: ()async  {
                         await controller.refreshScreen();
                      },
                      child: FutureBuilder(
                        future: controller.getEvents(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            List<dynamic> data = snapshot.data["data"];
                            return GridView.builder(
                              itemCount: data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              // physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => EventCard(
                                  title: data[index]["event_title"],
                                  content: data[index]["event_content"],
                                  image: data[index]["event_image"],
                                  price: data[index]["event_price"],
                                  onTap: () {
                                    Get.to(
                                      () => EventScreen(
                                        title: data[index]["event_title"],
                                        content: data[index]["event_content"],
                                        image: data[index]["event_image"],
                                        price: data[index]["event_price"],
                                        dateStart: data[index]["event_start"],
                                        dateEnd: data[index]["event_end"],
                                      ),
                                    );
                                  }),
                            );
                          }
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Error: ${snapshot.error}'),
                              IconButton(
                                  onPressed: () {
                                    controller.update();
                                  }, icon: Icon(Icons.refresh,color: Colors.cyan,))
                            ],
                          ),);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
