// ignore_for_file: unnecessary_const
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import '../services/world_class.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    void setUpWorldClock() async {
      WorldTime instance =
          WorldTime(location: 'Berlin', flag: 'Germany', url: 'Europe/Berlin');
      await instance.getData();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDay': instance.isDay,
      });
    }

    setUpWorldClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],

        // ignore: unnecessary_null_comparison
        body: (const Center(
            child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ))));
  }
}
