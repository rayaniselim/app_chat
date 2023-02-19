import 'package:app_chat/core/mock/list_user_mock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ListStoriesHomeWidget extends StatelessWidget {
  final double sizeImage;
  // final String textName;
  // final Widget childImage;

  const ListStoriesHomeWidget({
    Key? key,
    required this.sizeImage,
    // required this.textName,
    // required this.childImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = const ListUserMock().listUserMock(
      height: size.height * 0.08,
      width: size.width * 0.18,
    );

    final height = SizedBox(
      height: size.height * 0.009,
    );

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ImageStoriesWidget(
              image: list[index].image,
              sizeImage: sizeImage,
            ),
            height,
            TextWidget(
              style: TextStyles.textRegularNameStories,
              text:
                  // textName,
                  list[index].name.split(' ')[0], // PASSAR POR FORA
            ),
            height,
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? size.width * 0.06 : size.width * 0.03,
            right: size.width * 0.03,
          ),
        );
      },
    );
  }
}
