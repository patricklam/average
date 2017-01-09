// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// inspired by the Nest o' Pirates example Dart app

library average.server;

import 'package:rpc/rpc.dart';

import '../common/student.dart';
import '../common/student_enrolment.dart';
import '../common/course_mark.dart';

@ApiClass(version: 'v1')
class StudentsApi {
  final Map<int, Student> _students = {}; int _studentsMaxID = 0;
  final Map<int, CourseMark> _courseMarks = {};
  final Map<int, StudentEnrolment> _studentEnrolments = {};

  StudentsApi() {
  }

  // Returns a list of students
  @ApiMethod(method: 'GET', path: 'students')
  List<Student> listStudents() {
    return _students.values.toList();
  }

  // Returns a student
  @ApiMethod(method: 'GET', path: 'student/{internal_id}')
  Student getStudent(String internal_id) {
    return _students[int.parse(Uri.decodeComponent(internal_id))];
  }

  // Returns a list of course marks
  @ApiMethod(method: 'GET', path: 'course_marks')
  List<CourseMark> listCourseMarks() {
    return _courseMarks.values.toList();
  }

  // Returns a list of student enrolments
  @ApiMethod(method: 'GET', path: 'student_enrolments')
  List<StudentEnrolment> listStudentEnrolments() {
    return _studentEnrolments.values.toList();
  }

  @ApiMethod(method: 'POST', path: 'student')
  Student addStudent(Student ns) {
    var newStudent = new Student.fromArgs(_makeFreshID(), ns.uwid, ns.firstname, ns.lastname);
    _students[newStudent.internal_id] = newStudent;
    return newStudent;
  }

  int _makeFreshID() {
    while (_students.containsKey(_studentsMaxID))
      _studentsMaxID++;
    return _studentsMaxID;
  }
}
