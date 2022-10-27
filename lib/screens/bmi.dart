import 'package:mini_project/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/widgets/left_bar.dart';
import 'package:mini_project/widgets/list_sports.dart';
import 'package:mini_project/widgets/right_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BmiApp extends StatefulWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _hasil = 0;
  double _tinggi = 0;
  String _textHasil = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference sports =
        FirebaseFirestore.instance.collection('olahraga');
    final kardio = sports.where('jenis', isEqualTo: 'Kardio');
    final nonKardio = sports.where('jenis', isEqualTo: 'Resistance');
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        title: Text(
          'Menghitung Berat Badan',
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: secondaryBgColor,
        elevation: 0,
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Height',
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: primaryColor,
                        )),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: primaryColor,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  if (_h >= 100) {
                    _tinggi = _h / 100;
                  } else {
                    _tinggi = _h;
                  }
                  _hasil = _w / (_tinggi * _tinggi);
                  // print('tinggi = $_tinggi \nBerat = $_w\n Hasil = $_hasil ');
                  if (_hasil > 25) {
                    _textHasil = "Berat Anda Berlebih";
                  } else if (_hasil >= 18.5 && _hasil <= 25) {
                    _textHasil = "Berat Anda Masih Normal";
                  } else {
                    _textHasil = "Berat Anda Kurang";
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor, width: 2),
                ),
                child: Text(
                  'Hitung',
                  style: TextStyle(
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Text(
                _hasil.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 60,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textHasil.isNotEmpty,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      _textHasil,
                      style: TextStyle(
                        fontSize: 32,
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Visibility(
                      visible: _textHasil == 'Berat Anda Berlebih',
                      child: List_Sports(
                        sports: kardio,
                        title: 'Olahraga Kardio',
                      ),
                    ),
                    Visibility(
                      visible: _textHasil == 'Berat Anda Kurang',
                      child: List_Sports(
                        sports: nonKardio,
                        title: 'Olahraga WorkOut',
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            LeftBar(barWidth: MediaQuery.of(context).size.width * 0.3),
            SizedBox(height: 20),
            LeftBar(barWidth: MediaQuery.of(context).size.width * 0.4),
            SizedBox(height: 20),
            LeftBar(barWidth: MediaQuery.of(context).size.width * 0.2),
            SizedBox(height: 50),
            RightBar(barWidth: MediaQuery.of(context).size.width * 0.3),
            SizedBox(height: 50),
            RightBar(barWidth: MediaQuery.of(context).size.width * 0.4),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
