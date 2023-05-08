import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:  [
          const UserAccountsDrawerHeader(
            accountName: Text("accountName"),
            accountEmail: Text("account@Email.com"),
            currentAccountPicture: Icon(Icons.person),
            currentAccountPictureSize: Size(40, 40),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Setting"),
            leading: const Icon(Icons.settings),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Admin Panel"),
            leading: const Icon(Icons.admin_panel_settings),
            trailing: const Icon(Icons.arrow_forward),
          ),
          const Spacer(),
          ListTile(
            onTap: () {},
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
