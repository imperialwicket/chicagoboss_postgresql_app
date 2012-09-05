-- PostgreSQL db creation for ChicagoBoss_PostgreSQL_App

-- Check pg_hba.conf for permissions/connectivity of postgres
-- 'psql -U postgres' to connect

-- CREATE a new role for your application
CREATE USER cb_pgsql WITH PASSWORD 'cb_pgsql';
-- CREATE a new database for your application, owned by the new user
CREATE DATABASE cb_pgsql WITH OWNER = cb_pgsql;
-- GRANT full permissions to that user 
GRANT ALL ON DATABASE cb_pgsql TO cb_pgsql;

-- Change to the new database
\c cb_pgsql

-- CREATE OUR pg_todos table with appropriate ownership
CREATE TABLE pg_todos ( 
  id SERIAL UNIQUE PRIMARY KEY, 
  todo VARCHAR(255),
  created TIMESTAMP
  );
ALTER TABLE pg_todos OWNER TO cb_pgsql;
