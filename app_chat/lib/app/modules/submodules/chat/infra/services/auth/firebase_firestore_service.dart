import 'dart:async';

import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_service.dart';

class FirebaseFirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore firestore;

  const FirebaseFirestoreServiceImpl(this.firestore);

  @override
  Future<void> remotePutChatStatus(chat) async {
    final chatMap = chat.toMap();
    await firestore
        .collection('conversas')
        .doc(chat.idRemetente)
        .collection('ultimas_mensagens')
        .doc(chat.idDestinatario)
        .set(chatMap);
  }

  @override
  Future<void> addMessage(
      {required String idLoggedUser,
      required String idRecipient,
      required ChatMessageModel message}) async {
    final chatMessageMap = message.toMap();
    await firestore
        .collection('mensagens')
        .doc(idLoggedUser)
        .collection(idRecipient)
        .add(chatMessageMap);
  }

  @override
  Stream<List<Map<String, dynamic>>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    try {
      final result = firestore
          .collection('mensagens')
          .doc(idLoggedUser)
          .collection(idRecipientUser)
          .orderBy('data', descending: true)
          .snapshots()
          .map(
            (subscription) => subscription.docs
                .map(
                  (doc) => MessagesMapper().fromQuerySnapshot(doc),
                )
                .toList(),
          );
      return result;
    } catch (e) {
      rethrow;
    }

    // Stream<QuerySnapshot<Map<String, dynamic>>>
    // return await
    //  firestore.collection('mensagens')
    //  .doc(idLoggedUser)
    // .collection(idRecipientUser)
    // .orderBy('data', descending: true)
    // .snapshots();
    // throw UnimplementedError();
  }
/*




   .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print(doc["first_name"]);
        Map<String, dynamic> result = doc['key'];
      });
      // throw UnimplementedError();
    });




  FirebaseFirestore.instance
    .collection('users')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc["first_name"]);
        });
    });
    */

//   @override
//   Future<Map<String, dynamic>> loginWithEmailandPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       final credential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (credential.user == null) {
//         throw InvalidUserAuthException(stackTrace: StackTrace.current);
//       }
//       return _credentialToMap(credential.user!);
//     } on FirebaseAuthException catch (e, s) {
//       throw _handleFirebaseException(e, s);
//     }
//   }

//   AuthException _handleFirebaseException(
//       FirebaseAuthException err, StackTrace stack) {
//     switch (err.code) {
//       case 'invalid-email':
//         throw InvalidEmailAuthException(stackTrace: err.stackTrace ?? stack);
//       case 'user-disabled':
//         throw DisabledUserAuthException(stackTrace: err.stackTrace ?? stack);
//       case 'user-not-found':
//         throw UserNotFoundAuthException(stackTrace: err.stackTrace ?? stack);
//       case 'wrong-password':
//         throw WrongPasswordAuthException(stackTrace: err.stackTrace ?? stack);
//       default:
//         throw AuthException(
//           message: 'Generic exception ${err.code}',
//           stackTrace: err.stackTrace ?? stack,
//         );
//     }
//   }

//   @override
//   Future<void> logout() async {
//     try {
//       await _auth.signOut();
//     } on FirebaseAuthException catch (e, s) {
//       _handleFirebaseException(e, s);
//     }
//   }

//   @override
//   Future<Map<String, dynamic>> getUser() async {
//     final user = _auth.currentUser;

//     if (user == null) {
//       throw NotAuthenticatedAuthException(stackTrace: StackTrace.current);
//     }

//     return _credentialToMap(user);
//   }

//   Map<String, dynamic> _credentialToMap(User credential) {
//     return {
//       'email': credential.email,
//       'id': credential.uid,
//     };
  // }
}

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
