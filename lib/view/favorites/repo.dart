import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/view/favorites/model.dart';

class FavoritesRepo extends GetxService {
  final ApiClient apiClient;

  FavoritesRepo({required this.apiClient});
  Future<Response> getFavorites() async {
    return await apiClient.getData("favorites");
  }

  Future<Response> postFavorites(FavoritesModel favoritesModel) async {
    return await apiClient.postData("favorites", favoritesModel);
  }
}
