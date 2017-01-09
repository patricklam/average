import 'dart:core';
import 'dart:async' as async;
import 'dart:convert';

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    as commons;

import 'package:angular2/core.dart';
import 'package:http/http.dart' as http;

import '../common/student.dart';
import '../common/course_mark.dart';
import '../common/student_enrolment.dart';

import 'mock_students.dart';

const String USER_AGENT = 'dart-api-client studentsApi/v1';

@Injectable()
class StudentService {
  final commons.ApiRequester _requester;

  StudentService(http.Client client)
    : _requester = new commons.ApiRequester(
        client, "http://localhost:8088/", "studentsApi/v1/", USER_AGENT);

  /**
   * Request parameters:
   *
   * Completes with a [List<Student>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<List<Student>> getStudents() {
    var _url = null;
    var _queryParams = new Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    _url = 'students';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        data.map((value) => new Student.fromJson(value)).toList());
  }

  async.Future<List<CourseMark>> getCourseMarks() async {
    var _url = null;
    var _queryParams = new Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    _url = 'course_marks';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        data.map((value) => new CourseMark.fromJson(value)).toList());
  }

  async.Future<List<StudentEnrolment>> getStudentEnrolments() async {
    var _url = null;
    var _queryParams = new Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    _url = 'student_enrolments';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        data.map((value) => new StudentEnrolment.fromJson(value)).toList());
  }

  async.Future<Student> getStudent(int internal_id) async =>
    (await getStudents()).firstWhere((student) => student.internal_id == internal_id);

  async.Future<StudentEnrolment> getStudentEnrolment(String uwid) async {
    Student s = (await getStudents()).firstWhere((student) => student.uwid == uwid);
    return (await getStudentEnrolments()).firstWhere((enrolment) => enrolment.student_internal_id == s.internal_id);
  }

  async.Future<List<CourseMark>> getStudentCourseMarks(String uwid) async {
    Student s = (await getStudents()).firstWhere((student) => student.uwid == uwid);
    return (await getCourseMarks()).where((courseMark) => courseMark.student_internal_id == s.internal_id);
  }

  static final _headers = {'ContentType': 'application/json'};

  async.Future<Student> update(Student student) async {
    var _url = null;
    var _queryParams = new Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (student != null) {
      _body = JSON.encode(student.toJson());
    }

    _url = 'student';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Student.fromJson(data));
 }
}
