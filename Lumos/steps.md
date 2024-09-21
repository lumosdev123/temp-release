Below are the steps for Starting the applications:

Prerequisite: Docker, docker-compose

Clear previous docker images and containers
sudo docker rm -f $(docker ps -qa)
sudo docker rmi -f $(docker images -q)

1. download and extract the zip file
   wget https://raw.githubusercontent.com/lumosdev123/temp-release/main/Lumos-3.zip
   Command: unzip Lumos.zip

2. Change the permission for the script for allowing to execute
   Command: chmod +x start.sh
3. Login to docker hub
   Command: sudo docker login -u lumoscncllc@gmail.com -p <docker password>
4. Start the application
   Command: sudo ./start.sh

Note: if the application is started on a laptop or some how the computer shut downs, use the below command to start the application.

1. Go to the directory containing docker-compose.yaml file (the directory that was extracted)
2. Run below command to resume the application
   Command: sudo docker compose up -d

Admin user and password:
email: lhiveadmin@gmail.com
password: Ab\*123456
