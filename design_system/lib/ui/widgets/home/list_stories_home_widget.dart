import 'package:app_chat/core/mock/list_story_mock.dart';

import 'package:flutter/material.dart';

import '../../../design_system.dart';

class ListStoriesHomeWidget extends StatelessWidget {
  const ListStoriesHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = const ListStoriesMock().listStoriesMock(
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
              padding: EdgeInsets.only(
                left: indexAtual == 0 ? 25 : 12,
                bottom: 9,
                right: 12,
              ),
              child: Column(
                children: [
                  FittedBox(
                    child: SizedBox(
                      height: 70,
                      child: ImageAppWidget(
                        image: list[indexAtual].image,
                      ),
                    ),
                  ),
                  Text(
                    list[indexAtual].name.split(' ')[0],
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
