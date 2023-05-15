import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/controller/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CustomDrawerController());
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
                "User name : ${controller.username} \nRole : ${controller.role}"),
            accountEmail: Text("Email : ${controller.email}"),
            currentAccountPicture: const Icon(Icons.person),
            currentAccountPictureSize: const Size(40, 40),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.arrow_forward),
          ),
           ExpansionTile(
              leading : const Icon(Icons.settings),
              title: const Text("Settings"),
              children: [
                SwitchListTile(
                    title:  const Text("Dark Mode"),
                    value: false,
                    onChanged: (v) {
                    }),
              ]),
          ListTile(
            onTap: () {},
            title: const Text("Favorite"),
            leading: const Icon(Icons.favorite),
            trailing: const Icon(Icons.arrow_forward),
          ),
          controller.isAdmin
              ? ListTile(
                  onTap: () async {
                    Get.back();
                    await Future.delayed(const Duration(milliseconds: 500));
                    controller.goToAdminPanel();
                  },
                  title: const Text("Admin Panel"),
                  leading: const Icon(Icons.admin_panel_settings),
                  trailing: const Icon(Icons.arrow_forward),
                )
              : const SizedBox(),
          const Spacer(),
          ListTile(
            onTap: () {
              // Get.offNamed(AppRouts.signInScreen);
              controller.logout();
            },
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
