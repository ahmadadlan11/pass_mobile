
import 'package:get/get.dart';
import 'package:pass/api/api_client.dart';
import 'package:pass/view/favorites/model.dart';
import 'package:pass/view/favorites/repo.dart';


class FavoritesController extends GetxController {
  FavoritesRepo repo = FavoritesRepo(apiClient: Get.find<ApiClient>());
 

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _noInternet = false;
  bool get noInternet => _noInternet;
  List<FavoritesModel>? favorites;

  Future<void> getFavorites() async {
    _noInternet = false;
    _isLoading = true;

    update();
    Response response = await repo.getFavorites();

    if (response.statusCode == 200) {
      for (var i = 0; i < response.body.length; i++) {
        favorites?.add(FavoritesModel.fromMap(response.body));
      }
    } else {
      _noInternet = true;
      update();
    }
    _isLoading = false;
    update();
  }

  Future<void> postFavorite(FavoritesModel favoritesModel) async {
    _noInternet = false;
    _isLoading = true;

    update();
    Response response = await repo.postFavorites(favoritesModel);

    if (response.statusCode == 200) {
      getFavorites();
    } else {
      _noInternet = true;
      update();
    }
    _isLoading = false;
    update();
  }
}
