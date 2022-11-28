import 'package:flutter/material.dart';

class Gambie extends StatelessWidget {
  const Gambie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            color: Colors.red,
          ),
          const Divider(
            color: Colors.white,
            height: 5,
          ),
          Container(
            height: 50,
            color: Colors.blueAccent,
          ),
          const Divider(
            color: Colors.white,
            height: 5,
          ),
          Container(
            height: 50,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
