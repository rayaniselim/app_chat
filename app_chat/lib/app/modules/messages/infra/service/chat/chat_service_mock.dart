import 'dart:async';
import 'dart:math';
import 'package:app_chat/core/domain/entities/user_entity.dart';
import 'package:app_chat/app/modules/messages_module/domain/entities/message_entity.dart';
import 'chat_service.dart';

class ChatServiceMock implements ChatService {
  static final List<MessageEntity> _msgs = [
    MessageEntity(
      id: '8',
      message: 'Mensagem Mock',
      date: DateTime.now(),
      userId: '123',
      userName: 'rayani',
    ),
  ];

  static MultiStreamController<List<MessageEntity>>? _controller;
  static final _msgsStream = Stream<List<MessageEntity>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<MessageEntity>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<MessageEntity> save(String message, UserEntity user) async {
    final newMessage = MessageEntity(
      id: Random().nextDouble().toString(),
      message: message,
      date: DateTime.now(),
      userId: user.id,
      userName: user.name,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());
    return newMessage;
  }
}
