#!/bin/sh
curl -H "Content-Type: application/json" -d '{"internal_id":-1, "uwid":"99119924", "firstname": "r12", "lastname": "ttt"}' http://localhost:8088/studentsApi/v1/student
curl -H "Content-Type: application/json" -d '{"internal_id":-1, "uwid":"99119923", "firstname": "q11", "lastname": "rss"}' http://localhost:8088/studentsApi/v1/student
curl -H "Content-Type: application/json" -d '{"student_internal_id":"0", "course": "ECE", "section": "105", "mark": "88"}' http://localhost:8088/studentsApi/v1/course_mark
curl -H "Content-Type: application/json" -d '{"student_internal_id":"1", "course": "ECE", "section": "105", "mark": "77"}' http://localhost:8088/studentsApi/v1/course_mark
curl -H "Content-Type: application/json" -d '{"student_internal_id":"0", "term": "1169", "program": "SE", "level": "1A"}' http://localhost:8088/studentsApi/v1/student_enrolment
curl -H "Content-Type: application/json" -d '{"student_internal_id":"1", "term": "1169", "program": "SE", "level": "1A"}' http://localhost:8088/studentsApi/v1/student_enrolment
curl http://localhost:8088/studentsApi/v1/students
curl http://localhost:8088/studentsApi/v1/course_marks
curl http://localhost:8088/studentsApi/v1/student_enrolments
