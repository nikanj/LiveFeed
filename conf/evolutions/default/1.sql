# --- First database schema

# --- !Ups

DROP TABLE IF EXISTS login;

CREATE TABLE login (
  ID 			bigint NOT NULL,
  ProfName		varchar(45),
  Password 		varchar(45),
  constraint pk_login primary key (ID))
;

DROP TABLE IF EXISTS answer;

CREATE TABLE answer (
  ID 			bigint DEFAULT NULL,
  Answer	    varchar(45),
  KEY ID_answer_idx (ID),
  CONSTRAINT ID_answer FOREIGN KEY (ID) REFERENCES question (ID_answer) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Dumping data for table `answer`
--

LOCK TABLES answer WRITE;

UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS course;

CREATE TABLE course (
  ID_stats 			bigint NOT NULL,
  CourseName 		varchar(200) DEFAULT NULL,
  ID_login 			bigint DEFAULT NULL,
  SessionNumber 	varchar(200) DEFAULT NULL,
  PRIMARY KEY (ID_stats),
  UNIQUE KEY ID_UNIQUE (ID_stats),
  KEY ID_idx (ID_login),
  CONSTRAINT ID FOREIGN KEY (ID_login) REFERENCES login (ID) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Dumping data for table `course`
--

LOCK TABLES course WRITE;

UNLOCK TABLES;

--
-- Table structure for table `login`
--



--
-- Dumping data for table `login`
--

LOCK TABLES login WRITE;

UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS question;

CREATE TABLE question (
  ID_answer 		bigint NOT NULL,
  Question 			varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID_answer),
  UNIQUE KEY ID_UNIQUE (ID_answer)
);


--
-- Dumping data for table `question`
--

LOCK TABLES question WRITE;

UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS stats;

CREATE TABLE stats (
  ID 		bigint DEFAULT NULL,
  Slow 		varchar(45) DEFAULT NULL,
  OK 		varchar(45) DEFAULT NULL,
  Fast 		varchar(45) DEFAULT NULL,
  KEY 		ID_stats_idx (ID),
  CONSTRAINT ID_stats FOREIGN KEY (ID) REFERENCES course (ID_stats) ON DELETE NO ACTION ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;





create sequence login_seq start with 1000;

# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists login;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists login_seq;