USE system_money;

insert into user(username, pass, money)
values ("Georgi","", 0.00),
	   ("Velizar","", 0.00),
       ("Radoslav", "", 0.00);

insert into transaction(userTransaction_id_send , userTransaction_id_this, transaction_value, argument, type)
value (1, 2, 20.00, "test", "GET");

insert into transaction(userTransaction_id_send , userTransaction_id_this, transaction_value, argument, type)
value ((SELECT id FROM user WHERE username like 'Radoslav'), 3, 20.00, "test", "GET");


select * from transaction;

SELECT 
    *
FROM
    user;
   
   
SELECT 
    *
FROM
    user
WHERE
    username NOT LIKE 'Georgi';



SELECT 
    username, transaction_value, argument
FROM
    transaction
        JOIN
    user ON transaction.userTransaction_id_send = user.id
WHERE
    userTransaction_id_this IN (SELECT 
            id
        FROM
            user
        WHERE
            username LIKE 'Velizar'); /*SENDER -> THIS*/

    