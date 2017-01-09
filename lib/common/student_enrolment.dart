class StudentEnrolment {
  final int id;
  int student_internal_id;
  String term;
  String program;
  String level;

  StudentEnrolment();
  StudentEnrolment.fromArgs(this.id, this.student_internal_id, this.term, this.program, this.level);
  factory StudentEnrolment.fromJson(Map<String, dynamic> student_enrolment) =>
    new StudentEnrolment.fromArgs(_toInt(student_enrolment['id']),
                         _toInt(student_enrolment['student_internal_id']),
                         student_enrolment['term'],
                         student_enrolment['program'],
                         student_enrolment['level']);
  Map toJson() => {'id': id,
                   'student_internal_id': student_internal_id,
                   'term': term,
                   'program': program,
                   'level': level};
}

int _toInt(id) => id is int ? id : int.parse(id);
