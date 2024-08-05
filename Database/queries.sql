/* Countries Table */
CREATE TABLE `countries` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`country` VARCHAR(255) NULL DEFAULT NULL COMMENT 'country field name',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'country state field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='countries table'
COLLATE='utf8mb4_0900_ai_ci';

/* Cities Table */
CREATE TABLE `cities` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`city` VARCHAR(255) NULL DEFAULT NULL COMMENT 'cities name field ',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'cities state field',
	`country_id` BIGINT UNSIGNED NOT NULL COMMENT 'country foreign key',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_country_id_foreign_key` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='cities table'
COLLATE='utf8mb4_0900_ai_ci';

/* Tournament Table */
CREATE TABLE `tournaments` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`tournament` VARCHAR(255) NULL DEFAULT NULL COMMENT 'tournament name field',
	`start_date` DATE NULL DEFAULT NULL COMMENT 'tournament start date field',
	`end_date` DATE NULL DEFAULT NULL COMMENT 'tournament start date field',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'tournament state field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='tournaments table'
COLLATE='utf8mb4_0900_ai_ci';

/* Phases Table */
CREATE TABLE `phases` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`phase` VARCHAR(255) NULL DEFAULT NULL COMMENT 'phase name table',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'phase state table',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='phases table'
COLLATE='utf8mb4_0900_ai_ci';

/* tournament_by_phase table */
CREATE TABLE `tournament_by_phase` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`tournament_id` BIGINT UNSIGNED NOT NULL,
	`phase_id` BIGINT UNSIGNED NOT NULL,
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_tournament_id_foreign_key` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_phase_id_foreign_key` FOREIGN KEY (`phase_id`) REFERENCES `phases` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='tournament by phase table'
COLLATE='utf8mb4_0900_ai_ci';

/* Stadistics Table */
CREATE TABLE `stadistics` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`stadistic` VARCHAR(255) NULL DEFAULT NULL COMMENT 'stadistic column name',
	`value_stadistic` VARCHAR(255) NULL DEFAULT NULL COMMENT 'stadistic column value ',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'stadistic state ',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='Stadistics Table'
COLLATE='utf8mb4_0900_ai_ci';

/* Stadistics By Tournament */
CREATE TABLE `stadistics_by_tournament` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`tournament_id` BIGINT UNSIGNED NOT NULL COMMENT 'foreign key tournament field ',
	`stadistic_id` BIGINT UNSIGNED NOT NULL COMMENT 'foreign key stadistics field',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'state tournament stadistics field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_tournament_foreign_id_key` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_stadistic_id_foreign_key` FOREIGN KEY (`stadistic_id`) REFERENCES `stadistics` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='Tournament Stadistics Table'
COLLATE='utf8mb4_0900_ai_ci';

/* Teams */
CREATE TABLE `teams` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`team` VARCHAR(255) NULL DEFAULT NULL COMMENT 'team field name',
	`city_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key City Field',
	`shield` VARCHAR(255) NULL DEFAULT NULL COMMENT 'shield image path',
	`stadium_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key Stadium Field',
	`coach_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key Coach Field',
	`team_prize` DOUBLE NULL DEFAULT NULL COMMENT 'Values Team Prize',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'State Team Field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_city_id_foreign_key` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
	CONSTRAINT `FK1_stadium_id_foreign_key` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
	CONSTRAINT `FK1_coach_id_foreign_key` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='Teams Table'
COLLATE='utf8mb4_0900_ai_ci';

/* Stadiums */
CREATE TABLE `stadiums` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`stadium` VARCHAR(255) NULL DEFAULT NULL COMMENT 'stadium field name',
	`city_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key City Field',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'State Stadium Field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_id_city_foreign_key` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='Stadium Table'
COLLATE='utf8mb4_0900_ai_ci';

/* people */
CREATE TABLE `people` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Name Coach Field',
	`last_name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Last Name Coach Field',
	`age` VARCHAR(5) NULL DEFAULT NULL COMMENT 'Age Coach Field',
	`position_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key Position Field',
	`type_user_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key Type User Field',
	`team_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key Team Field',
	`nationality` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Coach Nationality Coach',
	`city_id` BIGINT UNSIGNED NOT NULL COMMENT 'Foreign Key City Field',
	`state` ENUM('1','0') NOT NULL DEFAULT '1' COMMENT 'Coach State Field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_city_id_1_foreign_key` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
	CONSTRAINT `FK1_position_id_1_foreign_key` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
	CONSTRAINT `FK1_type_user_id_1_foreign_key` FOREIGN KEY (`type_user_id`) REFERENCES `type_users` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
	CONSTRAINT `FK1_team_id_1_foreign_key` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='Coaches Table'
COLLATE='utf8mb4_0900_ai_ci';

