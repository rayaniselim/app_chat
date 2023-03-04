import 'package:flutter/material.dart';
import '../home/image_provider_app.dart';
import '../icon_button_widget.dart';
import 'name_chat_widget.dart';

class AppBarChatWidget extends StatelessWidget {
  final Icon icon;
  final ImageProvider<Object>? imageMock;
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
              height: size.height * 0.062,
              child: FittedBox(
                child: ImageProviderWidget(
                  imageProvider: imageMock,
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
            right: 10,
          ),
          child: IconButtonWidget(
            onPressedIcon: onPressedIcon,
            icon: icon,
          ),
        ),
      ],
    );
  }
}
