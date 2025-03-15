import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Widget'), centerTitle: true, backgroundColor: Color.fromARGB(255, 255, 100, 50),),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCounterWidget(
              title: 'TEAM A',
              backgroundColor: Colors.red,
            ),
            SizedBox(height: 10),
            CustomCounterWidget(
              title: 'TEAM B',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCounterWidget extends StatefulWidget {
  final String title;
  final Color backgroundColor;

  const CustomCounterWidget(
      {super.key, required this.title, required this.backgroundColor});

  @override
  _CustomCounterWidgetState createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.title}: $_counter',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
