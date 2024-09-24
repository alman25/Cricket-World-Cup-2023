/* 1.0 Overall Analysis */
-- In this analysis we are going to look at the overall statistics of the ICC Cricket World Cup 2023 --

/* 1.1 - Total Number of Sixes hit in ICC CWC 2023 */
select count(runs_off_bat) as total_6s
FROM deliveries
WHERE runs_off_bat = 6;

/* 1.2 - Total Number of Fours hit in ICC CWC 2023 */
select count(runs_off_bat) as total_4s
FROM deliveries
WHERE runs_off_bat = 4;

/* 1.3 - Countries that competed in ICC CWC 2023 */
select distinct(batting_team) as teams
FROM deliveries
ORDER by teams;

/* Batting Analysis /*
-- In this analysis we are going to look at the overall performance of batmen --

/* 2.1 - Top 10 highest runs scorer in ICC CWC 2023 */
select
	striker,
	sum(runs_off_bat) as runs
FROM deliveries
GROUP by striker
ORDER by runs DESC
LIMIT 10;

/* 2.2 - Top 10 players who hit the most Sixes in ICC WC 2023 */
select 
		striker, 
		count(runs_off_bat) as total_6s
FROM deliveries
WHERE runs_off_bat = 6
GROUP by striker
ORDER by total_6s DESC
LIMIT 10;

/* 2.3 - Top 10 batsmen who hit the most Sixes in a single match */
SELECT
	match_id,
	striker,
    count(runs_off_bat) as total_6s
FROM deliveries
WHERE runs_off_bat = 6
GROUP BY match_id, striker
ORDER BY total_6s DESC
LIMIT 10;

/* 2.4 - Most Sixes hit in a Venue */
SELECT
		venue,
        count(runs_off_bat) as total_6s
FROM deliveries
WHERE runs_off_bat = 6
GROUP by venue
ORDER by total_6s DESC;

/* 2.5 - Top 10 players who hit the most Fours in ICC WC 2023 */
SELECT
	striker,
    count(runs_off_bat) as total_4s
FROM deliveries
WHERE runs_off_bat = 4
GROUP by striker
ORDER by total_4s DESC
LIMIT 10;

/* 2.6 - Top 10 batsmen who hit most number of fours in single match */
SELECT
		match_id,
        striker,
        count(runs_off_bat) as total_4s
FROM deliveries
WHERE runs_off_bat = 4
GROUP by match_id, striker
ORDER by total_4s DESC
LIMIT 10;

/* 2.7 - Most fours hit in a Venue */
SELECT 
	venue,
    count(runs_off_bat) as total_4s
FROM deliveries
WHERE runs_off_bat = 4
GROUP by venue
ORDER by total_4s DESC;

/* 2.8 - Top 10 Teams which scored most number of runs in a match */
SELECT
	match_id,
    batting_team,
    sum(runs_off_bat) + sum(extras) as runs
FROM deliveries
GROUP by match_id, batting_team
ORDER by runs DESC
LIMIT 10;

/* 2.9 - Top 10 Batsmen who scored most number of runs in a match */
SELECT
		match_id,
        striker,
        sum(runs_off_bat) as runs
FROM deliveries
GROUP by match_id, striker
ORDER by runs DESC
LIMIT 10;

/* 2.10 - Overall Team Score in ICC CWC 23 */
SELECT
		batting_team,
        sum(runs_off_bat) + sum(extras) as runs
FROM deliveries
GROUP by batting_team
ORDER by runs DESC;

