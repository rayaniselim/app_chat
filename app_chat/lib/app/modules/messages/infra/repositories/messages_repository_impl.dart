import 'package:app_chat/app/modules/messages/domain/repositories/messages_repository.dart';

import '../datasources/message_datasource.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final MessageDataSource dataSource;

  MessagesRepositoryImpl(this.dataSource);
}
