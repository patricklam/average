// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:math';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

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
  List<CourseMark> course_marks;

  Map<Course, int> course_sizes = {};
  Map<Course, double> course_means = {};
  Map<Course, double> course_standard_deviations = {};

  Course selectedCourse;

  Map<int, Course> cached_course = {};
  Course getCourse(int id) {
    if (cached_course.containsKey(id))
      return cached_course[id];

    for (var c in courses) {
      if (c.id == id) {
        cached_course[id] = c;
        return c;
      }
    }
    return null;
  }

  Future<Null> ngOnInit() async {
    courses = (await _studentService.getCourses());
    course_marks = (await _studentService.getCourseMarks());

    Map<Course, double> course_sums = {};
    for (var c in courses) {
      course_sums[c] = 0.0;
      course_sizes[c] = 0;
      course_standard_deviations[c] = 0.0;
    }

    // calculate means
    for (var cm in course_marks) {
      Course c = getCourse(cm.course_internal_id);
      course_sums[c] += int.parse(cm.mark);
      course_sizes[c] += 1;
    }
    for (var c in courses) {
      course_means[c] = course_sums[c]/course_sizes[c];
    }

    // calculate standard deviations
    for (var cm in course_marks) {
      Course c = getCourse(cm.course_internal_id);
      course_standard_deviations[c] += pow(double.parse(cm.mark) - course_means[c], 2);
    }
    for (var c in courses) {
      course_standard_deviations[c] = sqrt(course_standard_deviations[c] / course_sizes[c]);
    }
  }

  void onSelect(Course course) {
    selectedCourse = course;
  }

  Future<Null> gotoDetail() => _router.navigate([
    'CourseDetail',
    {'id': selectedCourse.id.toString()}]);
}
