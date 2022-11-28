import 'package:flutter/material.dart';

class Mali extends StatelessWidget {
  const Mali({Key? key}) : super(key: key);

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
