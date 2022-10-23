import 'package:flutter/material.dart';
import 'package:mini_project/constants/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project/widgets/card.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('olahraga').snapshots();
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          backgroundColor: secondColor,
          title: Text(
            'Home Page',
            style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: secondColor,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang!',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 20),
                    Text('${user.email}'),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Checkout'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: Icon(Icons.report),
                title: Text('Transactions'),
                onTap: () {
                  Navigator.pushNamed(context, '/transactionsList');
                },
              ),
              Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
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
        body: Center(
          child: Text('Home'),
        ));
  }
}
