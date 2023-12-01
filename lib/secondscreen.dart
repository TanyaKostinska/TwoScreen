import 'package:flutter/material.dart';
import 'package:twoscreen/contact_dani.dart';

class SecondScreen extends StatefulWidget {
  final ContactDani contactDani;
  const SecondScreen({super.key, required this.contactDani});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ListTile(
              title: const Text('Дані вірні'),
              leading: Radio(
                value: true,
                groupValue: isTrue,
                onChanged: (value) {
                  setState(() {
                    isTrue = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Дані невірні'),
              leading: Radio(
                value: false,
                groupValue: isTrue,
                onChanged: (value) {
                  setState(() {
                    isTrue = value!;
                  });
                },
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Повернути дані'),
            ),
          ],
        ),
      ),
    );
  }
}
