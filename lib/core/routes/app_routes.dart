part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const mainLayout = _Paths.mainLayout;
  static const messageDetails = _Paths.messageDetails;
  static const groupDescription = _Paths.groupDescription;
}

abstract class _Paths {
  _Paths._();

  static const mainLayout = '/mainLayout';
  static const messageDetails = '/message_details';
  static const groupDescription = '/group_desciption';
}
