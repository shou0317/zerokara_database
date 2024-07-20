-- 1.1
CREATE TABLE Jyoshoroku
(
    toroku_bango INTEGER NOT NULL,
    namae VARCHAR(128) NOT NULL,
    jyusho VARCHAR(256) NOT NULL,
    tel_no CHAR(10),
    mail_address CHAR(20),
    PRIMARY KEY (toroku_bango)
);

-- 1.2
ALTER TABLE Jyoshoroku ADD COLUMN yubin_bango CHAR (8) NOT NULL;

-- 1.3
DROP TABLE Jyoshoroku;

-- 1.4
CREATE TABLE Jyoshoroku
(
    toroku_bango INTEGER NOT NULL,
    namae VARCHAR(128) NOT NULL,
    jyusho VARCHAR(256) NOT NULL,
    tel_no CHAR(10),
    mail_address CHAR(20),
    PRIMARY KEY (toroku_bango)
);

正答数4/4