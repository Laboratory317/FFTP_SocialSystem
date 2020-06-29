DROP DATABASE IF EXISTS javadb;
CREATE database javadb;
USE javadb;


/* PACIENTI */

CREATE TABLE pacients (
    id INT AUTO_INCREMENT PRIMARY KEY,
	fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    EGN VARCHAR(10) UNIQUE NOT NULL,
    idZC INT unique NOT NULL,
    sex ENUM('F','M') NOT NUll
);

CREATE TABLE ZC (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ZC TEXT NOT NULL
);




/*  VIRUS AND LEKARSTVA */

CREATE TABLE activeVirus (
	id INT auto_increment PRIMARY KEY,
    singtom VARCHAR(255) NOT NULL,
    id_virus INT NOT NULL
);

CREATE TABLE virus (
   id INT auto_increment primary key,
   name_virus VARCHAR(255) NOT NULL,
   singtom VARCHAR(255) NOT NULL,
   id_lekarstvo INT NOT NULL,
   //type VARCHAR(100) NOT NULL
);

CREATE TABLE lekarstva (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name_lek VARCHAR(255) NOT NULL,
  oputvane VARCHAR(255) NOT NULL,
  id_virus INT NOT NULL
);



/* DOCTORS */

CREATE TABLE doctors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL,
    title VARCHAR(5) NOT NULL,
    type  VARCHAR(20) NOT NULL,
    
    startWork TIME NOT NULL,
    stopWork TIME NOT NULL
);

CREATE TABLE pacients_bolnica (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_pacient INT NOT NULL,
    status ENUM('NEW','IN','FINISH') NOT NULL,
    id_doktor INT 
);



INSERT INTO pacients(fname, lname, city, address, EGN, idZC, sex)
VALUE ('Georgi', 'Chakarov', 'Ihtiman', 'str....', '0052020000', 1, 'M'),
       ('Velizar', 'Kunov', 'Belene', 'str....', '0001250000', 2, 'M'),
       ('Bilyana', 'Borisova', 'Botevgard', 'str....', '0000000000', 4, 'F'),
       ('Radoslav', 'Totev', 'Sofia', 'str....', '0052560000', 3, 'M');
       
INSERT INTO ZC(ZC)
VALUE ('ZC_V0.1'),
('ZC_V0.1'),
('ZC_V0.1'),
('ZC_V0.1 Boli me glavata');

INSERT INTO virus (name_virus, singtom, id_lekarstvo)
VALUE ('nora','glavobol, gadene, bolkiVkorema, raztroistvo', 1);

INSERT INTO lekarstva (name_lek, oputvane, id_virus)
VALUE ('lekNoraspirin','predi_da_hodite_na_stol_Prochetete_oputvaneto','1');


INSERT INTO doctors (fname, lname, title, type, startWork, stopWork)
VALUE ('Ivan','Vankov','dr','ushi-nos-gurlo', '07:00', '20:00'),
		('Ivan', 'Ivanov', 'dc', 'korem' , '08:00', '20:00'),
        ('Pesho', 'Peshov', 'dr', 'glava', '07:00', '20:00'),
        ('Stanislav', 'Stanislavov', 'dr', 'konsyltant', '07:00', '18:30')
        ;
  
  ALTER TABLE 'virus' ADD 'type' VARCHAR(100) NOT NULL AFTER 'id_lekarstvo';
