DROP DATABASE IF EXISTS fftp_system;
CREATE DATABASE fftp_system;
/*CREATE DATABASE IF NOT EXISTS fftp_system;*/
USE fftp_system;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    data_startInCompany DATE NOT NULL,
    typeWork VARCHAR(255) NOT NULL,
    action ENUM('active', 'offline', 'recently')
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    data_post DATE NOT NULL,
    content TEXT NOT NULL,
    id_poster INT,
    group_id INT,
    CONSTRAINT FOREIGN KEY (id_poster)
        REFERENCES users (id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_post DATE NOT NULL,
    content TEXT NOT NULL,
    id_post INT,
    id_poster INT,
    CONSTRAINT FOREIGN KEY (id_poster)
        REFERENCES users (id),
    CONSTRAINT FOREIGN KEY (id_post)
        REFERENCES posts (id)
);

CREATE TABLE groups_project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    data_start DATE NOT NULL,
    data_finish DATE NOT NULL,
    id_manager INT NOT NULL,
    CONSTRAINT FOREIGN KEY (id_manager)
        REFERENCES users (id)
);

CREATE TABLE user_group (
    id_user INT,
    id_group INT,
    CONSTRAINT FOREIGN KEY (id_user)
        REFERENCES users (id),
    CONSTRAINT FOREIGN KEY (id_group)
        REFERENCES groups_project (id)
);

CREATE TABLE message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    data_send DATE,
    id_user_sender INT,
    id_user_receiver INT,
    CONSTRAINT FOREIGN KEY (id_user_sender)
        REFERENCES users (id),
    CONSTRAINT FOREIGN KEY (id_user_receiver)
        REFERENCES users (id)
);

CREATE TABLE block_list (
    id_user INT,
    id_user_block INT,
    CONSTRAINT FOREIGN KEY (id_user)
        REFERENCES users (id),
    CONSTRAINT FOREIGN KEY (id_user_block)
        REFERENCES users (id)
);

CREATE TABLE point_map (
    id INT AUTO_INCREMENT PRIMARY KEY,
    coox DOUBLE NOT NULL,
    cooy DOUBLE NOT NULL,
    coot DATE NOT NULL,
    ip VARCHAR(12),
    id_users INT,
    CONSTRAINT FOREIGN KEY (id_users)
        REFERENCES users (id)
);
