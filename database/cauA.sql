-- câu 1:
SELECT * FROM `users` ORDER BY `user_name` ASC;

-- câu 2:
SELECT * FROM `users` ORDER BY `user_id` ASC LIMIT 3;


--câu 3:
SELECT * FROM `users` WHERE  `user_name` LIKE "%a%" ORDER BY `user_name` ASC;

-- câu 4:
SELECT * FROM `users` WHERE  `user_name` LIKE "%m";

-- câu 5:
SELECT * FROM `users` WHERE  `user_name` LIKE "%i";

-- câu 6:
SELECT * FROM `users` WHERE  `user_email` LIKE "%gmail%";

-- câu 7:
SELECT * FROM `users` WHERE  `user_email` LIKE "%gmail%" AND `user_email` LIKE "m%";

-- câu 8:
SELECT * FROM `users` WHERE  `user_email` LIKE "%gmail%" AND `user_name` LIKE "%i%" AND LENGHT(`user_name`) > 5;

-- câu 9:
SELECT * 
FROM `users`
WHERE  `user_name` LIKE "%a%" 
AND LENGHT(`user_name`)BETWEEN 5 AND 9
AND `user_email` LIKE '%@gmail.com'
AND `user_email` LIKE '%I%';

-- câu 10:
SELECT * 
FROM `users` 
WHERE  (`user_name` LIKE "%a%" AND LENGHT(`user_name`)BETWEEN 5 AND 9)
OR 
(`user_name` LIKE "%i%" AND LENGHT(`user_name`) < 9)
OR 
(`user_email` LIKE '%@gmail.com' AND `user_email` LIKE '%i%');