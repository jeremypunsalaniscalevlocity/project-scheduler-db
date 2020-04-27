CREATE DATABASE  IF NOT EXISTS projectscheduler;
USE projectscheduler;

DROP TABLE IF EXISTS hibernate_sequence;
CREATE TABLE hibernate_sequence (
  next_val bigint DEFAULT NULL
);
LOCK TABLES hibernate_sequence WRITE;
INSERT INTO hibernate_sequence VALUES (53),(53);
UNLOCK TABLES;

DROP TABLE IF EXISTS project_task;
CREATE TABLE project_task (
  project_id int DEFAULT NULL,
  task_id int DEFAULT NULL
);

LOCK TABLES project_task WRITE;
INSERT INTO project_task VALUES (50,47),(50,48),(50,46),(49,45),(49,46),(49,44),(52,51);
UNLOCK TABLES;

DROP TABLE IF EXISTS schedule_project;
CREATE TABLE schedule_project (
  project_id int NOT NULL AUTO_INCREMENT,
  project_name varchar(255) NOT NULL,
  project_desc varchar(255) DEFAULT NULL,
  project_startdate date NOT NULL,
  PRIMARY KEY (project_id),
  UNIQUE KEY idproject_UNIQUE (project_id)
) AUTO_INCREMENT=53;

LOCK TABLES schedule_project WRITE;
INSERT INTO schedule_project VALUES (49,'First Project','1st Project','2020-04-25'),(50,'Second Project','2nd Project','2020-05-02'),(52,'Third Project','3rd Project','2020-04-30');
UNLOCK TABLES;

DROP TABLE IF EXISTS schedule_task;
CREATE TABLE schedule_task (
  task_id int NOT NULL AUTO_INCREMENT,
  task_name varchar(255) NOT NULL,
  task_desc varchar(255) DEFAULT NULL,
  task_duration int NOT NULL,
  PRIMARY KEY (task_id),
  UNIQUE KEY id_UNIQUE (task_id)
) AUTO_INCREMENT=52;

LOCK TABLES schedule_task WRITE;
INSERT INTO schedule_task VALUES (44,'First Sample Task','First task - dependent on 2nd task',10),(45,'Second Sample Task','2nd Task - no dependent tasks',3),(46,'Third Sample Task','3rd Task - Dependent on first task',11),(47,'Fourth Sample Task','4th Task - Dependent on 1st and 2nd Tasks',15),(48,'Fifth Sample Task','5th Task - Dependent of 1st and 3rd Task',2),(51,'Sixth Sample Task','6th Task - no dependents',20);
UNLOCK TABLES;

DROP TABLE IF EXISTS task_dependencies;
CREATE TABLE task_dependencies (
  main_task_id int DEFAULT NULL,
  dependent_task_id int DEFAULT NULL
);

LOCK TABLES task_dependencies WRITE;
INSERT INTO task_dependencies VALUES (46,44),(48,46),(48,44),(47,45),(47,44),(44,45);
UNLOCK TABLES;

COMMIT;