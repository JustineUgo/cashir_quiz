import 'package:get/get.dart';

import '../controllers/questions_controller.dart';

class QuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsController>(
      () => QuestionsController(),
    );
  }
}
