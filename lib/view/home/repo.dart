
import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/view/home/model.dart';

class PackageRepo extends GetxService {
  final ApiClient apiClient;

  PackageRepo({required this.apiClient});
  Future<Response> getPackage() async {
    return await apiClient.getData("Package");
  }

  Future<Response> postPackage(PackageModel packageModel) async {
    return await apiClient.postData("Package", packageModel);
  }
}