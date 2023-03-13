import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesMapper {
  Map<String, dynamic> fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    return {
      'data': document['data'],
      'idUsuario': document['idUsuario'],
      'texto': document['texto'],
    };
  }
}
