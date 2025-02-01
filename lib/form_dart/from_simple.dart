import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});

  @override
  State<FormSimple> createState() => _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> {
  final _formKey = GlobalKey<FormState>(); // ใช้สำหรับตรวจสอบฟอร์ม
  bool _isSwitched = true; // ค่าปัจจุบันของ Switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchListTile(
                title: const Text('Enable Notifications'),
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),
              const SizedBox(height: 20), // เพิ่มระยะห่าง
            ],
          ),
        ),
      ),
    );
  }
}
