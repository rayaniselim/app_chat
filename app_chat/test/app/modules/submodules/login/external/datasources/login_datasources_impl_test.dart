import 'package:app_chat/app/modules/submodules/login/infra/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_chat/app/modules/submodules/login/external/datasources/login_datasources_impl.dart';

class AuthServiceMock extends Mock implements AuthService {}

void main() {
  final authServiceMock = AuthServiceMock();
  final dataSource = LoginDatasourceImpl(authServiceMock);
  test('Deve retornar um Map<String, dynamic>', () async {
    const email = 'rayani@user.com';
    const password = '123456';

    const Map<String, dynamic> responseMock = {
      'id': '1',
      'name': 'rayani',
      'email': 'rayani@user.com',
    };
    when(() => authServiceMock.loginWithEmailandPassword(email, password))
        .thenAnswer((_) async => responseMock);

    final resultService =
        await dataSource.loginWithEmailandPassword(email, password);

    expect(resultService, isNotEmpty);
    expect(resultService, isA<Map<String, dynamic>>());
  });
}


///  User? get currentUser; ???? testar? TODO: