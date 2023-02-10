import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../design_system.dart';
import '../ui/widgets/home/recent_home_widget.dart';

class PageWidgetbook extends StatelessWidget {
  const PageWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookComponent(
              name: 'AppBar Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'AppBar Home',
                  builder: (context) => const AppBarHomeWidget(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'AppBar Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'AppBar Chat',
                  builder: (context) => const AppBarChatWidget(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Recent Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'Recent Home',
                  builder: (context) => const RecentHomeWidget(),
                ),
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(name: 'Chat'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeApp.themeLight,
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeApp.themeDark,
        ),
      ],
    );
  }
}
