import 'package:get/get.dart';
import 'package:messaging_app/core/consts/demo_data.dart';
import 'package:messaging_app/core/models/category_model.dart';

class MessageDetailsController extends GetxController {
  bool isShowingCategories = false;

  ChannelModel selectedChannel = channels.first;

  showCategories() {
    isShowingCategories = !isShowingCategories;
    update();
  }

  selectChannel(ChannelModel value) {
    selectedChannel = value;
    update();
  }
}
