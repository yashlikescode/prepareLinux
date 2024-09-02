echo ""
echo "Enter space separated numbers for installing the softwares and press enter:"
echo ""
echo -e "1.\e[35m$(tput bold)VS Code$(tput sgr0)\e[0m     2.\e[35m$(tput bold)Git$(tput sgr0)\e[0m     3.\e[35m$(tput bold)C/C++$(tput sgr0)\e[0m    4.\e[35m$(tput bold)Pyhon 3$(tput sgr0)\e[0m    5.\e[35m$(tput bold)Java$(tput sgr0)\e[0m"
echo ""

read -p "Enter space-separated serial numbers: " input
IFS=" " read -ra numbers <<< "$input"

pkgArray=('VS Code' 'Git' 'C/C++ Compiler' 'Python 3' 'Java')


echo ""
echo ""
echo -e "\e[32mIt's safe...\e[0m"
echo -n "Enter system password (Press Enter to Ignore): "
stty -echo
pass=""
while IFS= read -r -n 1 char; do
    if [[ $char == $'\0' ]]; then
        break
    fi
    pass+="$char"
    echo -n "*"
done
stty echo
echo


if [ ${#pass} == "0" ]; then
    echo
    echo
    echo -e "\e[31mYou have to enter your password and press y again and again...\e[0m"
    echo -n "Enter system password (Or press Enter to Continue): "
    stty -echo
    while IFS= read -r -n 1 char; do
        if [[ $char == $'\0' ]]; then
            break
        fi
        pass+="$char"
        echo -n "*"
    done
    stty echo
    echo
fi

if [ ${#pass} == "0" ]; then
    sudo apt update
    sudo apt upgrade
    for number in "${numbers[@]}"; do
        if [ "$number" == "1" ]; then
            echo "Installing VS Code"
            sudo apt-get install wget gpg
            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
            sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
            sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
            rm -f packages.microsoft.gpg
            sudo apt install apt-transport-https
            sudo apt update
            sudo apt install code
        elif [ "$number" == "2" ]; then
            echo "Installing Git" 
            sudo apt install git
        elif [ "$number" == "3" ]; then
            echo "Installing C/C++ Compiler" 
            sudo apt install g++
        elif [ "$number" == "4" ]; then
            echo "Installing Python 3"
            sudo apt install python3
        elif [ "$number" == "5" ]; then
            echo "Installing Java"
            sudo apt install default-jre
        fi
    done
else
    echo -e "$pass\ny" | sudo -S sudo apt update
    echo -e "$pass\ny" | sudo -S sudo apt upgrade
    # echo "1.VS Code     2.Git     3. C/C++ Compiler    4.Pyhon 3"
    for number in "${numbers[@]}"; do
        if [ "$number" == "1" ]; then
            echo "Installing VS Code"
            echo -e "$pass\ny" | sudo -S sudo apt-get install wget gpg
            echo -e "$pass\ny" | sudo -S wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
            echo -e "$pass\ny" | sudo -S sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
            echo -e "$pass\ny" | sudo -S sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
            echo -e "$pass\ny" | sudo -S rm -f packages.microsoft.gpg
            echo -e "$pass\ny" | sudo -S sudo apt install apt-transport-https
            echo -e "$pass\ny" | sudo -S sudo apt update
            echo -e "$pass\ny" | sudo -S sudo apt install code
        elif [ "$number" == "2" ]; then
            echo "Installing Git" 
            echo -e "$pass\ny" | sudo -S sudo apt install git
        elif [ "$number" == "3" ]; then
            echo "Installing C/C++ Compiler" 
            echo -e "$pass\ny" | sudo -S sudo apt install g++
        elif [ "$number" == "4" ]; then
            echo "Installing Python 3"
            echo -e "$pass\ny" | sudo -S sudo apt install python3
        elif [ "$number" == "4" ]; then
            echo "Installing Java"
            echo -e "$pass\ny" | sudo -S sudo apt install default-jre
        fi
    done

fi

echo -e "$pass\ny" | sudo -S sudo apt autoremove
echo ""
echo -e "\e[32mEverything you chose have been installed and is ready for use.\e[0m"
echo ""
echo -e "\e[32mHappy Hacking...!\e[0m"
echo ""
