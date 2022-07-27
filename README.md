#### docker-registry ####
How To Setup And Host A Private Docker Registry
Docker private registry acts as a centralized store of custom images that you created for your application. We can easily push images to this private remote Docker registry and pull images from there whenever we needed.

This article demonstrates how to setup a basic private docker registry, and then later we will see how to configure HTTP Authentication, etc.

Let’s create directories to keep the things organized and execute below commands step by step:

#### 1. command to create folder  ####

mkdir docker-registry
cd ~/docker-registry
mkdir volume
nano docker-compose.yml

#### 2. docker-compose.yml ####

<img width="488" alt="2 1" src="https://user-images.githubusercontent.com/83863431/181220750-d6a0ed59-01ee-4e89-804f-75a94209d218.png">



    ports:
    - "5000:5000"  or  "5100:5000" 
    
  
    ports:
    - "8080:80"  or another like: "8082:80" 
   
 
        
 You can exit and save using CTRL+X then Y and then ENTER.   
 
        
 #### 3. Run docker-compose.yml  ####   
 
         docker-compose up -d  
      or sudo docker-compose -f docker-compose.yml up -d
      and check container : docker ps 
   

 #### 4. find your Ip address ####
 
         docker exec -it [CONTAINER ID] /bin/sh
 and run :  ip addr
    

 
 #### 5. Check docker-registry and docker-registry-ui in browser ####
 
        Example IP address is 20.204.80.36  
        ##  20.204.80.36:5000/v2/_catalog ##  for docker-registry
        ##  20.204.80.36:8080/home        ##  for docker-registry-ui
        
    
 #### 6. On Linux m/c, let’s modify the .json file is located /etc/docker/daemon.json and insecure-registries with <<ip-address:port>>.
 
  <img width="804" alt="3 1" src="https://user-images.githubusercontent.com/83863431/181222424-5fd3cd51-3ee9-4fa0-8b73-52d48101c074.png">


        You can exit and save using CTRL+X then Y and then ENTER.
 
 #### 7. Push a Docker image to a remote private registry ####
 
     example : (sudo) docker pull nginx
               (sudo) docker tag nginx:latest 20.204.80.36:5000/nginx
               (sudo) docker push 20.204.80.36:5000/nginx
     
    

     
 <img width="1051" alt="1 1" src="https://user-images.githubusercontent.com/83863431/181221416-f622dd81-8385-4ab3-90ad-1950af7ed39c.png">

     
#### 8. command: curl -X GET http://20.204.80.36:5000/v2/_catalog  for check Your repositories ####

#### when push Your Images to docker-registry, it add to volume auto. #####

     
               
 
  
