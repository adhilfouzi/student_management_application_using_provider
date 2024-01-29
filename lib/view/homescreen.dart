import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_application_using_provider/controller/provider/student_provider.dart';
import 'package:student_management_application_using_provider/view/addstudent.dart';
import 'package:student_management_application_using_provider/Model/studentmodel.dart';
import 'package:student_management_application_using_provider/view/editstudent.dart';
import 'package:student_management_application_using_provider/view/searchstudent.dart';
import 'package:student_management_application_using_provider/view/viewstudent.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchScreen()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Consumer<StudentProvider>(
        builder: (context, studentProvider, _) {
          List<StudentModel> students = studentProvider.stList;
          if (students.isEmpty) {
            return const Center(
              child: Text(
                'No students found.',
                style: TextStyle(fontSize: 18.0),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  final id = student.id;
                  return Card(
                    elevation: 2,
                    surfaceTintColor: Colors.green,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                StudentDetailScreen(studentId: id!)));
                      },
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(student.name),
                      subtitle: Text('S/O: ${student.father}'),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'edit') {
                            // Implement edit functionality
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditStudent(
                                  studentId: id!,
                                ),
                              ),
                            );
                          } else if (value == 'delete') {
                            // Implement delete functionality
                            studentProvider.deleteStudent(student.id!);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddStudent()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
