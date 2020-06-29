INSERT INTO users(firstName,lastName,username,password, phoneNumber,address, city,email, bd ,age,data_startInCompany, typeWork, action)
VALUE ('Georgi', 'Chakarov', 'GChakarov', '', '+359879689408', 'Perusha4','Pravec','work@project-uktc.eu','2000.02.12',17,'2018.02.20', 'boss', 'offline');

SELECT 
    *
FROM
    users;

    
SELECT 
    firstName
FROM
    users
WHERE
    username LIKE 'GChakarov'
        AND password LIKE '';