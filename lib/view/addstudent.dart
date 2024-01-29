import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_application_using_provider/controller/provider/student_provider.dart';
import 'package:student_management_application_using_provider/Model/studentmodel.dart';
import 'package:student_management_application_using_provider/controller/widget/submitbutton.dart';
import 'package:student_management_application_using_provider/controller/widget/textform.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add Student'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios))),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Builder(
          builder: (context) => Column(
            children: [
              TextFormWirte(
                controller: nameController,
                textcontent: 'Name',
                keyboardType: TextInputType.name,
              ),
              TextFormWirte(
                controller: fatherController,
                textcontent: 'Father',
                keyboardType: TextInputType.name,
              ),
              TextFormWirte(
                textcontent: 'Phone Number',
                controller: phonenumberController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: SubmitButton(
                          onTap: () {
                            add(context);
                          },
                          textcontent: 'Submit')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void add(BuildContext context) {
    if (nameController.text.isEmpty ||
        fatherController.text.isEmpty ||
        phonenumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields.'),
        ),
      );
      return;
    }

    final value = StudentModel(
      name: nameController.text.toUpperCase(),
      father: fatherController.text.toUpperCase(),
      phoneNumber: phonenumberController.text,
    );

    context.read<StudentProvider>().addStudent(value);

    // Clear the text fields after adding student
    nameController.clear();
    fatherController.clear();
    phonenumberController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Student added successfully!'),
      ),
    );
  }
}
