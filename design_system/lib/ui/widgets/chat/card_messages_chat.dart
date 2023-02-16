import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CardMessagesChat extends StatelessWidget {
  final String dataChat;
  final String recipientMessage;
  final String senderMessage;

  const CardMessagesChat({
    super.key,
    required this.dataChat,
    required this.recipientMessage,
    required this.senderMessage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ColorsExtension colorsExtension =
        Theme.of(context).extension<ColorsExtension>()!;

    return SizedBox(
      height: size.height * 0.73,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // TODO: TIRAR A COLUNA
          children: [
            TextDataWidget(
              date: dataChat,
              style: TextStyles.textRegularDateChat,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            // MENSAGEM RECEBIDA
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.065,
                    bottom: size.height * 0.01,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorsExtension.cardSenderMessage,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.03,
                        bottom: size.height * 0.008,
                        top: size.height * 0.008,
                      ),
                      child: Text(
                        senderMessage,
// TODO: Arrumar o espaço pra nao quebrar
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
                  padding: EdgeInsets.only(
                    right: size.width * 0.065,
                    bottom: size.height * 0.01,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorsExtension.cardRecipientMessage,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.05,
                        bottom: size.height * 0.008,
                        top: size.height * 0.008,
                      ),
                      child: Text(
                        recipientMessage,
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
