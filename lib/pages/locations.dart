import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:world_time_app/services/world_class.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<WorldTime> data = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = data[index];
    await instance.getData();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('list of countries'),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              return Card(
                  child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${data[index].flag}')),
                title: Text(data[index].location.toString()),
              ));
            })));
  }
}
