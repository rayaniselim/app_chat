import 'package:app_chat/app/modules/home_module/list_stories_home_widget.dart';
import 'package:app_chat/app/modules/home_module/sliverlist_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../design_system.dart';
import '../ui/widgets/chat/name_chat_widget.dart';

class PageWidgetbook extends StatelessWidget {
  const PageWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isObscure = true;

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
                  builder: (context) => AppBarHomeWidget(
                    onPressedIconSearch: () {},
                    titleAppBar: 'Messages',
                    iconSearch: Icon(
                      Icons.search,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                    iconTheme: const Icon(Icons.nightlight),
                    onPressedIconTheme: () {},
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Components Card Message Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'Components Card Message Home',
                  builder: (context) => ComponentsCardMessageHomeWidget(
                    messageUser: 'message mock',
                    onTap: () {},
                    date: '08:43',
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Recent Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'Recent Home',
                  builder: (context) => const RecentHomeWidget(
                    textRecent: 'R E C E N T',
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'List Stories Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'List Stories Home',
                  builder: (context) => const ListStoriesHomeWidget(
                    sizeImage: 37, // valor radius
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Icon Search',
              useCases: [
                WidgetbookUseCase(
                  name: 'Icon Search',
                  builder: (context) => IconButtonWidget(
                    onPressedIcon: () {},
                    icon: Icon(
                      Icons.search,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
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
                    date: '08:45',
                    messageUser: 'message mock',
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
                  builder: (context) => AppBarChatWidget(
                    onPressedIcon: () {},
                    icon: Icon(
                      Icons.search,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                    imageMock: 'assets/image/Jeon Yeo-been.jpeg',
                    nameMock: 'Name Widgetbook',
                    sizeImage: size.height * 0.10, // 37,
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Card Messages Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'Card Messages Chat',
                  builder: (context) => const CardMessagesChat(
                    dataChat: 'date mock',
                    senderMessage: 'mensagem remetente',
                    recipientMessage: 'mensagem destinatario',
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Name Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'Name Chat',
                  builder: (context) => const NameChatWidget(
                    nameMock: 'Name Widgetbook',
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Text Data Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'Text Data Chat',
                  builder: (context) => const TextDataWidget(
                    date: 'date mock',
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TextField Chat',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField Chat',
                  builder: (context) => TextFieldChatWidget(
                    prefixIcon: const Icon(
                      Icons.camera_alt_outlined,
                    ),
                    onPressedPrefixIcon: () {},
                    suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
                    hintText: 'Message',
                    onPressedSuffixIcon: () {},
                  ),
                ),
              ],
            ),

            /// LOGIN

            WidgetbookComponent(
              name: 'TextField Email Login',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField Email Login',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFieldWdiget(
                      hintText: 'Email',
                      icon: Icon(
                        (Icons.email_outlined),
                      ),
                      isObscure: false,
                      initialValue: 'rayani@user.com',
                      keyboardType: TextInputType.emailAddress,
                      labelText: '',
                    ),
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'TextField Password Login',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField Password Login',
                  builder: (context) => TextFieldWdiget(
                    isObscure: true,
                    hintText: 'Password',
                    icon: GestureDetector(
                      child: isObscure == true
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              size: 19,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              size: 19,
                            ),
                      onTap: () {
                        // setState(() {
                        //   isObscure = !isObscure;
                      },
                    ),
                    initialValue: '123456',
                    keyboardType: TextInputType.none,
                    labelText: 'Password',
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Button Login',
              useCases: [
                WidgetbookUseCase(
                  name: 'Button Login',
                  builder: (context) => ButtonWidget(
                    width: size.width * 0.20,
                    height: size.height * 0.03,
                    onPressed: () {},
                    title: 'Login',
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Button Register',
              useCases: [
                WidgetbookUseCase(
                  name: 'Button Register',
                  builder: (context) => TextButtonWidget(
                    onTap: () {},
                    title: 'Register',
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
