// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import '../common/student.dart';
import '../common/student_enrolment.dart';
import '../common/course_mark.dart';
import 'student_service.dart';

@Component(
  selector: 'my-student-detail',
  styleUrls: const ['student_detail_component.css'],
  templateUrl: 'student_detail_component.html',
  )
class StudentDetailComponent implements OnInit {
  Student student;
  StudentEnrolment studentEnrolment;
  List<CourseMark> studentMarks;
  double average;

  final StudentService _studentService;
  final RouteParams _routeParams;
  final Location _location;

  StudentDetailComponent(this._studentService, this._routeParams, this._location);

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    if (id != null) student = await (_studentService.getStudent(id));
    if (student != null) studentEnrolment = await (_studentService.getStudentEnrolment(student.uwid));
    if (student != null) {
      studentMarks = await (_studentService.getStudentCourseMarks(student.uwid));
      average = studentMarks.fold(0, (x, y) => x + int.parse(y.mark)) / studentMarks.length;
    }
    else {
      studentMarks = null;
      average = 0.0;
    }
  }
  Future<Null> save() async {
    await _studentService.update(student);
    goBack();
  }

  void goBack() => _location.back();
}