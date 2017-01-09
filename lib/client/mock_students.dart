// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../common/student.dart';
import '../common/course_mark.dart';
import '../common/student_enrolment.dart';

final List<Student> mockStudents = [
  new Student.fromArgs(1, '20000000', 'Test1', 'Student1'),
  new Student.fromArgs(2, '20000001', 'Test2', 'Student2'),
  new Student.fromArgs(3, '20000002', 'Test3', 'Student3'),
  new Student.fromArgs(4, '20000003', 'Test4', 'Student4'),
  new Student.fromArgs(5, '20000004', 'Test5', 'Student5')
];

final List<CourseMark> mockCourseMarks = [
  new CourseMark(1, 1, 'ECE', '150', '001', '100'),
  new CourseMark(2, 1, 'ECE', '105', '001', '94'),
  new CourseMark(3, 1, 'ECE', '140', '001', '93'),
  new CourseMark(4, 1, 'MATH', '115', '001', '88'),
  new CourseMark(5, 1, 'CHE', '102', '001', '77'),
  new CourseMark(6, 2, 'ECE', '150', '001', '28'),
  new CourseMark(7, 3, 'ECE', '105', '001', '94'),
  new CourseMark(8, 4, 'ECE', '140', '001', '93'),
  new CourseMark(9, 5, 'MATH', '115', '001', '88'),
  new CourseMark(10, 5, 'CHE', '102', '001', '77')
];

final List<StudentEnrolment> mockStudentEnrolments = [
  new StudentEnrolment(1, 1, '1169', 'CE', '1A'),
  new StudentEnrolment(2, 2, '1169', 'CE', '1A'),
  new StudentEnrolment(3, 3, '1169', 'CE', '1A'),
  new StudentEnrolment(4, 4, '1169', 'EE', '1A'),
  new StudentEnrolment(5, 5, '1169', 'EE', '1A')
];