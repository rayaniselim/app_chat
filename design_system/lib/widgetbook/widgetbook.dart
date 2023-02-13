import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../design_system.dart';
import '../ui/widgets/chat/name_chat_widget.dart';

class PageWidgetbook extends StatelessWidget {
  const PageWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'widgets Home',
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
              name: 'Components Card Message Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'Components Card Message Home',
                  builder: (context) => ComponentsCardMessageHomeWidget(
                    onTap: () {},
                  ),
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
                  builder: (context) => const ListStoriesHomeWidget(),
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
              name: 'Card SliverList home',
              useCases: [
                WidgetbookUseCase(
                  name: 'Card SliverList home',
                  builder: (context) => SliverListWidget(
                    onTap: () {},
                  ),
                ),
              ],
            ),

            ///// CHAT
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
              name: 'Card Messages Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'Card Messages Chat',
                  builder: (context) => const CardMessagesChat(),
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

            WidgetbookComponent(
              name: 'Text Data Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'Text Data Chat',
                  builder: (context) => const TextDataChat(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TextField Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField Chat',
                  builder: (context) => const TextFieldChatWidget(),
                ),
              ],
            ),

            /// LOGIN

            WidgetbookComponent(
              name: 'TextField Login',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField Login',
                  builder: (context) => const TextFieldLoginWdiget(
                    hintText: 'Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                    obscure: false,
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Button Login',
              useCases: [
                WidgetbookUseCase(
                  name: 'Button Login',
                  builder: (context) => ButtonLoginWidget(
                    onPressed: () {},
                  ),
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
