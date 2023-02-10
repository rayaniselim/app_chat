import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class RecentHomeWidget extends StatelessWidget {
  const RecentHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'RECENT',
            style: TextStyles.textMediumRecent.copyWith(
              letterSpacing: 0.3,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(),
        ),
      ],
    );
  }
}
