import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Channel A'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.abc_sharp,
            size: 300.0,
            color: Colors.redAccent,
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              payload,
              style: const TextStyle(fontSize: 30),
            ),
          ),

        ],
      ),
    );
  }
}
