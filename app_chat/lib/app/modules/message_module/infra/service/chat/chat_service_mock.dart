import 'dart:async';
import 'dart:math';
import 'package:app_chat/app/modules/domain/entities/user_model.dart';
import 'package:app_chat/app/modules/message_module/domain/entities/message_model.dart';
import 'chat_service.dart';

class ChatServiceMock implements ChatService {
  static final List<MessageModel> _msgs = [];

  static MultiStreamController<List<MessageModel>>? _controller;
  static final _msgsStream = Stream<List<MessageModel>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<MessageModel>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<MessageModel> save(String message, UserModel user) async {
    final newMessage = MessageModel(
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
