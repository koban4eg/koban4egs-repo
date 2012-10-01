#!/bin/bash

myfind(){
for i in $(ls $1)
do
    check=`echo "$1/$2" | grep -io "$1/$i"`  
    [ $check ] && [ -$3 $1/$i ] && echo $1/$i
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
