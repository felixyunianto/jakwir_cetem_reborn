// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListItemTab extends StatelessWidget {
  final String textOne;
  final Widget child;

  const ListItemTab({
    Key? key,
    required this.textOne,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: size.width * 0.1,
        height: size.height * 0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.red[300]),
        child: Center(
          child: Text("Q.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        width: size.width * 0.73,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textOne,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            child
          ],
        ),
      ),
    ]);
  }
}
