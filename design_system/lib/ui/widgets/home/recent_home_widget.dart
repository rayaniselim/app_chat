import 'package:flutter/material.dart';

import '../../../design_system.dart';

class RecentHomeWidget extends StatelessWidget {
  final String textRecent;
  const RecentHomeWidget({super.key, required this.textRecent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        textRecent,
        style: TextStyles.textMediumRecent.copyWith(
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
