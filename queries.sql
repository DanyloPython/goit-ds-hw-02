

SELECT * 
FROM tasks
WHERE user_id = <USER_ID>;


SELECT * 
FROM tasks
WHERE status_id = (SELECT id FROM status WHERE name = 'new');


UPDATE tasks
SET status_id = (SELECT id FROM status WHERE name = 'in progress')
WHERE id = <TASK_ID>;


SELECT * 
FROM users
WHERE id NOT IN (SELECT user_id FROM tasks);


INSERT INTO tasks (title, description, status_id, user_id)
VALUES ('New Task', 'Task description', (SELECT id FROM status WHERE name = 'new'), <USER_ID>);


SELECT * 
FROM tasks
WHERE status_id != (SELECT id FROM status WHERE name = 'completed');


DELETE FROM tasks
WHERE id = <TASK_ID>;


SELECT * 
FROM users
WHERE email LIKE '%@example.com';


UPDATE users
SET fullname = 'New Name'
WHERE id = <USER_ID>;


SELECT status.name, COUNT(tasks.id) AS task_count
FROM status
LEFT JOIN tasks ON status.id = tasks.status_id
GROUP BY status.name;


SELECT tasks.*
FROM tasks
JOIN users ON tasks.user_id = users.id
WHERE users.email LIKE '%@example.com';


SELECT * 
FROM tasks
WHERE description IS NULL OR description = '';


SELECT users.fullname, tasks.*
FROM users
JOIN tasks ON users.id = tasks.user_id
WHERE tasks.status_id = (SELECT id FROM status WHERE name = 'in progress');


SELECT users.fullname, COUNT(tasks.id) AS task_count
FROM users
LEFT JOIN tasks ON users.id = tasks.user_id
GROUP BY users.fullname;
