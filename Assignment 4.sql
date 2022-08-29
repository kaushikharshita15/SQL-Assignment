 -- Scenario 1
   CREATE TABLE books
(
    id int primary key,
    title varchar(20),
    author varchar(20),
	isbn bigint,
	published_date datetime; 
)

insert into books(id,title,author,isbn,published_date)
values 
('1','My First SQL Book','Mary Poker','981483029127','2012-02-22 12:08:17'),
('2','My Second SQL Book','John Mayer','857300923713','1972-07-03 09:22:45'),
('3','My Third SQL Book','Cary Flint','523120967812','2015-10-18 14:05:44');
