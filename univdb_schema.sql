CREATE TABLE Student (
    stdNo CHAR(11) NOT NULL,
    stdFirstName VARCHAR(30) NOT NULL,
    stdLastName VARCHAR(30) NOT NULL,
    stdCity VARCHAR(30) NOT NULL,
    stdState CHAR(2) NOT NULL,
    stdZip CHAR(10) NOT NULL,
    stdMajor CHAR(6),
    stdClass CHAR(2),
    stdGPA DECIMAL(3 , 2 ),
    CONSTRAINT StudentPk PRIMARY KEY (StdNo)
);


CREATE TABLE Course (
    CourseNo CHAR(6) NOT NULL,
    crsDesc VARCHAR(50) NOT NULL,
    CrsUnits INTEGER,
    CONSTRAINT CoursePK PRIMARY KEY (CourseNo)
);

CREATE TABLE Faculty (
    FacNo CHAR(11) NOT NULL,
    FacFirstName VARCHAR(30) NOT NULL,
    FacLastName VARCHAR(30) NOT NULL,
    FacCity VARCHAR(30) NOT NULL,
    FacState CHAR(2) NOT NULL,
    FacZipCode CHAR(10) NOT NULL,
    FacRank CHAR(4),
    FacHireDate DATE,
    FacSalary DECIMAL(10 , 2 ),
    FacSupervisor CHAR(11),
    FacDept CHAR(6),
    CONSTRAINT FacultyPK PRIMARY KEY (FacNo)
);

CREATE TABLE Offering (
    OfferNo INTEGER NOT NULL,
    CourseNo CHAR(6) NOT NULL,
    OffTerm CHAR(6) NOT NULL,
    OffYear INTEGER NOT NULL,
    OffLocation VARCHAR(30),
    OffTime VARCHAR(10),
    FacNo CHAR(11),
    OffDays CHAR(4),
    CONSTRAINT OfferingPK PRIMARY KEY (OfferNo),
    CONSTRAINT CourseFK FOREIGN KEY (CourseNo)
        REFERENCES Course (CourseNo),
    CONSTRAINT FacultyFK FOREIGN KEY (FacNo)
        REFERENCES Faculty (FacNo)
);

CREATE TABLE Enrollment (
    OfferNo INTEGER NOT NULL,
    StdNo CHAR(11) NOT NULL,
    EnrGrade DECIMAL(3 , 2 ),
    CONSTRAINT EnrollmentPK PRIMARY KEY (OfferNo , StdNo),
    CONSTRAINT OfferingFK FOREIGN KEY (OfferNo)
        REFERENCES Offering (OfferNo)
        ON DELETE CASCADE,
    CONSTRAINT StudentFK FOREIGN KEY (StdNo)
        REFERENCES Student (StdNo)
        ON DELETE CASCADE
);
