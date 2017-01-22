#Rasp-scripts
Set of instlalation script for raspberry

###Description
   * setup.sh : Script to update the base image
   * step1.sh : Script to create a new default user instead of pi 
   * step2.sh : Script to delete pi, to update the login message (/etc/motd) and finish the installation with some specific packages (nodejs, docker, )
   


###Usage
`curl -Lo- https://raw.githubusercontent.com/torwood3/rasp-script/master/setup.sh | bash`
