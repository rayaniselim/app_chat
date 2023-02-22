import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardMessagesChat extends StatelessWidget {
  final String dataChat;
  final String message;
  final bool currentUser;

  const CardMessagesChat({
    super.key,
    required this.dataChat,
    required this.currentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.73,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // TODO: TIRAR A COLUNA
          children: [
            TextDataWidget(
              text: dataChat,
              style: TextStyles.textRegularDateChat,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            MessageCurrentUserWidget(
              messageText: message,
              currentUser: currentUser,
            ),
            // MENSAGEM RECEBIDA
            // Row(
            //   mainAxisAlignment:
            //       currentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(
            //         left: size.width * 0.065,
            //         bottom: size.height * 0.01,
            //       ),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: currentUser
            //               ? colorsExtension.cardSenderMessage
            //               : colorsExtension.cardRecipientMessage,
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         constraints: BoxConstraints(
            //           maxWidth: size.width * 0.75,
            //         ),
            //         padding: EdgeInsets.only(
            //           left: size.width * 0.03,
            //           right: size.width * 0.05,
            //           bottom: size.height * 0.008,
            //           top: size.height * 0.008,
            //         ),
            //         margin: EdgeInsets.only(
            //           bottom: size.height * 0.01,
            //         ),
            //         child: Column(
            //           crossAxisAlignment: currentUser
            //               ? CrossAxisAlignment.end
            //               : CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'teste messagem',
            //               textAlign:
            //                   currentUser ? TextAlign.right : TextAlign.left,
            //               style: TextStyles.textRegularMessageChat,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // MENSAGEM ENVIADA

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(
            //         right: size.width * 0.065,
            //         bottom: size.height * 0.01,
            //       ),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: colorsExtension.cardRecipientMessage,
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         constraints: BoxConstraints(
            //           maxWidth: size.width * 0.75,
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.only(
            //             left: size.width * 0.03,
            //             right: size.width * 0.05,
            //             bottom: size.height * 0.008,
            //             top: size.height * 0.008,
            //           ),
            //           child: Text(
            //             recipientMessage,
            //             style: TextStyles.textRegularMessageChat,
            //             textAlign: TextAlign.right,
            //           ),
            //         ),
            //       ),
            //   ),
            // ],
            // ),
            //
          ],
        ),
      ),
    );
  }
}
