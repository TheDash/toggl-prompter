#!/bin/bash

echo "Spawning Toggl GUI.."

OUTPUT=$(zenity --forms --separator="," --text="Toggl Entry" --add-entry=Description --add-entry="Project (Ex: GOO01)" --add-entry="Duration (Ex: 00:43:21)" ) 

echo "$OUTPUT"
case $? in
    1)
        echo "Using last time entry"
        exit 0
        ;;
        
    -1)
        echo "Using last time entry"
        exit 0
        ;;
esac

IFS="," read -a togglinput <<< "$OUTPUT"

    

echo  "${togglinput[0]}" "@${togglinput[1]}" "'d'${togglinput[2]}"

/usr/bin/toggl.py add ${togglinput[0]} "@${togglinput[1]}" 'd'${togglinput[2]}


