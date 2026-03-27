import 'package:get/get.dart';

import '../../services/session_controller/session_controller.dart';
 

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SessionController(), permanent: true);  // ✅ correct
  }
}