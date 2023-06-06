-- Active: 1686012174143@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password, role)
VALUES
	('u001', 'Genilson', 'genilson@email.com', 'Genilson123', 'NORMAL'),

	('u002', 'Raimundo', 'raimundo123@email.com', 'Raimundo123', 'NORMAL'),

	('u003', 'Bacana', 'bacana@email.com', 'Bacana123.', 'ADMIN'),

    ('u004', 'Lourado', 'lourado123@email.com', 'Lourado123', 'NORMAL');

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO posts (id, creator_id, name)
VALUES
('p001', 'u001', 'Viagem'),
('p002', 'u002', 'Praia'),
('p003', 'u003', 'Sol');

CREATE TABLE likes_dislikes (
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
     ON UPDATE CASCADE
     ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts (id)
     ON UPDATE CASCADE
     ON UPDATE CASCADE
);

INSERT INTO likes_dislikes (user_id, post_id, like)
VALUES
    ('u003', 'p002', 2),
    ('u001', 'p002', 3),
    ('u002', 'p001', 10),
    ('u003', 'p001', 0);

UPDATE posts
SET likes = 10, dislikes = 1
WHERE id = 'p001';

UPDATE  posts
SET likes = 2 
WHERE id = 'p002';



DROP TABLE likes_dislikes;
DROP TABLE posts;
DROP TABLE users;



