import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';

class GroupDescriptionController extends GetxController {
  bool allowNotifications = false;

  List<Map<String, dynamic>> sections = [
    {
      'icon': Assets.starIcon,
      'label': 'Bookmarks',
    },
    {
      'icon': Assets.imgIcon,
      'label': 'Images',
    },
    {
      'icon': Assets.outlineVideoIcon,
      'label': 'Videos',
    },
    {
      'icon': Assets.documentIcon,
      'label': 'Documents',
    },
  ];

  String selectedSection = 'Bookmarks';

  changeNotification() {
    allowNotifications = !allowNotifications;
    update();
  }

  changeSection(String value) {
    selectedSection = value;
    update();
  }
}
