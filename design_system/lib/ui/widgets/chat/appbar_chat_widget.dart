import 'package:flutter/material.dart';
import '../icon_button_widget.dart';
import '../image_app_widget.dart';
import 'name_chat_widget.dart';

class AppBarChatWidget extends StatelessWidget {
  final Icon icon;
  final String imageMock;
  final String nameMock;
  final double sizeImage;
  final void Function() onPressedIcon;

  const AppBarChatWidget({
    super.key,
    required this.icon,
    required this.imageMock,
    required this.nameMock,
    required this.sizeImage,
    required this.onPressedIcon,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final statusBar = mediaQuery.viewPadding.top;

    return AppBar(
      toolbarHeight: kToolbarHeight + statusBar,
      elevation: 0,
      centerTitle: false,
      title: Row(children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: size.height * 0.07,
              child: FittedBox(
                child: ImageAppWidget(
                  image: imageMock,
                  sizeImage: sizeImage,
                ),
              ),
            );
          },
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        NameChatWidget(
          nameMock: nameMock,
        ),
      ]),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            left: 50,
            top: 10,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButtonWidget(
              onPressedIcon: onPressedIcon,
              icon: icon,
            ),
          ),
        ),
      ],
    );
  }
}
