import 'dart:async';
import 'dart:math';
import 'package:app_chat/core/domain/entities/user_entity.dart';

import 'auth_service.dart';

class AuthMockService implements AuthService {
  static const _defaultUser = UserEntity(
    id: '8',
    name: 'rayani',
    email: 'rayani@user.com',
    image: '',
  );

  static final Map<String, UserEntity> _users = {
    _defaultUser.email: _defaultUser,
  };
  static UserEntity? _currentUser;
  static MultiStreamController<UserEntity?>? _controller;
  static final _userStream = Stream<UserEntity?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  UserEntity? get currentUser {
    return _currentUser;
  }

  @override
  Stream<UserEntity?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
  ) async {
    final newUser = UserEntity(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      image: '',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(UserEntity? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
