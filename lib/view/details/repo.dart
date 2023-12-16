import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';

class DetailsRepo extends GetxService {
  final ApiClient apiClient;

  DetailsRepo({required this.apiClient});
  Future<Response> getDetails(String id) async {
    return await apiClient.getData("package/$id");
  }
}