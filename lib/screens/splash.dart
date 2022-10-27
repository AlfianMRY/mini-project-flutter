import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_project/constants/app_constant.dart';
import 'package:mini_project/screens/main.dart';

import 'package:mini_project/widgets/left_bar.dart';
import 'package:mini_project/widgets/right_bar.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  LeftBar(barWidth: MediaQuery.of(context).size.width * 0.3),
                  SizedBox(height: 20),
                  LeftBar(barWidth: MediaQuery.of(context).size.width * 0.4),
                  SizedBox(height: 20),
                  LeftBar(barWidth: MediaQuery.of(context).size.width * 0.2),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Mini Project',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      'By: Alfian M Rizal Yuristya',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: primaryColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  RightBar(barWidth: MediaQuery.of(context).size.width * 0.3),
                  SizedBox(height: 50),
                  RightBar(barWidth: MediaQuery.of(context).size.width * 0.4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
