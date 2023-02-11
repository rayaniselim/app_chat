import 'package:design_system/design_system.dart';
import 'package:design_system/ui/widgets/home/list_images_home_widget.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            // physics: const ClampingScrollPhysics(), // fica paradinho
            slivers: [
              const AppBarHomeWidget(),
              SliverToBoxAdapter(
                /// TODO: DEIXAR OS STORIES SEM SCROLL VERTICAL
                child: SizedBox(
                  height: size.height * 0.116,
                  child: const ListImagesHomeWidget(),
                ),
              ),
              CardSliverListWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
