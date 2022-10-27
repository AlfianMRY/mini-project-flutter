import 'package:flutter/material.dart';
import 'package:mini_project/screens/bmi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/app_constant.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                  child: Icon(Icons.person),
                  minRadius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${user.email}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: secondaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Sudahkah Berat Badan Anda Ideal Hari Ini?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: secondaryColor,
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(thirdBgColor),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiApp(),
                  ),
                );
              },
              child: Text('Cek Sekarang!'))
        ],
      ),
    );
  }
}
