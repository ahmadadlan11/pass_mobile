import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainScaffoldController extends GetxController {
  // Map<int, bool> titlesStatus = {0: false, 1: true, 2: false, 3: false};
  List<bool> titlesStatus = [true, false, false, false];
  final PersistentTabController persistentController = PersistentTabController(initialIndex: 0);
  changeStatus(int title) {
   
    for (var i = 0; i < 4; i++) {
      titlesStatus[i] = false;
    }

    titlesStatus[title] = true;
   
   
   
  }

  goToHome() {
    changeStatus(0);
    persistentController.index = 0;
    update();
  }
}
