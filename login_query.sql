use sikshalaya
SELECT user_id, username, role 
FROM Users 
WHERE username = '' 
  AND password = SHA2('', 256) 
  AND role = 'Admin';

SELECT user_id, username, role 
FROM Users 
WHERE username = '' 
  AND password = SHA2('', 256) 
  AND role = 'Teacher';

SELECT user_id, username, role 
FROM Users 
WHERE username = '' 
  AND password = SHA2('', 256) 
  AND role = 'Student';

SELECT user_id, username, role 
FROM Users 
WHERE username = '' 
  AND password = SHA2('', 256) 
  AND role = 'Guard';
