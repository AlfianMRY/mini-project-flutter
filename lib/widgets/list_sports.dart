import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class List_Sports extends StatelessWidget {
  const List_Sports({Key? key, required this.sports, required this.title})
      : super(key: key);

  final Query<Object?> sports;
  final title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Object?>>(
        future: sports.get(),
        // future: Olahraga.allData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.docs;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        '$title',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network(
                              '${data[index].get('foto')}',
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Column(
                                children: [
                                  Text('${data[index].get('nama')}'),
                                  Text(
                                    '${data[index].get('detail')}',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
