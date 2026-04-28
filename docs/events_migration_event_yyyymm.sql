-- Migracion para soportar orden cronologico por anio/mes (YYYYMM)
-- Tabla objetivo: events

ALTER TABLE `events`
  ADD COLUMN `event_yyyymm` INT(6) NULL AFTER `event_date`,
  ADD KEY `idx_event_yyyymm` (`event_yyyymm`);

-- Backfill: traduce event_date textual a event_yyyymm (YYYYMM).
-- Regla: toma el primer mes detectado en el texto y el primer anio de 4 digitos.
-- Si no se puede detectar mes o anio, guarda NULL.
UPDATE `events` e
JOIN (
    SELECT
        parsed.id,
        parsed.detected_year,
        CASE
            WHEN parsed.month_pos IS NULL THEN NULL
            WHEN parsed.month_pos = parsed.pos_enero THEN 1
            WHEN parsed.month_pos = parsed.pos_febrero THEN 2
            WHEN parsed.month_pos = parsed.pos_marzo THEN 3
            WHEN parsed.month_pos = parsed.pos_abril THEN 4
            WHEN parsed.month_pos = parsed.pos_mayo THEN 5
            WHEN parsed.month_pos = parsed.pos_junio THEN 6
            WHEN parsed.month_pos = parsed.pos_julio THEN 7
            WHEN parsed.month_pos = parsed.pos_agosto THEN 8
            WHEN parsed.month_pos = parsed.pos_septiembre THEN 9
            WHEN parsed.month_pos = parsed.pos_octubre THEN 10
            WHEN parsed.month_pos = parsed.pos_noviembre THEN 11
            WHEN parsed.month_pos = parsed.pos_diciembre THEN 12
            ELSE NULL
        END AS detected_month
    FROM (
        SELECT
            base.id,
            CAST(REGEXP_SUBSTR(base.event_date_lc, '(19|20)[0-9]{2}') AS UNSIGNED) AS detected_year,
            NULLIF(LEAST(
                base.pos_enero,
                base.pos_febrero,
                base.pos_marzo,
                base.pos_abril,
                base.pos_mayo,
                base.pos_junio,
                base.pos_julio,
                base.pos_agosto,
                base.pos_septiembre,
                base.pos_octubre,
                base.pos_noviembre,
                base.pos_diciembre
            ), 9999) AS month_pos,
            base.pos_enero,
            base.pos_febrero,
            base.pos_marzo,
            base.pos_abril,
            base.pos_mayo,
            base.pos_junio,
            base.pos_julio,
            base.pos_agosto,
            base.pos_septiembre,
            base.pos_octubre,
            base.pos_noviembre,
            base.pos_diciembre
        FROM (
            SELECT
                id,
                LOWER(event_date) AS event_date_lc,
                IF(LOCATE('enero', LOWER(event_date)) = 0, 9999, LOCATE('enero', LOWER(event_date))) AS pos_enero,
                IF(LOCATE('febrero', LOWER(event_date)) = 0, 9999, LOCATE('febrero', LOWER(event_date))) AS pos_febrero,
                IF(LOCATE('marzo', LOWER(event_date)) = 0, 9999, LOCATE('marzo', LOWER(event_date))) AS pos_marzo,
                IF(LOCATE('abril', LOWER(event_date)) = 0, 9999, LOCATE('abril', LOWER(event_date))) AS pos_abril,
                IF(LOCATE('mayo', LOWER(event_date)) = 0, 9999, LOCATE('mayo', LOWER(event_date))) AS pos_mayo,
                IF(LOCATE('junio', LOWER(event_date)) = 0, 9999, LOCATE('junio', LOWER(event_date))) AS pos_junio,
                IF(LOCATE('julio', LOWER(event_date)) = 0, 9999, LOCATE('julio', LOWER(event_date))) AS pos_julio,
                IF(LOCATE('agosto', LOWER(event_date)) = 0, 9999, LOCATE('agosto', LOWER(event_date))) AS pos_agosto,
                LEAST(
                    IF(LOCATE('septiembre', LOWER(event_date)) = 0, 9999, LOCATE('septiembre', LOWER(event_date))),
                    IF(LOCATE('setiembre', LOWER(event_date)) = 0, 9999, LOCATE('setiembre', LOWER(event_date)))
                ) AS pos_septiembre,
                IF(LOCATE('octubre', LOWER(event_date)) = 0, 9999, LOCATE('octubre', LOWER(event_date))) AS pos_octubre,
                IF(LOCATE('noviembre', LOWER(event_date)) = 0, 9999, LOCATE('noviembre', LOWER(event_date))) AS pos_noviembre,
                IF(LOCATE('diciembre', LOWER(event_date)) = 0, 9999, LOCATE('diciembre', LOWER(event_date))) AS pos_diciembre
            FROM `events`
        ) base
    ) parsed
) calc ON calc.id = e.id
SET e.event_yyyymm = CASE
    WHEN calc.detected_year IS NULL OR calc.detected_month IS NULL THEN NULL
    ELSE (calc.detected_year * 100 + calc.detected_month)
END;

-- Verificaciones sugeridas
SELECT id, title, event_date, event_yyyymm
FROM events
ORDER BY event_yyyymm DESC, created_at DESC;

SELECT COUNT(*) AS pendientes_revision
FROM events
WHERE event_yyyymm IS NULL;
