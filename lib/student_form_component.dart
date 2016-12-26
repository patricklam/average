import 'package:angular2/core.dart';

import 'student.dart';

@Component(
    selector: 'student-form',
    templateUrl: 'student_form_component.html')

class StudentFormComponent {
  bool submitted = false;
  Student model = new Student(1, '20000000', 'Test', 'Student');
  // TODO: Remove this when we're done
  String get diagnostic => 'DIAGNOSTIC: $model';

  onSubmit() {
    submitted = true;
  }
}