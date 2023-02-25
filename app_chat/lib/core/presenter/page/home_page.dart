import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/list_stories_home_widget.dart';

import '../components/sliverlist_home_widget.dart';

import '../theme_store.dart';

class HomePage extends StatelessWidget {
  final ThemeStore themeStore;

  const HomePage({
    Key? key,
    required this.themeStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeStore = Modular.get<ThemeStore>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarHomeWidget(
            titleAppBar: 'Messages',
            iconTheme: Icon(
              themeStore.isLightTheme ? Icons.nightlight : Icons.wb_sunny,
            ),
            onPressedIconTheme: themeStore.toggleTheme,
            iconLogout: Icon(
              Icons.logout_outlined,
              size: size.width * 0.07,
            ),
            onPressedIconLogout: () => Modular.to.navigate('/login/loginPage'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                bottom: size.width * 0.02,
              ),
              child: RecentHomeWidget(
                textRecent: 'R E C E N T',
                color: themeStore.isLightTheme
                    ? ColorsAppLight.secondary
                    : ColorsAppDark.secondary.withOpacity(0.58),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height * 0.14,
              child: ListStoriesHomeWidget(
                sizeImage: size.aspectRatio * 85,
              ),
            ),
          ),
          SliverListWidget(
            messageUser: 'ARRUMAR AQUI',
            date: ('${DateTime.now().hour}:${DateTime.now().minute}'),
          ),
        ],
      ),
    );
  }
}
