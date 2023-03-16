import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:app_chat/app/modules/submodules/home/presenter/components/list_stories_home_widget.dart';
import '../design_system.dart';
import '../ui/widgets/chat/name_chat_widget.dart';

class PageWidgetbook extends StatelessWidget {
  const PageWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isObscure = true;
    TextEditingController controllerMessage = TextEditingController();

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
                      onPressedIconLogout: () {},
                      titleAppBar: 'Messages',
                      iconLogout: Icon(
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
                name: 'Recent Home',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Recent Home',
                    builder: (context) => const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RecentHomeWidget(
                        textRecent: 'R E C E N T',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'List Stories Home',
                useCases: [
                  WidgetbookUseCase(
                    name: 'List Stories Home',
                    builder: (context) => const Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: ListStoriesHomeWidget(
                        sizeImage: 37, // valor radius
                      ),
                    ),
                  ),
                ],
              ),

              WidgetbookComponent(
                name: 'Icon Search',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Icon Search',
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: IconButtonWidget(
                        onPressedIcon: () {},
                        icon: Icon(
                          Icons.search,
                          size: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// CHAT
              WidgetbookComponent(
                name: 'AppBar Chat',
                useCases: [
                  WidgetbookUseCase(
                    name: 'AppBar Chat',
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppBarChatWidget(
                        onPressedIcon: () {},
                        icon: Icon(
                          Icons.search,
                          size: MediaQuery.of(context).size.width * 0.07,
                        ),
                        nameMock: 'Name Widgetbook',
                        sizeImage: size.height * 0.10,
                        imageMock:
                            Image.asset('app_chat/assets/image/hyun-bin.webp')
                                .image,
                      ),
                    ),
                  ),
                ],
              ),

              WidgetbookComponent(
                name: 'Name Chat',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Name Chat',
                    builder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: NameChatWidget(
                        nameMock: 'Name Widgetbook',
                      ),
                    ),
                  ),
                ],
              ),

              WidgetbookComponent(
                name: 'Text Data Chat',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Text Data Chat',
                    builder: (context) => const TextWidget(
                      text: 'date mock',
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
                    builder: (context) => Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: TextFieldChatWidget(
                        prefixIcon: const Icon(
                          Icons.camera_alt_outlined,
                        ),
                        onPressedPrefixIcon: () {},
                        hintText: 'Message',
                        controller: controllerMessage,
                        child: IconButtonWidget(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          onPressedIcon: () {},
                        ),
                      ),
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
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: TextFieldWdiget(
                        validator: (value) {
                          return null;
                        },
                        hintText: 'Email',
                        icon: const Icon(
                          (Icons.email_outlined),
                        ),
                        isObscure: false,
                        keyboardType: TextInputType.emailAddress,
                        labelText: '',
                        controller: null,
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
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: TextFieldWdiget(
                        validator: (value) {
                          return null;
                        },
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
                          onTap: () {},
                        ),
                        keyboardType: TextInputType.none,
                        labelText: 'Password',
                        controller: null,
                      ),
                    ),
                  ),
                ],
              ),

              WidgetbookComponent(
                name: 'Button Login',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Button Login',
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: ButtonWidget(
                        width: size.width * 0.20,
                        height: size.height * 0.03,
                        onPressed: () {},
                        title: 'Login',
                      ),
                    ),
                  ),
                ],
              ),

              WidgetbookComponent(
                name: 'Button Register',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Button Register',
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: TextButtonWidget(
                        onTap: () {},
                        title: 'Register',
                      ),
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
        devices: [
          Apple.iPhone13ProMax,
          Apple.iPhone8,
        ]);
  }
}
