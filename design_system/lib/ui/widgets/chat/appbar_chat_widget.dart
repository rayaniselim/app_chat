import 'package:flutter/material.dart';
import '../icon_search_widget.dart';
import '../image_app_widget.dart';
import 'name_chat_widget.dart';

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
            ImageAppWidget(
              height: size.height * 1.58,
              width: size.width * 0.038,
            ),
            SizedBox(
              width: size.width * 0.01, //16,
            ),
            const NameChatWidget(),
            const Spacer(),
            const IconSearchWidget(),
          ],
        ),
      ),
    );
  }
}
