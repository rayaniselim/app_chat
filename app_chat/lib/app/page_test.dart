import 'package:flutter/material.dart';

class PageTest extends StatefulWidget {
  const PageTest({super.key});

  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              color: Colors.pink,
              height: 200,
              width: 300,
              child: const Text('page test'))),
    );
  }
}
