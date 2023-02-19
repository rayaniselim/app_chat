import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';
import '../../list_stories_home_widget.dart';
import '../../sliverlist_home_widget.dart';

class HomePage extends StatelessWidget {
  final bool isLightTheme;
  // final UserModel user;

  final void Function() toggleTheme;
  final Color colorRecent;

  const HomePage({
    Key? key,
    required this.isLightTheme,
    required this.toggleTheme,
    required this.colorRecent,
    // required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarHomeWidget(
            titleAppBar: 'Messages',
            iconTheme: Icon(
              isLightTheme ? Icons.nightlight : Icons.wb_sunny,
            ),
            onPressedIconTheme: toggleTheme,
            iconSearch: Icon(
              Icons.search,
              size: size.width * 0.07,
            ),
            onPressedIconSearch: (() {}),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                bottom: size.width * 0.02,
              ),
              child: RecentHomeWidget(
                textRecent: 'R E C E N T',
                color: colorRecent,
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
          const SliverListWidget(
// TODO: Fazer que printe o horario e ultima mensagem recebida
            messageUser: 'ajustar o print',
            date: '08:43',
            // onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => ChatPage(
            // user: listUserMock[index],
            //     ),
          ),
          // );
          // },
          // ),
        ],
      ),
    );
  }
}
