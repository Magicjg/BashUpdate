#!/bin/bash
#SYSTEM-UPDATE
#SYSTEM MADE FOR AN APT LINUX SYSTEM UPDATE

#BANNER 
echo --------------------
echo ---SYSTEM-UPDATE----
echo --------------------


bye()
{

    echo ----------------------------------
    echo ------------Bye-------------------
    echo ----------------------------------
    exit 1

}
check_exist_status()
{
    #CHECK STATUS FOR FAILS IN EXECUTION OF COMANDS 
    #CONDITIONAL IF TO READ DE EXIT OF COMANDS
    if [ $? = '0' ];
    then
            echo
            echo "Success"
            echo
    else
            echo
            echo "[Error] Process failed!"
            echo

            read -p "The last command exited with an error. exit script? (Y/N) " answer

        #CONDITIONAL FOR QUIT OUT OF PROGRAM IF A COMAND FAIL
        if [[ $answer == [yY] ]];
        then
            bye
            exit 1 
        elif [[ $answer == [nN] ]];
        then
            echo Okay
        fi
    fi
}

upadate()
{ 
    if [[ $OPTION == [yY] ]];
        then
        
            sudo apt update
            check_exist_status
            sudo apt upgrade 
            check_exist_status
            sudo apt autoclean
            check_exist_status
            sudo apt -s autoremove
            check_exist_status
            apt list --upgradable  
            check_exist_status

            echo ---------------------------
            echo --SYSTEM UPGRADE COMPLETE--
            echo ---------------------------
    
        #CONDITIONAL IF ANSWER IN NO
    elif [[ $OPTION == [nN] ]];
        then        
            bye
    else #DEFAULT ANSWER
            bye
    fi
}

#ASKING TO SEE AVAIBLE UPDATES
echo "Do you want to see if there are updates available?  Y/N" 
read LISTA
if [[ $LISTA == [yY] ]]; then   
        echo ----------------------------------
        echo "These are your available updates"
        echo ----------------------------------
        apt list --upgradable 
        check_exist_status
        #ASK TO APPLY UPDATES
        echo ------------------------------------------
        echo "Do you want to apply these updates? Y/N"
        read OPTION
        echo ------------------------------------------
        #CONDITIONAL IF ANSWER IS YES
        upadate
elif [[ $LISTA == [nN] ]]; then
        #ASK TO UPDATE ANYWAY
        echo ------------------------------------------
        echo "WANT TO UPGRADE ANYWAY? Y/N"
        read OPTION
        echo ------------------------------------------
        if [[ $OPTION == [yY] ]]; then
            upadate
        elif [[ $OPTION == [nN] ]]; then
            bye
        else
            bye
        fi
        
    else
        bye
fi


