CREATE TABLE Customer (
  custNo   CHAR(8)     NOT NULL,
  custName VARCHAR(30) NOT NULL,
  address  VARCHAR(50) NOT NULL,
  internal CHAR(1)     NOT NULL,
  city     VARCHAR(30) NOT NULL,
  zip      VARCHAR(10) NOT NULL,
  state    VARCHAR(2)  NOT NULL,
  contact  VARCHAR(50) NOT NULL,
  phone    VARCHAR(30) NOT NULL,
  CONSTRAINT CustomerPk PRIMARY KEY (custNo)
);

CREATE TABLE Employee (
  empNo      CHAR(11)     NOT NULL,
  empName    VARCHAR(30)  NOT NULL,
  department VARCHAR(30)  NOT NULL,
  email      VARCHAR(255) NOT NULL,
  phone      VARCHAR(30)  NOT NULL,
  CONSTRAINT EmployeePK PRIMARY KEY (empNo)
);


CREATE TABLE Facility (
  facNo   CHAR(11)    NOT NULL,
  facName VARCHAR(30) NOT NULL,
  CONSTRAINT FacilityPK PRIMARY KEY (facNo)
);


CREATE TABLE EventRequest (
  evntNo      CHAR(8)       NOT NULL,
  custNo      CHAR(8)       NOT NULL,
  facNo       CHAR(8)       NOT NULL,
  dateHeld    DATE          NOT NULL,
  dateReq     DATE          NOT NULL,
  dateAuth    DATE,
  status      CHAR(20)      NOT NULL,
  estCost     DECIMAL(8, 2) NOT NULL,
  estAudience INTEGER       NOT NULL,
  budNo       CHAR(30),
  CONSTRAINT EventRequestPK PRIMARY KEY (evntNo),
  CONSTRAINT FK_Facility FOREIGN KEY (facNo) REFERENCES Facility (facNo),
  CONSTRAINT FK_Customer FOREIGN KEY (custNo) REFERENCES Customer (custNo),
  CHECK (status IN('Pending','Denied','Approved') AND estaudience>0)
);

CREATE TABLE EventPlan (
  planNo   CHAR(8)  NOT NULL,
  evntNo   CHAR(8)  NOT NULL,
  empNo    CHAR(8),
  workDate DATE     NOT NULL,
  notes    TEXT,
  activity CHAR(10) NOT NULL,
  CONSTRAINT PK_EventPlan PRIMARY KEY (planNo),
  CONSTRAINT FK_EventRequest FOREIGN KEY (evntNo) REFERENCES EventRequest (evntNo),
  CONSTRAINT FK_Employee FOREIGN KEY (empNo) REFERENCES Employee (empNo)
);


CREATE TABLE Location (
  locNo   CHAR(8)     NOT NULL,
  facNo   CHAR(8)     NOT NULL,
  locName VARCHAR(30) NOT NULL,
  CONSTRAINT LocationPK PRIMARY KEY (locNo),
  CONSTRAINT FacilityFK FOREIGN KEY (facNo) REFERENCES Facility (facNo)
);

CREATE TABLE ResourceTbl (
  resNo   CHAR(8)       NOT NULL,
  resName VARCHAR(30)   NOT NULL,
  rate    DECIMAL(8, 2) NOT NULL,
  CONSTRAINT PK_ResourceTbl PRIMARY KEY (resNo)
);


CREATE TABLE EventPlanLine (
  planNo    CHAR(8)   NOT NULL,
  lineNo    CHAR(8)   NOT NULL,
  locNo     CHAR(8)   NOT NULL,
  resNo     CHAR(8)   NOT NULL,
  timeStart TIMESTAMP NOT NULL,
  timeEnd   TIMESTAMP NOT NULL,
  numberFLD INTEGER   NOT NULL,
  CONSTRAINT PK_EventPlanLine PRIMARY KEY (planNo, lineNo),
  CONSTRAINT FK_EventPlan FOREIGN KEY (planNo) REFERENCES EventPlan (planNo),
  CONSTRAINT FK_Location FOREIGN KEY (locNo) REFERENCES Location (locNo),
  CONSTRAINT FK_ResourceTbl FOREIGN KEY (resNo) REFERENCES ResourceTbl (resNo)
);
