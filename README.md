# Docker Container Data Processing Project

## Overview
This project involves creating a Docker container to handle data processing tasks. The container will read data from an `input` folder, process it using a Python script, and write the results to an `output` folder.

![Project Diagram](https://user-images.githubusercontent.com/108837052/195683771-dee6eafb-d324-4a38-9286-0a766efa2e26.JPG)

## Business Requirements
- Download the initial package from the **EXERCISE FILES**.
- Upload your Dockerfile and the final CSV file to your GitHub repository.

## Technical Specifications
1. **Project Structure**: The project contains two folders (`input` and `output`) and a Python script.
2. **Docker Container**: 
    - Reads data from the `input` folder.
    - Writes processed data to the `output` folder.
3. **Python Script**: Located inside the container.
4. **Folder Mounting**: The `input` and `output` folders are mounted from the host to the container.
5. **Container Execution**: 
    - The container starts up without running the Python script.
    - The Python script is executed using `docker exec`.

## How to Run
1. Build the Docker image.
2. Run the Docker container.
3. Execute the Python script inside the container using `docker exec`.

## Note
- The Python script is ready to use, but you can modify it to meet specific requirements if needed.
