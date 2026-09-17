import 'package:flutter/material.dart';

const homeScreenRoute = '/homeScreenRoute';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HomeScreen', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
