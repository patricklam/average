class Course {
  final int id;
  String term;
  String subject, course, section;

  Course();
  Course.fromArgs(this.id, this.term, this.subject, this.course, this.section);
  factory Course.fromJson(Map<String, dynamic> course) =>
    new Course.fromArgs(_toInt(course['id']), course['term'],
                   course['subject'], course['course'], course['section']);
  Map toJson() => {'id': id,
                   'term': term,
                   'subject': subject, 'course': course, 'section': section};
}

int _toInt(id) => id is int ? id : int.parse(id);
