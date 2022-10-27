import 'package:flutter/material.dart';
import 'package:mini_project/constants/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: secondaryBgColor,
        title: Text(
          'Setting',
          style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: secondaryBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                      minRadius: 30,
                    ),
                  ),
                  Text(
                    '${user.email}',
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: Icon(Icons.arrow_back),
                label: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
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
