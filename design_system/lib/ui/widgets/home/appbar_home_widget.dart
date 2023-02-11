import 'package:design_system/ui/widgets/home/recent_home_widget.dart';
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Messages',
              style: TextStyles.textSemiBoldTitles.copyWith(
                fontSize: 28,
              ),
            ),
          ),
          Row(
            children: const [
              RecentHomeWidget(),
            ],
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(
            right: 10,
          ),
          child: IconSearchWidget(),
        ),
      ],
    );
  }
}
