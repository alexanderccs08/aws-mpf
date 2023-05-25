#!/bin/bash

#########################################################
# version 1.0                                           #
# Awsp.sh                                               #
# This small project is aimed at AWS account profile    # 
# management                                            #
#                                                       #
#                                                       #
# Alexander, 2023 May.                                  #
#########################################################

# Definition Functions

# Validation function and warning
function validOption(){

    OV=$1       # First parameter for Option Value
    
    if [ -z "$OV" ]; then
        echo
        echo -e '\033[31;1m Type a valid option!!! \033[m'
        
    fi    
}

# Function create Profiles
function createProfiles(){

    printf "\nType Profile Name: "
    read NPF
    aws configure --profile $NPF

}

# Function List Profiles
function listProfiles(){

    if [ -s "$HOME/.aws/credentials" ]; then
        printf "\nProfiles found\n"
        ct=1
        for line in `cat $HOME/.aws/credentials | grep "\[" | sed -e 's/\[//g' | sed -e 's/\]//g'`
        do
            echo $ct - $line
            ct=`expr $ct + 1`    
        done
        echo "=============================================="

        printf "\nWould you like to use one of them? [y/n]: "
        
        read OPT
        
        if [ "$OPT" == "" ]; then            
            validOption $OPT
            
        elif [ "$OPT" == 'y' ] || [ "$OPT" == 'Y' ]; then
            printf "\nType profile name: "
            read PN          

            # Verify profile in credentials
            CK=`grep $PN $HOME/.aws/credentials`
            if [ $? -eq 1 ]; then
                validOption
            else
                export AWS_PROFILE=$PN
                printf "\nEnvironment variable AWS_PROFILE has a new value, is: $PN\n"
            fi

        elif [ "$OPT" == 'n' ] || [ "$OPT" == 'N' ]; then            
            exit
        else
            validOption        
        fi        
        
    else
        printf "\nNo Profiles\n"
        printf "Would you like to create it? [y/n]: "
        read OPT
        
        if [ "$OPT" == "" ]; then            
            validOption "$OPT"

        elif [ "$OPT" == 'y' ] || [ "$OPT" == 'Y' ]; then
            createProfiles

        elif [ "$OPT" == 'n' ] || [ "$OPT" == 'N' ]; then
            exit
        else
            validOption
        fi
        
    fi
}

# Function Menu option
function menuMain(){

    LOOP='True'
    while [ "$LOOP" == 'True' ]; do
        printf "\n### Management Profiles AWS ###\n\n"
        printf "1 - List AWS Profiles\n"
        printf "2 - Configure new credential\n"
        printf "3 - Exit\n"

        printf "\nChoose one option: "
        read AN
        validOption $AN

        if [ "$AN" == '1' ]; then
            listProfiles
        elif [ "$AN" == '2' ]; then
            createProfiles
        elif [ "$AN" == '3' ]; then
            LOOP='False'
        fi
    done
}

menuMain