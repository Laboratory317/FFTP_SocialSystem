
DROP DATABASE IF EXISTS system_money;
/*CREATE DATABASE IF NOT EXISTS system_money;*/
CREATE DATABASE system_money;
USE system_money;


CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL,
    money DOUBLE NOT NULL
);

CREATE TABLE transaction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userTransaction_id_send INT NOT NULL,
    userTransaction_id_this INT NOT NULL,
    transaction_value DOUBLE NOT NULL,
    argument VARCHAR(255) NOT NULL,
    type ENUM('GET', 'SET'),
    CONSTRAINT FOREIGN KEY (userTransaction_id_send)
        REFERENCES user (id),
    CONSTRAINT FOREIGN KEY (userTransaction_id_this)
        REFERENCES user (id)
);
