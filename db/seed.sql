drop table if exists memos;

create table memos(
    id int NOT_NULL IDENTITY(1,1), 
    title text NOT_UNIQUE,
    content text NOT_UNIQUE,
    PRIMARY KEY (id)
);

insert into memos values('1', '1st memo', 'Hello');
insert into memos(id, title, content) values('2', '2nd memo', 'Helloooooo World');

