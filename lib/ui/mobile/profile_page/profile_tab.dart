import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  final String tabText;
  final IconData icon;
  final double padding;
  const ProfileTabs(
      {required this.tabText,
      required this.icon,
      required this.padding,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: 330,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromARGB(255, 232, 230, 230),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 28,
              color: const Color.fromARGB(255, 90, 89, 89),
            ),
            Text(
              tabText,
              style: const TextStyle(
                color: Color.fromARGB(255, 90, 89, 89),
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: padding),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: Color.fromARGB(255, 90, 89, 89),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
