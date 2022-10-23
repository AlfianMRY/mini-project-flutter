import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  String name;
  String detail;
  String image;
  MyCard(
      {super.key,
      required this.name,
      required this.detail,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      child: Row(
        children: [
          Image.network(image),
          Container(
            child: Column(
              children: [
                Text(name),
                Text(detail),
              ],
            ),
          )
        ],
      ),
    );
  }
}
