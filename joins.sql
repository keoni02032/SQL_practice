-- Существует база со следующими таблицами и полями

-- customers
--     id       - идентификатор покупателя
--     name     - имя покупателя
--     lastname - фамилия покупателя
--     gender   - пол покупателя
--     age      - возраст покупателя

-- orders
--     id - идентификатор заказа 
--     customer_id - идентификатор покупателя
--     product_id  - идентификатор продукта
--     order_type  - тип заказа (online или direct)
--     product_count - кол-во единиц продукта в заказе

-- products
--     id    - идентификатор продукта
--     title - наименование продукта
--     price - цена продукта

 

-- Написать запрос, который выведет покупателей, сделавших заказ.
-- Выборка должна содержать в себе поля name и lastname 


select distinct
    t1.name,
    t1.lastname
from customers t1
inner join orders t2
on t1.id = t2.customer_id;


-- Написать запрос, который выведет наименования продуктов, которые хоть раз были заказаны женщиной. Выборка должна содержать только поле title.

select
    t1.title
from products t1
inner join (
    select
        t1.id,
        t1.product_id,
        t1.product_count
    from orders t1
    inner join customers t2
    on t1.customer_id = t2.id
    where t2.gender like 'f' and t1.product_count >= 1
) t2
on t1.id = t2.product_id;


-- Найти продукты, которые ни разу не заказывали. Выведите наименование этих продуктов.

select distinct
    t1.title
from products t1
left join orders t2
    on t1.id = t2.product_id
where t2.product_count is null;



-- В базе есть таблица employee, которая содержит данные о сотрудниках, а так же tasks с данными о задачах.
-- Структура таблиц следующая:

-- employee

-- id - идентификатор сотрудника
-- name - имя сотрудника
-- lastname - фамилия сотрудника
-- salary - зарплата сотрудника
-- manager_id - идентификатор менеджера сотрудника

-- tasks

-- id - идентификатор задачи
-- title - наименование задачи
-- employee_id - идентификатор сотрудника, который назначен исполнителем
-- done_flg - флаг выполнения задачи (1 - задача выполнена, 0 - задача не выполнена)


-- Сформируйте выборку, которая содержит в себе имя и фамилию сотрудника, а так же наименование задачи.

select
    t1.name,
    t1.lastname,
    t2.title
from employee t1
inner join tasks t2 on t1.id = t2.employee_id;
    

-- Сформируйте выборку, которая содержит имена и фамилии сотрудников, у которых нет задач.

select
    t1.name,
    t1.lastname
from employee t1
left join tasks t2 on t1.id = t2.employee_id
where t2.employee_id is null;