USE vk;

CREATE TABLE posts (
  posts_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_text TEXT(3000),
  from_post_user_id BIGINT UNSIGNED NOT NULL,
  to_post_user_id BIGINT UNSIGNED NOT NULL,
  visible BOOLEAN DEFAULT True,--true видно всем, false только друзьям
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  counter_watched INT UNSIGNED,
  INDEX fk_friend_requests_from_user_idx (from_post_user_id),
  INDEX fk_friend_requests_to_user_idx (to_post_user_id),
  CONSTRAINT fk_post_users_1 FOREIGN KEY (from_post_user_id) REFERENCES users (id),
  CONSTRAINT fk_post_users_2 FOREIGN KEY (to_post_user_id) REFERENCES users (id)
  --CONSTRAINT fk_posts_users FOREIGN KEY (posts_id) REFERENCES users (id) -- при удалении удаляется только родитель, как сделать?
) ENGINE=InnoDB;

CREATE TABLE likes (
  like_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  like_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (like_id, user_id),
  INDEX fk_like_idx (like_id),
  INDEX fk_likes_users_idx (user_id),
  CONSTRAINT fk_like_idx FOREIGN KEY (like_id) REFERENCES posts (posts_id),
  CONSTRAINT ffk_likes_users_idx FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE=InnoDB;


BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,




CREATE TABLE geo (
  geo_user_id BIGINT UNSIGNED NOT NULL,
  geo_post_id BIGINT UNSIGNED NOT NULL,
  post_latitude DOUBLE PRECISION,
  post_longitude DOUBLE PRECISION,
  post_country TINYTEXT,
  post_street TINYTEXT,
  post_state TINYTEXT,
  post_place_name TINYTEXT,
  user_latitude DOUBLE PRECISION,
  user_longitude DOUBLE PRECISION,
  user_country TINYTEXT,
  user_street TINYTEXT,
  user_state TINYTEXT,
  user_place_name TINYTEXT,
  UNIQUE INDEX fk_geo_post_to_idx (geo_post_id),
  UNIQUE INDEX fk_geo_users_to_idx (geo_user_id),
  CONSTRAINT fk_geo_users FOREIGN KEY (geo_user_id) REFERENCES users (id) -- ON DELETE CASCADE
) ENGINE=InnoDB;


