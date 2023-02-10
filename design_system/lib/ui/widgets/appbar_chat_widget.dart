import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class AppBarChatWidget extends StatelessWidget {
  const AppBarChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final statusBar = MediaQuery.of(context).viewPadding.top;
    final heightAppBar = AppBar().preferredSize.height;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        height: heightAppBar + statusBar,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(
                'assets/image/hyun-bin.webp',
                fit: BoxFit.cover,
                height: size.height * 1.58,
                width: size.width * 0.038,
              ),
            ),
            SizedBox(
              width: size.width * 0.01, //16,
            ),
            Text(
              'Danny Hopkins',
              style: TextStyles.textSemiBoldTitles.copyWith(
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: size.height * 0.02 + size.width * 0.0021, //28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
