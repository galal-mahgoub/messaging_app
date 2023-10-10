import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/consts/enum.dart';
import 'package:messaging_app/core/models/user_model.dart';

import '../models/call_model.dart';
import '../models/chat_model.dart';

List<String> categories = ['All chats', 'Personal', 'Work', 'Groups'];

UserModel user = UserModel(
  name: 'Adina Nurrahma',
  img: Assets.userIcon,
  about: 'Trust your feelings , be a good human beings',
);

List<ChatModel> recentChats = [
  ChatModel(
    senderStatus: UserStatus.idle,
    senderName: 'Darlene Steward',
    senderImg: Assets.user1Icon,
    lastMsg: 'Pls take a look at the images.',
    sentDate: DateTime.now().subtract(
      const Duration(minutes: 18, seconds: 31),
    ),
    isSeen: false,
    isForward: false,
    unSeenMsgCount: 5,
  ),
  ChatModel(
    senderStatus: UserStatus.none,
    senderName: 'Fullsnack Designers',
    senderImg: Assets.user2Icon,
    lastMsg: 'Hello guys, we have discussed about tttttttttttttttttttttttttt',
    sentDate: DateTime.now().subtract(
      const Duration(minutes: 16, seconds: 4),
    ),
    isSeen: false,
    isForward: false,
    unSeenMsgCount: 0,
  ),
  ChatModel(
    senderStatus: UserStatus.active,
    senderName: 'Lee Williamson',
    senderImg: Assets.user3Icon,
    lastMsg: 'Yes, that’s gonna work, hopefully. ',
    sentDate: DateTime.now().subtract(
      const Duration(minutes: 6, seconds: 12),
    ),
    isSeen: false,
    isForward: false,
    unSeenMsgCount: 0,
  ),
  ChatModel(
    senderStatus: UserStatus.offline,
    senderName: 'Ronald Mccoy',
    senderImg: Assets.user4Icon,
    lastMsg: 'Thanks dude 😉',
    sentDate: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    isSeen: true,
    isForward: false,
    unSeenMsgCount: 0,
  ),
  ChatModel(
    senderStatus: UserStatus.offline,
    senderName: 'Albert Bell',
    senderImg: Assets.user5Icon,
    lastMsg: 'I‘m happy this anime has such grea...',
    sentDate: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    isSeen: false,
    isForward: false,
    unSeenMsgCount: 0,
  ),
];

List<ChatModel> pinnedChats = [
  ChatModel(
    senderStatus: UserStatus.idle,
    senderName: 'Mike Wazowski',
    senderImg: Assets.user6Icon,
    lastMsg: 'That’s awesome! tttttttttttt',
    sentDate: DateTime.now().subtract(
      const Duration(minutes: 18, seconds: 31),
    ),
    isSeen: false,
    isForward: true,
    unSeenMsgCount: 0,
  ),
  ChatModel(
    senderStatus: UserStatus.idle,
    senderName: 'Darlene Steward',
    senderImg: Assets.user1Icon,
    lastMsg: 'Pls take a look at the images.',
    sentDate: DateTime.now().subtract(
      const Duration(minutes: 18, seconds: 31),
    ),
    isSeen: false,
    isForward: false,
    unSeenMsgCount: 5,
  ),
  ChatModel(
    senderStatus: UserStatus.offline,
    senderName: 'Gregory Robertson',
    senderImg: Assets.user7Icon,
    lastMsg: 'Preparing for next vactttttt ',
    sentDate: DateTime.now().subtract(
      const Duration(minutes: 6, seconds: 12),
    ),
    isSeen: false,
    isForward: false,
    unSeenMsgCount: 0,
  ),
  ChatModel(
    senderStatus: UserStatus.active,
    senderName: 'Dwight Wilson',
    senderImg: Assets.user8Icon,
    lastMsg: 'I’d like to watchtttttttttttttttttttttttttttt',
    sentDate: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    isSeen: true,
    isForward: true,
    unSeenMsgCount: 0,
  ),
];

List<CallModel> calls = [
  CallModel(
    callerStatus: UserStatus.idle,
    callerName: 'Darlene Steward',
    callerImg: Assets.user1Icon,
    callDate: DateTime.now().subtract(
      const Duration(minutes: 18, seconds: 31),
    ),
    isPhoneCall: true,
    callType: CallType.called,
    historyCalls: [
      HistoryCallModel(
        callType: CallType.called,
        callDate: DateTime(2023, 10, 10, 3, 30),
        callDuration: '33 mins',
        isPhoneCall: true,
      ),
      HistoryCallModel(
        callType: CallType.called,
        callDate: DateTime.now().subtract(
          const Duration(days: 1),
        ),
        callDuration: '0:20',
        isPhoneCall: true,
      ),
      HistoryCallModel(
        callType: CallType.missed,
        callDate: DateTime(2023, 10, 7, 1, 30),
        callDuration: '0:00',
        isPhoneCall: false,
      ),
      HistoryCallModel(
        callType: CallType.called,
        callDate: DateTime(2023, 10, 5, 7, 25),
        callDuration: '4 mins',
        isPhoneCall: true,
      ),
      HistoryCallModel(
        callType: CallType.missed,
        callDate: DateTime(2023, 10, 5, 3, 30),
        callDuration: '0:00',
        isPhoneCall: true,
      ),
    ],
  ),
  CallModel(
    callerStatus: UserStatus.active,
    callerName: 'Lee Williamson',
    callerImg: Assets.user3Icon,
    callDate: DateTime.now().subtract(
      const Duration(minutes: 6, seconds: 12),
    ),
    isPhoneCall: true,
    callType: CallType.received,
    historyCalls: [],
  ),
  CallModel(
    callerStatus: UserStatus.active,
    callerName: 'Dwight Wilson',
    callerImg: Assets.user8Icon,
    callDate: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    isPhoneCall: false,
    callType: CallType.called,
    historyCalls: [],
  ),
  CallModel(
    callerStatus: UserStatus.offline,
    callerName: 'Albert Bell',
    callerImg: Assets.user5Icon,
    callDate: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    isPhoneCall: false,
    callType: CallType.missed,
    historyCalls: [],
  ),
];
