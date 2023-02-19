// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

import '../../../chat_module/presenter/page/chat_page.dart';
import '../../list_stories_home_widget.dart';
import '../../sliverlist_home_widget.dart';

class HomePage extends StatefulWidget {
  final bool isLightTheme;
  final void Function() toggleTheme;
  final Color colorRecent;

  const HomePage({
    Key? key,
    required this.isLightTheme,
    required this.toggleTheme,
    required this.colorRecent,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarHomeWidget(
            titleAppBar: 'Messages',
            iconTheme: Icon(
              widget.isLightTheme ? Icons.nightlight : Icons.wb_sunny,
            ),
            onPressedIconTheme: widget.toggleTheme,
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
                color: widget.colorRecent,
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
// TODO: Fazer que printe o horario e ultima mensagem recebida
            messageUser: 'ajustar o print',
            date: '08:43',
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
