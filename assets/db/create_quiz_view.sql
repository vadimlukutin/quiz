CREATE VIEW quiz_view (uuid, date, total, correct, name, type) AS
SELECT result.uuid, result.date, result.total, result.correct, quiz_type.name, quiz_type.type
FROM  result, quiz_type
WHERE result.type_uuid = quiz_type.uuid;