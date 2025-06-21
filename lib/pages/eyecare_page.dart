import 'package:flutter/material.dart';

class EyecarePage extends StatelessWidget {
  const EyecarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '👋 Welcome to Eyecare',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
