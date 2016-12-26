import 'dart:async';

import 'package:angular2/core.dart';

import 'student.dart';
import 'mock_students.dart';

@Injectable()
class StudentService {
  Future<List<Student>> getStudents() async => mockStudents;

  Future<Student> getStudent(int id) async =>
    (await getStudents()).firstWhere((student) => student.internal_id == id);
}
