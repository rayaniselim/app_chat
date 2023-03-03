import 'package:flutter/material.dart';

import '../../../design_system.dart';

class AppBarHomeWidget extends StatelessWidget {
  final String titleAppBar;
  final Icon iconLogout;
  final Icon iconTheme;
  final void Function() onPressedIconLogout;
  final void Function() onPressedIconTheme;

  const AppBarHomeWidget({
    super.key,
    required this.titleAppBar,
    required this.iconLogout,
    required this.onPressedIconTheme,
    required this.iconTheme,
    required this.onPressedIconLogout,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.viewPadding.top;

    return AppBar(
      toolbarHeight: kToolbarHeight + statusBar,
      elevation: 0,
      centerTitle: false,
      title: Text(
        titleAppBar,
        style: TextStyles.textSemiBoldTitleAppBar.copyWith(
          fontSize: 28,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Row(
            children: [
              IconButtonWidget(
                onPressedIcon: onPressedIconLogout,
                icon: iconLogout,
              ),
              IconButtonWidget(
                icon: iconTheme,
                onPressedIcon: onPressedIconTheme,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
