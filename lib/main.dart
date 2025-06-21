import 'package:flutter/material.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(const LenskartCloneApp());
}

class LenskartCloneApp extends StatelessWidget {
  const LenskartCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lenskart Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const BottomNav(),
    );
  }
}
