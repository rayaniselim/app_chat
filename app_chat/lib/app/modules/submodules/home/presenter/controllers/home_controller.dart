import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../core/domain/entities/user_entity.dart';

class HomeController {
  FirebaseFirestore firestore = Modular.get<FirebaseFirestore>();
  FirebaseAuth auth = Modular.get<FirebaseAuth>();

  late UserEntity _usuarioRemetente;
  StreamController streamController =
      StreamController<QuerySnapshot>.broadcast();
  late StreamSubscription streamConversas;

  recuperarDadosIniciais() {
    User? usuarioLogado = auth.currentUser;
    if (usuarioLogado != null) {
      String userId = usuarioLogado.uid;
      String? name = usuarioLogado.displayName ?? '';
      String? email = usuarioLogado.email ?? '';
      String? urlImagem = usuarioLogado.photoURL ?? '';

      _usuarioRemetente = UserEntity(
        userId: userId,
        name: name,
        email: email,
        imageUrl: urlImagem,
      );
    }

    _adicionarListenerConversas();
  }

  _adicionarListenerConversas() {
    final stream = firestore
        .collection('conversas')
        .doc(_usuarioRemetente.userId)
        .collection('ultimas_mensagens')
        .snapshots();

    streamConversas = stream.listen((dados) {
      streamController.add(dados);
    });
  }
}
