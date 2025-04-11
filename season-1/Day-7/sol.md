* Clone the repo 
* run the project locally
* Created docker file and builded it ( created docker file in that that project)
    docker build -t demoproject:v1 (pathwhere docker file is present)
* Created container from the docker image and accessed on port 5000
    docker run -itd --name demoproject-cont1 demoproject:v1 -p 5000:5000