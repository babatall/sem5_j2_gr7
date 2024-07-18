-- Création de la table User
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    email TEXT NOT NULL
);

-- Création de la table Article
CREATE TABLE Article (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

-- Création de la table Category
CREATE TABLE Category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL
);

-- Création de la table Tag
CREATE TABLE Tag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    color TEXT NOT NULL
);

-- Création de la table ArticleCategory
CREATE TABLE ArticleCategory (
    article_id INTEGER,
    category_id INTEGER,
    PRIMARY KEY (article_id, category_id),
    FOREIGN KEY (article_id) REFERENCES Article(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

-- Création de la table ArticleTag
CREATE TABLE ArticleTag (
    article_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (article_id, tag_id),
    FOREIGN KEY (article_id) REFERENCES Article(id),
    FOREIGN KEY (tag_id) REFERENCES Tag(id)
);

-- Création de la table Comment
CREATE TABLE Comment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content TEXT NOT NULL,
    user_id INTEGER,
    article_id INTEGER,
    parent_comment_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (article_id) REFERENCES Article(id),
    FOREIGN KEY (parent_comment_id) REFERENCES Comment(id)
);

-- Insérer des utilisateurs
INSERT INTO Users (username, email) VALUES ('Ali', 'ali12@example.com');
INSERT INTO Users (username, email) VALUES ('Biram', 'biram@example.com');

-- Insérer des articles
INSERT INTO Article (title, content, user_id) VALUES ('Premiere article', 'Contenu du premier article', 1);
INSERT INTO Article (title, content, user_id) VALUES ('Deuxième article', 'Contenu du deuxième article', 2);

-- Insérer des catégories
INSERT INTO Category (title) VALUES ('Catégorie 1');
INSERT INTO Category (title) VALUES ('Catégorie 2');

-- Insérer des tags
INSERT INTO Tag (title, color) VALUES ('Tag 1', '#DFF733');
INSERT INTO Tag (title, color) VALUES ('Tag 2', '#61FF57');

-- Associer des articles à des catégories
INSERT INTO ArticleCategory (article_id, category_id) VALUES (1, 1);
INSERT INTO ArticleCategory (article_id, category_id) VALUES (1, 2);
INSERT INTO ArticleCategory (article_id, category_id) VALUES (2, 1);

-- Associer des articles à des tags
INSERT INTO ArticleTag (article_id, tag_id) VALUES (1, 1);
INSERT INTO ArticleTag (article_id, tag_id) VALUES (2, 2);

-- Insérer des commentaires
INSERT INTO Comment (content, user_id, article_id, parent_comment_id) VALUES ('Super article !', 2, 1, NULL);
INSERT INTO Comment (content, user_id, article_id, parent_comment_id) VALUES ('Merci pour le commentaire !', 1, 1, 1);
