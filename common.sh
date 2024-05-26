heading(){
  echo -e "\e[36m$*\e[0m"
}

status(){
  if [ $1 -eq 0 ]; then
  echo success
  else
  echo failure
  exit 2
  fi
}