// import 'dart:async';

// import 'package:app_chat/app/modules/login/domain/entities/login_entity.dart';

// import 'auth_service.dart';

// class AuthMockService implements AuthService {
//   static const _defaultUser = LoginEntity(
//     email: 'rayani@user.com',
//     password: '123456',
//     name: 'rayani',
//   );

//   static final Map<String, LoginEntity> _users = {
//     _defaultUser.email: _defaultUser,
//   };
//   static LoginEntity? _currentUser;
//   static MultiStreamController<LoginEntity?>? _controller;
//   static final _userStream = Stream<LoginEntity?>.multi((controller) {
//     _controller = controller;
//     _updateUser(_defaultUser);
//   });

//   @override
//   LoginEntity? get currentUser {
//     return _currentUser;
//   }

//   @override
//   Stream<LoginEntity?> get userChanges {
//     return _userStream;
//   }

//   @override
//   Future<void> signup(
//     String email,
//     String password,
//   ) async {
//     final newUser = LoginEntity(
//       email: email,
//       password: password,
//     name: null,
//     );

//     _users.putIfAbsent(email, () => newUser);
//     _updateUser(newUser);
//   }

//   @override
//   Future<void> login(String email, String password) async {
//     _updateUser(_users[email]);
//   }

//   @override
//   Future<void> logout() async {
//     _updateUser(null);
//   }

//   static void _updateUser(LoginEntity? user) {
//     _currentUser = user;
//     _controller?.add(_currentUser);
//   }
// }



// // import 'dart:async';
// // import 'dart:math';
// // import 'package:app_chat/core/domain/entities/user_entity.dart';

// // import 'auth_service.dart';

// // class AuthMockService implements AuthService {
// //   static const _defaultUser = LoginEntity(
// //     id: '8',
// //     name: 'rayani',
// //     email: 'rayani@user.com',
// //     image: '',
// //   );

// //   static final Map<String, LoginEntity> _users = {
// //     _defaultUser.email: _defaultUser,
// //   };
// //   static LoginEntity? _currentUser;
// //   static MultiStreamController<LoginEntity?>? _controller;
// //   static final _userStream = Stream<LoginEntity?>.multi((controller) {
// //     _controller = controller;
// //     _updateUser(_defaultUser);
// //   });

// //   @override
// //   LoginEntity? get currentUser {
// //     return _currentUser;
// //   }

// //   @override
// //   Stream<LoginEntity?> get userChanges {
// //     return _userStream;
// //   }

// //   @override
// //   Future<void> signup(
// //     String name,
// //     String email,
// //     String password,
// //   ) async {
// //     final newUser = LoginEntity(
// //       id: Random().nextDouble().toString(),
// //       name: name,
// //       email: email,
// //       image: '',
// //     );

// //     _users.putIfAbsent(email, () => newUser);
// //     _updateUser(newUser);
// //   }

// //   @override
// //   Future<void> login(String email, String password) async {
// //     _updateUser(_users[email]);
// //   }

// //   @override
// //   Future<void> logout() async {
// //     _updateUser(null);
// //   }

// //   static void _updateUser(LoginEntity? user) {
// //     _currentUser = user;
// //     _controller?.add(_currentUser);
// //   }
// // }
