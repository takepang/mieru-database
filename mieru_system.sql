-- ユーザーテーブル
-- https://www.websec-room.com/2015/03/15/2153 参考
-- TODO ログインIDとemailをどうするか検討（ログインはメールアドレスにするため）
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL comment 'id プライマリkey',
    username VARCHAR(50)     NOT NULL comment 'ユーザー名',
    loginid VARCHAR(50)      NOT NULL comment 'ログインID',
    email VARCHAR(255)       NOT NULL comment 'メールアドレス',
    password VARCHAR(255)    NOT NULL comment 'パスワード',
    temp_pass VARCHAR(255)   DEFAULT NULL comment 'テンポラリーパスワード',
    temp_limit_time DATETIME DEFAULT NULL comment 'テンポラリーパスワード解除時刻',
    last_change_pass_time DATETIME DEFAULT NULL comment '最終パスワード変更時刻',
    last_login_time DATETIME DEFAULT NULL comment '最終ログイン時刻',
    salt VARCHAR(255) NOT NULL comment 'ソルト',
    reset INT(11) DEFAULT 0 comment 'パスワードリセットフラグ 0) 通常時 1) リセット時',
    status TINYINT(1) DEFAULT 1 comment 'ユーザーステータス 0) 非アクティブ 1) アクティブ',　
    create_at DATETIME DEFAULT current_timestamp comment '登録日時',
    update_at DATETIME DEFAULT NULL comment '更新日時',
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;