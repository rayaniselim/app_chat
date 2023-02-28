// import 'package:app_chat/app/modules/login/domain/entities/login_entity.dart';
// import 'package:app_chat/app/modules/login/domain/repositories/login_repository.dart';
// import 'package:app_chat/app/modules/login/infra/datasources/login_datasource.dart';
// import 'package:app_chat/app/modules/login/infra/repositories/login_repository_impl.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class DataSourceMock extends Mock implements LoginDataSource {}

// void main() {
//   late LoginRepository repository;
//   late LoginDataSource datasource;

//   setUp(() {
//     datasource = DataSourceMock();
//     repository = LoginRepositoryImpl(loginDataSource: datasource);
//   });

//   test('o loginWithEmailAndPassword deve retornar um Future', () async {
//     final userMock = UserCredential();

//     when(
//       () async => await datasource.loginWithEmailAndPassword(
//         email: 'rayani@user.com',
//         password: '123456',
//       ),
//     ).thenAnswer((_) => userMock);

//     final loginWithEmailAndPassword =
//         await repository.loginWithEmailAndPassword(
//       email: 'rayani@user.com',
//       password: '123456',
//     );

//     expect(loginWithEmailAndPassword, isA<Future<UserCredential>>());
//     // expect(loginWithEmailAndPassword, isNull);

//     // expect(loginWithEmailAndPassword, isA<UserCredential>);
//   });
// }
