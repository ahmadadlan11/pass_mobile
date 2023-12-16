import 'package:get/get.dart';
import 'package:pass/view/details/view.dart';
import 'package:pass/view/main%20scaffold/main_scaffold.dart';

class Pages {
  static final routes = [
    GetPage(name: Routes.mainScaffold, page: () =>  MainScaffold(),),
     GetPage(name: Routes.details, page: () => const DetailsView(),),
  ];
}

class Routes {
  static const home = '/home';
  static const details = '/details';
  static const favorites = '/favorites';
  static const passes = '/passes';
  static const more = '/more';
  static const splash = '/splash';
  static const mainScaffold = '/';
}
