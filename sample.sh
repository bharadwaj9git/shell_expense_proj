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
echo all arguments - "$*"
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


# functions
#declaring function
print_hello()
{
  echo hello world
}
# to call function we just simply

print_hello

# functions can access main program variables and vice versa

print_hello()
{
  echo hello world
  echo accessing variable from main program $x
  y=35
}

print_hello
echo function value - $y

# function have its own inputs

inputs_fn(){
  echo first value - $1
  echo second value - $2
  echo no of args - $#
}

inputs_fn 123 456

# conditions
# if condition

#simple if: if [expression]; then commands fi
#if else:  if [expression]; then commands else command fi
#else if: if [exp1] then commands else if[exp2] then commands else commands fi

# every thing expression will categorise numbers -- -eq(equal),-ne(notequal),-lt(lessthan),-gt(graterthan),-le(lessthan or equals)
# ,-ge (graterthan or equql to) if string ==,!=,-z
# -z for variables check if [ -z "$1/" ]; then echo no variable fi
# if file expression -e [-e /opt/sai.sh] to check file exists or not
#man.bash.com to check more commands

a=10
if [ $a -gt 5 ]; then
echo $a graterthan 5
fi

marks=60
if [ $marks -gt 70 ]; then
echo $a firstclass
elif [ $marks -lt 70 ]; then
echo $marks secondclass
else echo fail
fi

# always prefer to use "" for variables in conditions
#"like exit in conditions, in functions we will user return in functions as well"

sample()
{
  echo hello
  return 10
}

sample
echo return status - $?