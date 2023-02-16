import 'package:app_chat/core/mock/list_story_mock.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

class ComponentsCardMessageHomeWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String date;
  final String messageUser;

  const ComponentsCardMessageHomeWidget({
    Key? key,
    required this.onTap,
    required this.date,
    required this.messageUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = const ListStoriesMock().listStoriesMock(
      height: size.height * 0.08,
      width: size.width * 0.18,
    );

    return Padding(
      padding: const EdgeInsets.only(
        right: 25,
        left: 25,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                list[0].image,
                fit: BoxFit.fitHeight,
                height: size.height * 0.07,
                width: size.width * 0.15,
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Text(
                            list[0].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.textSemiBoldTitles.copyWith(
                              fontSize: 15,
                              //  TODO:: COLOR SEMIBOLD TITLE
                              // color: ColorsAppDark.secondary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 230,
                        height: 20,
                        child: Text(
                          messageUser,
                          style: TextStyles.textRegularMessageCard,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.07,
                      bottom: 25,
                    ),
                    child: TextDataWidget(
                      date: date,
                      style: TextStyles.textRegularMessageCard,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
