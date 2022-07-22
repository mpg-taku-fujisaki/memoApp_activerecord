drop table if exists memos;

create table memos(
    title text,
    content text
);

insert into memos values('1st memo', 'Hello');
insert into memos(title, content) values('2nd memo', 'Helloooooo World');

