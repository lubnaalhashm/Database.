create database Library_Management_System;
use Library_Management_System;

create table Author (
    Author_name varchar(50) primary key,
    Author_nationality varchar(50)
);

create table Book (
    Book_id varchar(10) primary key,
    Book_title varchar(50) not null,
    Author_name varchar(50), 
    foreign key (Author_name) references author(Author_name) 
	on delete cascade
	on update cascade,
);

create table Member (
    borrow_id int primary key,
    member_name varchar(10) not null,
    member_phone varchar(15) not null,
    borrow_date date not null
);

create table transactions  (
    borrow_id int, 
    book_id varchar(10), 
    return_date date not null,
    fine_amount decimal(5, 2),
    primary key (borrow_id, book_id),
    foreign key (borrow_id) references Member(borrow_id) 
	on delete cascade
	on update cascade,
    foreign key (book_id) references book(book_id) 
	on delete cascade
	on update cascade
);

insert into author (author_name, author_nationality) 
values 
('ramez', 'usa'),
('joel', 'usa'),
('mark', 'uk');
select * from author;

insert into book (book_id, book_title, author_name) values 
('b101', 'database systems', 'ramez'),
('b205', 'data science', 'joel'),
('b305', 'python basics', 'mark');
select * from book;

insert into Member (borrow_id, member_name, member_phone, borrow_date) values 
('201', 'ali', '9876543210', '2025-01-10'),
('202', 'fatima', '9871234560', '2025-01-12');
select * from Member;


insert into transactions (borrow_id, book_id, return_date, fine_amount) 
values 
(201, 'b101', '2025-01-20', 0),
(202, 'b205', '2025-01-25', 5),
(201, 'b305', '2025-01-22', 2);
select * from transactions;