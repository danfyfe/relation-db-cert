#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=postgres -c"
$PSQL "
  CREATE DATABASE salon;
"

SALON="psql --username=freecodecamp --dbname=salon -c"
$SALON "
  CREATE TABLE customers
  (
    customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(30) UNIQUE,
    name VARCHAR(30)
  );


  CREATE TABLE services
  (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE
  );


  CREATE TABLE appointments
  (
    appointment_id SERIAL PRIMARY KEY,
    time VARCHAR(30),
    customer_id INT,
    service_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
  );

  INSERT INTO services
  (name)
  VALUES('cut');

  INSERT INTO services
    (name)
  VALUES('color');

  INSERT INTO services
    (name)
  VALUES('perm');

  INSERT INTO services
    (name)
  VALUES('style');

  INSERT INTO services
    (name)
  VALUES('trim');
"
# GLOBALS
SERVICE_ID_SELECTED=""
SELECTED_SERVICE_NAME=""
SERVICE_TIME=""
CUSTOMER_PHONE=""
CUSTOMER_NAME=""
CUSTOMER_ID=""
SERVICE_TIME=""

initial_greeting='Welcome to My Salon, how can I help you?'
no_service_found='I could not find that service. What would you like today?'
# TODO refactor to not be hardcoded
# services=$SALON "SELECT * FROM services;"
available_services='
  1) cut
  2) color
  3) perm
  4) style
  5) trim
'

# get and set selected service
get_service_id() {
  if [ $1 == 'initial' ]; then
  echo "
    $initial_greeting
    $available_services
  "
  else 
      echo "
    $no_service_found
    $available_services
  "
  fi
  read SERVICE_ID_SELECTED
}

#  get and set phone number
get_customer_phone() {
  echo "What's your phone number?"
  read CUSTOMER_PHONE
}

# get and set customer name
get_customer_name() {
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  new_customer=$($SALON "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
}

# get and set SERVICE_TIME
get_service_time() {
  echo "What time would you like your $SELECTED_SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
}

# success message
display_success_message() {
  echo "I have put you down for a $SELECTED_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

##########
# main program flow
##########
get_service_id "initial"

while true; do
  service=$($SALON "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED" -tA)

  if [ -z "$service" ]; then
    # service not found
    get_service_id
  else
    # service found
    IFS='|' read -ra service_array <<< "$service"
    SELECTED_SERVICE_NAME="${service_array[1]}"
    get_customer_phone
    break
  fi
done

while true; do
  customer=$($SALON "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE'" -tA)

  if [ -z "$customer" ]; then
    # customer not found
    get_customer_name
  else
    # customer found
    IFS='|' read -ra customer_array <<< "$customer"
    CUSTOMER_ID="${customer_array[0]}"
    CUSTOMER_NAME="${customer_array[2]}"
    get_service_time
    break
  fi
done

# create appointment
appointment=$($SALON "
  INSERT INTO appointments(service_id, customer_id, time)
  VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')
")


# success message
display_success_message

exit 0