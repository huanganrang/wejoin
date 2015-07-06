 insert into mysql.user(Host,User,Password) values("localhost","dive",password("123456"));
 flush privileges;
 create database dive;
 grant all privileges on dive.* to bshoot@localhost identified by '123456';
 flush privileges;
 
 ---GRANT USAGE ON *.* TO 'appmonitor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;