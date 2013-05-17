mysql -u root -p12345 -e "DROP DATABASE IF EXISTS sellco_dev03"
mysql -u root -p12345 -e "CREATE DATABASE IF NOT EXISTS sellco_dev03"
mysql -u root -p12345 sellco_dev03 < ./sql/basic-acceptable.sql
mysql -u root -p12345 sellco_dev03 < ./sql/fixtures-1.sql
mysql -u root -p12345 sellco_dev03 < ./sql/sessions.sql
