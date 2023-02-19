import 'package:app_chat/app/modules/domain/entities/model.dart';

class ListUserMock {
  const ListUserMock();

  List<UserModel> listUserMock({
    required double height,
    required double width,
  }) {
    return [
      const UserModel(
        // heigth: height,
        // width: width,
        image: 'assets/image/hyun-bin.webp',
        name: 'Hyun Bin',
        email: '',
      ),
      const UserModel(
        // heigth: height,
        // width: width,
        name: 'Seo Ji-hye',
        image: 'assets/image/Seo-Ji-hye .png',
        email: '',
      ),
      const UserModel(
        // heigth: height,
        // width: width,
        name: 'Son Ye-jin',
        image: 'assets/image/Son Ye-jin.webp',
        email: '',
      ),
      const UserModel(
        // heigth: height,
        // width: width,
        name: 'Kim Seon-ho',
        image: 'assets/image/kim-seon-ho.jpeg',
        email: '',
      ),
      const UserModel(
        // heigth: height,
        // width: width,
        name: 'Shin Min-a',
        image: 'assets/image/Shin Min-a .jpeg',
        email: '',
      ),
      const UserModel(
        // heigth: height,
        // width: width,
        name: 'Song Joong-ki',
        image: 'assets/image/vincenzo.png',
        email: '',
      ),
      const UserModel(
        // heigth: height,
        // width: width,
        name: 'Jeon Yeo-been',
        image: 'assets/image/Jeon Yeo-been.jpeg',
        email: '',
      ),
    ];
  }
}
