import 'package:app_chat/core/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

class ComponentsCardMessageHomeWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String date;
  final bool selectedItem;
  final UserEntity user;
  final String message;

  const ComponentsCardMessageHomeWidget({
    Key? key,
    required this.onTap,
    required this.date,
    required this.selectedItem,
    required this.user,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        right: size.width * 0.06,
        left: size.width * 0.06,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                user.image!,
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
                            user.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.textSemiBoldTitles.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.54,
                        height: size.height * 0.03,
                        child: Text(
                          message,
                          style: TextStyles.textRegularMessageCard,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.05,
                      bottom: size.height * 0.03,
                    ),
                    child: TextWidget(
                      text: date,
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
