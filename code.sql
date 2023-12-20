-- BASE QUERY

-- 1. Selezionare cognome e nome tutti gli insegnanti, ordinati per cognome e poi per nome in ordine alfabetico (100)

SELECT *
FROM  teachers t 
ORDER BY t.surname, t.name;

-- 2. Selezionare tutti gli insegnamenti (courses) che valgono almeno 12 crediti (cfu) (375)

SELECT *
FROM courses c 
WHERE cfu >= 12;

-- 3. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT *
FROM students s 
WHERE YEAR(date_of_birth) = 1990;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT *
FROM courses c 
WHERE period = 'I semestre' AND `year` = 1;

-- 5. Da quanti dipartimenti è composta l’università?

SELECT count(*)
FROM departments d;

-- 6. Contare tutti gli insegnanti il cui cognome termina con la “E” (8)

SELECT *
FROM teachers t 
WHERE surname LIKE '%E';

-- 7. Selezionare nome, cognome e codice fiscale di tutti gli studenti iscritti al Corso di Laurea in Economia, in ordine alfabetico

SELECT s.name, s.surname, s.fiscal_code
FROM students s 
JOIN degrees d ON d.id = s.degree_id 
WHERE d.name = 'Corso di Laurea in Economia'
ORDER BY s.surname, s.name 

-- 8. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT *
FROM degrees d 
JOIN departments d2 ON d2.id = d.department_id 
WHERE d.`level` = 'magistrale' AND d2.name = 'Dipartimento di Neuroscienze'

-- BONUS QUERYS

-- 1. Selezionare nome e cognome di tutti gli studenti che hanno superato l’esame del corso “maxime laboriosam nostrum” (39)

SELECT s.name, s.surname 
FROM students s 
JOIN exam_student es ON es.student_id = s.id 
JOIN exams e ON e.id = es.exam_id 
JOIN courses c ON c.id = e.course_id 
WHERE c.name = 'maxime laboriosam nostrum' AND es.vote >= 18;

-- 2. Elencare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT t.id, t.name, t.surname 
FROM teachers t 
JOIN course_teacher ct ON ct.teacher_id = t.id
JOIN courses c ON c.id = ct.course_id 
JOIN degrees d ON d.id = c.degree_id 
JOIN departments d2 ON d2.id = d.department_id 
WHERE d2.name = 'Dipartimento di Matematica'

