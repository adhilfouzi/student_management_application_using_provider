import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_application_using_provider/controller/provider/student_provider.dart';
import 'package:student_management_application_using_provider/Model/studentmodel.dart';

class StudentDetailScreen extends StatelessWidget {
  final int studentId;

  const StudentDetailScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    // Retrieve the student data by ID from the provider
    StudentModel? student = context.read<StudentProvider>().stList.firstWhere(
        (student) => student.id == studentId,
        orElse: () =>
            StudentModel(id: -5, name: '', father: '', phoneNumber: ''));

    if (student.id == -5) {
      // Handle the case where the student is not found (optional)
      return Scaffold(
        appBar: AppBar(
          title: const Text('Student Details'),
        ),
        body: const Center(
          child: Text(
            'Error: Student not found!',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Name:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                student.name,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text(
                'Father:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                student.father,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text(
                'Phone Number:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                student.phoneNumber,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
