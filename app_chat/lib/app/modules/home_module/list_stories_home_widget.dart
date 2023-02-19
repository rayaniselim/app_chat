import 'package:app_chat/core/mock/list_user_mock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ListStoriesHomeWidget extends StatelessWidget {
  final double sizeImage;
  // final String imageMock;
  // final String nameMock;

  const ListStoriesHomeWidget({
    Key? key,
    required this.sizeImage,
    // required this.imageMock,
    // required this.nameMock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = listUserMock;

    final height = SizedBox(
      height: size.height * 0.009,
    );

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Row();
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? size.width * 0.06 : size.width * 0.03,
              right: size.width * 0.03,
            ),
            child: Column(
              children: [
                ImageStoriesWidget(
                  image: list[index].image, // PASSAR POR FORA
                  sizeImage: sizeImage,
                ),
                height,
                TextWidget(
                  style: TextStyles.textRegularNameStories,
                  // text: nameMock,
                  text: list[index].name.split(' ')[0], // PASSAR POR FORA
                ),
                height,
              ],
            ));
      },
    );
  }
}
