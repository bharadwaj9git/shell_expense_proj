# printing
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

#system special variables
# if we want to give input from system then special variables comes
# $0 $1 $2 .....$n
# $#,$*,$?

echo script name - $0
echo first arguments - $1
echo all arguments - $*
echo no.of arguments - $#

# command substitution  var = $(command)  if we use (()) for arithmetic substitution
# command
LS=$(ls)

echo $LS

#arithematic

var=$((10+50))
echo $var



# $? it will give exit status
# $# for no of arguments
# $* for all values

ls
echo exit status - $?
# exit state 0 -success
# 1-255 failure

# redirectors

echo -e "\e[31m create output log file \e[0m"
touch opt
echo -e "\e[31m sending ls output to log file \e[0m"
ls > opt
echo -e "\e[31m viewing content in log file \e[0m"
cat opt


# "<" input ">" output
#  2> to store error output
# &> it will combine both o/p and error o/p
# >> will append content, so we use &>>   ex: dnf install nginx -y &>> /tmp/expense.log will use in our porject


