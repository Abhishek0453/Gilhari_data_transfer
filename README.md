# Gilhari_data_transfer
## Introduction
Gilhari is a microservice offered by the company **Software Tree** that simplifies JSON data transfer across databases or between a database and an application. The microservice is available in a docker container and can be configured per application requirements and relational models. The microservice exposes REST interface to  provide APIs (POST, GET, PUT, DELETE…) for CRUD (Create, Retrieve, Update, and Delete) operations on the app-specific JSON objects. Architecturally, it sits behind other app components like microservices or gateways that take care of business logic, authentication, and authorizations. The microservice can be deployed in a container orchestration system like Kubernetes for scalability.

## Downloading Gilhari
The required files for Gilhari microservice can be downloaded from the official [link](https://www.softwaretree.com/v1/products/gilhari/download-gilhari.php) on the Software Tree [website](https://www.softwaretree.com/).

The package includes all the files required to run the microservice as a docker image and a few examples to get started with.  

The microservice can be configured by modifying the `gilhari_service.config` and the `.jdx` file in the `config` directory of an example.
### gilhari_service.config file
This file contains information about the schema of the database tables, class mappings, network port to be used for communication and the JDBC driver (jar file) path. 
The `classnames_map` file is located in the `config` directory, and the persistent classes are in the `bin` directory. The files compiled to generate the classes are in the `src` directory. 

### jdx file
The `jdx` file present in the `config` directory of the example contains the mappings of attributes present in the JSON objects that are meant to be transferred. It also provides specifications for the relations and primary keys within the objects.

Furthermore, it contains the connection link to the database preceded by a `JDX_DATABASE` tag and the path to the driver class file within the `jar` file that is mapped in the `config` file.

## Running the examples
The procedure to run Gilhari examples is as follows:

- Run the `compile` batch file created that compiles the java program in the src directory and sets the environment variable `JX_HOME` to the root directory where Gilhari SDK is downloaded.
>[!NOTE]
>Ensure that the `JX_HOME` environment variable is set to the root directory where Gilhari is installed. All the required JDX dependency mappings are made through the `JX_HOME` variable.
- Run the `build` batch file. This pulls the base Gilhari image and creates a new image with specified configurations.
- To get the image working, run the `run_docker_image` batch file, which fetches the newly built image and runs it by connecting it with the database connection string provided in the `.jdx` file.
- To interact with the microservice, a `curlCommands` batch file is provided which can be modified to requirement.

  
