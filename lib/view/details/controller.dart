import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/view/details/model.dart';
import 'package:pass/view/details/repo.dart';



class DetailsController extends GetxController {
  DetailsRepo repo = DetailsRepo(apiClient: Get.find<ApiClient>());
  PageController pageController = PageController();

  String errorImage = 'assets/images/error_image.png';
  List<String> _images = ['assets/images/images.jpeg', 'assets/images/images.jpeg', 'assets/images/images.jpeg'];
  List<Map<String, String>> details = [
    {"action": 'escape room', "price": "100"},
    {"action": 'Snow City', "price": "360"},
    {"action": 'Edge of the World', "price": "140"},
    {"action": 'Museum of Illusions', "price": "160"},
    {"action": 'escape room', "price": "100"},
    {"action": 'Snow City', "price": "360"},
    {"action": 'Edge of the World', "price": "140"},
    {"action": 'Museum of Illusions', "price": "160"},
  ];
  DetailsModel? currentPackage;
  List<String> get images => _images;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _noInternet = false;
  bool get noInternet => _noInternet;
  double value = 0.0;
  int quantity = 0;
  double page = 0.0;

  Future<void> getDetails(String id) async {
    _noInternet = false;
    _isLoading = true;

    update();
    Response response = await repo.getDetails(id);

    if (response.statusCode == 200) {
      currentPackage = DetailsModel.fromMap(response.body);
    } else {
      _noInternet = true;
      update();
    }
    _isLoading = false;
    update();
  }

  add() {
    if (canAdd()) {
      quantity++;
      update();
    }
  }

  canAdd() {
    if (quantity < 99) {
      return true;
    }
    return false;
  }

  canSubtract() {
    if (quantity > 0) {
      return true;
    }
    return false;
  }

  minus() {
    if (canSubtract()) {
      quantity--;
      update();
    }
  }
}
