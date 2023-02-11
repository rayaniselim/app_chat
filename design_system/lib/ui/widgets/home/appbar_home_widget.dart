import 'package:flutter/material.dart';

import '../../styles/colors_app.dart';
import '../../styles/text_styles.dart';
import '../icon_search_widget.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).viewPadding.top;
    final heightAppBar = AppBar().preferredSize.height;

    return SliverAppBar(
      toolbarHeight: heightAppBar + statusBar,
      floating: true,
      elevation: 0,
      backgroundColor: ColorsApp.primary,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          'Messages',
          style: TextStyles.textSemiBoldTitles.copyWith(
            fontSize: 28,
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: IconSearchWidget(),
        ),
      ],
    );
  }
}
