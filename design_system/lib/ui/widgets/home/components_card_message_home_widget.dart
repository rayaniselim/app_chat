import 'package:app_chat/core/mock/list_story_mock.dart';
import 'package:flutter/material.dart';
import '../../styles/text_styles.dart';

class ComponentsCardMessageHomeWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ComponentsCardMessageHomeWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = const ListStoriesMock().listStoriesMock(
      height: size.height * 0.08,
      width: size.width * 0.18,
    );

    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                list[0].image,
                fit: BoxFit.fitHeight,
                height: size.height * 0.07,
                width: size.width * 0.15,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.47,
                        ),
                        Text(
                          '08:43',
                          style: TextStyles.textRegularMessageCard,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 240,
                      height: 20,
                      child: Text(
                        'adsasnandasiofiosanioasnioasndsiodsadaasadas',
                        style: TextStyles.textRegularMessageCard,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
