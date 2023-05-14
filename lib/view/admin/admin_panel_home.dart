import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/view/admin/show_all_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


List<String> category = ["Hotel","Restaurant","Beach","Spa"];
class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            HomeScreenPanelCard(onTap: (){},title: "Category's Config",),
            HomeScreenPanelCard(onTap: (){},title: "Events Config",),
            Text(
              "Modify from Category's",
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
            ),
            Flexible(
                child: ListView.builder(physics: const BouncingScrollPhysics(),
                  itemCount: category.length,
                    itemBuilder: (context,index)=>
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 3,
                          // color: AppColors.kPrimaryColor,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            onTap: () {
                              Get.to(const ShowAllData(),arguments: {
                                "title" : category[index],
                                "index" : index,
                              });
                            },
                            title: Text(category[index]),
                            leading: const Icon(Icons.change_circle_outlined),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                ))
          ],
        ),
      ),
    );
  }
}

class HomeScreenPanelCard extends StatelessWidget {
  const HomeScreenPanelCard({
    super.key,required this.onTap, required this.title
  });

  final void Function()? onTap;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      color: AppColors.kPrimaryColor,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        leading: const Icon(Icons.change_circle_outlined),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
