import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? time;
  String? url;
  String? location;
  String? flag;
  bool? isDay;
  WorldTime({this.flag, this.location, this.url, this.isDay});

  Future<void> getData() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'];
      String offsets = offset.substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offsets)));
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
      // ignore: avoid_print
      print(now);

      time = DateFormat.jm().format(now);
      //print(dateTime);
      //print(offsets);
      // // ignore: unused_local_variable
      // String userName = await Future.delayed(
      //   const Duration(seconds: 3),
      //   () => 'sohail',
      // );

      // // ignore: unused_local_variable
      // String descriptionPerson = await Future.delayed(
      //   const Duration(seconds: 2),
      //   () => 'i am software developer',
      // );
    } catch (e) {
      // ignore: avoid_print
      print(e);
      time = 'cant get the time check error';
    }
  }
}
