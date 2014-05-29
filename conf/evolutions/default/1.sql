# --- First database schema

# --- !Ups

--
-- Table structure for table `login`
--

CREATE TABLE login (
  ID_prof 		bigint NOT NULL,
  ProfName		varchar(45),
  Password 		varchar(45),
  constraint pk_login primary key (ID_prof)
);


--
-- Table structure for table `stats`
--

CREATE TABLE stats (
  ID_stats 		bigint DEFAULT NULL,
  Speed_slow 		bigint DEFAULT NULL,
  Speed_ok 		bigint DEFAULT NULL,
  Speed_fast 		bigint DEFAULT NULL,
  Pause 		bigint DEFAULT NULL,
  Volume_high 		bigint DEFAULT NULL,
  Volume_ok 		bigint DEFAULT NULL,
  Volume_low 		bigint DEFAULT NULL,
  constraint pk_stats primary key (ID_stats)
);

--
-- Table structure for table `course`
--

CREATE TABLE course (
  ID_prof 			bigint NOT NULL,
  ID_stats 			bigint NOT NULL,
  CourseName 		varchar(200) DEFAULT NULL,
  SessionNumber 	varchar(200) DEFAULT NULL,
  constraint pk_course primary key (CourseName)
);
alter table course add constraint fk_course_login foreign key (ID_prof) references login (ID_prof) on delete restrict on update restrict;
alter table course add constraint fk_course_stats foreign key (ID_stats) references stats (ID_stats) on delete restrict on update restrict;
create index ix_course_login on course (ID_prof);
create index ix_course_stats on course (ID_stats);
--
-- Table structure for table `question`
--

CREATE TABLE question (
  ID_prof 			bigint NOT NULL,
  ID_question 		bigint NOT NULL,
  Question 			varchar(45) DEFAULT NULL,
  CourseName 		varchar(200) DEFAULT NULL,
  constraint pk_question primary key (ID_question)
  );

alter table question add constraint fk_question_login foreign key (ID_prof) references login (ID_prof) on delete restrict on update restrict;
alter table question add constraint fk_question_course foreign key (CourseName) references course (CourseName) on delete restrict on update restrict;
create index ix_question_login on question (ID_prof);
create index ix_question_course on question (CourseName);

--
-- Table structure for table `answer`
--

CREATE TABLE answer (
	ID_question  bigint NOT NULL,
  	Answer	    varchar(45),
);

alter table answer add constraint fk_answer_question foreign key (ID_question) references question (ID_question) on delete restrict on update restrict;
create index ix_answer_question on answer (ID_question);



create sequence login_seq start with 1000;
create sequence question_seq start with 1000;
create sequence answer_seq start with 1000;
create sequence course_seq start with 1000;
create sequence stats_seq start with 1000;

# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists login;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists login_seq;

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists question;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists question_seq;

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists answer;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists answer_seq;

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists course;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists course_seq;

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists stats;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists stats_seq;




