import 'package:flutter/material.dart';

class PageColors extends StatelessWidget {
  const PageColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xffFFFFFF),
              child: Center(child: Text(const Color(0xffFFFFFF).toString())),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xffB3B9C9),
              child: Center(child: Text(const Color(0xffB3B9C9).toString())),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xff9398A7),
              child: Center(child: Text(const Color(0xff9398A7).toString())),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xff7A8194),
              child: Center(child: Text(const Color(0xff7A8194).toString())),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xff3D4354),
              child: Center(child: Text(const Color(0xff3D4354).toString())),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xff373E4E),
              child: Center(child: Text(const Color(0xff373E4E).toString())),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xff292F3F),
              child: Center(child: Text(const Color(0xff292F3F).toString())),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xff1B202D),
              child: Center(
                  child: Text(
                const Color(0xff1B202D).toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              )),
            ),
            Container(
              height: 90,
              width: 200,
              color: const Color(0xff000000),
              child: Center(
                  child: Text(
                const Color(0xff000000).toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
