START TRANSACTION;
USE db_kpac;
INSERT INTO kpac (create_date, description, title) VALUES ('11-02-2022', 'description_1', 'title_1');
INSERT INTO kpac (create_date, description, title) VALUES ('11-02-2022', 'description_2', 'title_2');
INSERT INTO kpac (create_date, description, title) VALUES ('11-02-2022', 'description_3', 'title_3');
INSERT INTO kpac (create_date, description, title) VALUES ('11-02-2022', 'description_4', 'title_4');
INSERT INTO kpac (create_date, description, title) VALUES ('11-02-2022', 'description_5', 'title_5');
COMMIT;

START TRANSACTION;
USE db_kpac;
INSERT INTO kpacset (title) VALUES ('Title_set_1');
INSERT INTO kpacset (title) VALUES ('Title_set_2');
INSERT INTO kpacset (title) VALUES ('Title_set_3');

COMMIT;

START TRANSACTION;
USE db_kpac;
INSERT INTO kpac_kpacset (kpac_id, kpacset_id) VALUES (1, 1);
INSERT INTO kpac_kpacset (kpac_id, kpacset_id) VALUES (2, 2);
INSERT INTO kpac_kpacset (kpac_id, kpacset_id) VALUES (3, 3);
INSERT INTO kpac_kpacset (kpac_id, kpacset_id) VALUES (4, 1);
INSERT INTO kpac_kpacset (kpac_id, kpacset_id) VALUES (5, 2);

COMMIT;