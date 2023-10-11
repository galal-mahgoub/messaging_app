import 'package:get/get.dart';
import 'package:messaging_app/screens/group_description/bindings/group_description_binding.dart';
import 'package:messaging_app/screens/main_layout/bindings/main_layout_binding.dart';
import 'package:messaging_app/screens/main_layout/views/main_layout_view.dart';
import 'package:messaging_app/screens/message_details/bindings/message_details_binding.dart';
import 'package:messaging_app/screens/message_details/views/message_details_view.dart';

import '../../screens/group_description/views/group_description_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String initial = Routes.mainLayout;

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.mainLayout,
      page: () => const MainLayoutView(),
      binding: MainLayoutBinding(),
    ),
    GetPage(
      name: _Paths.messageDetails,
      page: () => const MessageDetailsView(),
      binding: MessageDetailsBinding(),
    ),
    GetPage(
      name: _Paths.groupDescription,
      page: () => const GroupDescriptionView(),
      binding: GroupDescriptionBinding(),
    ),
  ];
}
