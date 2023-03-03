import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../core/domain/entities/user_entity.dart';

class HomeController {
  FirebaseFirestore firestore = Modular.get<FirebaseFirestore>();
  FirebaseAuth auth = Modular.get<FirebaseAuth>();

  late UserEntity _loggedUser;
  StreamController streamController =
      StreamController<QuerySnapshot>.broadcast();
  late StreamSubscription streamConversas;

  recuperarDadosIniciais() {
    User? loggedInUser = auth.currentUser;
    if (loggedInUser != null) {
      String userId = loggedInUser.uid;
      String? name = loggedInUser.displayName ?? '';
      String? email = loggedInUser.email ?? '';
      String? imageUrl = loggedInUser.photoURL ?? '';

      _loggedUser = UserEntity(
        userId: userId,
        name: name,
        email: email,
        imageUrl: imageUrl,
      );
    }

    _adicionarListenerConversas();
  }

  _adicionarListenerConversas() {
    final stream = firestore
        .collection('conversas')
        .doc(_loggedUser.userId)
        .collection('ultimas_mensagens')
        .snapshots();

    streamConversas = stream.listen((dados) {
      streamController.add(dados);
    });
  }
}
