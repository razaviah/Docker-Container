# Docker Container Project -- Mini Project

Docker Container Project, Data Engineering Diploma, WeCloudData

Content developed by: WeCloudData Academy

## 1. Business Scenario

You will create a docker container for data process.

## 2. Business Requirements

* Please download the zip file from ***EXERCISE FILES***. This is the initial package for you to create such container.
* Please upload your docker file and final csv to the repository you created in the Github.

## 3. Specification Detail
1. In the file, there are 2 folders (***input*** and ***output***) and 1 python script. There are 2 csv files (***t1*** and ***t2***) in the input folder.
2. What you need to do is create a image to generate a container, in the container, you will:
   * Use the python script to read the data from ***input*** folder.
   * Write the results data into ***output*** folder.
3. The python script is in the container.
4. The ***input*** and ***output*** folder is in the host, in another word, outside the container. What you need to do is to mount the 2 folders from host to the container. 
5. Try to make container running first, and then run python script. This means when you use ***docker run*** to start up the container, the python script will not run. The python script only runs when you give container an order with command ***docker exec***. 
6. The python script is ready to use and you don't need to change it. But if you want, you can change the script for your requirements.

## 4. Diagram

The project diagram is as below:

<p align="center">
  <img src="https://user-images.githubusercontent.com/108837052/195683771-dee6eafb-d324-4a38-9286-0a766efa2e26.JPG" alt="Docker Container Project Process Diagram"/>
</p>


