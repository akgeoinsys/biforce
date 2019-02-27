CREATE DATABASE IF NOT EXISTS BIFORCE_STAGING;

USE BIFORCE_STAGING;

CREATE TABLE IF NOT EXISTS TRAINEE_DIM (TRAINEE_ID INT, BATCH_ID INT, TRAINEE_EMAIL STRING, TRAINEE_NAME STRING, TRAINING_STATUS STRING, PHONE_NUMBER STRING, PROFILE_URL STRING, SKYPE_ID STRING, RESOURCE_ID STRING, FLAG_NOTES STRING, FLAG_STATUS STRING, TECH_SCREEN_SCORE FLOAT, RECRUITER_NAME STRING, COLLEGE STRING, DEGREE STRING, MAJOR STRING, TECH_SCREENER_NAME STRING, REVPRO_PROJECT_COMPLETION INT);

CREATE TABLE IF NOT EXISTS BATCH_DIM (BATCH_ID INT, TRAINER_ID INT, ADDRESS_ID INT, BORDERLINE_GRADE_THRESHOLD FLOAT, END_DATE TIMESTAMP, GOOD_GRADE_THRESHOLD FLOAT, LOCATION STRING, SKILL_TYPE STRING, START_DATE TIMESTAMP, TRAINING_NAME STRING, TRAINING_TYPE STRING, NUMBER_OF_WEEKS INT, CO_TRAINER_ID INT, RESOURCE_ID STRING, GRADED_WEEKS INT);

CREATE TABLE IF NOT EXISTS NOTE_DIM (NOTE_ID INT, NOTE_CONTENT STRING, MAX_VISIBILITY INT, IS_QC_FEEDBACK BOOLEAN, QC_STATUS STRING, NOTE_TYPE STRING, WEEK_NUMBER INT);

CREATE TABLE IF NOT EXISTS NOTE_FACT (NOTE_ID INT, BATCH_ID INT, TRAINEE_ID INT);

CREATE TABLE IF NOT EXISTS GRADE_FACT (GRADE_ID INT, DATE_RECEIVED TIMESTAMP, ASSESSMENT_ID INT, TRAINEE_ID INT, SCORE FLOAT);

CREATE TABLE IF NOT EXISTS ASSESSMENT_DIM (ASSESSMENT_ID INT, BATCH_ID INT, CATEGORY_ID INT, RAW_SCORE FLOAT, ASSESSMENT_TITLE STRING, ASSESSMENT_TYPE STRING, WEEK_NUMBER INT);

CREATE TABLE IF NOT EXISTS CATEGORY_DIM (CATEGORY_ID INT, SKILL_CATEGORY STRING, IS_ACTIVE BOOLEAN);

CREATE TABLE IF NOT EXISTS TRAINER_DIM (TRAINER_ID INT, EMAIL STRING, NAME STRING, TIER STRING, TITLE STRING);

CREATE TABLE IF NOT EXISTS ADDRESS_DIM (ADDRESS_ID INT, ADDRESS_STREET STRING, ADDRESS_CITY STRING, ADDRESS_STATE STRING, ADDRESS_ZIP STRING, ADDRESS_COMPANY STRING, ADDRESS_ACTIVE BOOLEAN);

CREATE TABLE IF NOT EXISTS SPARK_DATA (ROWNUM INT, TEST_TYPE INT, RAW_SCORE DECIMAL(3, 0), SCORE DECIMAL(5, 2), TEST_PERIOD INT, TEST_CATEGORY INT, TRAINER_ID INT, BATCH_ID INT, GROUP_TYPE STRING, BATTERY_ID INT, BATTERY_STATUS INT);
