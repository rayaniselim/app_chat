import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_system/design_system.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/domain/entities/user_entity.dart';
import '../../../../../core/domain/usecases/remote_load_logged_user_data_usecase.dart';

class ContactsListTab extends StatefulWidget {
  const ContactsListTab({Key? key}) : super(key: key);

  @override
  State<ContactsListTab> createState() => _ContactsListTabState();
}

class _ContactsListTabState extends State<ContactsListTab> {
  late UserEntity usuarioRemetente;

  Future<void> loadLoggedUserData() async {
    final remoteLoadLoggedUserData =
        Modular.get<RemoteLoadLoggedUserDataUseCase>();
    usuarioRemetente = await remoteLoadLoggedUserData.call();
  }

  final FirebaseAuth _auth = Modular.get<FirebaseAuth>();
  final FirebaseFirestore _firestore = Modular.get<FirebaseFirestore>();
  late String _idUserLogado;

  Future<List<UserEntity>> _recuperarContatos() async {
    final usuarioRef = _firestore.collection('usuarios');
    QuerySnapshot querySnapshot = await usuarioRef.get();
    List<UserEntity> listaUsuarios = [];

    for (DocumentSnapshot item in querySnapshot.docs) {
      String userId = item['userId'];
      if (userId == _idUserLogado) continue;

      String email = item['email'];
      String name = item['name'];
      String image = item['imageUrl'];

      UserEntity usuario = UserEntity(
        userId: userId,
        name: name,
        email: email,
        imageUrl: image,
      );
      listaUsuarios.add(usuario);
    }

    return listaUsuarios;
  }

  _recuperarDadosUsuarioLogado() async {
    User? usuarioAtual = _auth.currentUser;
    if (usuarioAtual != null) {
      _idUserLogado = usuarioAtual.uid;
    }
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuarioLogado();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadLoggedUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserEntity>>(
        future: _recuperarContatos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: const [
                    Text('Carregando contatos'),
                    CircularProgressIndicator()
                  ],
                ),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(child: Text('Erro ao carregar os dados!'));
              } else {
                List<UserEntity>? listaUsuarios = snapshot.data;
                if (listaUsuarios != null) {
                  return ListView.builder(
                    itemCount: listaUsuarios.length,
                    itemBuilder: (context, index) {
                      UserEntity usuarioDestinatario = listaUsuarios[index];
                      return ListTile(
                        onTap: () {
                          Modular.to.pushNamed(
                            '/chat',
                            arguments: {
                              'usuarioRemetente': usuarioRemetente,
                              'usuarioDestinatario': usuarioDestinatario,
                            },
                          );
                        },
                        leading: ImageProviderWidget(
                          imageProvider: CachedNetworkImageProvider(
                            usuarioDestinatario.imageUrl,
                          ),
                          sizeImage: 25,
                        ),
                        title: Text(
                          usuarioDestinatario.name,
                          style: TextStyles.textSemiBoldTitles.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(8),
                      );
                    },
                  );
                }

                return const Center(child: Text('Nenhum contato encontrado!'));
              }
          }
        });
  }
}
