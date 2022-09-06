#!/bin/bash
#SYSTEM-UPDATE

figlet SYSTEM-UPDATE

echo "Do you want to see if there are updates available?  Y/N" 
read LISTA

case $LISTA in 
    Y)
        echo "These are your available updates"
        apt list --upgradable 
        
    ;;
    y)
        echo "These are your available updates"
        apt list --upgradable   
    ;;
    n)
        echo "Bye"
        exit 1
    ;;
    N)
        echo "Bye"
        exit 1
    ;;
    *)
        echo "Bye"
        exit 1
    ;;
    
esac
echo " Do you want to apply these updates? Y/N"
read OPTION

case $OPTION in 
    Y)
        sudo apt update
        sudo apt upgrade
        sudo apt autoclean
        sudo apt -s autoremove
        apt list --upgradable
        figlet SYSTEM UPGRADE COMPLETE
    ;;
    y)
        sudo apt update
        sudo apt upgrade
        sudo apt autoclean
        sudo apt -s autoremove
        apt list --upgradable  
        figlet SYSTEM UPGRADE COMPLETE
    ;;
    n)
        echo "Bye"
        exit 1
    ;;
    N)
        echo "Bye"
        exit 1
    ;;
    *)
        echo "Bye"
        exit 1
    ;;
    
esac