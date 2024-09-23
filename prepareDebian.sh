echo ""
echo ""
echo ""
echo "Enter space separated numbers for installing the softwares and press enter:"
echo ""
echo -e "1.\e[35m$(tput bold)VS Code$(tput sgr0)\e[0m     2.\e[35m$(tput bold)Git$(tput sgr0)\e[0m     3.\e[35m$(tput bold)C/C++$(tput sgr0)\e[0m    4.\e[35m$(tput bold)Pyhon 3$(tput sgr0)\e[0m    5.\e[35m$(tput bold)Java$(tput sgr0)\e[0m"
echo -e "6.\e[35m$(tput bold)Chromium$(tput sgr0)\e[0m     7.\e[35m$(tput bold)Brave$(tput sgr0)\e[0m     8.\e[35m$(tput bold)Firefox$(tput sgr0)\e[0m"
echo -e "9.\e[35m$(tput bold)OBS Studio$(tput sgr0)\e[0m     10.\e[35m$(tput bold)Spotify$(tput sgr0)\e[0m"  
echo ""
echo ""

read -p "Enter space-separated serial numbers: " input
IFS=" " read -ra numbers <<< "$input"

pkgArray=('VS Code' 'Git' 'C/C++ Compiler' 'Python 3' 'Java' 'Chromium' 'Brave' 'Firefox' 'OBS Studio' 'Spotify')


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
    sudo apt-get install wget
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
        elif [ "$number" == "6" ]; then
            echo "Installing Chromium"
            sudo apt install chromium
        elif [ "$number" == "7" ]; then
            echo "Installing Brave"
            sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
            sudo apt update
            sudo apt install brave-browser
        elif [ "$number" == "8" ]; then
            echo "Installing Firefox"
            sudo install -d -m 0755 /etc/apt/keyrings
            wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
            gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
            echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
            echo '
            Package: *
            Pin: origin packages.mozilla.org
            Pin-Priority: 1000
            ' | sudo tee /etc/apt/preferences.d/mozilla
            sudo apt-get update && sudo apt-get install firefox
        elif [ "$number" == "9" ]; then
            echo "Installing OBS Studio"
            sudo apt install obs-studio
        elif [ "$number" =="10"]; then
            echo "Installing Spotify"
            curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
            echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
            sudo apt-get update && sudo apt-get install spotify-client
        fi
    done
else
    echo -e "$pass\ny" | sudo -S sudo apt update
    echo -e "$pass\ny" | sudo -S sudo apt upgrade
    echo -e "$pass\ny" | sudo -S sudo apt-get install wget
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
        elif [ "$number" == "5" ]; then
            echo "Installing Java"
            echo -e "$pass\ny" | sudo -S sudo apt install default-jre
        elif [ "$number" == "6" ]; then
            echo "Installing Chromium"
            echo -e "$pass\ny" | sudo -S sudo apt install chromium
        elif [ "$number" == "7" ]; then
            echo "Installing Brave"
            echo -e "$pass\ny" | sudo -S sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
            echo -e "$pass\ny" | sudo -S echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
            echo -e "$pass\ny" | sudo -S sudo apt update
            echo -e "$pass\ny" | sudo -S sudo apt install brave-browser
        elif [ "$number" == "8" ]; then
            echo -e "$pass\ny" | sudo -S echo "Installing Firefox"
            echo -e "$pass\ny" | sudo -S sudo install -d -m 0755 /etc/apt/keyrings
            echo -e "$pass\ny" | sudo -S wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
            echo -e "$pass\ny" | sudo -S gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
            echo -e "$pass\ny" | sudo -S echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
            echo -e "$pass\ny" | sudo -S echo '
            Package: *
            Pin: origin packages.mozilla.org
            Pin-Priority: 1000
            ' | sudo tee /etc/apt/preferences.d/mozilla
            echo -e "$pass\ny" | sudo -S sudo apt-get update && sudo apt-get install firefox
        elif [ "$number" == "9" ]; then
            echo "OBS Studio"
            echo -e "$pass\ny" | sudo -S sudo apt install obs-studio
        elif [ "$number" == "10" ]; then
            echo "Installing Spotify"
            echo -e "$pass\ny" | sudo -S curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
            echo -e "$pass\ny" | sudo -S echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
            echo -e "$pass\ny" | sudo -S sudo apt-get update && sudo apt-get install spotify-client
        fi
    done

fi

echo -e "$pass\ny" | sudo -S sudo apt autoremove
echo ""
echo ""
echo -e "\e[32mHappy Hacking...!\e[0m"
echo ""
echo ""
