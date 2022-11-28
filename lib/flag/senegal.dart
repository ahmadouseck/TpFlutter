import 'package:flutter/material.dart';

class Senegal extends StatelessWidget {
  const Senegal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 140,
            color: Colors.green,
          ),
          Container(
            height: 200,
            width: 140,
            color: Colors.yellow,
            child: const Center(
                child: Icon(
              Icons.star,
              color: Colors.green,
              size: 50,
            )),
          ),
          Container(
            height: 200,
            width: 140,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
