import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'student.dart';
import 'student_enrolment.dart';
import 'course_mark.dart';
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
    students = (await _studentService.getStudents()).toList();
    for (var student in students) {
      var studentEnrolment = await (_studentService.getStudentEnrolment(student.uwid));
      var studentMarks = await (_studentService.getStudentCourseMarks(student.uwid));
      student.program = studentEnrolment.program;
      try {
        student.average = studentMarks.fold(0, (x, y) => x + int.parse(y.mark)) / studentMarks.length;
      } catch (exception) {
        student.average = -1;
      }
    }
    students.sort((a,b) => -a.average.compareTo(b.average));
  }
}
