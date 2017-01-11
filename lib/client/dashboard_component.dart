import 'dart:async';
import 'dart:collection';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../common/student.dart';
import '../common/student_enrolment.dart';
import '../common/course_mark.dart';
import 'student_service.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: const ['dashboard_component.css'],
  directives: const [ROUTER_DIRECTIVES]
)

class DashboardComponent implements OnInit {
  List<Student> students;
  Set<String> programs;
  String program;

  final StudentService _studentService;

  DashboardComponent(this._studentService);

  List<CourseMark> getStudentCourseMarks(List<CourseMark> courseMarks, int internal_id) {
    return courseMarks.where((courseMark) => courseMark.student_internal_id == internal_id);
  }

  Iterable<StudentEnrolment> getStudentEnrolment(List<StudentEnrolment> studentEnrolments, int internal_id) {
    return studentEnrolments.where((studentEnrolment) => studentEnrolment.student_internal_id == internal_id);
  }

  Future<Null> ngOnInit() async {
    students = (await _studentService.getStudents()).toList();
    var courseMarks = (await (_studentService.getCourseMarks())).toList();
    var studentEnrolments = (await (_studentService.getStudentEnrolments())).toList();
    programs = new SplayTreeSet<String>();
    for (var student in students) {
      var studentMarks = getStudentCourseMarks(courseMarks, student.internal_id);
      var studentEnrolment = getStudentEnrolment(studentEnrolments, student.internal_id).first;
      student.program = studentEnrolment.program;
      programs.add(student.program);
      try {
        student.average = studentMarks.fold(0, (x, y) => x + int.parse(y.mark)) / studentMarks.length;
        student.average = (student.average * 10).round() / 10;
      } catch (exception) {
        student.average = -1;
      }
    }
    students.sort((a,b) => -a.average.compareTo(b.average));
    filteredStudentsCache = students;
  }

  List<Student> filteredStudentsCache;
  String last_program;

  List<Student> filteredStudents() {
    if (last_program == program)
        return filteredStudentsCache;
    filteredStudentsCache =
        students.where((student) => program == null || student.program == program).toList();
    last_program = program;
    return filteredStudentsCache;
  }
}
