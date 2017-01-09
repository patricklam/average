class Student {
  int internal_id;
  String uwid;
  String firstname;
  String lastname;

  int average;
  String program;

  Student();
  Student.fromArgs(this.internal_id, this.uwid, this.firstname, this.lastname);
  factory Student.fromJson(Map<String, dynamic> student) =>
    new Student.fromArgs(_toInt(student['internal_id']),
                student['uwid'],
                student['firstname'],
                student['lastname']);
  Map toJson() => {'internal_id': internal_id,
                   'uwid': uwid,
                   'firstname': firstname,
                   'lastname': lastname};
}

int _toInt(id) => id is int ? id : int.parse(id);
