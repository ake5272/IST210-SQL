/* create tables */

/* genre_codes */
CREATE TABLE Genre_Codes(
genre_code int IDENTITY(1,1) NOT NULL,
genre_description varchar(32) NOT NULL);

/* actors */
CREATE TABLE Actors(
actor_id int IDENTITY(1,1) NOT NULL,
actor_gender char(1) NOT NULL,
actor_first_name varchar(32) NOT NULL,
actor_last_name varchar(32) NOT NULL,
other_actor_details varchar(512) NOT NULL);

/* movies */
CREATE TABLE Movies(
movie_id int IDENTITY(1,1) NOT NULL,
genre_type_code int NOT NULL,
release_year int NOT NULL,
movie_title varchar(128) NOT NULL,
movie_description varchar(1024) NOT NULL,
director_id int NOT NULL);

/* movie_cast */
CREATE TABLE Movie_Cast(
movie_id int NOT NULL,
actor_id int NOT NULL);

/* movie_ratings */
CREATE TABLE Movie_Ratings(
movie_rating_id int IDENTITY(1,1) NOT NULL,
movie_id int NOT NULL,
customer_id int NOT NULL,
rating_value int NOT NULL);

/* Directors */
CREATE TABLE Directors(
director_id int IDENTITY(1,1) NOT NULL,
director_name varchar(128) NOT NULL);

/* Customer_Rentals */
CREATE TABLE Customer_Rentals(
item_rental_id int IDENTITY(1,1) NOT NULL,
customer_id int NOT NULL,
movie_id int NOT NULL,
rental_period_code int NOT NULL,
other_rental_details varchar(512) NULL);

/* Rental_Periods */
CREATE TABLE Rental_Periods(
rental_period_code int IDENTITY(1,1) NOT NULL,
rental_price numeric NOT NULL,
rental_period_description varchar(512) NOT NULL);

/* Customers */
CREATE TABLE Customers(
customer_id int IDENTITY(1,1) NOT NULL,
member_yn char NOT NULL,
membership_number int NULL,
customer_first_name varchar(128) NULL,
customer_last_name varchar(128) NULL,
customer_street_name varchar(512) NULL,
customer_city varchar(32) NULL,
customer_state varchar(32) NOT NULL,
customer_zip_code int NULL,
customer_phone int NULL,
customer_email varchar(512) NOT NULL,
customer_dob date NULL);

/* Financial_Transactions */
CREATE TABLE Financial_Transactions(
transaction_id int IDENTITY(1,1) NOT NULL,
account_id int NOT NULL,
item_rental_id int NULL,
item_sale_id int NULL,
previous_transaction_id int NULL,
transaction_type_code int NOT NULL,
transaction_date date NOT NULL,
transaction_amount numeric NOT NULL,
transaction_comments varchar(1024) NULL);

/* Accounts */
CREATE TABLE Accounts(
account_id int IDENTITY(1,1) NOT NULL,
customer_id int NOT NULL,
payment_method_code int NOT NULL,
account_name varchar(512) NOT NULL,
customer_details varchar(1024) NULL);

/* Transaction_Types */
CREATE TABLE Transaction_Types(
transaction_type_code int IDENTITY(1,1) NOT NULL,
transaction_type_description varchar(32) NOT NULL);

/* Payment_Methods */
CREATE TABLE Payment_Methods(
payment_method_code int IDENTITY(1,1) NOT NULL,
payment_method_description varchar(32) NOT NULL);

/* Customer_Sales */
CREATE TABLE Customer_Sales(
item_sale_id int IDENTITY(1,1) NOT NULL,
customer_id int NOT NULL,
movie_id int NOT NULL,
sale_price numeric NOT NULL,
other_sale_details varchar(128) NULL);

