import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twoscreen/contact_dani.dart';
import 'package:twoscreen/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2200),
    );

    if (picked != null) {
      setState(() {
        birthDayController.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Screen'),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          TextField(
            controller: lastNameController,
          ),
          TextField(
            controller: discriptionController,
          ),
          TextField(
            controller: birthDayController,
            onTap: () => selectDate(context),
            readOnly: true,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return SecondScreen(
                    contactDani: ContactDani(
                        discription: discriptionController.text,
                        name: nameController.text,
                        lastName: lastNameController.text,
                        birthDay: birthDayController.text),
                  );
                }),
              );
              discriptionController.clear();
              nameController.clear();
              lastNameController.clear();
              birthDayController.clear();
            },
            child: const Text('Кнопка'),
          ),
        ],
      ),
    );
  }
}
