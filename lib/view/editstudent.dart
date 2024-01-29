import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_application_using_provider/controller/provider/student_provider.dart';
import 'package:student_management_application_using_provider/Model/studentmodel.dart';
import 'package:student_management_application_using_provider/controller/widget/submitbutton.dart';
import 'package:student_management_application_using_provider/controller/widget/textform.dart';

class EditStudent extends StatelessWidget {
  final int studentId;

  const EditStudent({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    // Find the student by ID from the StudentProvider
    StudentModel student = context
        .read<StudentProvider>()
        .stList
        .firstWhere((student) => student.id == studentId, orElse: () {
      // Return a default StudentModel if the student is not found
      return StudentModel(
        id: -5, // Set some default value for ID
        name: 'Empty',
        father: 'Empty',
        phoneNumber: 'Empty',
      );
    });

    // Check if the student ID is negative, indicating it wasn't found
    if (student.id == -5) {
      // Handle the case where the student is not found (optional)
      return Scaffold(
        appBar: AppBar(title: const Text('Edit Student')),
        body: const Center(
          child: Text('Error: Student not found!'),
        ),
      );
    }

    // Controllers for the text fields
    final TextEditingController nameController =
        TextEditingController(text: student.name);
    final TextEditingController fatherController =
        TextEditingController(text: student.father);
    final TextEditingController phoneNumberController =
        TextEditingController(text: student.phoneNumber);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Student')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
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
              controller: phoneNumberController,
              textcontent: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: SubmitButton(
                        onTap: () {
                          StudentModel updatedStudent = StudentModel(
                            id: studentId,
                            name: nameController.text,
                            father: fatherController.text,
                            phoneNumber: phoneNumberController.text,
                          );
                          context
                              .read<StudentProvider>()
                              .editStudent(updatedStudent);
                          Navigator.pop(context);
                        },
                        textcontent: 'Save Changes')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
