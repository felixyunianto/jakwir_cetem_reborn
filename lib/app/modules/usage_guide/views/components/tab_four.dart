import 'package:flutter/material.dart';

class TabFour extends StatefulWidget {
  const TabFour({super.key});

  @override
  State<TabFour> createState() => _TabFourState();
}

class _TabFourState extends State<TabFour> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Telepon",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 4,
          ),
          Text("0816337680",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          Text("Email",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 4,
          ),
          Text("aditreza57@gmail.com",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          Text("Twitter",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 4,
          ),
          Text("@disduktegalkota",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          Text("Alamat",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 4,
          ),
          Text("Jalan Lele No. 14 TEGAL",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ]);
  }
}
