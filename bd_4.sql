--задание 1
SELECT 
    date,
    amount,
    SUM(amount) OVER (ORDER BY date) AS cumulative_sum
FROM transactions
ORDER BY date;
--задание 2
SELECT 
    id,
    category,
    price,
    price - AVG(price) OVER (PARTITION BY category) AS price_deviation
FROM products;
--задание 3
SELECT 
    log_time,
    temperature,
    AVG(temperature) OVER (ORDER BY log_time ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3
FROM temperature_logs;
--задание 4
SELECT 
    task_id,
    project_id,
    start_date,
    FIRST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date) AS first_task_start,
    LAST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_task_start
FROM project_tasks;