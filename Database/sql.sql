CREATE SCHEMA `javawebdevpro001` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;

CREATE TABLE `javawebdevpro001`.`categories` (
  `category_id` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

CREATE TABLE `javawebdevpro001`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_UNIQUE` (`country` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

CREATE TABLE `javawebdevpro001`.`hinhthuc` (
  `hinhthuc_id` INT NOT NULL AUTO_INCREMENT,
  `hinhthuc` VARCHAR(45) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`hinhthuc_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

CREATE TABLE `javawebdevpro001`.`image` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `imagepath` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `mime` VARCHAR(45) NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`image_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

CREATE TABLE `javawebdevpro001`.`phim` (
  `phim_id` INT NOT NULL AUTO_INCREMENT,
  `ten` VARCHAR(255) NOT NULL,
  `movie_video` VARCHAR(255) NULL,
  `daodien` VARCHAR(45) NULL,
  `imdb` FLOAT NULL,
  `ngayphathanh` VARCHAR(12) NULL,
  `description` VARCHAR(2000) NULL,
  `details` TEXT NULL,
  `title` VARCHAR(255) NULL,
  `series` VARCHAR(45) NULL,
  `thoiluong` INT NULL,
  `country_id` INT NOT NULL,
  `hinhthuc_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`phim_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

CREATE TABLE `javawebdevpro001`.`user` (
  `id` INT NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  `email` VARCHAR(32) NOT NULL,
  `create_time` DATE NULL,
  `mobile` INT NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

CREATE TABLE `javawebdevpro001`.`video` (
  `video_id` INT NOT NULL,
  `videopath` VARCHAR(255) NOT NULL,
  `mime` VARCHAR(32) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `video_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `video`
    FOREIGN KEY (`movie_id`)
    REFERENCES `javawebdevpro001`.`phim` (`phim_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

ALTER TABLE `javawebdevpro001`.`phim` 
ADD INDEX `category_idx` (`category_id` ASC) VISIBLE,
ADD INDEX `hinhthuc_idx` (`hinhthuc_id` ASC) VISIBLE,
ADD INDEX `country_idx` (`country_id` ASC) VISIBLE;
;
ALTER TABLE `javawebdevpro001`.`phim` 
ADD CONSTRAINT `category`
  FOREIGN KEY (`category_id`)
  REFERENCES `javawebdevpro001`.`categories` (`category_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `hinhthuc`
  FOREIGN KEY (`hinhthuc_id`)
  REFERENCES `javawebdevpro001`.`hinhthuc` (`hinhthuc_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `country`
  FOREIGN KEY (`country_id`)
  REFERENCES `javawebdevpro001`.`country` (`country_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  ALTER TABLE `javawebdevpro001`.`image` 
ADD INDEX `phim_idx` (`movie_id` ASC) VISIBLE;
;
ALTER TABLE `javawebdevpro001`.`image` 
ADD CONSTRAINT `phim`
  FOREIGN KEY (`movie_id`)
  REFERENCES `webxemphim`.`phim` (`phim_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

