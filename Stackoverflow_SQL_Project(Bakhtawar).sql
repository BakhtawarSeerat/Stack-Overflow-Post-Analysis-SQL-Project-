-- ------ My concern: user_id in some of the tables is incorrect.-----------

-- "Stack Overflow Post Analysis: A SQL Portfolio Project" 

-- Dataset: https://www.kaggle.com/datasets/stackoverflow/stackoverflow/data?select=post_history
-- ___________________________________________________________________________________________________________________

-- Project Objective: The objective is to analyze the history of Stack Overflow posts, including edits, comments, and
-- other changes, to gain insights into user activity and content evolution while mastering SQL skills.
-- ___________________________________________________________________________________________________________________

-- create schema project

create schema project;

-- create tables and insert data using this schema

USE project;

-- Create Tables in the Dataset

-- 1. create table badges
CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);

-- insert data in badges table
INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');

-- 2. create table comments
CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

-- insert data in table comments
INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');

-- 3. create tabl post history
CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

-- insert data in table post history
INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');

-- 4. create table post links
CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

-- insert data in post links
INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);

-- 5. create table post answers
CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

-- insert data in post answers
INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

-- 6. create table tags

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

-- insert data in table tags
INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');

-- 7. create table users
CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

-- insert data in users
INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');

-- 8. create table votes
CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

-- insert data in votes
INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');

-- 9. create table posts
CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

-- insert data in table posts
INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);
-- ___________________________________________________________________________________________________________________

-- Tasks and Concepts
-- Part 1: Basics
-- 1. Loading and Exploring Data

-- Explore the structure and first 10 rows of each table:

-- 1. Structure of table badges
desc badges;

-- first 10 rows of table badges
SELECT * FROM project.badges
limit 10;

-- 2. Structure of table comments
desc comments;
-- first 10 rows of table comments
SELECT * FROM project.comments
limit 10;

--  3 . Structure of table post_history
desc project.post_history;
-- first 10 rows of table post_history
SELECT * FROM project.post_history
limit 10;

--  4. Structure of table post_links
desc post_links;
-- first 10 rows of table post_links
SELECT * FROM project.post_links
limit 10;

-- 5. Structure of table posts
desc posts;
-- first 10 rows of table posts
SELECT * FROM project.posts
limit 10;

-- 6. Structure of table posts_answers
desc posts_answers;
-- first 10 rows of table posts_answers 
SELECT * FROM project.posts_answers
limit 10;

-- 7. Structure of table tags
desc tags;
-- first 10 rows of table tags
SELECT * FROM project.tags
limit 10;

-- 8. Structure of table users
desc users;
-- first 10 rows of table users
SELECT * FROM project.users
limit 10;

-- 9. Structure of table votes
desc votes;
-- first 10 rows of table votes
SELECT * FROM project.votes
limit 10;

-- Identify the total number of records in each table

-- 1. Identify the total number of records in project.badges
SELECT count(*) FROM project.badges;

-- 2. Identify the total number of records in comments
SELECT count(*) FROM project.comments;

-- 3. Identify the total number of records in post_history
SELECT count(*) FROM project.post_history;

-- 4. Identify the total number of records in post_links
SELECT count(*) FROM project.post_links;

-- 5. Identify the total number of records in posts
SELECT count(*) FROM project.posts;

-- 6. Identify the total number of records in posts_answers
SELECT count(*) FROM project.posts_answers;

-- 7. Identify the total number of records in tags
SELECT count(*) FROM project.tags;

-- 8. Identify the total number of records in users
SELECT count(*) FROM project.users;

-- 9. Identify the total number of records in votes
SELECT count(*) FROM project.votes;


-- 2. Filtering and Sorting
-- Find all posts with a view_count greater than 100
select * from posts  where view_count >100;

-- Display comments made in 2005, sorted by creation_date (comments table).
select * from comments where year(creation_date)= "2005"
order by creation_date;

-- 3. Simple Aggregations
-- Count the total number of badges (badges table).
select count(*) as total_badges from badges;

-- Calculate the average score of posts grouped by post_type_id (posts_answer table).
select post_type_id, avg(score) as avg_score_post from posts_answers
group by post_type_id;
-- ___________________________________________________________________________________________________________________

-- Part 2: Joins
-- 1. Basic Joins
-- Combine the post_history and posts tables to display the title of posts and the corresponding changes made in the post history.
select p. id ,  p. title,  ph.text, ph.creation_date from posts p join post_history ph on p.id = ph.post_id;

