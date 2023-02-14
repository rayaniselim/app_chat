import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarHomeWidget(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height * 0.12,
              child: const ListStoriesHomeWidget(),
            ),
          ),

          /// TODO: arrumar 2 containers pra fazer o efeito
          SliverListWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
