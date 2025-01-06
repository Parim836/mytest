import 'package:mytest/page_answer/answer1.dart';
import 'package:mytest/page_answer/answer2.dart';
import 'package:mytest/page_answer/answer3.dart';
import 'package:mytest/page_answer/answer4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AnswerPortal(),
  ));
}

class AnswerPortal extends StatelessWidget {
  const AnswerPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Answer'),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 204, 49),
      ),
      backgroundColor: const Color.fromARGB(255, 172, 195, 185),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Layout1()));
                },
                child: const Text('Answer 1')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Layout2()));
                },
                child: const Text('Answer 2')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Layout3()));
                },
                child: const Text('Answer 3')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Layout4()));
                },
                child: const Text('Answer 4')),
          ],
        ),
      ),
    );
  }
}
