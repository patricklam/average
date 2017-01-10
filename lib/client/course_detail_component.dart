// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import '../common/student.dart';
import '../common/student_enrolment.dart';
import '../common/course_mark.dart';
import '../common/course.dart';
import 'student_service.dart';

@Component(
  selector: 'my-course-detail',
  styleUrls: const ['course_detail_component.css'],
  templateUrl: 'course_detail_component.html',
  )
class CourseDetailComponent implements OnInit {
  Course course;
  StudentEnrolment studentEnrolment;
  List<CourseMark> courseMarks;
  List<Student> students;
  Map<Student, String> marks;

  List<Course> _courses;
  final StudentService _studentService;
  final RouteParams _routeParams;
  final Location _location;

  CourseDetailComponent(this._studentService, this._routeParams, this._location);

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    courseMarks = [];
    course = new Course.fromArgs(1, '1111', 'CS', '111', '001');
    if (id != null) course = await (_studentService.getCourse(id));
    courseMarks = (await (_studentService.getCourseMarks()));

    students = []; marks = {};
    for (var cm in courseMarks) {
      if (cm.course_internal_id == course.id) {
        var s = (await (_studentService.getStudent(cm.student_internal_id)));
        students.add(s);
        marks[s] = cm.mark;
      }
    }
  }

  void goBack() => _location.back();
}