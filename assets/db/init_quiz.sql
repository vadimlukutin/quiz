BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "quiz_type" (
	"uuid"	BLOB NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"type"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("uuid")
);
CREATE TABLE IF NOT EXISTS "result" (
	"uuid"	BLOB NOT NULL UNIQUE,
	"date"	INTEGER NOT NULL,
	"total"	INTEGER NOT NULL,
	"correct"	INTEGER NOT NULL,
	"type_uuid"	BLOB NOT NULL,
	PRIMARY KEY("uuid")
);
INSERT INTO "quiz_type" ("uuid","name","type") VALUES ('��G̍S:��撋���','True or False Quiz','bool'),
 ('�3�����\ޓ�gVD','One Answer Quiz','string');
CREATE VIEW quiz_view (uuid, date, total, correct, name, type) AS
SELECT result.uuid, result.date, result.total, result.correct, quiz_type.name, quiz_type.type
FROM  result, quiz_type
WHERE result.type_uuid = quiz_type.uuid;
COMMIT;
