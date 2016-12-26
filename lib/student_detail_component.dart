// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2_components/angular2_components.dart';

import 'student.dart';
import 'student_service.dart';

@Component(
  selector: 'my-student-detail',
  templateUrl: 'student_detail_component.html',
  )
class StudentDetailComponent implements OnInit {
  Student student;
  final StudentService _studentService;
  final RouteParams _routeParams;
  final Location _location;

  StudentDetailComponent(this._studentService, this._routeParams, this._location);

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    if (id != null) student = await (_studentService.getStudent(id));
  }

  void goBack() => _location.back();
}