/* create primary keys with ALTER TABLE statement */
ALTER TABLE Genre_Codes ADD CONSTRAINT pk_genre_code 
PRIMARY KEY (genre_code);
ALTER TABLE Actors ADD CONSTRAINT pk_actor PRIMARY KEY 
(actor_id);
ALTER TABLE Movies ADD CONSTRAINT pk_movies PRIMARY KEY 
(movie_id);
ALTER TABLE Movie_Cast ADD CONSTRAINT pk_movie_cast PRIMARY 
KEY (movie_id, actor_id);
ALTER TABLE Movie_Ratings ADD CONSTRAINT pk_movie_rating PRIMARY 
KEY (movie_rating_id);
ALTER TABLE Directors ADD CONSTRAINT pk_directors PRIMARY 
KEY (director_id);
ALTER TABLE Customer_Rentals ADD CONSTRAINT pk_item_rental 
PRIMARY KEY (item_rental_id);
ALTER TABLE Rental_Periods ADD CONSTRAINT pk_rental_period 
PRIMARY KEY (rental_period_code);
ALTER TABLE Customers ADD CONSTRAINT pk_customer 
PRIMARY KEY (customer_id);
ALTER TABLE Financial_Transactions ADD CONSTRAINT pk_transaction 
PRIMARY KEY (transaction_id);
ALTER TABLE Accounts ADD CONSTRAINT pk_account 
PRIMARY KEY (account_id);
ALTER TABLE Transaction_Types ADD CONSTRAINT pk_transaction_type 
PRIMARY KEY (transaction_type_code);
ALTER TABLE Payment_Methods ADD CONSTRAINT pk_payment_method 
PRIMARY KEY (payment_method_code);
ALTER TABLE Customer_Sales ADD CONSTRAINT pk_item_sale 
PRIMARY KEY (item_sale_id);
/*  end of primary key creation */

/* create foreign keys */
ALTER TABLE Movies ADD  CONSTRAINT fk_movies_genre_code 
FOREIGN KEY(genre_type_code)
REFERENCES Genre_Codes (genre_code);
ALTER TABLE Movies ADD  CONSTRAINT fk_director 
FOREIGN KEY(director_id)
REFERENCES Directors (director_id);

ALTER TABLE Movie_Cast ADD CONSTRAINT fk_Movie_cast_actor 
FOREIGN KEY(actor_id)
REFERENCES Actors (actor_id);
ALTER TABLE Movie_Cast ADD CONSTRAINT fk_movie_cast_movie 
FOREIGN KEY(movie_id)
REFERENCES Movies (movie_id);

