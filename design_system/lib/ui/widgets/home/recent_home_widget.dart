import 'package:flutter/material.dart';

import '../../../design_system.dart';

class RecentHomeWidget extends StatelessWidget {
  const RecentHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        'R E C E N T',
        style: TextStyles.textMediumRecent.copyWith(
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
