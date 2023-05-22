import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/controller/admin/admin_panel_controller.dart';
import 'package:batna_traveler/view/admin/show_all_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> category = [
  "Hotel",
  "Restaurant",
  "Beach",
  "Spa",
  "Mountain",
  "Restaurant",
  "Motel"
];

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AdminPanelController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Admin Panel"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(
              "Home Screen Config",
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
            ),
            HomeScreenPanelCard(
              onTap: () {},
              title: "Categories Config",
            ),
            HomeScreenPanelCard(
              onTap: () {
                // controller.gotoEventConfig();
                Get.to(const ShowAllData(), arguments: {"title": "Events"});
              },
              title: "Events Config",
            ),
            Text(
              "Users",
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
            ),
            Flexible(
              flex: 1,
              child: HomeScreenPanelCard(
                onTap: () {
                  Get.to(const ShowAllData(), arguments: {"title": "Users"});
                },
                title: "All User",
              ),
            ),
            Text(
              "All Categories",
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
            ),
            Flexible(
              flex: 5,
              child: FutureBuilder(
                future: controller.getAllCategories(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<dynamic> data = snapshot.data["data"];
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) => Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 3,
                        // color: AppColors.kPrimaryColor,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          onTap: () {
                            controller.goToShowData(index);
                          },
                          title: Text(data[index]["category_name"]),
                          leading: const Icon(Icons.change_circle_outlined),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    );
                  }return Center(child: Text('Error: ${snapshot.error}'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenPanelCard extends StatelessWidget {
  const HomeScreenPanelCard(
      {super.key, required this.onTap, required this.title});

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      color: AppColors.kPrimaryColor,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        leading: const Icon(Icons.change_circle_outlined),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
