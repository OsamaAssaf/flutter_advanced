import 'package:timeago/timeago.dart' as timeago;

class TimeAgoController {
  void setTimeLocale() {
    timeago.setLocaleMessages(
      'ar',
      timeago.ArMessages(),
    );
  }
}
