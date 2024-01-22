--Завдання №3 - знайти працівника з найбільшою заробітною платою
SELECT name,salary
FROM worker
WHERE salary = (SELECT MAX(salary) FROM worker)

--Завдання №4 - знайти клієнта з найбільшою кількістю проєктів
SELECT client.name, COUNT(client_id)
FROM project
INNER JOIN client
ON project.client_id=client.id
where client.id IN(
SELECT COUNT(project.id)
FROM project
GROUP BY client_id
ORDER BY COUNT(client_id)
LIMIT 1
)

--Завдання №5 - знайти проєкт з найбільшою тривалістю
SELECT 'Project' || CHR(65 + (project.ID - 1)) AS NAME, DATEDIFF(day,project.START_DATE,project.FINISH_DATE) AS MONTH_COUNT
FROM project
ORDER BY MONTH_COUNT DESC
LIMIT 2

--Завдання №6 - знайти найстаршого та наймолодшого працівника
SELECT 'YOUNGEST' AS TYPE,name, birthday
FROM worker
WHERE birthday = (SELECT MIN(birthday) FROM worker)
UNION
SELECT 'ELDEST' AS TYPE,NAME, birthday
FROM worker
WHERE birthday = (SELECT MAX(birthday) FROM worker)
ORDER BY name

--Завдання №7 - вивести вартість кожного проєкту
SELECT project_id AS name, SUM(worker.salary) *
(SELECT ((DATE_PART('year', finish_date::date)-DATE_PART('year', start_date::date))*12 +	
DATE_PART('month', finish_date::date)-DATE_PART('month', start_date::date))
FROM project
WHERE project.id = project_id) AS PRICE		
FROM project_worker
LEFT JOIN worker ON project_worker.worker_id = worker.id
GROUP BY project_id
ORDER BY price DESC
