import 'package:app_chat/core/data/list_story_data.dart';
import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';
import '../image_app_widget.dart';

class ListImagesHomeWidget extends StatelessWidget {
  const ListImagesHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = ListStoriesData().listStoriesData(
      height: size.height * 0.08,
      width: size.width * 0.18,
    );

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, indexAtual) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                bottom: 9,
                right: 12,
              ),
              child: Column(
                children: [
                  ImageAppWidget(
                    height: list[indexAtual].heigth,
                    width: list[indexAtual].width,
                    image: list[indexAtual].image,
                  ),
                  Text(
                    list[indexAtual].name,
                    style: TextStyles.textRegularNameStories,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
