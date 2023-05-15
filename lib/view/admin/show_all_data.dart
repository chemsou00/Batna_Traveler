import 'package:batna_traveler/view/admin/widgets/restaurant_info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/search_bar.dart';
import 'widgets/hotel_info_card.dart';

class ShowAllData extends StatelessWidget {
  const ShowAllData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Get.arguments["title"];
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
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
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (title == "Hotel") {
                      return const HotelInfoCard(
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
                          image: "https://popmenucloud.com/cdn-cgi/image/width=1200,height=1200,fit=scale-down,format=auto,quality=60/ybtkwpfh/04ab0d84-f7b6-4fc3-b76d-34cb9a5fd35e.jpg");
                    }return const SizedBox();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
