echo hello world

echo -e "\e[31m hello world \e[0m"
echo -e "\e[32m hello world \e[0m"
echo -e "\e[33m hello world \e[0m"
echo -e "\e[34m hello world \e[0m"
echo -e "\e[35m hello world \e[0m"
echo -e "\e[36m hello world \e[0m"

# variable declaration and accessing variable
#user defined variable
x=10
echo x value is $x
echo x value is ${x}

#system variables
# $0 $1 $2 .....$n
# $#,$*,$?

# $? it will give exit status

ls
echo exit state - $?

# exit state 0 -success
# 1-255 failure