import '../../app/modules/domain/entities/story_model.dart';

class ListStoriesMock {
  const ListStoriesMock();

  List<StoryModel> listStoriesMock({
    required double height,
    required double width,
  }) {
    return [
      StoryModel(
        heigth: height,
        width: width,
        image: 'assets/image/hyun-bin.webp',
        name: 'Hyun Bin',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Seo Ji-hye',
        image: 'assets/image/Seo-Ji-hye .png',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Son Ye-jin',
        image: 'assets/image/Son Ye-jin.webp',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Kim Seon-ho',
        image: 'assets/image/kim-seon-ho.jpeg',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Shin Min-a',
        image: 'assets/image/Shin Min-a .jpeg',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Song Joong-ki',
        image: 'assets/image/vincenzo.png',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Jeon Yeo-been',
        image: 'assets/image/Jeon Yeo-been.jpeg',
      ),
      StoryModel(
        heigth: height,
        width: width,
        image: 'assets/image/hyun-bin.webp',
        name: 'Hyun Bin',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Seo Ji-hye',
        image: 'assets/image/Seo-Ji-hye .png',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Son Ye-jin',
        image: 'assets/image/Son Ye-jin.webp',
      ),
      StoryModel(
        heigth: height,
        width: width,
        name: 'Kim Seon-ho',
        image: 'assets/image/kim-seon-ho.jpeg',
      ),
    ];
  }
}
