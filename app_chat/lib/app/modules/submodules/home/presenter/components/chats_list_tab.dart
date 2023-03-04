import 'dart:async';

import 'package:app_chat/app/core/domain/entities/user_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_system/design_system.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/domain/usecases/remote_load_logged_user_data_usecase.dart';

class ChatsListTab extends StatefulWidget {
  const ChatsListTab({Key? key}) : super(key: key);

  @override
  State<ChatsListTab> createState() => _ChatsListTabState();
}

class _ChatsListTabState extends State<ChatsListTab> {
  late UserEntity loggedUser;

  Future<void> loadLoggedUserData() async {
    final remoteLoadLoggedUserData =
        Modular.get<RemoteLoadLoggedUserDataUseCase>();
    loggedUser = await remoteLoadLoggedUserData.call();
  }

  final FirebaseFirestore _firestore = Modular.get<FirebaseFirestore>();
  final FirebaseAuth _auth = Modular.get<FirebaseAuth>();

  late UserEntity _loggedUser;
  final StreamController _streamController =
      StreamController<QuerySnapshot>.broadcast();
  late StreamSubscription _streamConversas;

  _recuperarDadosIniciais() {
    User? loggedUser = _auth.currentUser;
    if (loggedUser != null) {
      String idUsuario = loggedUser.uid;
      String? nome = loggedUser.displayName ?? '';
      String? email = loggedUser.email ?? '';
      String? urlImagem = loggedUser.photoURL ?? '';

      _loggedUser = UserEntity(
        userId: idUsuario,
        name: nome,
        email: email,
        imageUrl: urlImagem,
      );
    }

    _adicionarListenerConversas();
  }

  _adicionarListenerConversas() {
    final stream = _firestore
        .collection('conversas')
        .doc(_loggedUser.userId)
        .collection('ultimas_mensagens')
        .snapshots();

    _streamConversas = stream.listen((dados) {
      _streamController.add(dados);
    });
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosIniciais();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadLoggedUserData();
    });
  }

  @override
  void dispose() {
    _streamConversas.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: const [
                  Text('Carregando conversas'),
                  CircularProgressIndicator()
                ],
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Center(child: Text('Erro ao carregar os dados!'));
            } else {
              QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
              List<DocumentSnapshot> listaConversas =
                  querySnapshot.docs.toList();

              return ListView.builder(
                itemCount: listaConversas.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot conversation = listaConversas[index];
                  String urlImagemDestinatario =
                      conversation['urlImagemDestinatario'];
                  String recipientName = conversation['nomeDestinatario'];
                  String recipientEmail = conversation['emailDestinatario'];
                  String lastMessage = conversation['ultimaMensagem'];
                  String idDestinatario = conversation['idDestinatario'];

                  UserEntity recipientUser = UserEntity(
                    userId: idDestinatario,
                    name: recipientName,
                    email: recipientEmail,
                    imageUrl: urlImagemDestinatario,
                  );

                  return ListTile(
                    onTap: () {
                      Modular.to.pushNamed(
                        '/chat',
                        arguments: {
                          'usuarioRemetente': loggedUser,
                          'usuarioDestinatario': recipientUser,
                        },
                      );
                    },
                    leading: ImageProviderWidget(
                      imageProvider: CachedNetworkImageProvider(
                        recipientUser.imageUrl,
                      ),
                      sizeImage: 25,
                    ),
                    title: Text(
                      recipientUser.name,
                      style: TextStyles.textSemiBoldTitles.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      lastMessage,
                      style: TextStyles.textRegularMessageCard,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    trailing: Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}',
                      style: TextStyles.textRegularMessageCard,
                    ),
                  );
                },
              );
            }
        }
      },
    );
  }
}
