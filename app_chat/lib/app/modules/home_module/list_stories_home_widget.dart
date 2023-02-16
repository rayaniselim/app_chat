import 'package:app_chat/core/mock/list_story_mock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ListStoriesHomeWidget extends StatelessWidget {
  final double sizeImage;

  const ListStoriesHomeWidget({
    Key? key,
    required this.sizeImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = const ListStoriesMock().listStoriesMock(
      height: size.height * 0.08,
      width: size.width * 0.18,
    );

    return ListView.builder(
      // LISTVIEW SEPARATEDE
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, indexActual) {
        return Column(
          /// COMPONENTIZAR DAQUI PRA BAIXO
          children: [
            Padding(
              padding: EdgeInsets.only(
                // TIRAR O PADDING,
                left: indexActual == 0 ? size.width * 0.06 : size.width * 0.03,
                right: size.width * 0.03,
              ),
              child: Column(
                children: [
                  FittedBox(
                    child: SizedBox(
                      height: size.height * 0.08,
                      child: ImageAppWidget(
                        image: list[indexActual].image,
                        sizeImage: sizeImage,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.009,
                  ),
                  Text(
                    list[indexActual].name.split(' ')[0], // PASSAR POR FORA
                    style: TextStyles.textRegularNameStories,
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
