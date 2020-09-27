import 'package:portfolio_website/src/resource/database/database.dart';
import 'package:portfolio_website/src/resource/resource.dart';

import '../configs.dart';

class AppDefautls {
  AppDefautls._();

  static const uid = "CppJ3tQzcDhHINak8NvHfAEMI0X2";
  static const name = "Minh Minh";
  static const avatar =
      "https://firebasestorage.googleapis.com/v0/b/portfoliowebsiteflutter.appspot.com/o/storage%2Favatar%2FIMG_0351.JPG?alt=media&token=0669c02a-5a91-4afb-be74-234044e6b21f";
  static const email = "minhminh9201@gmail.com";
  static const description = "Flutter,Android,IOS,Music,Esport,Traving";
  static List urls = [
    UrlSocialModel(
        description: "",
        icon: AppImages.icGithub,
        name: "Github",
        isFromFirebase: 0,
        url: AppValues.URL_GITHUB),
    UrlSocialModel(
        description: "",
        icon: AppImages.icFB,
        name: "Facebook",
        isFromFirebase: 0,
        url: AppValues.URL_FB),
    UrlSocialModel(
        description: "",
        icon: AppImages.icLinkedIn,
        name: "LinkedIn",
        isFromFirebase: 0,
        url: AppValues.URL_LINKEDIN),
    UrlSocialModel(
        description: "",
        icon: AppImages.icInstagram,
        name: "Instagram",
        isFromFirebase: 0,
        url: AppValues.URL_INSTAGRAM),
    UrlSocialModel(
        description: "",
        icon: AppImages.icMediumLight,
        name: "Medium",
        isFromFirebase: 0,
        url: AppValues.URL_MEDIUM),
  ];

  // static List<Blog> blogs = [
  //   Blog(
  //       id: 1,
  //       title: 'The Flutter GetX Ecosystem ~ State Management',
  //       description:
  //           'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty, performance and features. With development experience unlike any other framework, it does tick most of the boxes. However, it’s not perfect. There are some things that slow down the development from time to time.',
  //       image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
  //       isFromFirebase: 1,
  //       createTime: DateTime.now(),
  //       url:
  //           'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  //   Blog(
  //       id: 2,
  //       title: 'The Flutter GetX Ecosystem ~ State Management',
  //       description:
  //           'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty, performance and features. With development experience unlike any other framework, it does tick most of the boxes. However, it’s not perfect. There are some things that slow down the development from time to time.',
  //       image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
  //       isFromFirebase: 1,
  //       createTime: DateTime.now(),
  //       url:
  //           'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  //   Blog(
  //       id: 3,
  //       title: 'The Flutter GetX Ecosystem ~ State Management',
  //       description:
  //           'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty, performance and features. With development experience unlike any other framework, it does tick most of the boxes. However, it’s not perfect. There are some things that slow down the development from time to time.',
  //       image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
  //       isFromFirebase: 1,
  //       createTime: DateTime.now(),
  //       url:
  //           'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  // ];

  // static final List<Project> projects = [
  //   Project(
  //       id: 1,
  //       name: 'ViSafe',
  //       description:
  //           'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty...',
  //       image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
  //       isFromFirebase: 1,
  //       createTime: DateTime.now(),
  //       url:
  //           'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  //   Project(
  //       id: 2,
  //       name: 'ViSafe',
  //       description:
  //           'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty...',
  //       image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
  //       isFromFirebase: 1,
  //       createTime: DateTime.now(),
  //       url:
  //           'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  //   Project(
  //       id: 3,
  //       name: 'ViSafe',
  //       description:
  //           'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty...',
  //       image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
  //       isFromFirebase: 1,
  //       createTime: DateTime.now(),
  //       url:
  //           'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  // ];
}