/* Stadistics By Team */
CREATE TABLE `stadistics_by_team` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`team_id` BIGINT UNSIGNED NOT NULL COMMENT 'Team Foreign Key Field',
	`stadistic_id` BIGINT UNSIGNED NOT NULL COMMENT 'Stadistics Foreign Key Field',
	`stadistic` VARCHAR(255) NULL COMMENT 'Stadistic Name Field',
	`value` VARCHAR(255) NULL COMMENT 'Value Stadistic Field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_team_id_foreign_key` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_stadistic_id_1_foreign_key` FOREIGN KEY (`stadistic_id`) REFERENCES `stadistics` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='Team Stadistics Table'
COLLATE='utf8mb4_0900_ai_ci';

/* Stadistics By Stadium Table  */
CREATE TABLE `stadistics_by_stadium` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`stadium_id` BIGINT UNSIGNED NOT NULL COMMENT 'Stadium Foreign Key Field',
	`stadistic_id` BIGINT UNSIGNED NOT NULL COMMENT 'Stadistics Foreign Key Field',
	`stadistic` VARCHAR(255) NULL COMMENT 'Stadistic Name Field',
	`value` VARCHAR(255) NULL COMMENT 'Value Stadistic Field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_stadium_id_1_foreign_key` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_stadistic_id_2_foreign_key` FOREIGN KEY (`stadistic_id`) REFERENCES `stadistics` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='Stadium Stadistics Table'
COLLATE='utf8mb4_0900_ai_ci';

/* Stadistics By Coach Table */
CREATE TABLE `stadistics_by_coach` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`coach_id` BIGINT UNSIGNED NOT NULL COMMENT 'Coach Foreign Key Field',
	`stadistic_id` BIGINT UNSIGNED NOT NULL COMMENT 'Stadistics Foreign Key Field',
	`stadistic` VARCHAR(255) NULL COMMENT 'Stadistic Name Field',
	`value` VARCHAR(255) NULL COMMENT 'Value Stadistic Field',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK1_coach_id_2_foreign_key` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_stadistic_id_3_foreign_key` FOREIGN KEY (`stadistic_id`) REFERENCES `stadistics` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='Coach Stadistics Table'
COLLATE='utf8mb4_0900_ai_ci';


/* Positions Players and coaches */
CREATE TABLE `positions` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`position` VARCHAR(255) NULL DEFAULT NULL COMMENT 'position name',
	`state` ENUM('0','1') NOT NULL DEFAULT '1' COMMENT 'state position',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='Positions Table'
COLLATE='utf8mb4_0900_ai_ci';


/* Type Users */
CREATE TABLE `type_users` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(255) NULL DEFAULT NULL COMMENT 'name type user',
	`state` ENUM('0','1') NOT NULL DEFAULT '1' COMMENT 'state type user',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='Type Users Table'
COLLATE='utf8mb4_0900_ai_ci';


INSERT INTO `ligabetplay`.`type_users` (`type`, `created_at`, `updated_at`) VALUES ('Jugador', '2024-07-21 19:52:13', '2024-07-21 19:52:14'), ('Tecnico', '2024-07-21 19:52:13', '2024-07-21 19:52:14');



/* Main Texts */
CREATE TABLE `main_texts` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name_text` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Text Name',
	`value_text` TEXT NULL DEFAULT NULL COMMENT 'Value Text Name',
	`state` ENUM('0','1') NOT NULL DEFAULT '1' COMMENT 'State Text Name',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='Main Texts Table'
COLLATE='utf8mb4_0900_ai_ci';


INSERT INTO `ligabetplay`.`main_texts` (`name_text`, `value_text`, `created_at`, `updated_at`) VALUES ('aboutUs', 'Sobre Nosotros.', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('contactUS', 'Contactanos.', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('followUs', 'Siguenos.', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('description', 'Somos la Dimayor, una institución la cual es la encargada de dirigir el futbol profesional colombiano, y sus torneos afiliados.', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('Email', 'contactanosdimayor@dimayor.com', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('Telefono', '+601 5185510', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('Dirección', 'Carrera 45A #94-06', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('rights', '© 2024 Dimayor. Todos los derechos reservados.', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('politics', 'Politicas de Privacidad.', '2024-07-21 20:05:27', '2024-07-21 20:05:28'),
																									  ('terms', 'Terminos de Servicio.', '2024-07-21 20:05:27', '2024-07-21 20:05:28');



/* News */
CREATE TABLE `news` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`title_news` VARCHAR(255) NULL DEFAULT NULL COMMENT 'title news ',
	`description` TEXT NULL DEFAULT NULL COMMENT 'description news',
	`state` ENUM('0','1') NOT NULL DEFAULT '1' COMMENT 'state news',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='Table News'
COLLATE='utf8mb4_0900_ai_ci';

















