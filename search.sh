#!/bin/bash

#  writed by xiaota  beihang university
#  taxuxiang@buaa.edu.cn

#  using environment "bash"

#  using method
#  $bash search.sh  filename|abs_directory_name  "keyword"

#  result 
#  first line===== keyword line which set in object file
#  finnal==== how many files are there finds the keyword


echo "=====STARTING========"
# must have two arguments
if [ $# != 2 ]
then
	echo " no enough argument"
	exit 2
fi

#set the count for counting whole number
count=0

Find_file()
{
	cat -n "$1" | grep --color "$2"
#find successfully
	if [ $? == 0 ]
	then
		let count+=1
		echo "=======FIND $1=========="
		echo ""
	fi
}

#find directory recursivly
Find_directory()
{
	
	for i in $(ls $1)
	do
		if [ -d "$1/$i" ]
		then
			Find_directory "$1/$i" "$2"
		elif [ -f "$1/$i" ]
		then
			Find_file "$1/$i" "$2"
		fi
	done

}

#the shell starting from here
if [ -d $1 ]
then
	echo $1
	Find_directory "$1" "$2"
elif [ -f $1 ]
then
	Find_file "$1" "$2"
fi



if [ $count == 0 ]
then 
	echo "!!!!!!!!NOTHING FIND"
fi
echo "=====FIND all($count)===="
echo "=====END============="
