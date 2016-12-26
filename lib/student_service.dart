import 'dart:async';

import 'package:angular2/core.dart';

import 'student.dart';
import 'course_mark.dart';
import 'student_enrolment.dart';

import 'mock_students.dart';

@Injectable()
class StudentService {
  Future<List<Student>> getStudents() async => mockStudents;
  Future<List<CourseMark>> getCourseMarks() async => mockCourseMarks;
  Future<List<StudentEnrolment>> getStudentEnrolments() async => mockStudentEnrolments;

  Future<Student> getStudent(int internal_id) async =>
    (await getStudents()).firstWhere((student) => student.internal_id == internal_id);

  Future<StudentEnrolment> getStudentEnrolment(String uwid) async {
    Student s = (await getStudents()).firstWhere((student) => student.uwid == uwid);
    return (await getStudentEnrolments()).firstWhere((enrolment) => enrolment.student_internal_id == s.internal_id);
  }
}
