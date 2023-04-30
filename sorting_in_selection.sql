-- В базе существует таблица employee, которая хранит данные о сотрудниках. 
-- У данной таблицы следующий атрибутивный состав:

-- id - идентификатор сотрудника
-- name - имя сотрудника
-- lastname - фамилия сотрудника
-- age - возраст сотрудника
-- salary - зарплата сотрудника
-- gender - пол сотрудника 


-- Сформируйте выборку из всех мужчин. Выведите имя и фамилию.

select 
    name, 
    lastname 
from employee
where gender = 'm';


-- Сформируйте выборку из сотрудников, у которых зарплата больше 130 000. Выведите имя и зарплату.

select
    name,
    salary
from employee
where salary > 130000;


-- Сформируйте выборку из сотрудников, у которых предпоследняя буква в имени "l". Выведите только имя.

select
    name
from employee
where name like '%l_';