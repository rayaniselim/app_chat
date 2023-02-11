import 'package:app_chat/core/data/list_story_data.dart';
import 'package:flutter/material.dart';
import '../../styles/colors_app.dart';
import '../icon_search_widget.dart';
import '../image_app_widget.dart';
import 'name_chat_widget.dart';

class AppBarChatWidget extends StatelessWidget {
  const AppBarChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final statusBar = MediaQuery.of(context).viewPadding.top;
    final heightAppBar = AppBar().preferredSize.height;
    final list = ListStoriesData(
            //  TODO arrumar o tamanho depois
            )
        .listStoriesData(
      height: size.height * 0.05,
      width: size.width * 0.045,
      // height: 0,
      // width: 0,
    );
    return SliverAppBar(
      toolbarHeight: heightAppBar + statusBar,
      floating: true,
      elevation: 0,
      backgroundColor: ColorsApp.primary,
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              ImageAppWidget(
                height: size.height * 0.06,
                width: size.width * 0.12,
                image: list[0].image,
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        const Center(child: NameChatWidget()),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 25),
          child: IconSearchWidget(),
        ),
      ],
    );
  }
}
