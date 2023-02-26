// import 'dart:async';
// import 'dart:math';
// import 'package:app_chat/core/domain/entities/user_entity.dart';
// import 'package:app_chat/app/modules/chat/domain/entities/chat_entity.dart';
// import '../chat_service.dart';

// class ChatServiceMock implements ChatService {
//   static final List<ChatEntity> _msgs = [
//     ChatEntity(
//       id: '8',
//       message: 'Mensagem Mock',
//       date: DateTime.now(),
//       userId: '123',
//       userName: 'rayani',
//     ),
//   ];

//   static MultiStreamController<List<ChatEntity>>? _controller;
//   static final _msgsStream = Stream<List<ChatEntity>>.multi((controller) {
//     _controller = controller;
//     controller.add(_msgs);
//   });

//   @override
//   Stream<List<ChatEntity>> messagesStream() {
//     return _msgsStream;
//   }

//   @override
//   Future<ChatEntity> save(String message, UserEntity user) async {
//     final newMessage = ChatEntity(
//       id: Random().nextDouble().toString(),
//       message: message,
//       date: DateTime.now(),
//       userId: user.idUser,
//       userName: user.name,
//     );
//     _msgs.add(newMessage);
//     _controller?.add(_msgs.reversed.toList());
//     return newMessage;
//   }
// }
