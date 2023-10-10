import '../consts/enum.dart';

class CallModel {
  final UserStatus callerStatus;
  final String callerName;
  final String callerImg;
  final DateTime callDate;
  final bool isPhoneCall;
  final CallType callType;
  final List<HistoryCallModel> historyCalls;

  const CallModel({
    required this.callerStatus,
    required this.callerName,
    required this.callerImg,
    required this.callDate,
    required this.isPhoneCall,
    required this.callType,
    required this.historyCalls,
  });
}

class HistoryCallModel {
  final CallType callType;
  final DateTime callDate;
  final String callDuration;
  final bool isPhoneCall;

  const HistoryCallModel({
    required this.callType,
    required this.callDate,
    required this.callDuration,
    required this.isPhoneCall,
  });
}
