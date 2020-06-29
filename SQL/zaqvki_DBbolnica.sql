SELECT * FROM pacients;

SELECT name, numberRoom FROM ora right JOIN  stai ON roomID = stai.id WHERE EGN like '5353263';

SELECT ZC FROM pacients INNER JOIN ZC ON idZC = ZC.id WHERE EGN like '0000000000';
SELECT fname, lname, EGN, ZC FROM pacients INNER JOIN ZC on idZC=ZC.id ;




SELECT * FROM virus;


avtiveVirus(activeVirus.id    id_virus, singtom)
virus(virus.id     id_lekarstvo, name_virus, singtom )
virus (virus.id  name_virus, singtom, id_lekarstvo)

id_virus from activeVirus where singtom like 'singtom'
name_virus from virus where id_virus = id.virus 

SELECT *FROM activeVirus ;


SELECT name_virus FROM activeVirus INNER JOIN virus ON id_virus = virus.id WHERE singtom like 'glavobol, gadene, bolkiVkorema';

SELECT fname FROM pacients WHERE EGN like '0000000000';
SELECT pacients.id , ZC FROM pacients INNER JOIN ZC ON idZC = ZC.id WHERE EGN like '0000000000';

UPDATE virus SET type='korem' WHERE virus.id=1;

SELECT type FROM virus WHERE name_virus like 'nora';
SELECT doctors.id FROM doctors WHERE type like 'korem';
SELECT * FROM doctors WHERE doctors.id = '2';
SELECT * FROM virus;





SELECT doctors.id FROM doctors where type in (SELECT type FROM virus where name_virus like 'nora')