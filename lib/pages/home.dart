import 'package:flutter/material.dart';
import 'package:world_time_app/pages/locations.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImg = data['isDay'] ? 'day.png' : 'nights.jpg';
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('./assets/$bgImg'), fit: BoxFit.cover)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    data['flag'],
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: const TextStyle(fontSize: 60, color: Colors.white),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Locations())));
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDay': result['isDay'],
                        'time': result['time']
                      };
                    });
                  },
                  icon: const Icon(Icons.next_plan),
                  label: const Text('list of country'))
            ],
          ),
        ),
      ),
    ));
  }
}
