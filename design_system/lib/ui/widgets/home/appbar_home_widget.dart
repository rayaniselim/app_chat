import 'package:flutter/material.dart';

import '../../../design_system.dart';

class AppBarHomeWidget extends StatelessWidget {
  final String titleAppBar;
  final Icon icon;
  final void Function() onPressedIcon;

  const AppBarHomeWidget({
    super.key,
    required this.titleAppBar,
    required this.icon,
    required this.onPressedIcon,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.viewPadding.top;

    return SliverAppBar(
      toolbarHeight: kToolbarHeight + statusBar,
      floating: true,
      snap: true,
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
            bottom: 20,
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
