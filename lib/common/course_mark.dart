class CourseMark {
  final int id;
  int student_internal_id;
  int course_internal_id;
  String mark;

  CourseMark();
  CourseMark.fromArgs(this.id, this.student_internal_id, this.course_internal_id, this.mark);
  factory CourseMark.fromJson(Map<String, dynamic> course_mark) =>
    new CourseMark.fromArgs(_toInt(course_mark['id']),
                   _toInt(course_mark['student_internal_id']),
                   _toInt(course_mark['course_internal_id']),
                   course_mark['mark']);
  Map toJson() => {'id': id,
                   'student_internal_id': student_internal_id,
                   'course_internal_id': course_internal_id,
                   'mark': mark};
}

int _toInt(id) => id is int ? id : int.parse(id);
