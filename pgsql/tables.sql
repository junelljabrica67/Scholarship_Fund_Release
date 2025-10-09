CREATE TABLE users (
    "user_id" SERIAL PRIMARY KEY,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" VARCHAR(255) NOT NULL
);
    
CREATE TABLE "administrator" (
    "admin_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL UNIQUE,
    FOREIGN KEY ("user_id") REFERENCES "users"("user_id")
);

CREATE TABLE programs (
    "program_id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "department" VARCHAR(255) NOT NULL,
    "year_level" VARCHAR(255) NOT NULL
);

CREATE TABLE students (
    "student_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL UNIQUE,
    "program_id" INTEGER NOT NULL UNIQUE,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "birth_date" DATE NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "school" VARCHAR(255) NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "users"("user_id")
);

CREATE TABLE student_program (
    "id" SERIAL PRIMARY KEY,
    "student_id" INTEGER NOT NULL UNIQUE,
    "program_id" INTEGER NOT NULL,
    FOREIGN KEY ("student_id") REFERENCES "students"("student_id"),
    FOREIGN KEY ("program_id") REFERENCES "programs"("program_id")
);

CREATE TABLE student_grades (
    "grade_id" SERIAL PRIMARY KEY,
    "student_id" INTEGER NOT NULL UNIQUE,
    "term" INTEGER NOT NULL,
    "gwa" INTEGER NOT NULL,
    FOREIGN KEY ("student_id") REFERENCES "students"("student_id")
);

CREATE TABLE Requirements (
    "requirement_id" SERIAL PRIMARY KEY,
    "created_by" INTEGER NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    FOREIGN KEY ("created_by") REFERENCES "administrator"("admin_id")
);

CREATE TABLE student_requirements (
    "id" BIGSERIAL PRIMARY KEY,
    "student_id" INTEGER NOT NULL UNIQUE,
    "approved_by" INTEGER NOT NULL UNIQUE,
    "requirement_id" INTEGER NOT NULL UNIQUE,
    "submitted" BOOLEAN NOT NULL,
    "approved" BOOLEAN NOT NULL,
    FOREIGN KEY ("student_id") REFERENCES "students"("student_id"),
    FOREIGN KEY ("approved_by") REFERENCES "administrator"("admin_id"),
    FOREIGN KEY ("requirement_id") REFERENCES "requirements"("requirement_id")
);

CREATE TABLE fund_releases (
    "release_id" BIGSERIAL PRIMARY KEY,
    "release_by" INTEGER NOT NULL UNIQUE,
    "released_to" INTEGER NOT NULL UNIQUE,
    "release_date" DATE NOT NULL,
    "amount_released" INTEGER NOT NULL,
    FOREIGN KEY ("release_by") REFERENCES "administrator"("admin_id"),
    FOREIGN KEY ("released_to") REFERENCES "students"("student_id")
);

