import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('title app firebase'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.blue,
        height: 300,
        width: 300,
      ),
    );
  }
}
