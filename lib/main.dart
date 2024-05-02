import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Model> _data;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _data = const <Model>[
      Model('Commune Zaouia El-abidya', 33.13, 6.08),
      Model('Cabinet dentaire snoussi', 33.11, 6.07),
      Model('Aeroport Sidi-mehdi Touggourt', 33.06636120286526, 6.09277576222202),
      Model('Restaurant Kamel et Djamel', 33.10756910981978, 6.077036113593599),
      Model('Tribunal of Touggourt', 33.1122422115415, 6.077036113555691)
    ];
    _zoomPanBehavior = MapZoomPanBehavior();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: SfMaps(
          layers: [
            MapTileLayer(
              initialZoomLevel: 12,
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              initialMarkersCount: _data.length,
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: _data[index].latitude,
                  longitude: _data[index].longitude,
                  child: IconButton(
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(_data[index].name))
                      );
                    },
                    icon: const Icon(Icons.location_on),
                  ),
                );
              },
              zoomPanBehavior: _zoomPanBehavior,
            ),
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Model {
  const Model(this.name, this.latitude, this.longitude);

  final String name;
  final double latitude;
  final double longitude;
}

