Process to start working

- Modify the gilhari_service.config file with appropriate credentials and options

- Modify the gilhari7_cloud_oracle.jdx file in config directory if required while changing database connection string

- Run the compile batch file after setting the path as required in the file which creates persistent class file in the bin directory and sets the JX_HOME variable to root file where Gilhari sdk is installed

- Modify the extension of DockerBuildAndRun.txt to .bat, .cmd or .sh with respect to the system used and then run it

- Use curlCommands to interact with the database through the microservice (may need to change extension to .cmd based on the OS used)