CREATE DATABASE IF NOT EXISTS BIFORCE_STAGING;

USE BIFORCE_STAGING;

CREATE TABLE TRAINEE_DIM (TRAINEE_ID INT, BATCH_ID INT, TRAINEE_EMAIL STRING, TRAINEE_NAME STRING, TRAINING_STATUS STRING, PHONE_NUMBER STRING, PROFILE_URL STRING, SKYPE_ID STRING, RESOURCE_ID STRING, FLAG_NOTES STRING, FLAG_STATUS STRING, TECH_SCREEN_SCORE FLOAT, RECRUITER_NAME STRING, COLLEGE STRING, DEGREE STRING, MAJOR STRING, TECH_SCREENER_NAME STRING, REVPRO_PROJECT_COMPLETION INT);

CREATE TABLE BATCH_DIM (BATCH_ID INT, TRAINER_ID INT, ADDRESS_ID INT, BORDERLINE_GRADE_THRESHOLD FLOAT, END_DATE TIMESTAMP, GOOD_GRADE_THRESHOLD FLOAT, LOCATION STRING, SKILL_TYPE STRING, START_DATE TIMESTAMP, TRAINING_NAME STRING, TRAINING_TYPE STRING, NUMBER_OF_WEEKS INT, CO_TRAINER_ID INT, RESOURCE_ID STRING, GRADED_WEEKS INT);

CREATE TABLE NOTE_DIM (NOTE_ID INT, NOTE_CONTENT STRING, MAX_VISIBILITY INT, IS_QC_FEEDBACK BOOLEAN, QC_STATUS STRING, NOTE_TYPE STRING, WEEK_NUMBER INT);

CREATE TABLE NOTE_FACT (NOTE_ID INT, BATCH_ID INT, TRAINEE_ID INT);

CREATE TABLE GRADE_FACT (GRADE_ID INT, DATE_RECEIVED TIMESTAMP, ASSESSMENT_ID INT, TRAINEE_ID INT, SCORE FLOAT);

CREATE TABLE ASSESSMENT_DIM (ASSESSMENT_ID INT, BATCH_ID INT, CATEGORY_ID INT, RAW_SCORE FLOAT, ASSESSMENT_TITLE STRING, ASSESSMENT_TYPE STRING, WEEK_NUMBER INT);

CREATE TABLE CATEGORY_DIM (CATEGORY_ID INT, SKILL_CATEGORY STRING, IS_ACTIVE BOOLEAN);

CREATE TABLE TRAINER_DIM (TRAINER_ID INT, EMAIL STRING, NAME STRING, TIER STRING, TITLE STRING);

CREATE TABLE ADDRESS_DIM (ADDRESS_ID INT, ADDRESS_STREET STRING, ADDRESS_CITY STRING, ADDRESS_STATE STRING, ADDRESS_ZIP STRING, ADDRESS_COMPANY STRING, ADDRESS_ACTIVE BOOLEAN);


INSERT OVERWRITE TABLE trainee_dim
SELECT trainee_id, batch_id, trainee_email, trainee_name, TRAINING_STATUS, PHONE_NUMBER, PROFILE_URL, SKYPE_ID, RESOURCE_ID, FLAG_NOTES, FLAG_STATUS, TECH_SCREEN_SCORE, RECRUITER_NAME, COLLEGE, DEGREE, MAJOR, TECH_SCREENER_NAME, REVPRO_PROJECT_COMPLETION
FROM caliber_trainee;

INSERT OVERWRITE TABLE BATCH_DIM
SELECT BATCH_ID, TRAINER_ID, ADDRESS_ID, BORDERLINE_GRADE_THRESHOLD, END_DATE, GOOD_GRADE_THRESHOLD, LOCATION, SKILL_TYPE, START_DATE, TRAINING_NAME, TRAINING_TYPE, NUMBER_OF_WEEKS, CO_TRAINER_ID, RESOURCE_ID, GRADED_WEEKS
FROM CALIBER_BATCH;

INSERT OVERWRITE TABLE NOTE_DIM
SELECT NOTE_ID, NOTE_CONTENT, MAX_VISIBILITY, IS_QC_FEEDBACK, QC_STATUS, NOTE_TYPE, WEEK_NUMBER
FROM CALIBER_NOTE;

INSERT OVERWRITE TABLE NOTE_FACT
SELECT NOTE_ID, BATCH_ID, TRAINEE_ID
FROM CALIBER_NOTE;

INSERT OVERWRITE TABLE GRADE_FACT
SELECT GRADE_ID, DATE_RECEIVED, ASSESSMENT_ID, TRAINEE_ID, SCORE
FROM CALIBER_GRADE;

INSERT OVERWRITE TABLE ASSESSMENT_DIM
SELECT ASSESSMENT_ID, BATCH_ID, ASSESSMENT_CATEGORY, RAW_SCORE, ASSESSMENT_TITLE, ASSESSMENT_TYPE, WEEK_NUMBER
FROM CALIBER_ASSESSMENT;

INSERT OVERWRITE TABLE CATEGORY_DIM
SELECT CATEGORY_ID, SKILL_CATEGORY, IS_ACTIVE
FROM CALIBER_CATEGORY;

INSERT OVERWRITE TABLE TRAINER_DIM
SELECT TRAINER_ID, EMAIL, NAME, TIER, TITLE
FROM CALIBER_TRAINER;

INSERT OVERWRITE TABLE ADDRESS_DIM
SELECT ADDRESS_ID, ADDRESS_STREET, ADDRESS_CITY, ADDRESS_STATE, ADDRESS_ZIPCODE, ADDRESS_COMPANY, ACTIVE
FROM CALIBER_ADDRESS;