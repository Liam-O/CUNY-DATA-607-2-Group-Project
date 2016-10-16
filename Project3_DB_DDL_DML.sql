/* Create Data Science database */
CREATE DATABASE data_science;
/* Use Data Science database */
USE data_science;
/* Drop all data_science database tables */
DROP TABLE data_science.category;
DROP TABLE data_science.skill;
DROP TABLE data_science.skill_category_map;
DROP TABLE data_science.transactions;
/* Create data_science.category table */
CREATE TABLE category
(
	ID INT(5) NOT NULL AUTO_INCREMENT,
	CATEGORY_NAME VARCHAR(100),
	PRIMARY KEY (ID)
);
/* Create data_science.skill table */
CREATE TABLE skill
(
        ID INT(5) NOT NULL AUTO_INCREMENT,
        SKILL_NAME VARCHAR(100),
	PRIMARY KEY (ID)
);
/* Create data_science.skill_category_map table */
CREATE TABLE skill_category_map
(
	SKILL_ID INT(5) NOT NULL,        
	CATEGORY_ID INT(5) NOT NULL
);
/* Create data_science.transactions table */
CREATE TABLE transactions
(
	ID INT(5) NOT NULL AUTO_INCREMENT,
	SKILL_ID INT(5) NOT NULL,        
	TX_DATE DATE NOT NULL,
	PRIMARY KEY (ID)
);
/* Initialize auto increment value to 1 */
ALTER TABLE category AUTO_INCREMENT=1;
/* Initialize auto increment value to 1 */
ALTER TABLE skill AUTO_INCREMENT=1;
/* Initialize auto increment value to 1 */
ALTER TABLE transactions AUTO_INCREMENT=1;

/* Populate data_science.category table */
INSERT INTO category(CATEGORY_NAME) VALUES ('Unknown');
INSERT INTO category(CATEGORY_NAME) VALUES ('Programming Languages');
INSERT INTO category(CATEGORY_NAME) VALUES ('Machine Learning');
INSERT INTO category(CATEGORY_NAME) VALUES ('Data Mining');
INSERT INTO category(CATEGORY_NAME) VALUES ('Data Visualization');
INSERT INTO category(CATEGORY_NAME) VALUES ('Databases');
INSERT INTO category(CATEGORY_NAME) VALUES ('Big Data Frameworks');
INSERT INTO category(CATEGORY_NAME) VALUES ('Probability and Statistics');
INSERT INTO category(CATEGORY_NAME) VALUES ('Generic');
INSERT INTO category(CATEGORY_NAME) VALUES ('Education');
INSERT INTO category(CATEGORY_NAME) VALUES ('Operating Systems');

