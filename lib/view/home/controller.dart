import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/const/colors.dart';
import 'package:pass/view/home/model.dart';
import 'package:pass/view/home/repo.dart';


class HomeController extends GetxController {
  PackageRepo repo = PackageRepo(apiClient: Get.find<ApiClient>());
  Map<int, bool> titlesStatus = {
    0: true,
    1: false,
    2: false,
  };
  Color color = AppColor.primary;
  int number = 5;
   bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _noInternet = false;
  bool get noInternet => _noInternet;
  List<PackageModel>? packages;

  Future<void> getPackage() async {
    _noInternet = false;
    _isLoading = true;

    update();
    Response response = await repo.getPackage();

    if (response.statusCode == 200) {
      for (var i = 0; i < response.body.length; i++) {
        packages?.add(PackageModel.fromMap(response.body));
      }
    } else {
      _noInternet = true;
      update();
    }
    _isLoading = false;
    update();
  }

 
  changeStatus(int title) {
    for (var i = 0; i < 3; i++) {
      titlesStatus[i] = false;
    }

    titlesStatus[title] = true;
    color = title == 0
        ? AppColor.primary
        : title == 1
            ? Colors.teal
            : Colors.teal.shade900;
    number = title == 0
        ? 5
        : title == 1
            ? 2
            : 3;
    update();
  }
}
