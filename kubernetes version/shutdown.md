# Cleanup Procedures

## Google Cloud Cleanup

### Steps to clean up

1. Click the project selector on the top left of the page
   ![Step 1](https://udemy-images.s3.amazonaws.com/redactor/raw/2018-09-06_15-52-13-d86ba5ce924035b5e698e5106dbcea57.png)

2. Click the 'gear' icon on the top right
   ![Step 2](https://udemy-images.s3.amazonaws.com/redactor/raw/2018-09-06_15-52-44-c5b20fec91b3bcf618a592624572f3f7.png)

3. Find your project in the list of projects that is presented, then click the three dots on the far right hand side
   ![Step 3](https://udemy-images.s3.amazonaws.com/redactor/raw/2018-09-06_15-53-54-200f5dfbe9d95b90640328467fcfee6b.png)

4. Click 'Delete'
   ![Step 4](https://udemy-images.s3.amazonaws.com/redactor/raw/2018-09-06_15-54-17-64c5dea9f707f4f664c4abf1b598c457.png)

5. Enter your project ID and click 'Shut Down'
   ![Step 5](https://udemy-images.s3.amazonaws.com/redactor/raw/2018-09-06_15-54-32-b8d88edf6cae27542b063641b711a635.png)

## Local Environment Cleanup

### Stopping Minikube

To stop Minikube, and the VM that it runs, run minikube stop . You can bring your local cluster back online at any time by running minikube start

### Stopping Running Containers

You might still have some containers running on your machine. Try a docker ps . You can then run docker stop <container_id> to clean up any running containers

### Clearing the Build Cache

All the images that we built and ran during the course are cached on your local machine - they might be taking up to around 1GB of space. You can clean these up by running docker system prune
