class Student {
  final int internal_id;
  String uwid;
  String firstname, lastname;

  int average;
  String program;

  factory Student.fromJson(Map<String, dynamic> student) =>
    new Student(_toInt(student['internal_id']),
                student['uwid'],
                student['firstname'], student['lastname']);
  Map toJson() => {'internal_id': internal_id,
                   'uwid': uwid,
                   'firstname': firstname,
                   'lastname': lastname};

  Student(this.internal_id, this.uwid, this.firstname, this.lastname);
}

int _toInt(id) => id is int ? id : int.parse(id);
