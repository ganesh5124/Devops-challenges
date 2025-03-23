# Installations that used for this task
# Install python3 and flask for the web application
# 1. Python3
    sudo apt update
    sudo apt install python3 python3-pip -y
    python3 --version
# 2. Flask
    sudo pip3 install flask
    python3 -m flask --version
# 3. Install virtualenv
    sudo pip3 install virtualenv
    virtualenv --version
# For Verification of database connection

# 1. Install MySQL connector
    sudo pip3 install mysql-connector-python
# 2. Verify MySQL connection
    telnet ipofdbserver 3306
# 3. ping the database server
    ping ipofdbserver


# Install MySQL in database server
# 1. Update the package index
    sudo apt update
# 2. Install MySQL
    sudo apt install mysql-server -y
# 3. Start MySQL service
    sudo systemctl start mysql
    sudo systemctl enable mysql
# 4. Secure MySQL
    sudo mysql_secure_installation
# 5. Login to MySQL
    sudo mysql -u root -p
# 6. Create a database
    CREATE DATABASE myapp;
# 7. Create a user
    CREATE USER 'flaskusr'@'10.10.%' IDENTIFIED BY 'Flas@pass123';
# 8. Grant privileges
    GRANT ALL PRIVILEGES ON myapp.* TO 'flaskusr'@'10.10.%';
# 9. Flush privileges
    FLUSH PRIVILEGES;
# 10. Exit MySQL
    exit
