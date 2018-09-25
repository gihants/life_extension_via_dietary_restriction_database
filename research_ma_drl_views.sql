CREATE OR REPLACE VIEW studies_by_year AS
SELECT c.year AS year, count(*) AS studies
FROM comparison c
GROUP BY year
ORDER BY year ASC;


CREATE OR REPLACE VIEW studies_per_country AS
SELECT s.Country as country, (SELECT c.Country_Code FROM country c WHERE c.Country_Name = s.Country) AS country_code, COUNT(*) as studies
FROM study_info s
WHERE NOT (s.Country = '')
GROUP BY s.Country
ORDER BY studies DESC;


CREATE OR REPLACE VIEW sample_size_year_sex AS
SELECT  Study_ID as study_id, Sex sex, N2 treatment_group_sample_size, Year year
FROM comparison
GROUP BY Study_ID, Sex, N2, Year
ORDER BY Year;

SELECT c.Study_ID as paper, (SELECT COUNT(DISTINCT c_1.Sex) FROM comparison c_1 WHERE c_1.Study_ID = paper) AS number_of_items 
FROM comparison c
GROUP BY paper
ORDER BY number_of_items DESC;

CREATE OR REPLACE VIEW experiments_per_study AS
SELECT c.Study_ID as study_id, count(*) as experiments
FROM study_info c
GROUP BY study_id
ORDER BY experiments DESC;

CREATE OR REPLACE VIEW country_codes_of_first_authors AS
SELECT s.study_ID AS study_id, c.Country_Name AS country, c.Country_Code AS country_code
FROM study_info s, country c
WHERE s.Country = c.Country_Name
ORDER BY study_id;

CREATE OR REPLACE VIEW paper_titiles AS
SELECT DISTINCT t.Study_ID, t.TI
FROM titles t;


