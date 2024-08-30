import 'package:flutter/material.dart';
import 'package:foodfighter/components/my_drawer_tile.dart';
import 'package:foodfighter/pages/settings_page.dart';
import 'package:foodfighter/services/authentication/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,),
          ),

          Padding(
              padding: EdgeInsets.all(25),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
          ),

          //home tile
          MyDrawerTile(
              text: "H O M E",
              iconData: Icons.home,
              onTap: () => Navigator.pop(context),
          ),

          //settings tile
          MyDrawerTile(
              text: "S E T T I N G S",
              iconData: Icons.settings,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()))
          ),

          const Spacer(),

          //logout
          MyDrawerTile(
              text: "L O G O U T",
              iconData: Icons.logout,
              onTap: logout
          ),
        ],
       
      ),
    );
  }

}