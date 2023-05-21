import 'dart:developer';

import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/view/admin/admin_panel_home.dart';
import 'package:batna_traveler/view/components/custom_drawer.dart';
import 'package:batna_traveler/view/components/home_widgets.dart';
import 'package:batna_traveler/view/components/search_bar.dart';
import 'package:batna_traveler/view/components/spacer_between-categories.dart';
import 'package:batna_traveler/view/screens/events_screen.dart';
import 'package:batna_traveler/view/screens/show_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<IconData> myIcons= [Icons.hotel,Icons.restaurant,Icons.beach_access,Icons.spa,Icons.landscape,Icons.restaurant,Icons.hotel_outlined];


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: category.length,
                  itemBuilder: (context,index)=>CategoryCard(
                    iconData: myIcons[index],
                    index: index,
                    onPressed: () {
                      Get.to(() => const ShowData(),arguments: {
                        "title" : category[index],
                      });
                    },
                  ),
                ),
              ),
              SpacerBetween(
                  title: 'Events',
                  onTap: () {
                    log('See all Events onTAPED');
                  }),
              Expanded(
                child: RefreshIndicator(
                  backgroundColor: AppColors.kSecandaryColor,
                  onRefresh: ()async {
                    await Future.delayed(const Duration(seconds: 3));
                  },
                  child: GridView.builder(
                    itemCount: category.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>EventCard(onTap: (){Get.to(()=>EventScreen(index: index,));}),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
