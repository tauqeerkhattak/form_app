import 'package:form_app/domain/bindings/home_binding.dart';
import 'package:form_app/screens/home/home.dart';
import 'package:get/get.dart';

class Routes {
  static const home = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => Home(),
      binding: HomeBinding(),
    ),
  ];
}
