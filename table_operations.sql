-- Напишите запрос, который создаст таблицу product с полями
-- id - целое число
-- title - строка с длинной 128
-- price - целое число

create table product(
    id integer primary key,
    title varchar(128),
    price integer
);


-- Напишите запрос, который создаст таблицу product с описанными ниже полями. Обратите внимание на ограничения (constraints).

-- id - целое число (первичный ключ)
-- title - строка с длинной 128 (не null)
-- price - целое число (больше либо равно нулю, ноль по умолчанию).

create table product(
    id integer primary key,
    title varchar(128) not null,
    price integer check(price >= 0) default 0
);


-- В базе существует таблица product с полями:

-- id - целове число (первичный ключ)
-- title - строка с длинной 128 (не null)
-- price - целое число (больше либо равно нулю, ноль по умолчанию).

-- Напишите SQL скрипт, который добавляет 5 записей с продуктами (данные произвольные).

insert into product(title, price) value('asd', 2);
insert into product(title, price) value('df', 0);
insert into product(title, price) value('sad', 1);
insert into product(title, price) value('rty', 3);
insert into product(title, price) value('dsf', 1);
