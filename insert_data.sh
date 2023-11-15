#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# TRUNCATE TABLE games, teams;
$PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY ;"

#loop through lines
cat games.csv | while IFS="," read YEAR ROUND WINNER OPP WINNERGOALS OPPGOALS
do
if [[ $YEAR != 'year' ]]
then
  echo "$YEAR $WINNER"

  #get winner ID
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")

  #if null, add team to teams table, then get assigned ID
  if [[ -z $WINNER_ID ]]
  then
    echo "$WINNER id not found"
    INSERT_WINNER_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")"
    if [[ $INSERT_WINNER_RESULT == 'INSERT 0 1' ]]
    then 
      echo "Inserted $WINNER, to teams table (winner)"
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi
  fi

  # get opponent ID
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP';")

  # if null, add opp to teams table
  if [[ -z $OPP_ID ]]
  then
    echo "$OPP id not found"
    INSERT_OPP_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$OPP');")"
    if [[ $INSERT_OPP_RESULT == 'INSERT 0 1' ]]
    then 
      echo "Inserted $OPP, to teams table (opp)"
      OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP';")
    fi
  fi
  # insert entry into games table and return result
  INSERT_ENTRY_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPP_ID, $WINNERGOALS, $OPPGOALS);")
  if [[ $INSERT_ENTRY_RESULT == 'INSERT 0 1' ]]
  then 
    echo "Entry inserted into games table"
  fi
fi
done
