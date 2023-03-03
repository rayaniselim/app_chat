import 'package:app_chat/app/modules/submodules/home/presenter/components/chats_list_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/components/list_stories_home_widget.dart';
import '../../../core/presenter/stores/theme_store.dart';
import 'presenter/components/contacts_list_tab.dart';

class HomePage extends StatefulWidget {
  final ThemeStore themeStore;

  const HomePage({
    Key? key,
    required this.themeStore,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = Modular.get<FirebaseAuth>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeStore = Modular.get<ThemeStore>();
    final ColorsExtension colorsExtension =
        Theme.of(context).extension<ColorsExtension>()!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 100),
        child: AppBarHomeWidget(
          titleAppBar: 'Messages',
          iconTheme: Icon(
            themeStore.isLightTheme ? Icons.nightlight : Icons.wb_sunny,
          ),
          onPressedIconTheme: themeStore.toggleTheme,
          iconLogout: Icon(
            Icons.logout_outlined,
            size: size.width * 0.07,
          ),
          onPressedIconLogout: () async {
            await auth.signOut();
            Modular.to.navigate('/login/loginPage');
          },
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                bottom: size.width * 0.03,
              ),
              child: RecentHomeWidget(
                textRecent: 'R E C E N T',
                color: themeStore.isLightTheme
                    ? ColorsAppLight.secondary
                    : ColorsAppDark.secondary.withOpacity(0.58),
              ),
            ),
            SizedBox(
              height: size.height * 0.14,
              child: ListStoriesHomeWidget(
                sizeImage: size.aspectRatio * 85,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: colorsExtension.cardSliverListHome,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.06,
                  ),
                  child: const TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ChatsListTab(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ContactsListTab(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
