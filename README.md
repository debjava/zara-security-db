# Spring Security with OAUTH2 with 3 Legged Authentication with MYSQL Database
## It is JDBC based authentication

# How to use
- Download the project
- Build the project using the Maven command mvn clean install
- You will find two war files, deploy both in Tomcat server
- Open browser and type the url [http://localhost:8080/zara-client-db]

# Testing in Firefox REST Client
- To access in REST Client , use the follwoing url [http://localhost:8080/zara-auth-db/test/test/11]
- Pass the following information in the header

- Authorization
- bearer [copy the access_token=]
- An example is given below.

GET
http://localhost:8080/zara-auth/test/test/11

Authorization

bearer 8f0e4006-2e8d-424e-8de0-5e4e3008f17c
