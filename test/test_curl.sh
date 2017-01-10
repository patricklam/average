#!/bin/sh
curl -H "Content-Type: application/json" -d '{"internal_id":-1, "uwid":"99119924", "firstname": "r12", "lastname": "ttt"}' http://localhost:8088/studentsApi/v1/student
curl -H "Content-Type: application/json" -d '{"internal_id":-1, "uwid":"99119923", "firstname": "q11", "lastname": "rss"}' http://localhost:8088/studentsApi/v1/student
curl -H "Content-Type: application/json" -d '{"term": "1169", "subject": "ECE", "course": "105", "section": "001"}' http://localhost:8088/studentsApi/v1/course
curl -H "Content-Type: application/json" -d '{"term": "1169", "subject": "ECE", "course": "140", "section": "001"}' http://localhost:8088/studentsApi/v1/course
curl -H "Content-Type: application/json" -d '{"student_internal_id":"1", "course_internal_id": "0", "mark": "77"}' http://localhost:8088/studentsApi/v1/course_mark
curl -H "Content-Type: application/json" -d '{"student_internal_id":"0", "course_internal_id": "1", "term": "1169", "program": "SE", "level": "1A"}' http://localhost:8088/studentsApi/v1/student_enrolment
curl -H "Content-Type: application/json" -d '{"student_internal_id":"1", "term": "1169", "program": "SE", "level": "1A"}' http://localhost:8088/studentsApi/v1/student_enrolment
curl http://localhost:8088/studentsApi/v1/students
curl http://localhost:8088/studentsApi/v1/course_marks
curl http://localhost:8088/studentsApi/v1/student_enrolments
