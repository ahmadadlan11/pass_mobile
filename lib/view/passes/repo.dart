import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/view/passes/model.dart';

class PassesRepo extends GetxService {
  final ApiClient apiClient;

  PassesRepo({required this.apiClient});
  Future<Response> getOrders() async {
    return await apiClient.getData("order");
  }

  Future<Response> postOrder(PassesModel passesModel) async {
    return await apiClient.postData("order", passesModel);
  }
}