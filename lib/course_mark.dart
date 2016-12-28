class CourseMark {
  final int id;
  final int student_internal_id;
  String subject, course, section;
  String mark;

  factory CourseMark.fromJson(Map<String, dynamic> course_mark) =>
    new CourseMark(_toInt(course_mark['id']),
                   _toInt(course_mark['student_internal_id']),
                   course_mark['subject'], course_mark['course'], course_mark['section'],
                   course_mark['mark']);
  Map toJson() => {'id': id,
                   'student_internal_id': student_internal_id,
                   'subject': subject, 'course': course, 'section': section,
                   'mark': mark};

  CourseMark(this.id, this.student_internal_id, this.subject, this.course, this.section, this.mark);
}

int _toInt(id) => id is int ? id : int.parse(id);
