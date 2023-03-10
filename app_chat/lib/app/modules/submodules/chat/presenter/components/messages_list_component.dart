import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/presenter/controllers/chat_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
                    final listMessage = snapshot.data;

                    return Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: chatController.scrollController,
                        itemCount: listMessage.length,
                        itemBuilder: (context, index) {
                          final ChatMessageEntity message = listMessage[index];

                          Alignment align = Alignment.topLeft;
                          var color = colorsExtension.cardSenderMessage;

                          if (chatController.loggedUser.userId ==
                              message.userId) {
                            align = Alignment.topRight;
                            color = colorsExtension.cardRecipientMessage;
                          }

                          return Column(
                            children: [
                              Align(
                                alignment: align,
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
                                    message.text,
                                    style: TextStyles.textRegularMessageChat,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Align(
                                  alignment: chatController.loggedUser.userId ==
                                          message.userId
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
            },
          ),
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
          SizedBox(height: size.height * 0.04),
        ],
      ),
    );
  }
}
