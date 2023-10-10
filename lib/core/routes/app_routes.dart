part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const mainLayout = _Paths.mainLayout;
  static const messageDetails = _Paths.messageDetails;
}

abstract class _Paths {
  _Paths._();

  static const mainLayout = '/mainLayout';
  static const messageDetails = '/message_details';
}
