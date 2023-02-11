import 'package:app_chat/core/data/list_story_data.dart';
import 'package:flutter/material.dart';

import '../image_app_widget.dart';

class ListImagesHomeWidget extends StatelessWidget {
  const ListImagesHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = ListStoriesData(
            //  TODO arrumar o tamanho depois
            )
        .listStoriesData(
      height: size.height * 0.05,
      width: size.width * 0.12,
    );
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, indexAtual) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 20,
            // right: 20,
            top: 24,
            bottom: 24,
          ),
          child: ImageAppWidget(
            height: list[indexAtual].heigth,
            width: list[indexAtual].width,
            image: list[indexAtual].image,
          ),
        );
      },
    );
  }
}
