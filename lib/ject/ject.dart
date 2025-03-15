// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   // สถานที่ท่องเที่ยว (พิกัด, ชื่อ)
//   List<Map<String, dynamic>> locations = [
//     {"name": "สถานที่ A", "lat": 13.7563, "lon": 100.5018},
//     {"name": "สถานที่ B", "lat": 13.7365, "lon": 100.5230},
//     {"name": "สถานที่ C", "lat": 13.7450, "lon": 100.5380},
//     // เพิ่มสถานที่อื่นๆ ตามต้องการ
//   ];

//   // พิกัดของผู้ใช้หรือสถานที่เริ่มต้น
//   LatLng startLocation = LatLng(13.7563, 100.5018);

//   // คำนวณระยะทางระหว่างสถานที่
//   double calculateDistance(LatLng start, LatLng end) {
//     var distance = Distance();
//     return distance.as(LengthUnit.kilometer, start, end);
//   }

//   // ฟังก์ชันกรองสถานที่ตามระยะทาง
//   List<Map<String, dynamic>> filterLocationsByDistance(LatLng startLocation, List<Map<String, dynamic>> locations, double maxDistance) {
//     List<Map<String, dynamic>> filteredLocations = [];

//     for (var location in locations) {
//       double distance = calculateDistance(startLocation, LatLng(location['lat'], location['lon']));
//       if (distance <= maxDistance) {
//         filteredLocations.add(location);
//       }
//     }

//     return filteredLocations;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double maxDistance = 5.0; // ระยะทางสูงสุด (กิโลเมตร)

//     // กรองสถานที่ที่อยู่ในระยะทาง
//     List<Map<String, dynamic>> filteredLocations = filterLocationsByDistance(startLocation, locations, maxDistance);

//     return Scaffold(
//       appBar: AppBar(title: Text('จัดแพลนเที่ยวตามระยะทาง')),
//       body: Column(
//         children: [
//           Text('สถานที่ในระยะ $maxDistance กิโลเมตร'),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredLocations.length,
//               itemBuilder: (context, index) {
//                 var location = filteredLocations[index];
//                 return ListTile(
//                   title: Text(location['name']),
//                   subtitle: Text('พิกัด: ${location['lat']}, ${location['lon']}'),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: FlutterMap(
//               options: MapOptions(center: startLocation, zoom: 13.0),
//               layers: [
//                 TileLayerOptions(
//                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//                 MarkerLayerOptions(
//                   markers: filteredLocations.map((location) {
//                     return Marker(
//                       point: LatLng(location['lat'], location['lon']),
//                       builder: (ctx) => Icon(Icons.location_on, size: 40, color: Colors.red),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
