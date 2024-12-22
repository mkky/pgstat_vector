-- Create a user with pg_monitor rights
CREATE USER monitor_user WITH PASSWORD 'monitor_password';
GRANT pg_monitor TO monitor_user;

-- Verify the permissions
-- You can uncomment this line for testing if needed
-- SELECT * FROM pg_roles WHERE rolname = 'monitor_user';

