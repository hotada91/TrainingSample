#!/bin/bash

# LOCAL VARIABLE
# Define with "local" keyword
# Variables visible only within a code block or function

setLocalVar() {
    local localVar="Local"
    echo "Local Variable: $localVar"
    globalVar="Global"
    echo $BASHPID
}

setLocalVar
echo "setLocalVar local variable: $localVar"
echo "Global variable: $globalVar"
( echo "Global variable in subshell: $globalVar" )

/bin/bash -c "echo GlobalVariable: $globalVar"  # ?
/bin/bash -c "echo GlobalVariable: \$globalVar"

# ENVIRONMENTAL VARIABLES
export ExportVariable="I'm export variable"
printenv | grep "ExportVariable"
/bin/bash -c 'echo ExportVariable: $ExportVariable'

# POSITIONAL PARAMETERS
# Arguments passed to the script from the command line : $0, $1, $2, $3 . . .

# $0 is the name of the script itself
# ? What is value of $0 in interactive terminal
echo $0 
/bin/bash -c 'echo $0'
/bin/sh -c 'echo $0'

test_func()
{
    echo "Num of params: $#"
    echo "All params: $@"
    echo "All params: $*"

    scriptName=$0
    arg1=$1
    arg2=$2
    
    # The shift command reassigns the positional parameters, in effect shifting them to the left one notch.
    # $1 <--- $2, $2 <--- $3, $3 <--- $4, etc.
    # The old $1 disappears, but $0 (the script name) does not change
    shift  
    arg3=$2

    echo $scriptName: $arg1 $arg2 $arg3
   
}
test_func "One" "Two" "Three"
./PrintParams.sh "One" "Two" "Three"

# EXIT STATUS
# $? is especially useful for testing the result of a command in a script
# Every command returns an exit status (sometimes referred to as a return status or exit code). A successful command returns a 0, while an unsuccessful one returns a non-zero value that usually can be interpreted as an error code.
# $? reads the exit status of the last command executed.

success_func()
{
    echo "Success"
}
fail_func()
{
    not_existed_command
}

fail_func
echo "fail_func exit status: $?"
if [[ $? == 0 ]]; then echo "Result: Success"; fi     # ?

success_func
status=$?
echo "success_func exit status: $status"
if [[ $status == 0 ]]; then echo "Result: Success"; fi

/bin/bash -c "exit 12"
echo "Executed script: exit status: $?"

# IFS(Internal Field Separator)