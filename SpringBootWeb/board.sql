-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.0-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- board 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `board` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `board`;

-- 테이블 board.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(1000) DEFAULT NULL,
  `REGDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `WRITER_ID` varchar(50) DEFAULT NULL,
  `NOTICE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.comment:~3 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`ID`, `CONTENT`, `REGDATE`, `WRITER_ID`, `NOTICE_ID`) VALUES
	(1, '안녕하세요?', '2021-02-14 15:16:02', 'admin', 1),
	(2, 'Hello 댓글이야', '2021-02-14 15:16:07', 'user', 1),
	(3, '2번글 댓글', '2021-02-14 15:16:11', 'guest', 2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 board.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  KEY `PRIMARY_KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.user:~3 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `pwd`, `email`) VALUES
	(1, '박용렬', NULL, 'shanepark@deltax.ai'),
	(2, 'newlec', NULL, NULL),
	(0, '관리자', NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 board.user_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_role` (
  `USER_ID` varchar(50) DEFAULT NULL,
  `ROLE_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.user_role:~0 rows (대략적) 내보내기
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

-- 테이블 board.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `WRITERID` varchar(50) DEFAULT NULL,
  `CONTENT` blob DEFAULT NULL,
  `REGDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `HIT` int(11) DEFAULT NULL,
  `FILES` varchar(1000) DEFAULT NULL,
  `PUB` int(1) unsigned zerofill NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.notice:~12 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`ID`, `TITLE`, `WRITERID`, `CONTENT`, `REGDATE`, `HIT`, `FILES`, `PUB`) VALUES
	(1, 'JSP Servlet 연습', '1', _binary 0x4A5350EBA5BC20EC9DB4EC9AA9ED959C2057656220536572766C657420EAB09CEBB09CEC9D8420EC97B0EC8AB5ED95A9EB8B88EB8BA42E, '2022-01-17 20:14:03', 1234567, 'test.zip, abc.gif, pub.txt', 0),
	(2, 'Query Practice', '2', _binary 0x4D7953514CEC9D8420EC9DB4EC9AA9ED959C2043525544, '2022-01-17 20:14:06', 2, 'SELECT * FROM', 0),
	(3, 'JSTL 과정', '2', _binary 0x4A53544CEC9D8420EC9DB4EC9AA9ED959C204A53502053796E74617820EC9E91EC84B1, '2022-01-17 21:09:39', 5, 'core, format, function', 1),
	(4, 'Service 추가', '1', _binary 0x537072696E67207365727669636520ECB694EAB080, '2022-01-17 20:14:10', 3, 'controller, service, entity', 0),
	(5, 'Model', '1', _binary 0x4D6F64656C20EBB0A9EBB295EBA1A0, '2022-01-17 20:14:11', 3, 'Controller-Service-DAO', 0),
	(6, 'Spring을 이용한 Web', '1', _binary 0x537072696E672057656220EAB5ACED9884, '2022-01-17 20:14:12', 8, 'Spring Web', 0),
	(7, 'NewLecture 갖와', '1', _binary 0x4E65774C656374757265, '2022-01-17 20:14:13', 10, 'NewLecture 강좌 좋아요', 1),
	(8, 'Empry', '1', _binary 0x5465737420EC9AA9, '2022-01-17 20:14:14', 3, '시험용 Data', 0),
	(9, 'Hi~', '2', _binary 0x57656C636F6D65, '2022-01-17 21:05:40', 0, NULL, 1),
	(10, 'ShanePark', '2', _binary 0x5368616E65205061726B, '2022-01-17 21:06:22', 0, '시험용 데이터 2', 1),
	(11, '델타엑스', '2', _binary 0x5061726B20596F6E675279656F6C, '2022-01-17 21:07:36', 0, '시험용 데이터 3', 1),
	(12, 'DeltaX', '1', _binary 0x44656C746158, '2022-01-17 21:10:02', 1, '시험용 데이터 4', 1);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 뷰 board.noticeview 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `noticeview` (
	`ID` INT(11) NOT NULL,
	`TITLE` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`WRITERID` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`CONTENT` BLOB NULL,
	`REGDATE` TIMESTAMP NOT NULL,
	`HIT` INT(11) NULL,
	`FILES` VARCHAR(1000) NULL COLLATE 'utf8_general_ci',
	`PUB` INT(1) UNSIGNED ZEROFILL NOT NULL,
	`userName` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- 테이블 board.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `ID` varchar(50) DEFAULT NULL,
  `DISCRIPTION` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.role:~0 rows (대략적) 내보내기
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 테이블 board.tb_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_board` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호 (PK)',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `content` varchar(3000) NOT NULL COMMENT '내용',
  `writer` varchar(20) NOT NULL COMMENT '작성자',
  `view_cnt` int(11) NOT NULL DEFAULT 0 COMMENT '조회 수',
  `notice_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '공지글 여부',
  `secret_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '비밀글 여부',
  `delete_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
  `insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `update_time` datetime DEFAULT NULL COMMENT '수정일',
  `delete_time` datetime DEFAULT NULL COMMENT '삭제일',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='게시판';

-- 테이블 데이터 board.tb_board:~99 rows (대략적) 내보내기
DELETE FROM `tb_board`;
/*!40000 ALTER TABLE `tb_board` DISABLE KEYS */;
INSERT INTO `tb_board` (`idx`, `title`, `content`, `writer`, `view_cnt`, `notice_yn`, `secret_yn`, `delete_yn`, `insert_time`, `update_time`, `delete_time`) VALUES
	(1, '1번 게시글 제목을 수정합니다.', '1번 게시글 내용을 수정합니다.', '홍길동', 0, 'N', 'N', 'Y', '2020-11-29 18:20:18', '2020-11-29 18:42:02', '2020-12-01 08:10:39'),
	(55, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-11-29 19:38:54', NULL, '2020-11-30 16:25:17'),
	(56, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-11-30 11:44:36', '2020-11-30 16:00:17', NULL),
	(57, 'Test', 'Board Test', '더오리', 0, 'N', 'N', 'Y', '2020-11-30 13:22:45', NULL, '2020-11-30 18:08:57'),
	(58, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-11-30 16:29:56', NULL, '2020-11-30 16:30:07'),
	(59, '게시판 글쓰기 시험 2', '게시판 글쓰기  테스트 입니다. 2', '홍길동', 0, 'N', 'N', 'Y', '2020-11-30 21:29:34', NULL, '2020-11-30 21:31:16'),
	(60, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:28', NULL, NULL),
	(61, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:28', NULL, NULL),
	(62, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:28', NULL, NULL),
	(63, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(64, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(65, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(66, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(67, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(68, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(70, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(71, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(72, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(73, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(74, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(75, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(76, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(77, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(78, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(79, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(80, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(81, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(85, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(86, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(87, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(88, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(89, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(90, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(91, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(92, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(93, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(94, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(95, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(96, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(97, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(98, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(99, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(100, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(101, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(102, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(103, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(104, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(105, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(106, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(107, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(108, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(116, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(117, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(118, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(119, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(120, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(121, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(122, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(123, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(124, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(125, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(126, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(127, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(128, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(129, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(130, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(131, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(132, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(133, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(134, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(135, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(136, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(137, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(138, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(139, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(140, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(141, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(142, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(143, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(144, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(145, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(146, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(147, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(148, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(149, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(150, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(151, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(152, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(153, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정 - 두번째', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', '2020-12-01 21:56:40', NULL),
	(154, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(155, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(156, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(157, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(158, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(159, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(160, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(161, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(162, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(163, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL);
/*!40000 ALTER TABLE `tb_board` ENABLE KEYS */;

-- 테이블 board.tb_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_comment` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호 (PK)',
  `board_idx` int(11) NOT NULL COMMENT '게시글 번호 (FK)',
  `content` varchar(3000) NOT NULL COMMENT '내용',
  `writer` varchar(20) NOT NULL COMMENT '작성자',
  `delete_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
  `insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `update_time` datetime DEFAULT NULL COMMENT '수정일',
  `delete_time` datetime DEFAULT NULL COMMENT '삭제일',
  PRIMARY KEY (`idx`),
  KEY `fk_comment_board_idx` (`board_idx`),
  CONSTRAINT `fk_comment_board_idx` FOREIGN KEY (`board_idx`) REFERENCES `tb_board` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='댓글';

-- 테이블 데이터 board.tb_comment:~21 rows (대략적) 내보내기
DELETE FROM `tb_comment`;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` (`idx`, `board_idx`, `content`, `writer`, `delete_yn`, `insert_time`, `update_time`, `delete_time`) VALUES
	(6, 55, '1번 댓글을 추가합니다!', '1번 회원', 'N', '2020-12-05 10:04:53', NULL, NULL),
	(8, 55, '1번 댓글을 추가합니다!', '1번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(9, 55, '2번 댓글을 추가합니다!', '2번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(10, 55, '3번 댓글을 추가합니다!', '3번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(11, 55, '4번 댓글을 추가합니다!', '4번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(12, 55, '5번 댓글을 추가합니다!', '5번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(13, 55, '6번 댓글을 추가합니다!', '6번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(14, 55, '7번 댓글을 추가합니다!', '7번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(15, 55, '8번 댓글을 추가합니다!', '8번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(16, 55, '9번 댓글을 추가합니다!', '9번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(17, 55, '10번 댓글을 추가합니다!', '10번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(18, 55, '11번 댓글을 추가합니다!', '11번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(19, 55, '12번 댓글을 추가합니다!', '12번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(20, 55, '13번 댓글을 추가합니다!', '13번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(21, 55, '14번 댓글을 추가합니다!', '14번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(22, 55, '15번 댓글을 추가합니다!', '15번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(23, 55, '16번 댓글을 추가합니다!', '16번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(24, 55, '17번 댓글을 추가합니다!', '17번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(25, 55, '18번 댓글을 추가합니다!', '18번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(26, 55, '19번 댓글을 추가합니다!', '19번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(27, 55, '20번 댓글을 추가합니다!', '20번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL);
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;

-- 뷰 board.noticeview 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `noticeview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `noticeview` AS SELECT n.*, m.name userName 
from notice n 
	JOIN user m ON n.writerId = m.id ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
