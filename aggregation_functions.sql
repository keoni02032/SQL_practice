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

-- Напишите запрос, который выводит количество онлайн и прямых заказов.
-- Выборка должна содержать в себе поля order_type и orders_count (количество заказов).

select distinct
    order_type,
    count(order_type) as orders_count
from orders
where order_type like 'online'
group by order_type
union
select distinct
    order_type,
    count(order_type) as orders_count
from orders
where order_type like 'direct'
group by order_type;


-- Напишите запрос, который выводит всех клиентов и количество заказов у каждого клиента.
-- Выборка должна содержать в себе поля customer_id, orders_count (количество заказов).

select
    t2.id as customer_id,
    
    case 
        when t1.customer_id is null
            then 0
        else count(t1.customer_id)
    end orders_count
from orders t1
right join customers t2
on t1.customer_id = t2.id
group by t2.id;


-- Напишите запрос, который выводит всех клиентов и общую сумму их заказов. 
-- Выборка должна содержать в себе поля customer_id, total_sum (общая сумма всех заказов).
-- Если у клиента нет заказов, то в поле total_sum должно быть 0.

select
    t3.id as customer_id,
    case 
        when sum(t2.price * t1.product_count) is null
            then 0.00
        else sum(t2.price * t1.product_count)
    end total_sum
from orders t1
inner join products t2 on t1.product_id = t2.id
right join customers t3 on t3.id = t1.customer_id
group by t3.id;
