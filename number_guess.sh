#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Generate random number between 1 and 1000
NUM=$(( 1 + RANDOM % 1000 ))
echo $NUM


#Prompt username and read it
echo "Enter your username:"
read USERNAME

#Search username on database
GET_USER=$($PSQL "SELECT username, COUNT(username), MIN(tries) FROM games WHERE username='$USERNAME' GROUP BY username;")

#check result of search
if [[ -z $GET_USER ]]
then
  #if user is a first timer
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

else
  echo $GET_USER | while IFS="|" read USRNAME GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USRNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
  done

fi

echo -e "\nGuess the secret number between 1 and 1000:"
TRY=0

while true; 
do
((TRY++))
read GUESS

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"

  else

    if [[ $GUESS -eq $NUM ]]
    then
      echo "You guessed it in $TRY tries. The secret number was $NUM. Nice job!"
      break

    else
    #if lower
      if [[ $NUM -gt $GUESS ]]
       then
        echo "It's higher than that, guess again:"

      else
      #if higher
        echo "It's lower than that, guess again:"

      fi

    fi
     
  fi


done

INSERT_USR=$($PSQL "INSERT INTO games(username, tries) VALUES('$USERNAME', $TRY);")


  