/* Populate data_science.skill table */
INSERT INTO skill(SKILL_NAME) VALUES ('Java');
INSERT INTO skill(SKILL_NAME) VALUES ('R');
INSERT INTO skill(SKILL_NAME) VALUES ('Scala');
INSERT INTO skill(SKILL_NAME) VALUES ('Python');
INSERT INTO skill(SKILL_NAME) VALUES ('C');
INSERT INTO skill(SKILL_NAME) VALUES ('C++');
INSERT INTO skill(SKILL_NAME) VALUES ('SAS');
INSERT INTO skill(SKILL_NAME) VALUES ('Natural Language Processing');
INSERT INTO skill(SKILL_NAME) VALUES ('scikit-learn');
INSERT INTO skill(SKILL_NAME) VALUES ('Text Mining');
INSERT INTO skill(SKILL_NAME) VALUES ('Text Analytics');
INSERT INTO skill(SKILL_NAME) VALUES ('Tableau');
INSERT INTO skill(SKILL_NAME) VALUES ('D3.js');
INSERT INTO skill(SKILL_NAME) VALUES ('FusionCharts');
INSERT INTO skill(SKILL_NAME) VALUES ('Charts.js');
INSERT INTO skill(SKILL_NAME) VALUES ('Google Charts');
INSERT INTO skill(SKILL_NAME) VALUES ('Highcharts');
INSERT INTO skill(SKILL_NAME) VALUES ('Leaflet');
INSERT INTO skill(SKILL_NAME) VALUES ('dygraphs');
INSERT INTO skill(SKILL_NAME) VALUES ('Datawrapper');
INSERT INTO skill(SKILL_NAME) VALUES ('QlikView');
INSERT INTO skill(SKILL_NAME) VALUES ('Plotly');
INSERT INTO skill(SKILL_NAME) VALUES ('MySQL');
INSERT INTO skill(SKILL_NAME) VALUES ('Oracle');
INSERT INTO skill(SKILL_NAME) VALUES ('NoSQL');
INSERT INTO skill(SKILL_NAME) VALUES ('MongoDB');
INSERT INTO skill(SKILL_NAME) VALUES ('Cassandra');
INSERT INTO skill(SKILL_NAME) VALUES ('Redis');
INSERT INTO skill(SKILL_NAME) VALUES ('SQL');
INSERT INTO skill(SKILL_NAME) VALUES ('Postgres');
INSERT INTO skill(SKILL_NAME) VALUES ('HBase');
INSERT INTO skill(SKILL_NAME) VALUES ('Elastic');
INSERT INTO skill(SKILL_NAME) VALUES ('Hadoop');
INSERT INTO skill(SKILL_NAME) VALUES ('Hive');
INSERT INTO skill(SKILL_NAME) VALUES ('Mahout');
INSERT INTO skill(SKILL_NAME) VALUES ('Pig');
INSERT INTO skill(SKILL_NAME) VALUES ('Spark');
INSERT INTO skill(SKILL_NAME) VALUES ('Tez');
INSERT INTO skill(SKILL_NAME) VALUES ('Zookeeper');
INSERT INTO skill(SKILL_NAME) VALUES ('Avro');
INSERT INTO skill(SKILL_NAME) VALUES ('Ambari');
INSERT INTO skill(SKILL_NAME) VALUES ('Chukwa');
INSERT INTO skill(SKILL_NAME) VALUES ('Apache Storm');
INSERT INTO skill(SKILL_NAME) VALUES ('Apache Kafka');
INSERT INTO skill(SKILL_NAME) VALUES ('Naive Bayes Classifier');
INSERT INTO skill(SKILL_NAME) VALUES ('Inferential Statistics');
INSERT INTO skill(SKILL_NAME) VALUES ('Descriptive Statistics');
INSERT INTO skill(SKILL_NAME) VALUES ('Regression Analysis');
INSERT INTO skill(SKILL_NAME) VALUES ('Time Series Analysis10	Unix');
INSERT INTO skill(SKILL_NAME) VALUES ('Linux');
INSERT INTO skill(SKILL_NAME) VALUES ('Mac');
INSERT INTO skill(SKILL_NAME) VALUES ('Windows');
INSERT INTO skill(SKILL_NAME) VALUES ('B.S Computer Science');
INSERT INTO skill(SKILL_NAME) VALUES ('B.S Statistics');
INSERT INTO skill(SKILL_NAME) VALUES ('B.S Mathematics');
INSERT INTO skill(SKILL_NAME) VALUES ('B.S Applied Mathematics');
INSERT INTO skill(SKILL_NAME) VALUES ('B.S Economics');
INSERT INTO skill(SKILL_NAME) VALUES ('B.S Physics');
INSERT INTO skill(SKILL_NAME) VALUES ('M.S Computer Science');
INSERT INTO skill(SKILL_NAME) VALUES ('M.S Statistics');
INSERT INTO skill(SKILL_NAME) VALUES ('M.S Mathematics');
INSERT INTO skill(SKILL_NAME) VALUES ('M.S Applied Mathematics');
INSERT INTO skill(SKILL_NAME) VALUES ('M.S Operations Research');
INSERT INTO skill(SKILL_NAME) VALUES ('M.S Quantitative Finance');
INSERT INTO skill(SKILL_NAME) VALUES ('Web Analytics');
INSERT INTO skill(SKILL_NAME) VALUES ('Predictive Analytics');
INSERT INTO skill(SKILL_NAME) VALUES ('ETL');

