#!/bin/bash
#SYSTEM-UPDATE
#SYSTEM MADE FOR AN APT LINUX SYSTEM UPDATE

#BANNER 
echo --------------------
echo ---SYSTEM-UPDATE----
echo --------------------

#CHECK STATUS FOR FAILS IN EXECUTION OF COMANDS 
check_exist_status()
{
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
        case $answer in
            y)
                exit 1
            ;;
            Y)
                exit 1
            ;;
            n)
                echo Okay
            ;;
             n)
                echo Okay
            ;;
        esac
    fi
}

upadate()
{
    

    case $OPTION in 
        Y)
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
        ;;
        y)
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
        ;;

        #CONDITIONAL IF ANSWER IN NO

        n)
            bye
        ;;
        N)
            bye
        ;;

        #DEFAULT ANSWER

        *)
            
        ;;
    esac

}

bye()
{

    echo ----------------------------------
    echo ------------Bye-------------------
    echo ----------------------------------
    exit 1

}

#ASKING TO SEE AVAIBLE UPDATES
echo "Do you want to see if there are updates available?  Y/N" 
read LISTA

#MAKING A CONDITIONAL TO SEE UPDATES
case $LISTA in 
    #IF TE ANSWER IS YES
    Y)
        
        echo ----------------------------------
        echo "These are your available updates"
        echo ----------------------------------

        apt list --upgradable 
        check_exist_status

        #ASK TO APPLY UPDATES

        echo ------------------------------------------
        echo " Do you want to apply these updates? Y/N"
        read OPTION
        echo ------------------------------------------

        #CONDITIONAL IF ANSWER IS YES

        upadate
    
    ;;

    #CONDITIONAL FOR ANSWER YES

    y)
        
        echo ----------------------------------
        echo "These are your available updates"
        echo ----------------------------------

        apt list --upgradable 
        check_exist_status

        #ASK TO APPLY UPDATES

        echo ------------------------------------------
        echo " Do you want to apply these updates? Y/N"
        read OPTION
        echo ------------------------------------------

    #CONDITIONAL IF ANSWER IS YES

        upadate
        
    ;;

 #IF ANSWER IS NO TO SE UPDATES

    n)
        #ASK TO UPDATE ANYWAY
        echo ------------------------------------------
        echo " WANT TO UPGRADE ANYWAY? Y/N"
        read OPTION
        echo ------------------------------------------

        upadate
    ;;
    N)
        #ASK TO UPDATE ANYWAY
        echo ------------------------------------------
        echo " WANT TO UPGRADE ANYWAY? Y/N"
        read OPTION
        echo ------------------------------------------

        upadate
        
    #DEFAULT OPTION
    
    
esac

