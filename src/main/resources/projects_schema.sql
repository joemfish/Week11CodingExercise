DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7,2),
actual_hours DECIMAL(7,2),
difficulty INT,
notes TEXT,
PRIMARY KEY (project_id)
);

CREATE TABLE category (
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE step (
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
step_order INT NOT NULL,
step_text TEXT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
project_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

CREATE TABLE material (
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT,
cost DECIMAL(7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE, 
);

--Add some data

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Alien Elimination', 24, 36, 5, 'may require equipment not yet known to mankind');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Door hangers', 7, 36.25);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Screws', 20, 4.50);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Align hangers on opening side of door', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Screw hangers into frame', 2);
INSERT INTO category (category_id, category_name) VALUES (1, 'Doors and windows');
INSERT INTO category (category_id, category_name) VALUES (2, 'Repairs');
INSERT INTO category (category_id, category_name) VALUES (3, 'Gardening');
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (1, 2);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'stuff', 3, 12.99);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'things', 205, 1199.55);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'eat a cheeseburger', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'do the next step', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'this only has 1 step', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (4, 'build a semiconductor', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (4, 'talk to a physicist', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (5, 'hire it done', 1);
INSERT INTO project_category (project_id, category_id) VALUES (2, 3);
INSERT INTO project_category (project_id, category_id) VALUES (3, 2);
INSERT INTO project_category (project_id, category_id) VALUES (4, 2);
INSERT INTO project_category (project_id, category_id) VALUES (4, 3);
INSERT INTO project_category (project_id, category_id) VALUES (5, 1);
INSERT INTO project_category (project_id, category_id) VALUES (5, 3);