ALTER TABLE Movie_Ratings ADD CONSTRAINT fk_customer 
FOREIGN KEY(customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Movie_Ratings ADD CONSTRAINT fk_movie 
FOREIGN KEY(movie_id) REFERENCES Movies (movie_id);

ALTER TABLE Customer_Rentals ADD CONSTRAINT fk_renting_customer 
FOREIGN KEY(customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Customer_Rentals ADD CONSTRAINT fk_movie_rented 
FOREIGN KEY(movie_id) REFERENCES Movies (movie_id);
ALTER TABLE Customer_Rentals ADD CONSTRAINT fk_rental_period 
FOREIGN KEY(rental_period_code) REFERENCES Rental_Periods (rental_period_code);

ALTER TABLE Financial_Transactions ADD CONSTRAINT fk_financial_account 
FOREIGN KEY(account_id) REFERENCES Accounts (account_id);
ALTER TABLE Financial_Transactions ADD CONSTRAINT fk_rental 
FOREIGN KEY(item_rental_id) REFERENCES Customer_Rentals (item_rental_id);
ALTER TABLE Financial_Transactions ADD CONSTRAINT fk_sale 
FOREIGN KEY(item_sale_id) REFERENCES Customer_Sales (item_sale_id);
ALTER TABLE Financial_Transactions ADD CONSTRAINT fk_previous_transaction 
FOREIGN KEY(previous_transaction_id) REFERENCES Financial_Transactions (transaction_id);
ALTER TABLE Financial_Transactions ADD CONSTRAINT fk_transaction_type 
FOREIGN KEY(transaction_type_code) REFERENCES Transaction_Types (transaction_type_code);


ALTER TABLE Accounts ADD CONSTRAINT fk_customer_id 
FOREIGN KEY(customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Accounts ADD CONSTRAINT fk_payment_method 
FOREIGN KEY(payment_method_code) REFERENCES Payment_Methods (payment_method_code);

ALTER TABLE Customer_Sales ADD CONSTRAINT fk_customer_id 
FOREIGN KEY(customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Customer_Sales ADD CONSTRAINT fk_customer_movie 
FOREIGN KEY(movie_id) REFERENCES Movies (movie_id);
/*  end of foreign key creation */

Populating Data
/* Insert data for table Genre_Codes */
INSERT INTO Genre_Codes VALUES ('Action & Adventure');
INSERT INTO Genre_Codes VALUES ('Comedy');
INSERT INTO Genre_Codes VALUES ('Documentary');
INSERT INTO Genre_Codes VALUES ('Drama');
INSERT INTO Genre_Codes VALUES ('Education');
INSERT INTO Genre_Codes VALUES ('Foreign');
INSERT INTO Genre_Codes VALUES ('Horror');
INSERT INTO Genre_Codes VALUES ('Romance');
INSERT INTO Genre_Codes VALUES ('Thriller');
INSERT INTO Genre_Codes VALUES ('Western');

/* Insert data for table Customers */ 
INSERT INTO Customers (member_yn, membership_number, customer_first_name, customer_last_name, customer_state, customer_zip_code, customer_email) VALUES ('y', 123, 'John', 'Smith', 'VA', '18512', 'jsmith@hotmail.com');
INSERT INTO Customers (member_yn, customer_first_name, customer_last_name, customer_state, customer_email) VALUES ('n', 'Mary', 'Jones', 'PA', 'jones_mary@gmail.com');
INSERT INTO Customers (member_yn, membership_number, customer_first_name, customer_last_name, customer_state, customer_email) VALUES ('y', 364, 'Sally', 'Ryder', 'FL', 'crazy_for_sql@yahoo.com');
INSERT INTO Customers (member_yn, membership_number , customer_first_name, customer_last_name, customer_street_name, customer_city, customer_state, customer_zip_code, customer_email) VALUES ('y', 234, 'Paul', 'Walker', '2 Clay Ave',  'Scranton', 'MA', '18503', 'paul@dundermifflin.com');
INSERT INTO Customers (member_yn, customer_first_name, customer_last_name, customer_state, customer_email) VALUES ('n', 'Daniel', 'Murphy', 'PA', 'dlm5@cmu.edu');

/* Insert data for table Movie_Ratings */
INSERT INTO Movie_Ratings VALUES (1, 2, 1);
INSERT INTO Movie_Ratings VALUES (3, 2, 2);
INSERT INTO Movie_Ratings VALUES (2, 1, 3);
INSERT INTO Movie_Ratings VALUES (4, 3, 4);
INSERT INTO Movie_Ratings VALUES (2, 3, 5);

/* Insert data for moives, actors and move_cast */
/* Amazing Spider-Man */
INSERT INTO Directors VALUES('Marc Webb');
INSERT INTO Movies VALUES (1, 2012, 'The Amazing 
Spider-Man',
'The story of Peter Parker, an outcast high schooler who 
was abandoned by his parents as a boy, leaving him to be 
raised by his Uncle Ben and Aunt May. Like most teenagers, 
Peter is trying to figure out who he is and how he got to 
be the person he is today. Peter is also finding his way 
with his first high school crush, Gwen Stacy, and together, 
they struggle with love, commitment, and secrets. As Peter 
discovers a mysterious briefcase that belonged to his 
father, he begins a quest to understand his parents 
disappearance - leading him directly to Oscorp and the lab 
of Dr. Curt Connors, his fathers former partner. As 
Spider-Man is set on a collision course with Connors 
alter-ego, The Lizard, Peter will make life-altering 
choices to use his powers and shape his destiny to become a 
hero.', 1);
INSERT INTO Actors values ('M', 'Andrew', 'Garfield', 
'Although born in Los Angeles, Andrew Garfield grew up in 
England; his mother is English and they moved back there 
when he was three years old. He went to a private school, 
the City of London Freemen School, and began acting in 
youth theatre productions while he was still at school. At 
19, he went to the Central School of Speech and Drama.');
INSERT INTO Actors values ('F', 'Emma', 'Stone', 
'Stone began acting as a child as a member of the Valley 
Youth Theatre in Phoenix, Arizona, where she made her stage 
debut in a production of Kenneth Grahames The Wind in the 
Willows. She appeared in many more productions through her 
early teens until, at the age of 15, she decided that she 
wanted to make acting her career.');
INSERT INTO Movie_Cast VALUES (1,1);
INSERT INTO Movie_Cast VALUES (1,2);
/* Superbad */
INSERT INTO Directors VALUES ('Greg Motolla');
INSERT INTO Movies VALUES (2, 2007, 'Superbad',
'Two co-dependent high school seniors are forced to deal 
with separation anxiety after their plan to stage a 
booze-soaked party goes awry.',
2);
INSERT INTO Actors values ('M', 'Michael', 'Cera', 
'Canadian actor Michael Cera is the middle child of a 
Canadian mother and Italian father, both of whom worked for 
Xerox. He has two sisters. He was educated at Conestoga 
Public School, Robert H. Lagerquist Senior Public School 
and Heart Lake Secondary School until the ninth grade. Cera 
then completed his high school education via 
correspondence.');
INSERT INTO Actors values ('M', 'Jonah', 'Hill', 
'Hill grew up in Los Angeles, the son of a tour accountant 
for Guns N Roses. He graduated from Crossroads School in 
Santa Monica and went on to The New School in New York to 
study drama.')
INSERT INTO Actors values ('M', 'Christopher', 
'Mintz-Plasse',
'Attended El Camino Real High School from 2003 to 2007. 
Because he was only 17 at the time of filming Superbad 
(2007), his mother was required to be on set during the 
filming of his sex scene.');
INSERT INTO Movie_Cast VALUES (2,3);
INSERT INTO Movie_Cast VALUES (2,4);
INSERT INTO Movie_Cast VALUES (2,5);
/* Gone with the wind */
INSERT INTO Directors VALUES ('Victor Fleming');
INSERT INTO Movies VALUES (4, 1939, 'Gone with the 
Wind',
'American classic in which a manipulative woman and a 
roguish man carry on a turbulent love affair in the 
American south during the Civil War and Reconstruction.',
3);
INSERT INTO Actors values ('M', 'Clark', 'Gable', 
'Clark Gables mother died when he was seven months old. At 
16 he quit high school, went to work in an Akron Ohio tire 
factory and decided to become an actor after seeing the 
play The Bird of Paradise.');
INSERT INTO Actors values ('F', 'Vivien', 'Leigh', 
'If a film were made of the life of Vivien Leigh, it would 
open in India just before World War I, where a successful 
British businessman could live like a prince. In the 
mountains above Calcutta, a little princess is born. 
Because of the outbreak of World War I, she is six years 
old the first time her parents take her to England.');
INSERT INTO Actors values ('M', 'Thomas', 'Mitchell',
'Thomas Mitchell was one of the great American character 
actors, whose credits read like a list of the greatest 
films of the 20th century');
INSERT INTO Movie_Cast VALUES (3,6);
INSERT INTO Movie_Cast VALUES (3,7);
INSERT INTO Movie_Cast VALUES (3,8);

/* Fahrenheit 9/11 */
INSERT INTO Directors VALUES ('Michael Moore');
INSERT INTO Movies VALUES (3, 2004, 'Fahrenheit 
9/11',
'Michael Moores view on what happened to the United States 
after September 11; and how the Bush Administration 
allegedly used the tragic event to push forward its agenda 
for unjust wars in Afghanistan and Iraq.',
4);
INSERT INTO Actors values ('M', 'Michael', 'Moore', 
'Michael Moore was born in Flint, Michigan April 23, 1954, 
but was not raised there. Contrary to popular belief, he 
was actually raised in Davison, Michigan. He studied 
journalism at the University of Michigan-Flint, and also 
pursued other hobbies such as gun shooting, for which he 
even won a competition.');
INSERT INTO Actors values ('M', 'George', 'Bush', 
'The 43rd President of the United States of America, George 
Walker Bush was born two days after the national holiday of 
the Fourth of July, 1946 in New Haven, Connecticut where 
his father was attending Yale College in the Class of 
1949.');
INSERT INTO Actors values ('M', 'Ben', 'Affleck',
'Benjamin Geza Affleck was born on August 15, 1972 in 
Berkeley, California, USA but raised in Cambridge, 
Massachusetts, USA. He was born to parents Tim Affleck, a 
social worker, who is now divorced from Bens mother Chris 
Affleck, a school teacher.');
INSERT INTO Movie_Cast VALUES (4,9);
INSERT INTO Movie_Cast VALUES (4,10);
INSERT INTO Movie_Cast VALUES (4,11);
/* Good Will Hunting */
INSERT INTO Directors VALUES ('Gus Van Sant');
INSERT INTO Movies VALUES (4, 1997, 'Good Will 
Hunting',
'Will Hunting, a janitor at MIT, has a gift for mathematics 
but needs help from a psychologist to find direction in his 
life.',
5);
INSERT INTO Actors values ('M', 'Robin', 'Williams', 
'Williams briefly studied political science before 
enrolling at Juilliard to study theatre. After he left 
Juilliard, he performed in night clubs where he was 
discovered for the role of Mork on an episode of Happy Days 
in 1974 and the subsequent Mork & Mindy TV series in 
1978.');
INSERT INTO Actors values ('M', 'Matt', 'Damon', 
'Matt Damon was born in 1970. His father, Kent Damon, a tax 
preparer, and his mother, Nancy Carlsson-Paige, a college 
professor, are now divorced.');
INSERT INTO Movie_Cast VALUES (5,12);
INSERT INTO Movie_Cast VALUES (5,13);
INSERT INTO Movie_Cast VALUES (5,11);

/* Insert data for table Transaction_Types */ 
INSERT INTO Transaction_Types VALUES ('Payment');
INSERT INTO Transaction_Types VALUES ('Refund');

/* Insert data for table Payment_Methods */ 
INSERT INTO Payment_Methods VALUES ('Credit Card');
INSERT INTO Payment_Methods VALUES ('PayPal');

/* Insert data for table Accounts */ 
INSERT INTO Accounts (customer_id, payment_method_code, account_name) VALUES (2, 1, 'Smith Account');
INSERT INTO Accounts (customer_id, payment_method_code, account_name) VALUES (3, 2, 'Jones Account');
INSERT INTO Accounts (customer_id, payment_method_code, account_name) VALUES (4, 1, 'Ryder Account');
INSERT INTO Accounts (customer_id, payment_method_code, account_name) VALUES (5, 2, 'Walker Account');
INSERT INTO Accounts (customer_id, payment_method_code, account_name) VALUES (6, 2, 'Murphy Account');

/* Insert data for tables Rental_Periods */
INSERT INTO Rental_Periods VALUES (1.99, '1 day');
INSERT INTO Rental_Periods VALUES (2.99, '2 days');
INSERT INTO Rental_Periods VALUES (4.99, '1 week');

/* Insert data for table Customer_Rentals */ 
INSERT INTO Customer_Rentals (customer_id, movie_id, rental_period_code) VALUES (1, 2, 2);
INSERT INTO Customer_Rentals (customer_id, movie_id, rental_period_code) VALUES (2, 1, 1);
INSERT INTO Customer_Rentals (customer_id, movie_id, rental_period_code) VALUES (3, 3, 3);

/* Insert data for table Customer_Sales */ 
INSERT INTO Customer_Sales (customer_id, movie_id, sale_price) VALUES (4, 4, 15.99);
INSERT INTO Customer_Sales (customer_id, movie_id, sale_price) VALUES (5, 5, 12.99);

/* Insert data for table Financial_Transactions */ 
INSERT INTO Financial_Transactions (account_id, item_rental_id, transaction_type_code, transaction_date, transaction_amount) VALUES (1, 1, 1, '7/2/2012', 2.99);
INSERT INTO Financial_Transactions (account_id, item_rental_id, transaction_type_code, transaction_date, transaction_amount) VALUES (2, 2, 1, '7/10/2012', 1.99);
INSERT INTO Financial_Transactions (account_id, item_rental_id, transaction_type_code, transaction_date, transaction_amount) VALUES (3, 3, 1, '6/2/2012', 4.99);
INSERT INTO Financial_Transactions (account_id, item_sale_id, transaction_type_code, transaction_date, transaction_amount) VALUES (4, 1, 1, '5/10/2012', 15.99);
INSERT INTO Financial_Transactions (account_id, item_sale_id, transaction_type_code, transaction_date, transaction_amount) VALUES (4, 2, 2, '6/30/2012', 15.99);

Calling Data
/* Calling Yearly Revenue */
SELECT SUM(transaction_amount) FROM Financial_Transactions WHERE transaction_date BETWEEN '2012-01-01' AND '2012-12-31'

/* Top Rated Movies */
SELECT TOP 5 movie_title FROM Movies, Movie_Ratings WHERE Movie_Ratings.movie_id=Movies.movie_id GROUP BY movie_title ORDER BY AVG(rating_value) DESC

/* Top Genres */
SELECT TOP 5 genre_description FROM Movies, Movie_Ratings, Genre_Codes WHERE Movie_Ratings.movie_id=Movies.movie_id AND genre_code=genre_type_code GROUP BY genre_description ORDER BY AVG(rating_value) DESC

/* Top 5 States by Sales */
SELECT TOP 5 customer_state FROM Financial_Transactions, Customers, Accounts WHERE Accounts.account_id=Financial_Transactions.account_id AND Accounts.customer_id=Customers.customer_id GROUP BY customer_state ORDER BY AVG(transaction_amount) DESC

/* Distribution of Sales: Member vs Non-Member */
SELECT COUNT(transaction_amount) as NumberOfTransactions FROM Financial_Transactions, Customers, Accounts WHERE Accounts.account_id=Financial_Transactions.account_id AND Accounts.customer_id=Customers.customer_id GROUP BY member_yn
