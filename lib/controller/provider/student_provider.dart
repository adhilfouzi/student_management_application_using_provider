import 'package:flutter/material.dart';
import 'package:student_management_application_using_provider/Model/studentmodel.dart';

class StudentProvider with ChangeNotifier {
  List<StudentModel> stList = [];
  int id = -1;
  void addStudent(StudentModel value) {
    value.id = id++;
    stList.add(value);
    notifyListeners();
  }

  void editStudent(StudentModel editedStudent) {
    final index =
        stList.indexWhere((student) => student.id == editedStudent.id);
    if (index != -1) {
      stList[index] = editedStudent;
      notifyListeners();
    }
  }

  void deleteStudent(int studentId) {
    stList.removeWhere((student) => student.id == studentId);
    notifyListeners();
  }
}
