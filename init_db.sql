CREATE TABLE worker(
id BIGINT auto_increment PRIMARY KEY,
name VARCHAR(1000) NOT NULL CHECK(length(name)>=2),
birthday DATE CHECK(birthday>='19000101'),
level VARCHAR NOT NULL,
salary INTEGER CHECK(salary>=100 AND salary<=1000),
CONSTRAINT chack_level CHECK
(level IN('Trainee','Junior','Middle','Senior'))
);

CREATE TABLE client(
id BIGINT auto_increment PRIMARY KEY,
name VARCHAR(1000) NOT NULL CHECK(length(name)>=2)
);

CREATE TABLE project(
id BIGINT auto_increment PRIMARY KEY,
client_id BIGINT NOT NULL,
start_date DATE,
finish_date DATE,
CONSTRAINT fk_client_id FOREIGN KEY(client_id) REFERENCES client(id)
);
ALTER TABLE project
ADD CONSTRAINT start_finish CHECK(start_date<finish_date);

CREATE TABLE project_worker(
project_id BIGINT NOT NULL,
worker_id BIGINT NOT NULL,
PRIMARY KEY(project_id,worker_id),
FOREIGN KEY(project_id) REFERENCES project(id),
FOREIGN KEY(worker_id) REFERENCES worker(id)
);






