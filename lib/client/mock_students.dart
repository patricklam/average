// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../common/student.dart';
import '../common/course.dart';
import '../common/course_mark.dart';
import '../common/student_enrolment.dart';

final List<Student> mockStudents = [
  new Student.fromArgs(1, '20000000', 'Test1', 'Student1'),
  new Student.fromArgs(2, '20000001', 'Test2', 'Student2'),
  new Student.fromArgs(3, '20000002', 'Test3', 'Student3'),
  new Student.fromArgs(4, '20000003', 'Test4', 'Student4'),
  new Student.fromArgs(5, '20000004', 'Test5', 'Student5')
];

final List<CourseMark> mockCourses = [
  new Course.fromArgs(1, '1169', 'ECE', '150', '001'),
  new Course.fromArgs(2, '1169', 'ECE', '105', '001'),
  new Course.fromArgs(3, '1169', 'ECE', '140', '001'),
  new Course.fromArgs(4, '1169', 'MATH', '115', '001'),
  new Course.fromArgs(5, '1169', 'CHE', '102', '001')
];

final List<CourseMark> mockCourseMarks = [
  new CourseMark.fromArgs(1, 1,  1, '100'),
  new CourseMark.fromArgs(2, 2,  1, '94'),
  new CourseMark.fromArgs(3, 3,  1, '93'),
  new CourseMark.fromArgs(4, 4,  1, '88'),
  new CourseMark.fromArgs(5, 5,  1, '77'),
  new CourseMark.fromArgs(6, 1,  2, '28'),
  new CourseMark.fromArgs(7, 2,  3, '94'),
  new CourseMark.fromArgs(8, 3,  4, '93'),
  new CourseMark.fromArgs(9, 4,  4, '88'),
  new CourseMark.fromArgs(10, 5, 5, '77')
];

final List<StudentEnrolment> mockStudentEnrolments = [
  new StudentEnrolment.fromArgs(1, 1, '1169', 'CE', '1A'),
  new StudentEnrolment.fromArgs(2, 2, '1169', 'CE', '1A'),
  new StudentEnrolment.fromArgs(3, 3, '1169', 'CE', '1A'),
  new StudentEnrolment.fromArgs(4, 4, '1169', 'EE', '1A'),
  new StudentEnrolment.fromArgs(5, 5, '1169', 'EE', '1A')
];