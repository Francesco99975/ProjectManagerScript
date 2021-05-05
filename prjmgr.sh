#! /usr/bin/bash
mkdir -p ~/.config/prjmgr
cd ~/.config/prjmgr
tmp="tmp.txt"
program=code

if [ "$1" = 'run' ]
then
    p=0
    for arg in "${@:2}"
    do
        if [ $p -eq 1 ]
        then
            program=$arg
            p=$((0))
        fi

        if [ "$arg" = "--program" ]
        then
            p=$((1))
        fi
    done

    for arg in "${@:2}"
    do
        if [ "${arg:0:2}" = "--" ]
        then
            break
        fi
        $program $arg
    done
elif [ "$1" = 'ls' ]
then
    echo DIRS PROJECT_NAME > $tmp
    for entry in ./*
    do
        if [ ${entry:2} != $tmp ]
        then
            wc -l ${entry:2} >> $tmp
        fi
    done
    column -t "tmp.txt"
elif [ "$1" = 'create' ]
then
    for arg in "${@:3}"
    do
        echo "$arg" >> "$2.txt"
    done
elif [ "$1" = 'start' ]
then
    p=0
    for arg in "${@}"
    do
        if [ $p -eq 1 ]
        then
            program=$arg
            p=$((0))
        fi

        if [ "$arg" = "--program" ]
        then
            p=$((1))
        fi
    done

    if [ -f "$2.txt" ]
    then
        i=0
        while read x
        do
            array[$i]=$x
            i=$(($i + 1))
        done < "$2.txt"

        i=$(($i - 1))

        for n in $(seq 0 $i)
        do
            $program ${array[$n]}
        done
    else
        echo "Project not found!"
    fi
elif [ "$1" = 'delete' ]
then
    if [ -f "$2.txt" ]
    then
        rm "$2.txt"
    else
        echo "Project not found!"
    fi
else
    echo "Command not found!"
fi