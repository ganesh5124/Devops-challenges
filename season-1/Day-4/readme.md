
## Tasks:
### Networking Configuration:
  1. Subnetting:
      -  Create a public subnet for the Flask app.
      -  Create a private subnet for the MySQL database.
  2. NAT Gateway:
      -  Configure NAT to route traffic between the public subnet and the private subnet, enabling the Flask app to be publicly accessible while the MySQL database remains isolated.
  3. Routing:
      -  Ensure proper routing between the subnets to allow communication from the Flask app to MySQL using the private IP address.

### Service Setup:
1. Deploy the Database Service:
   - Deploy a MySQL database on a private IP
   - Ensure the database is only accessible from the Flask application.
2. Deploy the Application Service:
   - Deploy a Flask application on a public IP.
   - The Flask app should communicate with MySQL using its private IP.
   - Make the Flask application publicly accessible via NAT.

### SSL Configuration:
1. HTTPS Setup:
   - Enable SSL for the Flask application to secure traffic between the app and users.
   - Ensure that all HTTP traffic is redirected to HTTPS.

###  Connectivity Testing:
  -  Test connectivity between the Flask app and the MySQL database to ensure the Flask app can communicate securely using the private IP.

### Failure Simulation & Troubleshooting:
  -  Simulate a failure by stopping the MySQL service.
  -  Use the command: ``` sudo systemctl stop mysql ```
  -  Troubleshoot why the Flask app cannot connect to the MySQL database after the failure.
  -  Use tools like ping or telnet to test connectivity between the Flask app and the database:
  -  Use ping to check if the Flask app can reach the MySQL server via the private IP.
  -  Use telnet to verify that the MySQL service is listening on the correct port.
  -  Check the Flask application logs for any error messages related to the database connection failure.
  -  Review network security settings such as firewalls, security groups, and routing tables to confirm that they are configured to allow communication between the Flask app and MySQL.
  -  Check for misconfigurations in NAT, firewall rules, or any other network access settings that might prevent the Flask app from connecting to the MySQL database.
