import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CardMessagesChat extends StatelessWidget {
  const CardMessagesChat({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.73,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TextDataChat(),
            const SizedBox(
              height: 15,
            ),
            // MENSAGEM RECEBIDA
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    bottom: 7,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsApp.yourMessageContainerColorDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 24,
                        bottom: 5,
                        top: 5,
                      ),
                      child: Text(
                        'dksandasnioasnaison   ', // odkasodaksdopsakdopaskdaosp  oskdpoadsoakdaoskads',
                        style: TextStyles.textRegularMessageChat,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // MENSAGEM ENVIADA
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    bottom: 7,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsApp.myMessageContainerColorDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 24,
                        bottom: 5,
                        top: 5,
                      ),
                      child: Text(
                        'dksandasnioasnaison',
                        style: TextStyles.textRegularMessageChat,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ],
            ), //
          ],
        ),
      ),
    );
  }
}
