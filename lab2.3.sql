CREATE TABLE students(
    full_name text not null primary key ,
    age integer not null ,
    birth text not null ,
    gender varchar(1) not null ,
    average_grade double precision not null ,
    inf text,
    dormitory boolean not null ,
    add_inf text
);

CREATE TABLE instructors(
    full_name text not null primary key ,
    speaking_L text not null ,
    work_exp text not null,
    lessons boolean
);

CREATE TABLE Lessonss(
    tittle text not null ,
    instructor text references instructors(full_name),
    students text references students(full_name),
    room_numb integer
);