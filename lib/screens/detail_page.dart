import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project/constants/app_constant.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.id});
  final id;

  @override
  Widget build(BuildContext context) {
    DocumentReference sports =
        FirebaseFirestore.instance.collection('olahraga').doc(id);

    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: secondaryBgColor,
        title: Text(
          'Detail Olahraga',
          style: TextStyle(color: secondaryColor),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: sports.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            // print('data : ${data['name']}');
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    data['foto'],
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${data['nama']}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * .90,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type : ${data['jenis']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Deskripsi : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(data['detail']),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('something went worng!'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