-- Join the users table with badges to find the total badges earned by each user
select  u.*, count(b.id) as total_badges_user from badges b join  users u on b.user_id=u.id
group by u.id;

-- 2. Multi-Table Joins
-- ○ Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users).
select p.title,c.text,u.display_name as user_name
from posts p join comments c 
on c.post_id= p.id
join  users u
on u.id=c.user_id;

-- ○ Combine post_links with posts to list related questions.
select p.id, p.title, pp.title as related_post_title , pl.related_post_id from post_links pl 
join posts p on p.id=pl.post_id
join posts pp on pl.related_post_id=pp.id;

-- ○ Join the users, badges, and comments tables to find the users who have earned badges and made comments.
select distinct(u.id), u.display_name,u.reputation,u.creation_date from users u
join badges b on b.user_id=u.id
join comments c on c.user_id =u.id;
-- ___________________________________________________________________________________________________________________

-- Part 3: Subqueries
-- 1. Single-Row Subqueries
-- ○ Find the user with the highest reputation (users table).
select * from users where reputation =(
select max(reputation) from users);

-- ○ Retrieve posts with the highest score in each post_type_id (posts table).
select * from posts where (post_type_id, score)
in  (select post_type_id, max(score) as score from posts
group by post_type_id);

-- 2. Correlated Subqueries
-- ○ For each post, fetch the number of related posts from post_links.
-- we used COALESCE fn to replace nulls with zeros for posts having no related posts
select * , COALESCE((select count(related_post_id)from post_links pl  where p.id=pl.post_id), 0) as count_related_post  
from posts p;
-- ___________________________________________________________________________________________________________________

-- Part 4: Common Table Expressions (CTEs)
-- 1. Non-Recursive CTE
-- ○ Create a CTE to calculate the average score of posts by each user and use it to:
-- ■ List users with an average score above 50.
with ct as
(select  owner_user_id, avg(score) as avg_score from posts
group by owner_user_id)
select * from ct where avg_score >50;

-- ■ Rank users based on their average post score.
with ct as
(select  owner_user_id, avg(score) as avg_score from posts
group by owner_user_id)
select owner_user_id, rank() over(order by avg_score) as ranking from ct ;

-- 2. Recursive CTE
-- ○ Simulate a hierarchy of linked posts using the post_links table.
with recursive heirarchy as (
  -- anchor member
  select pp.post_id, pp.related_post_id, 1 as level 
  from post_links pp
  union all
  -- recursive member
  select pp.post_id, pp.related_post_id, level+1  as level  
  from  post_links pp
  inner join heirarchy hh
  on pp.post_id=hh.related_post_id
  WHERE hh.level < 10 -- termination condition to stop after 10 levels
)
select * from heirarchy
order by level;
-- ___________________________________________________________________________________________________________________

-- Part 5: Advanced Queries
-- 1. Window Functions
-- ○ Rank posts based on their score within each year (posts table).
-- Ranking the score within each year, as there is only 2023 in data, all the scores are ranked accordingly.
select *, rank() over(partition by substring(creation_date, 1,4) order by score) as ranking from posts;

-- ○ Calculate the running total of badges earned by users (badges table).
select *, count(name) over(partition by user_id order by id) as running_total_badges from badges;
-- ___________________________________________________________________________________________________________________

-- New Insights and Questions
-- ● Which users have contributed the most in terms of comments, edits, and votes?
select user_id, count(user_id) from comments
group by user_id;

select user_id, count(user_id) from post_history
group by user_id;

-- User_id 1001, Name: Alice have contributed the most in the given terms. --

select post_id,owner_user_id, count(post_id) as counts from votes 
join posts on posts.id= votes.post_id
group by post_id
order by counts desc;

-- ● What types of badges are most commonly earned, and which users are the top earners?
select name, count(name) from badges
group by name;
-- 'Gold Contributor' is the badge most commonly earned --

select u.id, u.display_name, count(b.user_id) from badges b
join users u on b.user_id=u.id
group by user_id;
-- User_id 1001, Name: Alice is the top earner --


-- ● Which tags are associated with the highest-scoring posts?
select id, title, max(score)
from posts 
group by id
order by score desc
limit 1;
-- SQL, Database are the relevant tags for the highest scoring post.--

-- ● How often are related questions linked, and what does this say about knowledge sharing?
select post_id,count(related_post_id) as link_count  from post_links pl
group by post_id
order by link_count desc;
-- Almost 3 questions/ posts are linked together. This helps the users to look for answers, to their questions, in related questions. This way, knowledge sharing is enhanced for the users.
