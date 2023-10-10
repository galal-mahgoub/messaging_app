import 'package:flutter/material.dart';

enum UserStatus {
  none,
  active,
  idle,
  offline,
}

enum CallType {
  missed,
  received,
  called,
}

Color userStatus(UserStatus userStatus) {
  switch (userStatus) {
    case UserStatus.active:
      return const Color(0xff4CE417);

    case UserStatus.idle:
      return const Color(0xffF2C94C);

    default:
      return const Color(0xffBDBDBD);
  }
}
