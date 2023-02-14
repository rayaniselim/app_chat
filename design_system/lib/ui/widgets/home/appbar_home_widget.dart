import 'package:flutter/material.dart';

import '../../../design_system.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).viewPadding.top;
    final heightAppBar = AppBar().preferredSize.height;

    return SliverAppBar(
      toolbarHeight: heightAppBar + statusBar,
      floating: true,
      snap: true,
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
              SizedBox(
                height: 8,
              ),
              RecentHomeWidget(),
            ],
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(
            right: 10,
            top: 0,
            bottom: 20,
          ),
          child: IconSearchWidget(),
        ),
      ],
    );
  }
}
