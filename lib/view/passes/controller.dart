import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/view/passes/model.dart';
import 'package:pass/view/passes/repo.dart';


class PassesController extends GetxController {
   PassesRepo repo = PassesRepo(apiClient: Get.find<ApiClient>());
  

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _noInternet = false;
  bool get noInternet => _noInternet;
  List<PassesModel>? passes;

  Future<void> getPasses() async {
    _noInternet = false;
    _isLoading = true;

    update();
    Response response = await repo.getOrders();

    if (response.statusCode == 200) {
      for (var i = 0; i < response.body.length; i++) {
        passes?.add(PassesModel.fromMap(response.body));
      }
    } else {
      _noInternet = true;
      update();
    }
    _isLoading = false;
    update();
  }

  Future<void> postFavorite(PassesModel passesModel) async {
    _noInternet = false;
    _isLoading = true;

    update();
    Response response = await repo.postOrder(passesModel);

    if (response.statusCode == 200) {
      getPasses();
    } else {
      _noInternet = true;
      update();
    }
    _isLoading = false;
    update();
  }
  List<bool> passesStatus = [false, false];
  changeStatus(int index) {
    passesStatus[index] = !passesStatus[index];
    update();
  }

 
}
