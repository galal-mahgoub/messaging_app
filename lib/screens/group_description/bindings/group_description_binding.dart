import 'package:get/get.dart';

import '../controllers/group_description_controller.dart';

class GroupDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupDescriptionController>(
      () => GroupDescriptionController(),
    );
  }
}
