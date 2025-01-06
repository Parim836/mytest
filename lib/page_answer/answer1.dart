import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grid Layout',
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Row แรก
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              const SizedBox(width: 20),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              const SizedBox(width: 20),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Row ที่สอง
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              ),
              const SizedBox(width: 20),
              Container(
                height: 100,
                width: 100,
                color: Colors.purple,
              ),
              const SizedBox(width: 20),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
