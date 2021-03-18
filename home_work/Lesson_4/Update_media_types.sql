UPDATE vk.media_types
SET name='music'
WHERE id=1;

UPDATE vk.media_types
SET name='video'
WHERE id=2;

UPDATE vk.media_types
SET name='text'
WHERE id=3;

UPDATE vk.media_types
SET name='story'
WHERE id=4;

SELECT * FROM vk.media_types mt 