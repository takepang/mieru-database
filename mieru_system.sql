-- ユーザーテーブル
-- https://www.websec-room.com/2015/03/15/2153 参考
-- http://gomocool.net/gomokulog/?p=664 参考
-- http://qiita.com/junjun_iphone/items/87070ff0db2757f197e3
-- https://jmatsuzaki.com/archives/16505
-- TODO ログインIDとemailをどうするか検討（ログインはメールアドレスにするため）
CREATE TABLE users (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'id プライマリkey',
    `username` VARCHAR(50)     NOT NULL COMMENT 'ユーザー名',
    `loginid` VARCHAR(50)      NOT NULL COMMENT 'ログインID',
    `email` VARCHAR(255)       NOT NULL COMMENT 'メールアドレス',
    `password` VARCHAR(255)    NOT NULL COMMENT 'パスワード',
    `temp_pass` VARCHAR(255)   DEFAULT NULL COMMENT 'テンポラリーパスワード',
    `temp_limit_time` DATETIME DEFAULT NULL COMMENT 'テンポラリーパスワード解除時刻',
    `last_change_pass_time` DATETIME DEFAULT NULL COMMENT '最終パスワード変更時刻',
    `last_login_time` DATETIME DEFAULT NULL COMMENT '最終ログイン時刻',
    `salt` VARCHAR(255) NOT NULL COMMENT 'ソルト',
    `reset` INT(11) NOT NULL DEFAULT 0 COMMENT 'パスワードリセットフラグ 0) 通常時 1) リセット時',
    `group_id` INT(11) NOT NULL DEFAULT 0 COMMENT 'グループテーブル外部参照キー',
    `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'ユーザーステータス 0) 非アクティブ 1) アクティブ',
    `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- グループテーブル
CREATE TABLE groups (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'id プライマリkey',
    `name` VARCHAR(100) NOT NULL COMMENT 'グループ名',
    `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

