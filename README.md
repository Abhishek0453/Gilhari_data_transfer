# Gilhari_data_transfer
## Introduction to Gilhari
Gilhari is a microservice offered by the company **Software Tree** that simplifies JSON data transfer across databases or between a database and an application. The microservice is available in a docker container and can be configured per application requirements and relational models. The microservice exposes REST interface to  provide APIs (POST, GET, PUT, DELETE…) for CRUD (Create, Retrieve, Update, and Delete) operations on the app-specific JSON objects. Architecturally, it sits behind other app components like microservices or gateways that take care of business logic, authentication, and authorizations. The microservice can be deployed in a container orchestration system like Kubernetes for scalability.

## Downloading Gilhari
The required files for the Gilhari microservice can be downloaded from the official [link](https://www.softwaretree.com/v1/products/gilhari/download-gilhari.php) on the Software Tree [website](https://www.softwaretree.com/).

The package includes all the files required to run the microservice as a docker image and a few examples to get started with.  

The microservice can be configured by modifying the `gilhari_service.config` and the `.jdx` file in the `config` directory of the example.
### gilhari_service.config file
This file contains information about the schema of the database tables, class mappings, network port to be used for communication and the JDBC driver (jar file) path. 
The `classnames_map` file is located in the `config` directory, and the persistent classes are in the `bin` directory. The files compiled to generate the classes are in the `src` directory. 

### jdx file
The `jdx` file in the `config` directory of the example contains the mappings of attributes present in the JSON objects that are meant to be transferred. It also provides specifications for the relations and primary keys within the objects.

Furthermore, it contains the connection link to the database preceded by a `JDX_DATABASE` tag and the path to the driver class file within the `jar` file that is mapped in the `config` file.

## Running the examples
The procedure to run Gilhari examples is as follows:

- Run the `compile` batch file that compiles the java program in the src directory and sets the environment variable `JX_HOME` to the root directory where Gilhari SDK is downloaded.
>[!NOTE]
>Ensure that the `JX_HOME` environment variable is set to the root directory where Gilhari is installed. All the required JDX dependency mappings are made through the `JX_HOME` variable.
- Run the `build` batch file. This pulls the base Gilhari image and creates a new image with specified configurations.
- To get the image working, run the `run_docker_image` batch file, which fetches the newly built image and runs it by connecting it with the database connection string provided in the `.jdx` file.
- To interact with the microservice, a `curlCommands` batch file is provided, which can be modified according to requirement.

## About Oracle 19c
It is a relational database with support for various productivity features
Improvement in performances from its previous versions through automatic indexing through a ML algorithm
A query quarantining system to prevent overloading of system resources with a large amount of query requests
The most useful features for our project would be support for JSON including partial updating facility for the same

## Creating the 19c Database:
Step1: create a OCI account
Step2: go to create ATP(Autonomous Transaction Processing) database
Step3: Select Transaction Processing in workload types
Step4: Provide the database,a name,password
## Connecting the 19c Database with Gilhari:
After creating the database, go to connections and copy one of the connection strings
Add These 2 to the .jdx file
JDX_DATABASE JDX:jdbc:oracle:thin:@<connection string>USER=ADMIN;PASSWORD=<password>;JDX_DBTYPE=Oracle;DEBUG_LEVEL=0
JDBC_DRIVER oracle.jdbc.driver.OracleDriver
## Introduction to MongoDB
MongoDB is an open-source document-oriented database designed to store
large amounts of data with ease of working with it. It is a NoSQL database, meaning it does not involve tables with relations between attributes of objects stored in the database. Unlike Relational databases, data is not stored in tables; instead, collections and documents are used. A non-relational database does not have a fixed
schema for data storage and can be changed on the go if required. It also supports
hierarchical storage of data, unlike relational databases. A sophisticated indexing
scheme is implemented in MongoDB to facilitate data retrieval.

MongoDB can be used either on the cloud or on the device locally. MongoDB Atlas is a web interface for databases, whereas MongoDB Compass is a downloadable GUI for interacting with the databases. The MongoDB server can be downloaded from [here](https://www.mongodb.com/try/download/community). The installation provides an option to install MongoDB compass along with the server. An alternative method of interacting with the server is the Mongo Shell, which can be accessed from the Windows terminal and downloaded from [here](https://www.mongodb.com/try/download/shell).

### Interacting with the database
Once the cluster and collection are made after signing in to MongoDB, a few methods exist to interact with it.

-**Using GUI**
  MongoDB Compass has an inbuilt shell and methods to interact with the database. It has options to post data, query it out or modify and delete the objects inserted into it.

  The complete guidelines can be found [here](https://www.mongodb.com/docs/compass/current/manage-data/).

-**Using Mongo Shell**
  Once Mongo Shell is installed, it can be connected to the database through a connection string and enables it to interact using APIs. 

  The full documentation can be found [here](https://www.mongodb.com/docs/v4.4/crud/).

-**Through command line**
  Windows terminal can be used to interact with the databases through commands that include the database URI, cluster name, table name and instructions.

  For example, to transfer JSON data from a local file named 'data.json' to a database named 'Employee', you can use the command 
  `mongoimport --uri "mongodb://localhost:27017/Employee" --collection Employee --file "C:/Users/<username>/Desktop/data.json" --jsonArray` and to export it to an 'output.json' file, 
  `mongoexport --host localhost --port 27017 --db Employee --collection Employee --out C:/Users/<username>/Desktop/output.json` can be used.

  The credentials can be added to the command if the database has a username and password.

  The command line tools can be downloaded from [here](https://www.mongodb.com/try/download/database-tools), and the complete documentation is provided [here](https://www.mongodb.com/docs/database-tools/).
  

## Introduction to Couchbase
Couchbase Server is an open-source, distributed, multi-model NoSQL, JSON document database that is enhanced for interactive applications. Its server is designed to provide us with easy-to-scale key-value or JSON document access with high sustained throughput and low latency. These applications may help in serving many users by storing, creating, aggregating, retrieving, manipulating and presenting data. It is designed to be gathered from a single machine to large-scale deployments spanning many machines.

The Couchbase server can be installed from [here](https://www.couchbase.com/downloads/).

After installing the server, set up a basic cluster and bucket.

### Interacting with Couchbase
- Like MongoDB, Couchbase has its own interface to interact with the database. The server can be accessed on any browser with a server number and port number through which the Couchbase server will listen to APIs 
 and CRUD commands sent to it. The browser interface contains a GUI to help facilitate posting and querying data from the buckets. 
- An alternative way to communicate with it is through the command line. couchbase-cli is a command line interface used to interact with the Couchbase server. The server can be accessed through the command line using the connection string for the server, username, password, and the bucket name to be accessed. For example, to post data stored in a 'data.json' file on the desktop, the command `cbimport json -c couchbase://localhost:8091 -u <username> -p <password> -b Employee -d file://C:/Users/<user>/Desktop/data.json -f list -g %id%` can be used whereas the command `cbexport json -c couchbase://localhost:8091 -u <username> -p <password> -b Employee -f list -o C:/Users/<user>/Desktop/output.json` extracts the data from a bucket name 'Employee' to a 'output.json' file on the desktop.

  The entire documentation for the command line interface for couchbase can be found [here](https://docs.couchbase.com/server/current/cli/cbcli/couchbase-cli.html).
