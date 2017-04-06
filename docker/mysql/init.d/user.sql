CREATE USER 'sample_user'@'%' IDENTIFIED BY 'sample_password';
GRANT ALL PRIVILEGES ON *.* TO 'sample_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
