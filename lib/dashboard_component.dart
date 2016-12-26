import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'student.dart';
import 'student_service.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: const ['dashboard_component.css'],
  directives: const [ROUTER_DIRECTIVES],
)
class DashboardComponent implements OnInit {
  List<Student> students;

  final StudentService _studentService;

  DashboardComponent(this._studentService);

  Future<Null> ngOnInit() async {
    students = (await _studentService.getStudents()).take(3).toList();
  }
}
