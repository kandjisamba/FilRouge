-- Doctrine Migration File Generated on 2020-01-23 10:49:55

-- Version 20200110120251
CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, profil_id INT DEFAULT NULL, username VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, nom_complet VARCHAR(255) NOT NULL, is_active TINYINT(1) NOT NULL, UNIQUE INDEX UNIQ_8D93D649F85E0677 (username), INDEX IDX_8D93D649275ED078 (profil_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE role (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE user ADD CONSTRAINT FK_8D93D649275ED078 FOREIGN KEY (profil_id) REFERENCES role (id);
INSERT INTO migration_versions (version, executed_at) VALUES ('20200110120251', CURRENT_TIMESTAMP);

-- Version 20200117120252
CREATE TABLE compte (id INT AUTO_INCREMENT NOT NULL, users_id INT NOT NULL, numero VARCHAR(255) NOT NULL, solde INT NOT NULL, datecreation DATETIME NOT NULL, UNIQUE INDEX UNIQ_CFF6526067B3B43D (users_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE compte ADD CONSTRAINT FK_CFF6526067B3B43D FOREIGN KEY (users_id) REFERENCES user (id);
INSERT INTO migration_versions (version, executed_at) VALUES ('20200117120252', CURRENT_TIMESTAMP);

-- Version 20200117131539
CREATE TABLE compte (id INT AUTO_INCREMENT NOT NULL, usercreate_id INT NOT NULL, numero VARCHAR(255) NOT NULL, solde INT NOT NULL, datecreate DATETIME NOT NULL, INDEX IDX_CFF6526020537CE3 (usercreate_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE compte ADD CONSTRAINT FK_CFF6526020537CE3 FOREIGN KEY (usercreate_id) REFERENCES user (id);
INSERT INTO migration_versions (version, executed_at) VALUES ('20200117131539', CURRENT_TIMESTAMP);

-- Version 20200120124546
CREATE TABLE partenaire (id INT AUTO_INCREMENT NOT NULL, ninea VARCHAR(255) NOT NULL, register VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120124546', CURRENT_TIMESTAMP);

-- Version 20200120133150
ALTER TABLE compte ADD user_id INT NOT NULL;
ALTER TABLE compte ADD CONSTRAINT FK_CFF65260A76ED395 FOREIGN KEY (user_id) REFERENCES user (id);
CREATE INDEX IDX_CFF65260A76ED395 ON compte (user_id);
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120133150', CURRENT_TIMESTAMP);

-- Version 20200120133731
ALTER TABLE compte ADD user_id INT NOT NULL, ADD parteners_id INT NOT NULL;
ALTER TABLE compte ADD CONSTRAINT FK_CFF65260A76ED395 FOREIGN KEY (user_id) REFERENCES user (id);
ALTER TABLE compte ADD CONSTRAINT FK_CFF65260E9156E6E FOREIGN KEY (parteners_id) REFERENCES partenaire (id);
CREATE INDEX IDX_CFF65260A76ED395 ON compte (user_id);
CREATE INDEX IDX_CFF65260E9156E6E ON compte (parteners_id);
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120133731', CURRENT_TIMESTAMP);

-- Version 20200120145334
ALTER TABLE compte DROP FOREIGN KEY FK_CFF65260E9156E6E;
DROP TABLE partenaire;
ALTER TABLE compte DROP FOREIGN KEY FK_CFF65260A76ED395;
DROP INDEX IDX_CFF65260E9156E6E ON compte;
DROP INDEX IDX_CFF65260A76ED395 ON compte;
ALTER TABLE compte DROP user_id, DROP parteners_id;
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120145334', CURRENT_TIMESTAMP);

-- Version 20200120145716
ALTER TABLE compte DROP FOREIGN KEY FK_CFF65260E9156E6E;
DROP TABLE partenaire;
DROP INDEX IDX_CFF65260E9156E6E ON compte;
DROP INDEX IDX_CFF65260A76ED395 ON compte;
ALTER TABLE compte DROP parteners_id, DROP user_id;
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120145716', CURRENT_TIMESTAMP);

-- Version 20200120150004
ALTER TABLE compte DROP FOREIGN KEY FK_CFF65260E9156E6E;
DROP INDEX IDX_CFF65260A76ED395 ON compte;
DROP INDEX IDX_CFF65260E9156E6E ON compte;
ALTER TABLE compte DROP parteners_id, DROP user_id;
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120150004', CURRENT_TIMESTAMP);

-- Version 20200120150132
ALTER TABLE compte ADD ninea LONGTEXT NOT NULL, ADD register LONGTEXT NOT NULL;
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120150132', CURRENT_TIMESTAMP);

-- Version 20200120160641
ALTER TABLE compte ADD CONSTRAINT FK_CFF6526020537CE3 FOREIGN KEY (usercreate_id) REFERENCES user (id);
CREATE INDEX IDX_CFF6526020537CE3 ON compte (usercreate_id);
INSERT INTO migration_versions (version, executed_at) VALUES ('20200120160641', CURRENT_TIMESTAMP);

-- Version 20200123104918
ALTER TABLE compte DROP ninea, DROP register;
INSERT INTO migration_versions (version, executed_at) VALUES ('20200123104918', CURRENT_TIMESTAMP);
