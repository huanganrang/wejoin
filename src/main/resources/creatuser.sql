CREATE USER 'dive'@'127.0.0.1' IDENTIFIED BY '123456';
flush privileges;
 create database dive;
 alter database dive character set utf8; 
 grant all privileges on dive.* to dive@localhost identified by '123456';
 flush privileges;
 
 ---GRANT USAGE ON *.* TO 'appmonitor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;