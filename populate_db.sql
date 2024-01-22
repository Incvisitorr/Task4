--ADD WORKERS
INSERT INTO worker(name,birthday,level,salary) VALUES
('Miko1','20000405','Junior',100000),
('Miko2','20010506','Middle',999),
('Miko3','20020506','Senior',5000),
('Miko4','20030405','Junior',500),
('Miko5','20040506','Middle',4999),
('Miko6','20050506','Senior',5500),
('Miko7','20060506','Senior',80000),
('Miko8','20070405','Junior',400),
('Miko9','20080506','Middle',1500),
('Miko10','20090506','Senior',7000);

--ADD CLIENTS
INSERT INTO client(name) VALUES
('Client1'),
('Client2'),
('Client3'),
('Client4'),
('Client5');

--ADD project
INSERT INTO project(client_ID,start_date,finish_date) VALUES
(1,'20000101','20000130'),
(2,'20000101','20010130'),
(2,'20000101','20020130'),
(3,'20000101','20030130'),
(3,'20100101','20110130'),
(3,'20110101','20120130'),
(4,'20130101','20140130'),
(5,'20140101','20150130'),
(5,'20040101','20150130'),
(5,'20040101','20150130');