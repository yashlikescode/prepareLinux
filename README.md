# prepareLinux
This tool automates installation of the apps that you need. You can select all the apps that needs to be downloaded and it automatically installs them for you.
## How to use this repo
### Option 1: Directly running from the internet
1. Open Terminal
2. Run the Command ```bash <(curl https://raw.githubusercontent.com/yashlikesraw/prepareLinux/main/prepareDebian.sh)```
### Option 2: Making a copy of the ```.sh``` file and then running it
1. Open Terminal
2. Run the command ```curl https://raw.githubusercontent.com/yashlikesraw/prepareLinux/main/prepareDebian.sh > prepareDebian.sh``` (to create a local bash file)
3. Run the command ```bash prepareDebian.sh``` (to run the bash file)
### Option 3: Clonning the Repository
1. Visit this repository either from github or following the link: http://tinyurl.com/readylinux
2. Clone the Repo using ```git clone https://github.com/yashlikescode/prepareLinux.git```
3. Go into the directory using command ```cd prepareLinux```
4. Run the command ```bash prepareDebian.sh``` (to run the bash file)
## How to run a ```.sh``` file in linux
1. Go to the location of the file:   ``` cd <file location> ```
2. Make that file executable:   ``` chmod +x <file name>.sh ```
3. Run that file:   ``` ./<file name>.sh ```
## Install additional softwares
Some of the extra softwares have been commented out which you can use, or you can customize the .sh file as per your need
## Note 
While running the program you will be asked to enter your system password.
We understand that you should not enter your password in any random program you have found on the internet, but please hear us out.
While installing many programs, most of the linux distros require entering a password.
The sole purpose of this repository is to automate the process of manually installing every app.
Hence, we take password from user early in the program and then use it to allow smooth installation of all the required apps.
