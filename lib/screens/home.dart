import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:mini_project/constants/app_constant.dart';
import 'package:mini_project/screens/bmi.dart';
import 'package:mini_project/screens/landing.dart';
import 'package:mini_project/screens/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyPages = [
      SettingsPage(),
      LandingPage(),
      BmiApp(),
    ];

    return Scaffold(
      body: bodyPages[currentPage],
      bottomNavigationBar: ConvexAppBar(
        shadowColor: Colors.white,
        initialActiveIndex: 1,
        activeColor: primaryBgColor,
        color: thirdBgColor.withOpacity(0.8),
        backgroundColor: primaryColor.withOpacity(.9),
        items: [
          TabItem(icon: Icons.settings, title: 'Settings'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.scale, title: 'Timbangan'),
        ],
        onTap: (int i) => setState(() {
          currentPage = i;
        }),
      ),
    );
  }
}
