#!/bin/bash

myfind(){
for i in $(ls $1)
do
    target=`echo "$1/$i" | tr [:lower:] [:upper:]`
    sample=`echo "$1/$2" | tr [:lower:] [:upper:]`
    #echo TARGET $1/$i SAMPLE $1/$2
    check=`echo "$1/$2" | grep -io "$1/$i"`  

    if [ $target = $sample ] && [ -$3 $1/$i ]
    then	
        echo $1/$i
    fi
    [ -d $1/$i ] && myfind $1/$i $2 $3
done
}


ftype=e
dir=$1
shift
until [ -z "$1" ] 
do
    case $1 in
        -type  ) ftype=$2;;
        -iname ) file=$2;;
    esac
    shift
    shift
done

case $ftype in
    s ) ftype=S;;
    l ) ftype=L;;
esac

myfind $dir $file $ftype
