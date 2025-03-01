// // import 'package:flutter/material.dart';
// // import 'package:mytest/week%206/widgetProfileCard.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   ThemeMode _themeMode = ThemeMode.light;

// //   void _toggleTheme() {
// //     setState(() {
// //       _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyWidget(toggleTheme: _toggleTheme),
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData.light().copyWith(
// //         scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
// //         textTheme: const TextTheme(
// //           bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
// //         ),
// //         appBarTheme: AppBarTheme(
// //           backgroundColor: Colors.blue, // สีพื้นหลังของ AppBar ในธีมสว่าง
// //           titleTextStyle: TextStyle(color: Colors.black), // สีข้อความใน AppBar
// //         ),
// //       ),
// //       darkTheme: ThemeData.dark().copyWith(
// //         scaffoldBackgroundColor: const Color.fromARGB(255, 79, 75, 75),
// //         textTheme: const TextTheme(
// //           bodyMedium: TextStyle(color: Colors.white),
// //         ),
// //         appBarTheme: AppBarTheme(
// //           backgroundColor: const Color.fromARGB(255, 79, 75, 75), // เปลี่ยนสีพื้นหลังของ AppBar ในธีมมืด
// //           titleTextStyle: TextStyle(color: Colors.white), // สีข้อความใน AppBar
// //         ),
// //       ),
// //       themeMode: _themeMode,
// //     );
// //   }
// // }

// // class GreetingWidget extends StatelessWidget {
// //   final String name;
// //   const GreetingWidget({super.key, required this.name});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Demo APP'),
// //         backgroundColor: const Color.fromARGB(255, 244, 171, 195),
// //         centerTitle: true,
// //       ),
// //       body: Center(child: Text('Hello, $name')),
// //     );
// //   }
// // }

// // class MyWidget extends StatelessWidget {
// //   final Function toggleTheme;
// //   const MyWidget({super.key, required this.toggleTheme});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('')),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           ProfileCard(
// //             name: 'Patcharaporn Paythaisong',
// //             position: 'Student',
// //             email: 'paythaisong_p@silpakorn.edu',
// //             phone: '0805674895',
// //             imageUrl:
// //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBCSncMky3y5D6cePikzRjNvJs2QozdiHruxOlu0fl1GUAFkOYbfy1iGSnyun6aQBuSeQ&usqp=CAU',
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               toggleTheme(); // เรียกฟังก์ชันที่ส่งมาจาก MyApp เพื่อสลับธีม
// //             },
// //             child: const Text("Toggle Theme"),
// //           ),
// //           const AnimatedDemo(),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class AnimatedDemo extends StatefulWidget {
// //   const AnimatedDemo({super.key});

// //   @override
// //   State<AnimatedDemo> createState() => _AnimatedDemoState();
// // }

// // class _AnimatedDemoState extends State<AnimatedDemo> {
// //   Color _color = Colors.blue; // ตัวแปรสีที่ใช้เก็บสีของกล่อง

// //   void _changeBox() {
// //     setState(() {
// //       // เปลี่ยนสีของกล่องระหว่างสีน้ำเงินและสีแดง
// //       _color = _color == Colors.blue ? Colors.red : Colors.blue;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         // ใช้ AnimatedContainer เพื่อให้เกิดการเปลี่ยนแปลงสีอย่างสมูท
// //         AnimatedContainer(
// //           duration: const Duration(seconds: 1), // เวลาที่ใช้ในการเปลี่ยนแปลง
// //           width: 200,
// //           height: 200,
// //           color: _color, // ใช้สีที่กำหนดในตัวแปร _color
// //         ),
// //         ElevatedButton(
// //           onPressed: _changeBox, // เรียกฟังก์ชัน _changeBox เพื่อเปลี่ยนสี
// //           child: const Text("Change Box Color"),
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(TrafficLightApp());
// }

// class TrafficLightApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TrafficLightScreen(),
//     );
//   }
// }

// class TrafficLightScreen extends StatefulWidget {
//   @override
//   _TrafficLightScreenState createState() => _TrafficLightScreenState();
// }

// class _TrafficLightScreenState extends State<TrafficLightScreen> {
//   int _currentLight = 0; // 0 = แดง, 1 = เหลือง, 2 = เขียว

//   void _changeLight() {
//     setState(() {
//       _currentLight = (_currentLight + 1) % 3;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Traffic Light Animation")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildTrafficLight(Colors.red, _currentLight == 0),
//           _buildTrafficLight(Colors.yellow, _currentLight == 1),
//           _buildTrafficLight(Colors.green, _currentLight == 2),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _changeLight,
//             child: Text("เปลี่ยนไฟ"),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTrafficLight(Color color, bool isActive) {
//     return AnimatedOpacity(
//       duration: Duration(seconds: 1),
//       opacity: isActive ? 1.0 : 0.3,
//       child: Container(
//         margin: EdgeInsets.all(10),
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: color,
//           boxShadow: isActive
//               ? [BoxShadow(color: color.withOpacity(0.5), blurRadius: 20)]
//               : [],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(const TrafficLightApp());
}

class TrafficLightApp extends StatelessWidget {
  const TrafficLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrafficLightScreen(),
    );
  }
}

class TrafficLightScreen extends StatefulWidget {
  const TrafficLightScreen({super.key});

  @override
  State<TrafficLightScreen> createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  int _currentLight = 0; // 0 = แดง, 1 = เหลือง, 2 = เขียว

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3; // เปลี่ยนไฟทีละอัน
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Traffic Light Animation")),
      body: Center(  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _currentLight == 0 ? 1.0 : 0.3,
              child: _buildTrafficLight(const Color.fromARGB(255, 226, 109, 101)),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _currentLight == 1 ? 1.0 : 0.3,
              child: _buildTrafficLight(const Color.fromARGB(255, 239, 227, 122)),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _currentLight == 2 ? 1.0 : 0.3,
              child: _buildTrafficLight(const Color.fromARGB(255, 133, 225, 136)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeLight,
              child: const Text("เปลี่ยนไฟ"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrafficLight(Color color) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
