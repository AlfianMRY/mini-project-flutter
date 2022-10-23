import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:mini_project/constants/app_constant.dart';
import 'package:mini_project/screens/bmi.dart';
import 'package:mini_project/screens/landing.dart';

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
      Center(
        child: Text('Page kiri'),
      ),
      LandingPage(),
      BmiApp(),
    ];

    return Scaffold(
      body: bodyPages[currentPage],
      bottomNavigationBar: ConvexAppBar(
        shadowColor: Colors.white,
        initialActiveIndex: 1,
        activeColor: secondColor,
        color: secondColor.withOpacity(0.8),
        backgroundColor: mainColor.withOpacity(.9),
        items: [
          TabItem(icon: Icons.map, title: 'Discovery'),
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
