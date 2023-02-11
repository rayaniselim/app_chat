import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../design_system.dart';
import '../ui/widgets/chat/name_chat_widget.dart';
import '../ui/widgets/home/list_images_home_widget.dart';
import '../ui/widgets/home/recent_home_widget.dart';
import '../ui/widgets/icon_search_widget.dart';

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
            WidgetbookComponent(
              name: 'List Stories Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'List Stories Home',
                  builder: (context) => const ListImagesHomeWidget(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Icon Search',
              useCases: [
                WidgetbookUseCase(
                  name: 'Icon Search',
                  builder: (context) => const IconSearchWidget(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Name Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'Name Chat',
                  builder: (context) => const NameChatWidget(),
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