/* Populate data_science.skill_category_map table */
INSERT INTO skill_category_map VALUE (1, 1);
INSERT INTO skill_category_map VALUE (2, 1);
INSERT INTO skill_category_map VALUE (3, 1);
INSERT INTO skill_category_map VALUE (4, 1);
INSERT INTO skill_category_map VALUE (5, 1);
INSERT INTO skill_category_map VALUE (6, 1);
INSERT INTO skill_category_map VALUE (7, 1);
INSERT INTO skill_category_map VALUE (8, 2);
INSERT INTO skill_category_map VALUE (9, 2);
INSERT INTO skill_category_map VALUE (10, 2);
INSERT INTO skill_category_map VALUE (11, 2);
INSERT INTO skill_category_map VALUE (12, 4);
INSERT INTO skill_category_map VALUE (13, 4);
INSERT INTO skill_category_map VALUE (14, 4);
INSERT INTO skill_category_map VALUE (15, 4);
INSERT INTO skill_category_map VALUE (16, 4);
INSERT INTO skill_category_map VALUE (17, 4);
INSERT INTO skill_category_map VALUE (18, 4);
INSERT INTO skill_category_map VALUE (19, 4);
INSERT INTO skill_category_map VALUE (20, 4);
INSERT INTO skill_category_map VALUE (21, 4);
INSERT INTO skill_category_map VALUE (22, 4);
INSERT INTO skill_category_map VALUE (23, 5);
INSERT INTO skill_category_map VALUE (24, 5);
INSERT INTO skill_category_map VALUE (25, 5);
INSERT INTO skill_category_map VALUE (26, 5);
INSERT INTO skill_category_map VALUE (27, 5);
INSERT INTO skill_category_map VALUE (28, 5);
INSERT INTO skill_category_map VALUE (29, 5);
INSERT INTO skill_category_map VALUE (30, 5);
INSERT INTO skill_category_map VALUE (31, 5);
INSERT INTO skill_category_map VALUE (32, 5);
INSERT INTO skill_category_map VALUE (33, 6);
INSERT INTO skill_category_map VALUE (34, 6);
INSERT INTO skill_category_map VALUE (35, 6);
INSERT INTO skill_category_map VALUE (36, 6);
INSERT INTO skill_category_map VALUE (37, 6);
INSERT INTO skill_category_map VALUE (38, 6);
INSERT INTO skill_category_map VALUE (39, 6);
INSERT INTO skill_category_map VALUE (40, 6);
INSERT INTO skill_category_map VALUE (41, 6);
INSERT INTO skill_category_map VALUE (42, 6);
INSERT INTO skill_category_map VALUE (43, 6);
INSERT INTO skill_category_map VALUE (44, 6);
INSERT INTO skill_category_map VALUE (45, 7);
INSERT INTO skill_category_map VALUE (46, 7);
INSERT INTO skill_category_map VALUE (47, 7);
INSERT INTO skill_category_map VALUE (48, 7);
INSERT INTO skill_category_map VALUE (49, 7);
INSERT INTO skill_category_map VALUE (50, 10);
INSERT INTO skill_category_map VALUE (51, 10);
INSERT INTO skill_category_map VALUE (52, 10);
INSERT INTO skill_category_map VALUE (53, 9);
INSERT INTO skill_category_map VALUE (54, 9);
INSERT INTO skill_category_map VALUE (55, 9);
INSERT INTO skill_category_map VALUE (56, 9);
INSERT INTO skill_category_map VALUE (57, 9);
INSERT INTO skill_category_map VALUE (58, 9);
INSERT INTO skill_category_map VALUE (59, 9);
INSERT INTO skill_category_map VALUE (60, 9);
INSERT INTO skill_category_map VALUE (61, 9);
INSERT INTO skill_category_map VALUE (62, 9);
INSERT INTO skill_category_map VALUE (63, 9);
INSERT INTO skill_category_map VALUE (64, 9);
INSERT INTO skill_category_map VALUE (65, 8);
INSERT INTO skill_category_map VALUE (66, 8);
INSERT INTO skill_category_map VALUE (67, 8);

/* Insert Transactions in data_science.transactions table */
INSERT INTO transactions (SKILL_ID, TX_DATE) values (1, STR_TO_DATE('10/15/2016', '%m/%d/%Y'));
INSERT INTO transactions (SKILL_ID, TX_DATE) values (1, STR_TO_DATE('10/16/2016', '%m/%d/%Y'));