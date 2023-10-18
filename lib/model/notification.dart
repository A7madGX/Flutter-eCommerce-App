// ignore_for_file: non_constant_identifier_names

class NotificationMessage {
  final int id;
  final String title;
  final String description;
  final DateTime date = DateTime.now();

  NotificationMessage(
      {required this.title, required this.description, required this.id});

  String formatDateTime() {
    String formatted_dateTime;
    String time_specific;

    String date_time_string = DateTime.now().toString();
    List<String> date_time = date_time_string.split(' ');

    String date = date_time[0];
    List<String> date_specifics = date.split('-');
    String date_formatted = date_specifics.reversed.toList().join('/');

    String time = date_time[1].substring(0, 5);
    int checkTime = int.parse(time.substring(0, 2));
    if (checkTime > 12) {
      time_specific = 'PM';
      checkTime = checkTime - 12;
    } else {
      time_specific = 'AM';
    }
    String time_formatted = '$checkTime${time.substring(2, 5)} $time_specific';

    formatted_dateTime = '$date_formatted $time_formatted';
    return (formatted_dateTime);
  }
}
