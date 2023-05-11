import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

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
              "Home Screen Contents",
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              color: Colors.cyan,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {},
                title: const Text("Category Config"),
                leading: const Icon(Icons.change_circle_outlined),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              color: AppColors.kPrimaryColor,
              margin: const EdgeInsets.symmetric(vertical: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {},
                title: const Text("Events Config"),
                leading: const Icon(Icons.change_circle_outlined),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ),
            Text(
              "Modify Data from Category",
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
            ),
            Flexible(
                child: ListView.builder(physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                    itemBuilder: (context,index)=>
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 3,
                          // color: AppColors.kPrimaryColor,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            onTap: () {},
                            title: const Text("Hotels"),
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
