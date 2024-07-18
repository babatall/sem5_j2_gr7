-- Création de la table User pour le blog
CREATE TABLE IF NOT EXISTS BlogUser (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Création de la table Article pour le blog
CREATE TABLE IF NOT EXISTS Article (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES BlogUser(id)
);

-- Création de la table Category pour le blog
CREATE TABLE IF NOT EXISTS Category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL
);

-- Création de la table Tag pour le blog
CREATE TABLE IF NOT EXISTS Tag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    color TEXT NOT NULL
);

-- Création de la table ArticleCategory pour le blog
CREATE TABLE IF NOT EXISTS ArticleCategory (
    article_id INTEGER,
    category_id INTEGER,
    FOREIGN KEY (article_id) REFERENCES Article(id),
    FOREIGN KEY (category_id) REFERENCES Category(id),
    PRIMARY KEY (article_id, category_id)
);

-- Création de la table CategoryTag pour le blog
CREATE TABLE IF NOT EXISTS CategoryTag (
    category_id INTEGER,
    tag_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES Category(id),
    FOREIGN KEY (tag_id) REFERENCES Tag(id),
    PRIMARY KEY (category_id, tag_id)
);

-- Insérer un utilisateur dans le blog
INSERT INTO BlogUser (name) VALUES ('Alice');
-- Insérer une catégorie dans le blog
INSERT INTO Category (title) VALUES ('Tech');
-- Insérer un tag dans le blog
INSERT INTO Tag (title, color) VALUES ('Important', '#FFFFF');
-- Insérer un article dans le blog
INSERT INTO Article (title, content, user_id) VALUES ('First Post', 'This is the first post.', 1);
-- Associer l'article à la catégorie dans le blog
INSERT INTO ArticleCategory (article_id, category_id) VALUES (1, 1);
-- Associer la catégorie au tag dans le blog
INSERT INTO CategoryTag (category_id, tag_id) VALUES (1, 1);

-- Création de la table Student pour MOOCademy
CREATE TABLE IF NOT EXISTS Student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

-- Création de la table Course pour MOOCademy
CREATE TABLE IF NOT EXISTS Course (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT
);

-- Création de la table Lesson pour MOOCademy
CREATE TABLE IF NOT EXISTS Lesson (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    course_id INTEGER,
    FOREIGN KEY (course_id) REFERENCES Course(id)
);

-- Insérer un élève dans MOOCademy
INSERT INTO Student (name, email) VALUES ('Bob', 'bob@example.com');
-- Insérer un cours dans MOOCademy
INSERT INTO Course (title, description) VALUES ('Mathematics 101', 'Introduction to Mathematics');
-- Insérer une leçon dans MOOCademy
INSERT INTO Lesson (title, body, course_id) VALUES ('Lesson 1', 'This is the first lesson.', 1);

-- Création de la table User pour Pinterest
CREATE TABLE IF NOT EXISTS PinterestUser (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    email TEXT NOT NULL
);

-- Création de la table Pin pour Pinterest
CREATE TABLE IF NOT EXISTS Pin (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES PinterestUser(id)
);

-- Création de la table Comment pour Pinterest
CREATE TABLE IF NOT EXISTS PinterestComment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content TEXT NOT NULL,
    user_id INTEGER,
    pin_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES PinterestUser(id),
    FOREIGN KEY (pin_id) REFERENCES Pin(id)
);

-- Insérer un utilisateur dans Pinterest
INSERT INTO PinterestUser (username, email) VALUES ('Charlie', 'charlie@example.com');
-- Insérer un pin dans Pinterest
INSERT INTO Pin (url, user_id) VALUES ('https://example.com/image1.jpg', 1);
-- Insérer un commentaire dans Pinterest
INSERT INTO PinterestComment (content, user_id, pin_id) VALUES ('Nice pin!', 1, 1);

-- Base de données pour The News
-- Création de la table User
CREATE TABLE User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

-- Création de la table Link
CREATE TABLE Link (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    title TEXT NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

-- Création de la table Comment
CREATE TABLE Comment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content TEXT NOT NULL,
    link_id INTEGER,
    user_id INTEGER,
    parent_id INTEGER,
    FOREIGN KEY (link_id) REFERENCES Link(id),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (parent_id) REFERENCES Comment(id)
);

-- Insérer des utilisateurs
INSERT INTO User (name, email) VALUES ('Ali', 'ali12@example.com');
INSERT INTO User (name, email) VALUES ('Biram', 'biram@example.com');

-- Insérer des liens
INSERT INTO Link (url, title, user_id) VALUES ('https://example.com/link1', 'Premier lien', 1);
INSERT INTO Link (url, title, user_id) VALUES ('https://example.com/link2', ' Deuxieme lien', 2);

-- Insérer des commentaires
INSERT INTO Comment (content, link_id, user_id) VALUES ('Great article!', 1, 2);
INSERT INTO Comment (content, link_id, user_id, parent_id) VALUES ('I agree!', 1, 1, 1);  -- Reply to first comment


-- Base de données pour The Class
-- Création de la table Student
CREATE TABLE Student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

-- Création de la table Course
CREATE TABLE Course (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT
);

-- Création de la table Enrollment
CREATE TABLE Enrollment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (course_id) REFERENCES Course(id)
);

-- Insérer des élèves
INSERT INTO Student (name, email) VALUES ('Baba', 'baba@example.com');
INSERT INTO Student (name, email) VALUES ('Maria', 'maria@example.com');

-- Insérer des cours
INSERT INTO Course (title, description) VALUES ('Mathematics 101', 'Introduction to Mathematics');
INSERT INTO Course (title, description) VALUES ('History 201', 'Advanced World History');

-- Insérer des inscriptions
INSERT INTO Enrollment (student_id, course_id) VALUES (1, 1);  
INSERT INTO Enrollment (student_id, course_id) VALUES (2, 1);  
INSERT INTO Enrollment (student_id, course_id) VALUES (1, 2);  
