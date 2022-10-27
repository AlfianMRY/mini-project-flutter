import 'package:flutter/material.dart';
import 'package:mini_project/constants/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/list_sports.dart';
import '../widgets/card_user.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    CollectionReference sports =
        FirebaseFirestore.instance.collection('olahraga');
    final kardio = sports.where('jenis', isEqualTo: 'Kardio');
    final nonKardio = sports.where('jenis', isEqualTo: 'Resistance');

    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: secondaryBgColor,
        title: Text(
          'Home Page',
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: primaryColor,
        child: ListView(
          children: <Widget>[
            Container(
              height: 30,
            ),
            DrawerHeader(
              decoration: BoxDecoration(
                color: thirdBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${user.email}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 200,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: secondaryBgColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CardUser(user: user),
            ),
            List_Sports(
              sports: kardio,
              title: 'Olahraga Kardio',
            ),
            SizedBox(
              height: 30,
            ),
            List_Sports(
              sports: nonKardio,
              title: 'Olahraga WorkOut',
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
