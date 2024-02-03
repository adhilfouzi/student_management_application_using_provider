import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_application_using_provider/controller/provider/student_provider.dart';
import 'package:student_management_application_using_provider/Model/studentmodel.dart';
import 'package:student_management_application_using_provider/controller/widget/textform.dart';
import 'package:student_management_application_using_provider/view/viewstudent.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            Consumer<StudentProvider>(builder: (context, studentProvider, _) {
          return IconButton(
              onPressed: () {
                Navigator.pop(context);
                studentProvider.searchResults.clear();
              },
              icon: const Icon(Icons.arrow_back_ios));
        }),
        title: const Text('Search Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormWirte(
              textcontent: 'Search by name...',
              onChanged: (query) {
                context.read<StudentProvider>().searchStudents(query);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<StudentProvider>(
                builder: (context, studentProvider, _) {
                  List<StudentModel> searchResults =
                      studentProvider.searchResults;
                  if (searchResults.isEmpty) {
                    return const Center(
                      child: Text('No value found'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final student = searchResults[index];
                        return Card(
                          elevation: 2,
                          surfaceTintColor: Colors.green,
                          child: ListTile(
                            title: Text(student.name),
                            subtitle: Text('S/O: ${student.father}'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StudentDetailScreen(
                                      studentId: student.id!)));
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
