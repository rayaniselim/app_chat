import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';
import '../icon_search_widget.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).viewPadding.top;
    final heightAppBar = AppBar().preferredSize.height;

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: AppBar(
        elevation: 0,
        toolbarHeight: heightAppBar + statusBar,
        title: Text(
          'Messages',
          style: TextStyles.textSemiBoldTitles.copyWith(
            fontSize: 28,
          ),
        ),
        centerTitle: false,
        actions: const [
          IconSearchWidget(),
        ],
      ),
    );
  }
}
