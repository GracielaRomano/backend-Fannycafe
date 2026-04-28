-- 1) Extender estructura de event_gallery
ALTER TABLE event_gallery
  ADD COLUMN media_type ENUM('image','video') NOT NULL DEFAULT 'image' AFTER event_id,
  ADD COLUMN media_url VARCHAR(500) NULL AFTER image_url,
  ADD COLUMN thumbnail_url VARCHAR(500) NULL AFTER media_url,
  ADD INDEX idx_event_media_type (event_id, media_type);

-- 2) Backfill de datos existentes (imagenes actuales)
UPDATE event_gallery
SET
  media_type = 'image',
  media_url = image_url
WHERE media_url IS NULL OR media_url = '';

-- 3) Asegurar que media_url quede obligatorio
ALTER TABLE event_gallery
  MODIFY COLUMN media_url VARCHAR(500) NOT NULL;

-- 4) (Opcional) Eliminar image_url cuando ya no lo uses
-- ALTER TABLE event_gallery DROP COLUMN image_url;