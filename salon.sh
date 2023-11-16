#! /bin/bash
PSQL="psql --tuples-only --username=freecodecamp --dbname=salon -c"

echo -e "\n~~~ MY SALON ~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1 !!!!!"
  fi

  echo -e "\nHow can we help you?"
  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id;")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  
  read SERVICE_ID_SELECTED
  
  #if option invalid
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID ]]
  then
    MAIN_MENU "INVALID SELECTION" 
  
  else  
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  FSERVICE_NAME=$(echo $SERVICE_NAME | sed 's/ //g' )

  #get customer phone number
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE

  #get customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  FCUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ //g')

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nPlease enter your name:"
    read CUSTOMER_NAME

    #add to customers table
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    if [[ $INSERT_CUSTOMER == 'INSERT 0 1' ]]
    then
      echo -e "Inserted new customer ,$CUSTOMER_NAME ($CUSTOMER_PHONE)"
    else
      MAIN MENU "error inserting customer"
    fi
  fi

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #add appointment
  echo -e "\nWhat time do you want your$SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  if [[ $INSERT_APPOINTMENT == 'INSERT 0 1' ]]
  then
    echo -e "I have put you down for a $FSERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    MAIN_MENU "___Error making appointment!!!"
  fi

  fi

}


MAIN_MENU
