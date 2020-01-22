# RDS Tester
Small app written in Python/Flask, intended to be run in a container.
It will connect to a MySQL instance, run the "SHOW DATABASES" command and display the results.
It is expected, that the app will be used in the cloud to demonstrate some of its features.

## Prerequisites

+ To simplify things, the app uses hard-coded database username and password. This is a VERY bad idea, don't do so in a production environment! For the demo purposes, make sure such user exists in the MySQL instance
+ Make sure the database security group allows connections

## Usage

+ Create a CD pipeline and run the app in a K8S deployment. Optionally, one can run in in a standalone Docker container
+ If run inside K8S, expose the deployment. The container port should be set to 5000
+ Connect to the app from the browser, enter the IP address of the MySQL server and see the list of the databases
