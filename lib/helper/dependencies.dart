


import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/const/constants.dart';
import 'package:pass/main.dart';
import 'package:pass/view/details/controller.dart';
import 'package:pass/view/home/controller.dart';
import 'package:pass/view/main%20scaffold/main_scaffold.dart';

Future<void> init() async {
  // final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => prefs);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  
 

  //controllers
 Get.lazyPut(() =>  MainScaffold());
 Get.lazyPut(() => HomeController());
 Get.lazyPut(() => DetailsController());
  

  //Search
 
}
