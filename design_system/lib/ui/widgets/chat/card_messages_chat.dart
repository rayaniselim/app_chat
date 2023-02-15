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
          // TIRAR A COLUNA
          children: [
            TextDataWidget(
              date: dataChat,
              style: TextStyles.textRegularDateChat,
            ),
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
                      color: colorsExtension.cardSenderMessage,
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
                  padding: const EdgeInsets.only(
                    right: 30,
                    bottom: 7,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorsExtension.cardRecipientMessage,
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
