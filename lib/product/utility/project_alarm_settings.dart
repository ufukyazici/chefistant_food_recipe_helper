import 'package:alarm/model/alarm_settings.dart';

class ProjectAlarmSettings {
  final int alarmId;
  final String notificationTitle;
  final String notificationBody;
  final DateTime dateTime;
  late AlarmSettings alarmSettings;
  ProjectAlarmSettings(
      {required this.alarmId,
      required this.notificationTitle,
      required this.notificationBody,
      required this.dateTime}) {
    alarmSettings = AlarmSettings(
      id: alarmId,
      dateTime: dateTime,
      fadeDuration: 3.0,
      assetAudioPath: 'assets/audio/alarm.wav',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      notificationTitle: notificationTitle,
      notificationBody: notificationBody,
    );
  }
}
