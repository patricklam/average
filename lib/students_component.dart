// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
//import 'package:angular2_components/angular2_components.dart';

import 'student.dart';
import 'student_service.dart';

@Component(
  selector: 'my-students',
  styleUrls: const ['students_component.css'],
  templateUrl: 'students_component.html',
//  directives: const [materialDirectives],
//  providers: const [materialProviders],
)

class StudentsComponent implements OnInit {
  final Router _router;
  final StudentService _studentService;
  List<Student> students;
  Student selectedStudent;

  StudentsComponent(this._studentService, this._router);

  Future<Null> getStudents() async {
    students = await _studentService.getStudents();
  }

  void ngOnInit() {
    getStudents();
  }

  void onSelect(Student student) {
    selectedStudent = student;
  }

  Future<Null> gotoDetail() => _router.navigate([
    'StudentDetail',
    {'id': selectedStudent.id.toString()}]);
}
