CREATE TABLE `book` (
  `book_code` varchar(10) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `publishing_company` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publishing_year` date NOT NULL,
  `number_of_editions` int DEFAULT NULL,
  `cost` double NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`book_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `student` (
  `student_id` varchar(10) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `category` (
  `category_id` varchar(10) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `book_code` varchar(10) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_fk` (`book_code`),
  CONSTRAINT `category_fk` FOREIGN KEY (`book_code`) REFERENCES `book` (`book_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `borrow_order` (
  `borrow_id` varchar(10) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `borrow_day` date NOT NULL,
  `return_day` date NOT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `borrow_order_fk` (`student_id`),
  CONSTRAINT `borrow_order_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `detail_borrow` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `borrow_id` varchar(10) NOT NULL,
  `book_code` varchar(10) NOT NULL,
  `numer_of_book` int DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `detail_borrow_fk` (`borrow_id`),
  KEY `detail_borrow_fk_1` (`book_code`),
  CONSTRAINT `detail_borrow_fk` FOREIGN KEY (`borrow_id`) REFERENCES `borrow_order` (`borrow_id`),
  CONSTRAINT `detail_borrow_fk_1` FOREIGN KEY (`book_code`) REFERENCES `book` (`book_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci