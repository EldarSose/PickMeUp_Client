import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pickmeup/ui/mobile/mobile_helper/nav_bar.dart';
import 'package:pickmeup/ui/mobile/profile_page/profile_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Profile"),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    "Eldar Sose",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    "eldar.sose@edu.fit.ba",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 99, 98, 98),
                    ),
                  ),
                ),
                ProfileTabs(
                  tabText: "Privacy",
                  icon: Icons.admin_panel_settings,
                  padding: 120.0,
                ),
                ProfileTabs(
                  tabText: "Purchase history",
                  icon: FontAwesomeIcons.clockRotateLeft,
                  padding: 40.0,
                ),
                ProfileTabs(
                  tabText: "Help & Support",
                  icon: FontAwesomeIcons.circleQuestion,
                  padding: 58.0,
                ),
                ProfileTabs(
                  tabText: "Settings",
                  icon: Icons.settings,
                  padding: 120.0,
                ),
                ProfileTabs(
                  tabText: "Logout",
                  icon: Icons.logout,
                  padding: 120.0,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarPage(
        index: 2,
      ),
    );
  }
}
