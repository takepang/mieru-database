-- ユーザーテーブル
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    loginid VARCHAR(50),
    email VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(20),
    status TINYINT(1),
    create_at DATETIME DEFAULT NULL,
    update_at DATETIME DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;