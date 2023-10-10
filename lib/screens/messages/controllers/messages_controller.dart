import 'package:get/get.dart';

class MessagesController extends GetxController {
  bool showFullRecentChats = false;
  String selectedCategory = 'All chats';

  selectCategory(String value) {
    selectedCategory = value;
    update();
  }
}
