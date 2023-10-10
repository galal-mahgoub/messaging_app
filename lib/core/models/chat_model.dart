import '../consts/enum.dart';

class ChatModel {
  final UserStatus senderStatus;
  final String senderName;
  final String senderImg;
  final String lastMsg;
  final DateTime sentDate;
  final bool isSeen;
  final bool isForward;
  final int unSeenMsgCount;

  const ChatModel({
    required this.senderStatus,
    required this.senderName,
    required this.senderImg,
    required this.lastMsg,
    required this.sentDate,
    required this.isSeen,
    required this.isForward,
    required this.unSeenMsgCount,
  });
}
