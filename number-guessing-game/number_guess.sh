#!/bin/bash
# dB setup
db="psql --username=freecodecamp --dbname=postgres -t --no-align -c "
$db "CREATE DATABASE number_guess"
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c "

$PSQL "
  CREATE TABLE users
  (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(30),
    games_played INT,
    best_game INT
  );

  CREATE TABLE games
  (
    game_id SERIAL PRIMARY KEY,
    total_turns INT,
    user_id INT,
    number_to_guess INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
  );
"



# GLOBAL VARIABLES
NUMBER_TO_GUESS=$((RANDOM % 1000 + 1))
echo "answer: $NUMBER_TO_GUESS"
USERNAME=""
USER_ID=""
USER_GAMES_PLAYED=""
CURRENT_GUESS=""
GUESS_MESSAGE="Guess the secret number between 1 and 1000:"
GAME_NUMBER_OF_GUESSES=0

# METHODS
get_user_name() {
  echo "Enter your username:"
  read USERNAME
}

greet_user() {
  found_user=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'" -tA)
  if [ -z "$found_user" ]; then
    new_user=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0)")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    USER_GAMES_PLAYED=0
    # echo "user id $USER_ID"
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    IFS='|' read -ra user_array <<< "$found_user"
    USER_ID="${user_array[0]}"
    USER_BEST_GAME=$($PSQL "SELECT total_turns FROM games JOIN users ON games.user_id = users.user_id WHERE users.user_id = $USER_ID ORDER BY total_turns ASC LIMIT 1")
    USER_GAMES_PLAYED=$($PSQL "SELECT COUNT(*) AS num_games FROM games WHERE user_id = $USER_ID")
    echo "
      Welcome back, $USERNAME! You have played $USER_GAMES_PLAYED games, and your best game took $USER_BEST_GAME guesses.
    "
  fi
}

collect_guess() {
  echo "$GUESS_MESSAGE"
  read CURRENT_GUESS
  ((GAME_NUMBER_OF_GUESSES++))

  while ! [[ "$CURRENT_GUESS" =~ ^[0-9]+$ ]]; do
    GUESS_MESSAGE="That is not an integer, guess again:"
    collect_guess
  done
}


# PROGRAM FLOW
get_user_name
greet_user
collect_guess

while [ "$CURRENT_GUESS" != "$NUMBER_TO_GUESS" ]; do
  if [ $CURRENT_GUESS -lt $NUMBER_TO_GUESS ]; then
    GUESS_MESSAGE="It's higher than that, guess again:"
  else
    GUESS_MESSAGE="It's lower than that, guess again:"
  fi
  collect_guess
done


echo "You guessed it in $GAME_NUMBER_OF_GUESSES tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

# echo "user id: $USER_ID"
# echo "number of guesses: $GAME_NUMBER_OF_GUESSES"
# echo "number to guess: $NUMBER_TO_GUESS"
make_game=$($PSQL " INSERT INTO games(user_id, total_turns, number_to_guess) VALUES($USER_ID, $GAME_NUMBER_OF_GUESSES, $NUMBER_TO_GUESS)")

exit 0