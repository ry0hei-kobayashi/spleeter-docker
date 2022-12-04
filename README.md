# spleeter-docker

This repository has spleeter{https://github.com/deezer/spleeter}. You can try this without broken your local environment.
If you enter a your audio file, it will copy the output results to your local PC. Operation was confirmed with Ubuntu20.04 and Docker20.10.21.

How to use.
1. Please git clone this repository first.
2. It is easy, although many environment variables must be given.
3. Please run below command with your arg setting.

$ docker build -t spleeter --build-arg FILENAME=hoge \\  
                           --build-arg EXT=hoge \\  
                           --build-arg NUMSTEMS=hoge \\  
                           --build-arg USERNAME=$USER \\  
                           --build-arg IP=hoge \\  
                           --build-arg PASSWD=hoge  
                          
About arg setting example. In case of input file name is song.wav.  
・Set your input FILENAME and EXT.
FILENAME=song  
EXT=wav  
・NUMSTEMS variable can select the spleeters model. You can choose 2or4or5. Please see spleeter's github{https://github.com/deezer/spleeter} for detailes.  
NUMSTEMS=2  
・USERNAME is your local machines USERNAME.  
USERNAME=$USER  
・IP is your local machines IP.  
IP=192.168.x.x  
・PASSWD is your local machines password.  
PASSWD=xxxxxxxx  

(USERNAME,IP,PASSWD　are used for scp command.) 

