-- c�u 1:
SELECT * FROM `users` ORDER BY `user_name` ASC;

-- c�u 2:
SELECT * FROM `users` ORDER BY `user_id` ASC LIMIT 3;


--c�u 3:
SELECT * FROM `users` WHERE  `user_name` LIKE "%a%" ORDER BY `user_name` ASC;

-- c�u 4:
SELECT * FROM `users` WHERE  `user_name` LIKE "%m";

-- c�u 5:
SELECT * FROM `users` WHERE  `user_name` LIKE "%i";

-- c�u 6:
SELECT * FROM `users` WHERE  `user_email` LIKE "%gmail%";

-- c�u 7:
SELECT * FROM `users` WHERE  `user_email` LIKE "%gmail%" AND `user_email` LIKE "m%";

-- c�u 8:
SELECT * FROM `users` WHERE  `user_email` LIKE "%gmail%" AND `user_name` LIKE "%i%" AND LENGHT(`user_name`) > 5;

-- c�u 9:
SELECT * 
FROM `users`
WHERE  `user_name` LIKE "%a%" 
AND LENGHT(`user_name`)BETWEEN 5 AND 9
AND `user_email` LIKE '%@gmail.com'
AND `user_email` LIKE '%I%';

-- c�u 10:
SELECT * 
FROM `users` 
WHERE  (`user_name` LIKE "%a%" AND LENGHT(`user_name`)BETWEEN 5 AND 9)
OR 
(`user_name` LIKE "%i%" AND LENGHT(`user_name`) < 9)
OR 
(`user_email` LIKE '%@gmail.com' AND `user_email` LIKE '%i%');