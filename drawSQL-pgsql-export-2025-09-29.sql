CREATE TABLE "Student_Grades"(
    "grade_id" INTEGER NOT NULL,
    "student_id" INTEGER NOT NULL,
    "term" INTEGER NOT NULL,
    "gwa" INTEGER NOT NULL
);
ALTER TABLE
    "Student_Grades" ADD PRIMARY KEY("grade_id");
ALTER TABLE
    "Student_Grades" ADD CONSTRAINT "student_grades_student_id_unique" UNIQUE("student_id");
CREATE TABLE "Student_Requirements"(
    "student_id" INTEGER NOT NULL,
    "approved_by" INTEGER NOT NULL,
    "requirement_id" INTEGER NOT NULL,
    "submitted" BOOLEAN NOT NULL,
    "approved" BOOLEAN NOT NULL
);
ALTER TABLE
    "Student_Requirements" ADD CONSTRAINT "student_requirements_student_id_unique" UNIQUE("student_id");
ALTER TABLE
    "Student_Requirements" ADD CONSTRAINT "student_requirements_approved_by_unique" UNIQUE("approved_by");
ALTER TABLE
    "Student_Requirements" ADD CONSTRAINT "student_requirements_requirement_id_unique" UNIQUE("requirement_id");
CREATE TABLE "Program"(
    "program_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "department" VARCHAR(255) NOT NULL,
    "year_level" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Program" ADD PRIMARY KEY("program_id");
CREATE TABLE "Students"(
    "user_id" INTEGER NOT NULL,
    "program_id" INTEGER NOT NULL,
    "student_id" INTEGER NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "birth_date" DATE NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "school" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Students" ADD CONSTRAINT "students_user_id_unique" UNIQUE("user_id");
ALTER TABLE
    "Students" ADD CONSTRAINT "students_program_id_unique" UNIQUE("program_id");
ALTER TABLE
    "Students" ADD PRIMARY KEY("student_id");
CREATE TABLE "Users"(
    "user_id" INTEGER NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("user_id");
CREATE TABLE "Requirements"(
    "requirement_id" INTEGER NOT NULL,
    "created_by" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "Requirements" ADD PRIMARY KEY("requirement_id");
ALTER TABLE
    "Requirements" ADD CONSTRAINT "requirements_created_by_unique" UNIQUE("created_by");
CREATE TABLE "fund_release"(
    "release_id" INTEGER NOT NULL,
    "release_by" INTEGER NOT NULL,
    "released_to" INTEGER NOT NULL,
    "release_date" DATE NOT NULL,
    "amount_released" INTEGER NOT NULL
);
ALTER TABLE
    "fund_release" ADD PRIMARY KEY("release_id");
ALTER TABLE
    "fund_release" ADD CONSTRAINT "fund_release_release_by_unique" UNIQUE("release_by");
ALTER TABLE
    "fund_release" ADD CONSTRAINT "fund_release_released_to_unique" UNIQUE("released_to");
CREATE TABLE "Administrator"(
    "user_id" INTEGER NOT NULL,
    "admin_id" INTEGER NOT NULL
);
ALTER TABLE
    "Administrator" ADD CONSTRAINT "administrator_user_id_unique" UNIQUE("user_id");
ALTER TABLE
    "Administrator" ADD PRIMARY KEY("admin_id");
CREATE TABLE "Student_Program"(
    "student_id" INTEGER NOT NULL,
    "program_id" INTEGER NOT NULL
);
ALTER TABLE
    "Student_Program" ADD CONSTRAINT "student_program_student_id_unique" UNIQUE("student_id");
ALTER TABLE
    "Student_Requirements" ADD CONSTRAINT "student_requirements_student_id_foreign" FOREIGN KEY("student_id") REFERENCES "Students"("student_id");
ALTER TABLE
    "Administrator" ADD CONSTRAINT "administrator_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");
ALTER TABLE
    "Students" ADD CONSTRAINT "students_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");
ALTER TABLE
    "Student_Program" ADD CONSTRAINT "student_program_program_id_foreign" FOREIGN KEY("program_id") REFERENCES "Program"("program_id");
ALTER TABLE
    "Student_Requirements" ADD CONSTRAINT "student_requirements_approved_by_foreign" FOREIGN KEY("approved_by") REFERENCES "Administrator"("admin_id");
ALTER TABLE
    "fund_release" ADD CONSTRAINT "fund_release_released_to_foreign" FOREIGN KEY("released_to") REFERENCES "Students"("student_id");
ALTER TABLE
    "Student_Requirements" ADD CONSTRAINT "student_requirements_requirement_id_foreign" FOREIGN KEY("requirement_id") REFERENCES "Requirements"("requirement_id");
ALTER TABLE
    "Student_Program" ADD CONSTRAINT "student_program_student_id_foreign" FOREIGN KEY("student_id") REFERENCES "Students"("student_id");
ALTER TABLE
    "Student_Grades" ADD CONSTRAINT "student_grades_student_id_foreign" FOREIGN KEY("student_id") REFERENCES "Students"("student_id");
ALTER TABLE
    "fund_release" ADD CONSTRAINT "fund_release_release_by_foreign" FOREIGN KEY("release_by") REFERENCES "Administrator"("admin_id");
ALTER TABLE
    "Requirements" ADD CONSTRAINT "requirements_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "Administrator"("admin_id");