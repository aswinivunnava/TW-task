CREATE USER 'wiki'@'localhost' IDENTIFIED BY 'THISpasswordSHOULDbeCHANGED';
CREATE DATABASE wikidatabase;
GRANT ALL PRIVILEGES ON wikidatabase.* TO wiki;
FLUSH PRIVILEGES;

