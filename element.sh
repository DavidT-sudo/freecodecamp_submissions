#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then

  echo "Please provide an element as an argument."

else

  ELEM=$1

  if [[ $ELEM =~ ^[0-9]+$ ]]
  then
    GET_INFO=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ELEM;")
    echo "$GET_INFO" | while IFS="|" read ATOMIC_NUM NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
    do
    if [[ -z $GET_INFO ]]
    then
      echo "I could not find that element in the database."

    else
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    
    fi
    done

  else
    GET_INFO=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$ELEM' OR name='$ELEM';")
    echo "$GET_INFO" | while IFS="|" read ATOMIC_NUM NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
    do
    if [[ -z $GET_INFO ]]
    then
      echo "I could not find that element in the database."

    else    
    echo -e "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting_point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    
    fi
    done
  fi

fi
