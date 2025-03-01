CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Programs (
    ProgramID SERIAL PRIMARY KEY,
    ProgramName VARCHAR(255) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


CREATE TABLE Students (
    RollNo VARCHAR(255) PRIMARY KEY,
    StudentName VARCHAR(255) NOT NULL,
    EnrolNo VARCHAR(255) NOT NULL,
    Batch VARCHAR(255) NOT NULL,
    ProgramID INT NOT NULL,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE Courses (
    CourseCode VARCHAR(255) PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    ProgramID INT NOT NULL,
    Semester INT NOT NULL,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);


CREATE TABLE Students_Courses (
    EnrollmentID SERIAL PRIMARY KEY,
    RollNo VARCHAR(255) NOT NULL,
    CourseCode VARCHAR(255) NOT NULL,
    FOREIGN KEY (RollNo) REFERENCES Students(RollNo),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);


CREATE TABLE Teachers (
    TeacherID VARCHAR(255) PRIMARY KEY,
    TeacherName VARCHAR(255) NOT NULL
);

CREATE TABLE Course_Teachers (
    CourseCode VARCHAR(255),
    TeacherID VARCHAR(255),
    PRIMARY KEY (CourseCode, TeacherID),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


CREATE TABLE CLOs (
    CLOID VARCHAR(25) PRIMARY KEY,
    CourseCode VARCHAR(255) NOT NULL,
    CLO_Number INT NOT NULL,
    Description TEXT,
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

CREATE TABLE PLOs (
    PLOID VARCHAR(25) PRIMARY KEY,
    PLO_Number VARCHAR(10) NOT NULL,
    Description TEXT
);

CREATE TABLE CLOs_PLOs_Mapping (
    MappingID SERIAL PRIMARY KEY,
    CLOID VARCHAR(25),
    PLOID VARCHAR(25),
    FOREIGN KEY (CLOID) REFERENCES CLOs(CLOID),
    FOREIGN KEY (PLOID) REFERENCES PLOs(PLOID)
);


CREATE TABLE Student_Course_CLO_Achievements (
    AchievementID SERIAL PRIMARY KEY,
    RollNo VARCHAR(255),
    CLOID VARCHAR(25),
    CLO_Value INT, -- This can be a binary (0/1), a grade, or a percentage
    FOREIGN KEY (RollNo) REFERENCES Students(RollNo),
    FOREIGN KEY (CLOID) REFERENCES CLOs(CLOID)
);

CREATE TABLE Student_PLO_Scores (
    ScoreID SERIAL PRIMARY KEY,
    RollNo VARCHAR(255),
    PLOID VARCHAR(25),
    PLOScore INT, -- This can represent an aggregated score or achievement level for the PLO
    FOREIGN KEY (RollNo) REFERENCES Students(RollNo),
    FOREIGN KEY (PLOID) REFERENCES PLOs(PLOID)
);

-- classsrom creation


CREATE TABLE Classrooms (
    ClassroomID SERIAL PRIMARY KEY,
    CourseTitle VARCHAR(255) NOT NULL,
    CourseCode VARCHAR(255) NOT NULL,
    ProgramID INT NOT NULL,
    Semester VARCHAR(255) NOT NULL,
    CreditHour VARCHAR(255) NOT NULL,
    KnowledgeArea VARCHAR(255),
    CourseObjectives TEXT,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

CREATE TABLE Classroom_Students (
    ClassroomStudentID SERIAL PRIMARY KEY,
    ClassroomID INT NOT NULL,
    RollNo VARCHAR(255) NOT NULL,
    FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID),
    FOREIGN KEY (RollNo) REFERENCES Students(RollNo)
);

CREATE TABLE Classroom_Teachers (
    ClassroomTeacherID SERIAL PRIMARY KEY,
    ClassroomID INT NOT NULL,
    TeacherID VARCHAR(255) NOT NULL,
    FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


CREATE INDEX idx_students_rollno ON Students (RollNo);
CREATE INDEX idx_students_programid ON Students (ProgramID);
CREATE INDEX idx_courses_programid ON Courses (ProgramID);
CREATE INDEX idx_students_courses_rollno ON Students_Courses (RollNo);
CREATE INDEX idx_students_courses_coursecode ON Students_Courses (CourseCode);
CREATE INDEX idx_course_teachers_coursecode ON Course_Teachers (CourseCode);
CREATE INDEX idx_course_teachers_teacherid ON Course_Teachers (TeacherID);
CREATE INDEX idx_clos_coursecode ON CLOs (CourseCode);
CREATE INDEX idx_clos_plos_mapping_cloid ON CLOs_PLOs_Mapping (CLOID);
CREATE INDEX idx_clos_plos_mapping_ploid ON CLOs_PLOs_Mapping (PLOID);
CREATE INDEX idx_student_course_clo_achievements_rollno ON Student_Course_CLO_Achievements (RollNo);
CREATE INDEX idx_student_course_clo_achievements_cloid ON Student_Course_CLO_Achievements (CLOID);
CREATE INDEX idx_student_plo_scores_rollno ON Student_PLO_Scores (RollNo);
CREATE INDEX idx_student_plo_scores_ploid ON Student_PLO_Scores (PLOID);



-- Insert Departments
INSERT INTO Departments (DepartmentName)
VALUES 
    ('Electrical Engineering'),
    ('Computer Science');

-- Insert Programs for Electrical Engineering Department (DepartmentID = 1)
INSERT INTO Programs (ProgramName, DepartmentID)
VALUES 
    ('Electrical Engineering (EE)', 1),
    ('Computer Engineering (CE)', 1),
    ('Telecommunication Engineering (TE)', 1),
    ('Power Engineering (PE)', 1);

-- Insert Programs for Computer Science Department (DepartmentID = 2)
INSERT INTO Programs (ProgramName, DepartmentID)
VALUES 
    ('Software Engineering (SE)', 2),
    ('Information Technology (IT)', 2),
    ('Data Science (DS)', 2),
    ('Cyber Security (CS)', 2);




-- Insert Students for Electrical Engineering (EE) (ProgramID = 1)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-EE', 'Student1 EE', 'UIT/001/2019', '19B', 1),
    ('19B-002-EE', 'Student2 EE', 'UIT/002/2019', '19B', 1),
    ('19B-003-EE', 'Student3 EE', 'UIT/003/2019', '19B', 1),
    ('19B-004-EE', 'Student4 EE', 'UIT/004/2019', '19B', 1),
    ('19B-005-EE', 'Student5 EE', 'UIT/005/2019', '19B', 1),
    ('19B-006-EE', 'Student6 EE', 'UIT/006/2019', '19B', 1),
    ('19B-007-EE', 'Student7 EE', 'UIT/007/2019', '19B', 1),
    ('19B-008-EE', 'Student8 EE', 'UIT/008/2019', '19B', 1),
    ('19B-009-EE', 'Student9 EE', 'UIT/009/2019', '19B', 1),
    ('19B-010-EE', 'Student10 EE', 'UIT/010/2019', '19B', 1);

-- Insert Students for Computer Engineering (CE) (ProgramID = 2)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-CE', 'Student1 CE', 'UIT/011/2019', '19B', 2),
    ('19B-002-CE', 'Student2 CE', 'UIT/012/2019', '19B', 2),
    ('19B-003-CE', 'Student3 CE', 'UIT/013/2019', '19B', 2),
    ('19B-004-CE', 'Student4 CE', 'UIT/014/2019', '19B', 2),
    ('19B-005-CE', 'Student5 CE', 'UIT/015/2019', '19B', 2),
    ('19B-006-CE', 'Student6 CE', 'UIT/016/2019', '19B', 2),
    ('19B-007-CE', 'Student7 CE', 'UIT/017/2019', '19B', 2),
    ('19B-008-CE', 'Student8 CE', 'UIT/018/2019', '19B', 2),
    ('19B-009-CE', 'Student9 CE', 'UIT/019/2019', '19B', 2),
    ('19B-010-CE', 'Student10 CE', 'UIT/020/2019', '19B', 2);

-- Insert Students for Telecommunication Engineering (TE) (ProgramID = 3)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-TE', 'Student1 TE', 'UIT/021/2019', '19B', 3),
    ('19B-002-TE', 'Student2 TE', 'UIT/022/2019', '19B', 3),
    ('19B-003-TE', 'Student3 TE', 'UIT/023/2019', '19B', 3),
    ('19B-004-TE', 'Student4 TE', 'UIT/024/2019', '19B', 3),
    ('19B-005-TE', 'Student5 TE', 'UIT/025/2019', '19B', 3),
    ('19B-006-TE', 'Student6 TE', 'UIT/026/2019', '19B', 3),
    ('19B-007-TE', 'Student7 TE', 'UIT/027/2019', '19B', 3),
    ('19B-008-TE', 'Student8 TE', 'UIT/028/2019', '19B', 3),
    ('19B-009-TE', 'Student9 TE', 'UIT/029/2019', '19B', 3),
    ('19B-010-TE', 'Student10 TE', 'UIT/030/2019', '19B', 3);

-- Insert Students for Power Engineering (PE) (ProgramID = 4)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-PE', 'Student1 PE', 'UIT/031/2019', '19B', 4),
    ('19B-002-PE', 'Student2 PE', 'UIT/032/2019', '19B', 4),
    ('19B-003-PE', 'Student3 PE', 'UIT/033/2019', '19B', 4),
    ('19B-004-PE', 'Student4 PE', 'UIT/034/2019', '19B', 4),
    ('19B-005-PE', 'Student5 PE', 'UIT/035/2019', '19B', 4),
    ('19B-006-PE', 'Student6 PE', 'UIT/036/2019', '19B', 4),
    ('19B-007-PE', 'Student7 PE', 'UIT/037/2019', '19B', 4),
    ('19B-008-PE', 'Student8 PE', 'UIT/038/2019', '19B', 4),
    ('19B-009-PE', 'Student9 PE', 'UIT/039/2019', '19B', 4),
    ('19B-010-PE', 'Student10 PE', 'UIT/040/2019', '19B', 4);

-- Insert Students for Software Engineering (SE) (ProgramID = 5)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-SE', 'Student1 SE', 'UIT/041/2019', '19B', 5),
    ('19B-002-SE', 'Student2 SE', 'UIT/042/2019', '19B', 5),
    ('19B-003-SE', 'Student3 SE', 'UIT/043/2019', '19B', 5),
    ('19B-004-SE', 'Student4 SE', 'UIT/044/2019', '19B', 5),
    ('19B-005-SE', 'Student5 SE', 'UIT/045/2019', '19B', 5),
    ('19B-006-SE', 'Student6 SE', 'UIT/046/2019', '19B', 5),
    ('19B-007-SE', 'Student7 SE', 'UIT/047/2019', '19B', 5),
    ('19B-008-SE', 'Student8 SE', 'UIT/048/2019', '19B', 5),
    ('19B-009-SE', 'Student9 SE', 'UIT/049/2019', '19B', 5),
    ('19B-010-SE', 'Student10 SE', 'UIT/050/2019', '19B', 5);

-- Insert Students for Information Technology (IT) (ProgramID = 6)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-IT', 'Student1 IT', 'UIT/051/2019', '19B', 6),
    ('19B-002-IT', 'Student2 IT', 'UIT/052/2019', '19B', 6),
    ('19B-003-IT', 'Student3 IT', 'UIT/053/2019', '19B', 6),
    ('19B-004-IT', 'Student4 IT', 'UIT/054/2019', '19B', 6),
    ('19B-005-IT', 'Student5 IT', 'UIT/055/2019', '19B', 6),
    ('19B-006-IT', 'Student6 IT', 'UIT/056/2019', '19B', 6),
    ('19B-007-IT', 'Student7 IT', 'UIT/057/2019', '19B', 6),
    ('19B-008-IT', 'Student8 IT', 'UIT/058/2019', '19B', 6),
    ('19B-009-IT', 'Student9 IT', 'UIT/059/2019', '19B', 6),
    ('19B-010-IT', 'Student10 IT', 'UIT/060/2019', '19B', 6);

-- Insert Students for Data Science (DS) (ProgramID = 7)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-DS', 'Student1 DS', 'UIT/061/2019', '19B', 7),
    ('19B-002-DS', 'Student2 DS', 'UIT/062/2019', '19B', 7),
    ('19B-003-DS', 'Student3 DS', 'UIT/063/2019', '19B', 7),
    ('19B-004-DS', 'Student4 DS', 'UIT/064/2019', '19B', 7),
    ('19B-005-DS', 'Student5 DS', 'UIT/065/2019', '19B', 7),
    ('19B-006-DS', 'Student6 DS', 'UIT/066/2019', '19B', 7),
    ('19B-007-DS', 'Student7 DS', 'UIT/067/2019', '19B', 7),
    ('19B-008-DS', 'Student8 DS', 'UIT/068/2019', '19B', 7),
    ('19B-009-DS', 'Student9 DS', 'UIT/069/2019', '19B', 7),
    ('19B-010-DS', 'Student10 DS', 'UIT/070/2019', '19B', 7);

-- Insert Students for Cyber Security (CS) (ProgramID = 8)
INSERT INTO Students (RollNo, StudentName, EnrolNo, Batch, ProgramID)
VALUES 
    ('19B-001-CS', 'Student1 CS', 'UIT/071/2019', '19B', 8),
    ('19B-002-CS', 'Student2 CS', 'UIT/072/2019', '19B', 8),
    ('19B-003-CS', 'Student3 CS', 'UIT/073/2019', '19B', 8),
    ('19B-004-CS', 'Student4 CS', 'UIT/074/2019', '19B', 8),
    ('19B-005-CS', 'Student5 CS', 'UIT/075/2019', '19B', 8),
    ('19B-006-CS', 'Student6 CS', 'UIT/076/2019', '19B', 8),
    ('19B-007-CS', 'Student7 CS', 'UIT/077/2019', '19B', 8),
    ('19B-008-CS', 'Student8 CS', 'UIT/078/2019', '19B', 8),
    ('19B-009-CS', 'Student9 CS', 'UIT/079/2019', '19B', 8),
    ('19B-010-CS', 'Student10 CS', 'UIT/080/2019', '19B', 8);



INSERT INTO Courses (CourseCode, CourseName, ProgramID, Semester)
VALUES 
    ('EE101', 'Introduction to Electrical Engineering', 1, 1),
    ('CE101', 'Introduction to Computer Engineering', 2, 1),
    ('TE101', 'Introduction to Telecommunication Engineering', 3, 1),
    ('PE101', 'Introduction to Power Engineering', 4, 1),
    ('SE101', 'Introduction to Software Engineering', 5, 1),
    ('IT101', 'Introduction to Information Technology', 6, 1),
    ('DS101', 'Introduction to Data Science', 7, 1),
    ('CS101', 'Introduction to Cyber Security', 8, 1);

    -- Enroll Students in Courses

-- Electrical Engineering (EE) (ProgramID = 1)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-EE', 'EE101'),
    ('19B-002-EE', 'EE101'),
    ('19B-003-EE', 'EE101'),
    ('19B-004-EE', 'EE101'),
    ('19B-005-EE', 'EE101'),
    ('19B-006-EE', 'EE101'),
    ('19B-007-EE', 'EE101'),
    ('19B-008-EE', 'EE101'),
    ('19B-009-EE', 'EE101'),
    ('19B-010-EE', 'EE101');

-- Computer Engineering (CE) (ProgramID = 2)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-CE', 'CE101'),
    ('19B-002-CE', 'CE101'),
    ('19B-003-CE', 'CE101'),
    ('19B-004-CE', 'CE101'),
    ('19B-005-CE', 'CE101'),
    ('19B-006-CE', 'CE101'),
    ('19B-007-CE', 'CE101'),
    ('19B-008-CE', 'CE101'),
    ('19B-009-CE', 'CE101'),
    ('19B-010-CE', 'CE101');

-- Telecommunication Engineering (TE) (ProgramID = 3)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-TE', 'TE101'),
    ('19B-002-TE', 'TE101'),
    ('19B-003-TE', 'TE101'),
    ('19B-004-TE', 'TE101'),
    ('19B-005-TE', 'TE101'),
    ('19B-006-TE', 'TE101'),
    ('19B-007-TE', 'TE101'),
    ('19B-008-TE', 'TE101'),
    ('19B-009-TE', 'TE101'),
    ('19B-010-TE', 'TE101');

-- Power Engineering (PE) (ProgramID = 4)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-PE', 'PE101'),
    ('19B-002-PE', 'PE101'),
    ('19B-003-PE', 'PE101'),
    ('19B-004-PE', 'PE101'),
    ('19B-005-PE', 'PE101'),
    ('19B-006-PE', 'PE101'),
    ('19B-007-PE', 'PE101'),
    ('19B-008-PE', 'PE101'),
    ('19B-009-PE', 'PE101'),
    ('19B-010-PE', 'PE101');

-- Software Engineering (SE) (ProgramID = 5)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-SE', 'SE101'),
    ('19B-002-SE', 'SE101'),
    ('19B-003-SE', 'SE101'),
    ('19B-004-SE', 'SE101'),
    ('19B-005-SE', 'SE101'),
    ('19B-006-SE', 'SE101'),
    ('19B-007-SE', 'SE101'),
    ('19B-008-SE', 'SE101'),
    ('19B-009-SE', 'SE101'),
    ('19B-010-SE', 'SE101');

-- Information Technology (IT) (ProgramID = 6)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-IT', 'IT101'),
    ('19B-002-IT', 'IT101'),
    ('19B-003-IT', 'IT101'),
    ('19B-004-IT', 'IT101'),
    ('19B-005-IT', 'IT101'),
    ('19B-006-IT', 'IT101'),
    ('19B-007-IT', 'IT101'),
    ('19B-008-IT', 'IT101'),
    ('19B-009-IT', 'IT101'),
    ('19B-010-IT', 'IT101');

-- Data Science (DS) (ProgramID = 7)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-DS', 'DS101'),
    ('19B-002-DS', 'DS101'),
    ('19B-003-DS', 'DS101'),
    ('19B-004-DS', 'DS101'),
    ('19B-005-DS', 'DS101'),
    ('19B-006-DS', 'DS101'),
    ('19B-007-DS', 'DS101'),
    ('19B-008-DS', 'DS101'),
    ('19B-009-DS', 'DS101'),
    ('19B-010-DS', 'DS101');

-- Cyber Security (CS) (ProgramID = 8)
INSERT INTO Students_Courses (RollNo, CourseCode)
VALUES 
    ('19B-001-CS', 'CS101'),
    ('19B-002-CS', 'CS101'),
    ('19B-003-CS', 'CS101'),
    ('19B-004-CS', 'CS101'),
    ('19B-005-CS', 'CS101'),
    ('19B-006-CS', 'CS101'),
    ('19B-007-CS', 'CS101'),
    ('19B-008-CS', 'CS101'),
    ('19B-009-CS', 'CS101'),
    ('19B-010-CS', 'CS101');


    -- Insert Teachers
INSERT INTO Teachers (TeacherID, TeacherName)
VALUES 
    ('T001', 'Dr. Alice Johnson'),
    ('T002', 'Dr. Bob Smith'),
    ('T003', 'Dr. Carol Davis'),
    ('T004', 'Dr. David Brown'),
    ('T005', 'Dr. Emma Wilson'),
    ('T006', 'Dr. Frank Miller'),
    ('T007', 'Dr. Grace Lee'),
    ('T008', 'Dr. Henry Garcia');

-- Assign Each Teacher to One Course
INSERT INTO Course_Teachers (CourseCode, TeacherID)
VALUES 
    ('EE101', 'T001'),
    ('CE101', 'T002'),
    ('TE101', 'T003'),
    ('PE101', 'T004'),
    ('SE101', 'T005'),
    ('IT101', 'T006'),
    ('DS101', 'T007'),
    ('CS101', 'T008');

    --- remaining will be taken from old database

    -- Insert CLOs for Electrical Engineering (EE101)
INSERT INTO CLOs (CLOID, CourseCode, CLO_Number, Description)
VALUES 
    ('EE101_CLO1', 'EE101', 1, 'Understand basic electrical engineering concepts'),
    ('EE101_CLO2', 'EE101', 2, 'Apply circuit analysis techniques'),
    ('EE101_CLO3', 'EE101', 3, 'Analyze AC and DC circuits'),
    ('EE101_CLO4', 'EE101', 4, 'Design simple electrical circuits');

-- Insert CLOs for Computer Engineering (CE101)
INSERT INTO CLOs (CLOID, CourseCode, CLO_Number, Description)
VALUES 
    ('CE101_CLO1', 'CE101', 1, 'Understand fundamentals of computer engineering'),
    ('CE101_CLO2', 'CE101', 2, 'Design basic digital circuits'),
    ('CE101_CLO3', 'CE101', 3, 'Implement simple computer programs'),
    ('CE101_CLO4', 'CE101', 4, 'Understand computer architecture');

-- Insert CLOs for Software Engineering (SE101)
INSERT INTO CLOs (CLOID, CourseCode, CLO_Number, Description)
VALUES 
    ('SE101_CLO1', 'SE101', 1, 'Understand software development lifecycle'),
    ('SE101_CLO2', 'SE101', 2, 'Write basic software programs'),
    ('SE101_CLO3', 'SE101', 3, 'Understand software engineering principles'),
    ('SE101_CLO4', 'SE101', 4, 'Develop small-scale software projects');



    -- Insert Data into PLOs Table
INSERT INTO PLOs (PLOID, PLO_Number, Description)
VALUES 
    ('PLO1', '(i)', 'Engineering Knowledge: An ability to apply knowledge of mathematics, science, engineering fundamentals and an engineering specialization to the solution of complex engineering problems.'),
    ('PLO2', '(ii)', 'Problem Analysis: An ability to identify, formulate, research literature, and analyze complex engineering problems reaching substantiated conclusions using first principles of mathematics, natural sciences and engineering sciences.'),
    ('PLO3', '(iii)', 'Design/Development of Solutions: An ability to design solutions for complex engineering problems and design systems, components or processes that meet specified needs with appropriate consideration for public health and safety, cultural, societal, and environmental considerations.'),
    ('PLO4', '(iv)', 'Investigation: An ability to investigate complex engineering problems in a methodical way including literature survey, design and conduct of experiments, analysis and interpretation of experimental data, and synthesis of information to derive valid conclusions.'),
    ('PLO5', '(v)', 'Modern Tool Usage: An ability to create, select and apply appropriate techniques, resources, and modern engineering and IT tools, including prediction and modeling, to complex engineering activities, with an understanding of the limitations.'),
    ('PLO6', '(vi)', 'The Engineer and Society: An ability to apply reasoning informed by contextual knowledge to assess societal, health, safety, legal and cultural issues and the consequent responsibilities relevant to professional engineering practice and solution to complex engineering problems.'),
    ('PLO7', '(vii)', 'Environment and Sustainability: An ability to understand the impact of professional engineering solutions in societal and environmental contexts and demonstrate knowledge of and need for sustainable development.'),
    ('PLO8', '(viii)', 'Ethics: Apply ethical principles and commit to professional ethics and responsibilities and norms of engineering practice.'),
    ('PLO9', '(ix)', 'Individual and Team Work: An ability to work effectively, as an individual or in a team, on multifaceted and /or multidisciplinary settings.'),
    ('PLO10', '(x)', 'Communication: An ability to communicate effectively, orally as well as in writing, on complex engineering activities with the engineering community and with society at large, such as being able to comprehend and write effective reports and design documentation, make effective presentations, and give and receive clear instructions.'),
    ('PLO11', '(xi)', 'Project Management: An ability to demonstrate management skills and apply engineering principles to one’s own work, as a member and/or leader in a team, to manage projects in a multidisciplinary environment.'),
    ('PLO12', '(xii)', 'Lifelong Learning: An ability to recognize importance of, and pursue lifelong learning in the broader context of innovation and technological developments.');


    -- Mapping CLOs of Electrical Engineering (EE101) to PLOs
INSERT INTO CLOs_PLOs_Mapping (CLOID, PLOID)
VALUES 
    ('EE101_CLO1', 'PLO1'),
    ('EE101_CLO2', 'PLO2'),
    ('EE101_CLO3', 'PLO3'),
    ('EE101_CLO4', 'PLO4');

-- Mapping CLOs of Computer Engineering (CE101) to PLOs
INSERT INTO CLOs_PLOs_Mapping (CLOID, PLOID)
VALUES 
    ('CE101_CLO1', 'PLO5'),
    ('CE101_CLO2', 'PLO6'),
    ('CE101_CLO3', 'PLO7'),
    ('CE101_CLO4', 'PLO8');

-- Mapping CLOs of Software Engineering (SE101) to PLOs
INSERT INTO CLOs_PLOs_Mapping (CLOID, PLOID)
VALUES 
    ('SE101_CLO1', 'PLO9'),
    ('SE101_CLO2', 'PLO10'),
    ('SE101_CLO3', 'PLO11'),
    ('SE101_CLO4', 'PLO12');



    -- Achievements for Students in Electrical Engineering (EE101)
INSERT INTO Student_Course_CLO_Achievements (RollNo, CLOID, CLO_Value)
VALUES 
    ('19B-001-EE', 'EE101_CLO1', 1),
    ('19B-001-EE', 'EE101_CLO2', 1),
    ('19B-001-EE', 'EE101_CLO3', 1),
    ('19B-001-EE', 'EE101_CLO4', 1),
    ('19B-002-EE', 'EE101_CLO1', 1),
    ('19B-002-EE', 'EE101_CLO2', 0),
    ('19B-002-EE', 'EE101_CLO3', 1),
    ('19B-002-EE', 'EE101_CLO4', 0),
    ('19B-003-EE', 'EE101_CLO1', 1),
    ('19B-003-EE', 'EE101_CLO2', 1),
    ('19B-003-EE', 'EE101_CLO3', 1),
    ('19B-003-EE', 'EE101_CLO4', 1),
    ('19B-004-EE', 'EE101_CLO1', 0),
    ('19B-004-EE', 'EE101_CLO2', 0),
    ('19B-004-EE', 'EE101_CLO3', 1),
    ('19B-004-EE', 'EE101_CLO4', 0),
    ('19B-005-EE', 'EE101_CLO1', 1),
    ('19B-005-EE', 'EE101_CLO2', 1),
    ('19B-005-EE', 'EE101_CLO3', 0),
    ('19B-005-EE', 'EE101_CLO4', 1);

-- Achievements for Students in Computer Engineering (CE101)
INSERT INTO Student_Course_CLO_Achievements (RollNo, CLOID, CLO_Value)
VALUES 
    ('19B-001-CE', 'CE101_CLO1', 1),
    ('19B-001-CE', 'CE101_CLO2', 1),
    ('19B-001-CE', 'CE101_CLO3', 0),
    ('19B-001-CE', 'CE101_CLO4', 1),
    ('19B-002-CE', 'CE101_CLO1', 1),
    ('19B-002-CE', 'CE101_CLO2', 1),
    ('19B-002-CE', 'CE101_CLO3', 1),
    ('19B-002-CE', 'CE101_CLO4', 1),
    ('19B-003-CE', 'CE101_CLO1', 0),
    ('19B-003-CE', 'CE101_CLO2', 1),
    ('19B-003-CE', 'CE101_CLO3', 1),
    ('19B-003-CE', 'CE101_CLO4', 0),
    ('19B-004-CE', 'CE101_CLO1', 1),
    ('19B-004-CE', 'CE101_CLO2', 1),
    ('19B-004-CE', 'CE101_CLO3', 1),
    ('19B-004-CE', 'CE101_CLO4', 1),
    ('19B-005-CE', 'CE101_CLO1', 1),
    ('19B-005-CE', 'CE101_CLO2', 0),
    ('19B-005-CE', 'CE101_CLO3', 0),
    ('19B-005-CE', 'CE101_CLO4', 1);

-- Achievements for Students in Software Engineering (SE101)
INSERT INTO Student_Course_CLO_Achievements (RollNo, CLOID, CLO_Value)
VALUES 
    ('19B-001-SE', 'SE101_CLO1', 1),
    ('19B-001-SE', 'SE101_CLO2', 0),
    ('19B-001-SE', 'SE101_CLO3', 1),
    ('19B-001-SE', 'SE101_CLO4', 1),
    ('19B-002-SE', 'SE101_CLO1', 1),
    ('19B-002-SE', 'SE101_CLO2', 1),
    ('19B-002-SE', 'SE101_CLO3', 1),
    ('19B-002-SE', 'SE101_CLO4', 1),
    ('19B-003-SE', 'SE101_CLO1', 1),
    ('19B-003-SE', 'SE101_CLO2', 0),
    ('19B-003-SE', 'SE101_CLO3', 1),
    ('19B-003-SE', 'SE101_CLO4', 0),
    ('19B-004-SE', 'SE101_CLO1', 0),
    ('19B-004-SE', 'SE101_CLO2', 0),
    ('19B-004-SE', 'SE101_CLO3', 0),
    ('19B-004-SE', 'SE101_CLO4', 1),
    ('19B-005-SE', 'SE101_CLO1', 1),
    ('19B-005-SE', 'SE101_CLO2', 1),
    ('19B-005-SE', 'SE101_CLO3', 1),
    ('19B-005-SE', 'SE101_CLO4', 1);



    -- Insert Two New Classes
INSERT INTO Classrooms (CourseTitle, CourseCode, ProgramID, Semester, CreditHour, KnowledgeArea, CourseObjectives)
VALUES 
    ('Introduction to Electrical Engineering', 'EE101', 1, '1st', '3', 'Engineering Fundamentals', 'Understand the basics of electrical engineering.'),
    ('Introduction to Computer Engineering', 'CE101', 2, '1st', '3', 'Engineering Fundamentals', 'Understand the basics of computer engineering.');

-- Enroll Students in Electrical Engineering (ClassroomID = 1)
INSERT INTO Classroom_Students (ClassroomID, RollNo)
VALUES 
    (1, '19B-001-EE'),
    (1, '19B-002-EE'),
    (1, '19B-003-EE'),
    (1, '19B-004-EE'),
    (1, '19B-005-EE');

-- Enroll Students in Computer Engineering (ClassroomID = 2)
INSERT INTO Classroom_Students (ClassroomID, RollNo)
VALUES 
    (2, '19B-001-CE'),
    (2, '19B-002-CE'),
    (2, '19B-003-CE'),
    (2, '19B-004-CE'),
    (2, '19B-005-CE');