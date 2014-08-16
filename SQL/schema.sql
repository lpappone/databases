
/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/




CREATE DATABASE chat;

USE chat;


DROP TABLE IF EXISTS messagesTable;
DROP TABLE IF EXISTS usersTable;
DROP TABLE IF EXISTS joinUsersMessagesTable;
DROP TABLE IF EXISTS joinUserFriendsTable;
DROP TABLE IF EXISTS hashtagsTable;
-- ---
-- Table messagesTable
--
-- ---


-- CREATE TABLE messagesTable (
CREATE TABLE messagesTable (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  userid INTEGER NULL DEFAULT NULL,
  text VARCHAR(255) NULL DEFAULT NULL,
  room VARCHAR(255) NULL DEFAULT NULL,
  time TIMESTAMP NULL DEFAULT NULL,
  hashtag VARCHAR(31) NULL DEFAULT NULL,
  PRIMARY KEY (id),
KEY (userid)
);


/* Create other tables and define schemas for them here! */




-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;


-- ---
-- Table usersTable
--
-- ---


CREATE TABLE usersTable (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  userName VARCHAR(31) NULL DEFAULT NULL,
  password VARCHAR(15) NULL DEFAULT NULL,
  styleTag VARCHAR(255) NULL DEFAULT NULL,
  signOffTag VARCHAR(255) NULL DEFAULT NULL,
  avatar VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table joinUsersMessagesTable
--
-- ---


CREATE TABLE joinUsersMessagesTable (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  userID INTEGER NULL DEFAULT NULL,
  messageID INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
-- KEY (userID),
-- KEY (messageID)
);

-- ---
-- Table joinUserFriendsTable
--
-- ---


CREATE TABLE joinUserFriendsTable (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  follower INTEGER NULL DEFAULT NULL,
  followee INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
-- KEY (follower),
-- KEY (followee)
);

-- ---
-- Table hashtagsTable
--
-- ---


CREATE TABLE hashtagsTable (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  messageID INTEGER NULL DEFAULT NULL,
  hashtag VARCHAR(31) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE messagesTable ADD FOREIGN KEY (userid) REFERENCES usersTable (id);
-- ALTER TABLE joinUsersMessagesTable ADD FOREIGN KEY (messageID) REFERENCES messagesTable (id);
-- ALTER TABLE joinUserFriendsTable ADD FOREIGN KEY (follower) REFERENCES usersTable (id);
-- ALTER TABLE joinUserFriendsTable ADD FOREIGN KEY (followee) REFERENCES usersTable (id);
-- ALTER TABLE hashtagsTable ADD FOREIGN KEY (messageID) REFERENCES messagesTable (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE 'usersTable' ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE 'messagesTable' ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE 'joinUsersMessagesTable' ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE 'joinUserFriendsTable' ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE 'hashtagsTable' ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO 'usersTable' ('id','userName','password','styleTag','signOffTag','avatar') VALUES
-- (',',',',',');
-- INSERT INTO 'messagesTable' ('id','text','room','time','hashtag') VALUES
-- (',',',',');
-- INSERT INTO 'joinUsersMessagesTable' ('id','userID','messageID') VALUES
-- (',',');
-- INSERT INTO 'joinUserFriendsTable' ('id','follower','followee') VALUES
-- (',',');
-- INSERT INTO 'hashtagsTable' ('id','messageID','hashtag') VALUES
-- (',',');




/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/










