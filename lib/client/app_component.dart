// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'dashboard_component.dart';
import 'student_detail_component.dart';
import 'student_service.dart';
import 'students_component.dart';
import 'courses_component.dart';
import 'course_detail_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [ROUTER_DIRECTIVES],
  providers: const [StudentService, ROUTER_PROVIDERS],
)

@RouteConfig(const [
  const Route(
      path: '/dashboard',
      name: 'Dashboard',
      component: DashboardComponent,
      useAsDefault: true),
  const Route(
      path: '/detail/:id', name: 'StudentDetail', component: StudentDetailComponent),
  const Route(
      path: '/course_detail/:id', name: 'CourseDetail', component: CourseDetailComponent),
  const Route(path: '/students', name: 'Students', component: StudentsComponent),
  const Route(path: '/courses', name: 'Courses', component: CoursesComponent)
])

class AppComponent {
  final String title = 'Averages';
}