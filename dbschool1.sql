create database sikshalaya2
Use sikshalaya2
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Teacher', 'Student','Non-teaching_staff','guards','faculty members','Accountant') NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Contact VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select* from Users
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address TEXT,
    class_id INT NOT NULL,
    Guardian_name VARCHAR(100),
    Guardian_contact NVARCHAR(15),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    qualification VARCHAR(100),
    specialization VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL UNIQUE,
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    class_id INT NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE Exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_name VARCHAR(100) NOT NULL,
    class_id INT NOT NULL,
    exam_date DATE NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE Results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT NOT NULL,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks FLOAT NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES Exams(exam_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

CREATE TABLE Fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    amount FLOAT NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('Paid', 'Unpaid') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Courses (
  course_id INT PRIMARY KEY not null,
  course_name varchar(100) not null,
  teacher_id INT,
   class_id INT,
  Foreign key (teacher_id) References Teachers(teacher_id),
   Foreign key (class_id) References Classes(class_id)
);

CREATE USER 'pma1'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'pma1'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE TABLE Guards (
    guard_id INT AUTO_INCREMENT PRIMARY KEY,
    guard_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    shift ENUM('Morning', 'Evening', 'Night'),
    hire_date DATE NOT NULL
);


CREATE TABLE AccessControl (
    access_id INT AUTO_INCREMENT PRIMARY KEY,
    guard_id INT NOT NULL,
    role_name VARCHAR(50) NOT NULL,
    access_granted BOOLEAN DEFAULT TRUE,
    access_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guard_id) REFERENCES Guards(guard_id)
);

CREATE TABLE StudentLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    guard_id INT NOT NULL,
    log_type ENUM('Entry', 'Exit') NOT NULL,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (guard_id) REFERENCES Guards(guard_id)
);

CREATE TABLE VisitorRecords (
    visitor_id INT AUTO_INCREMENT PRIMARY KEY,
    visitor_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100),
    purpose VARCHAR(255) NOT NULL,
    entry_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    exit_time TIMESTAMP NULL,
    guard_id INT NOT NULL,
    FOREIGN KEY (guard_id) REFERENCES Guards(guard_id)
);

