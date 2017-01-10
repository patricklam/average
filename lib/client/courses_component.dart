// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../common/student.dart';
import '../common/student_enrolment.dart';
import '../common/course.dart';
import '../common/course_mark.dart';
import 'student_service.dart';

@Component(
  selector: 'my-courses',
  styleUrls: const ['courses_component.css'],
  templateUrl: 'courses_component.html'
)

class CoursesComponent implements OnInit {
  final Router _router;
  final StudentService _studentService;

  CoursesComponent(this._studentService, this._router);
  List<Course> courses;
  Course selectedCourse;

  Future<Null> fetchCourses() async {
    courses = await _studentService.getCourses();
  }

  void ngOnInit() {
    fetchCourses();
  }

  void onSelect(Course course) {
    selectedCourse = course;
  }

  Future<Null> gotoDetail() => _router.navigate([
    'CourseDetail',
    {'id': selectedCourse.id.toString()}]);
}
