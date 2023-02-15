import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../chat_module/presenter/page/chat_page.dart';
import '../../list_stories_home_widget.dart';
import '../../sliverlist_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarHomeWidget(
            onPressedIcon: () {},
            titleAppBar: 'Messages',
            icon: Icon(
              Icons.search,
              size: size.width * 0.07,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                bottom: 17,
              ),
              child: RecentHomeWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height * 0.13,
              child: ListStoriesHomeWidget(
                sizeImage: size.aspectRatio * 85,
              ),
            ),
          ),
          SliverListWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChatPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
