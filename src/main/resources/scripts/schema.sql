CREATE SCHEMA IF NOT EXISTS db_kpac DEFAULT CHARACTER SET utf8mb4;
USE db_kpac;

DROP TABLE IF EXISTS kpac;
DROP TABLE IF EXISTS kpacset;
DROP TABLE IF EXISTS kpac_kpacset;

CREATE TABLE kpac (
id INT NOT NULL AUTO_INCREMENT,
create_date VARCHAR(10),
description VARCHAR(250),
title VARCHAR(2000),
PRIMARY KEY (id)
);

CREATE TABLE kpacset (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(250),
PRIMARY KEY (id)
);

CREATE TABLE kpac_kpacset (
kpac_id INT NOT NULL,
kpacset_id INT NOT NULL,
PRIMARY KEY (kpac_id, kpacset_id),
foreign key (kpacset_id) references kpacset (id) ON DELETE CASCADE,
foreign key (kpac_id) references kpac (id) ON DELETE CASCADE
);