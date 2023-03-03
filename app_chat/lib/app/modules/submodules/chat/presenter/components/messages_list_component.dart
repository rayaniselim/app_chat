import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_chat/app/modules/submodules/chat/presenter/controllers/chat_controller.dart';

class MessageListComponent extends StatefulWidget {
  const MessageListComponent({Key? key}) : super(key: key);

  @override
  State<MessageListComponent> createState() => _MessageListComponentState();
}

class _MessageListComponentState extends State<MessageListComponent> {
  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    chatController = Modular.get<ChatController>();
    chatController.adicionarListenerMensagens();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chatController.atualizarListenerMensagens();
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final ColorsExtension colorsExtension =
        Theme.of(context).extension<ColorsExtension>()!;

    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          TextDataWidget(
            text:
                '${DateTime.now().day} MAR ${DateTime.now().hour}:${DateTime.now().minute}',
            style: TextStyles.textRegularDateChat,
          ),
          //Listagem de mensagens
          StreamBuilder(
              stream: chatController.streamController.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Expanded(
                      child: Center(
                        child: Column(
                          children: const [
                            Text('Carregando dados'),
                            CircularProgressIndicator()
                          ],
                        ),
                      ),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text('Erro ao carregar os dados!'));
                    } else {
                      QuerySnapshot querySnapshot =
                          snapshot.data as QuerySnapshot;
                      List<DocumentSnapshot> listaMensagens =
                          querySnapshot.docs.toList();

                      return Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          controller: chatController.scrollController,
                          itemCount: listaMensagens.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot mensagem = listaMensagens[index];

                            Alignment alinhamento = Alignment.topLeft;
                            var color = colorsExtension.cardSenderMessage;

                            if (chatController.usuarioRemetente.userId ==
                                mensagem['idUsuario']) {
                              alinhamento = Alignment.topRight;
                              color = colorsExtension.cardRecipientMessage;
                            }

                            return Column(
                              children: [
                                Align(
                                  alignment: alinhamento,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: size.width * 0.8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.all(6),
                                    child: Text(
                                      mensagem['texto'],
                                      style: TextStyles.textRegularMessageChat,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Align(
                                    alignment: chatController
                                                .usuarioRemetente.userId ==
                                            mensagem['idUsuario']
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: TextDataWidget(
                                      text:
                                          '${DateTime.now().hour}:${DateTime.now().minute}',
                                      style: TextStyles.textRegularDateChat,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                }
              }),
          SizedBox(height: size.height * 0.02),
          TextFieldChatWidget(
            prefixIcon: const Icon(
              Icons.camera_alt_outlined,
              size: 50,
            ),
            onPressedPrefixIcon: () {},
            hintText: 'Message',
            controller: chatController.controllerMensagem,
            child: IconButtonWidget(
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              onPressedIcon: () async {
                await chatController.enviarMensagem();
              },
            ),
          ),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}
