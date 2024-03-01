#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
VALUES=""
while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
  winnerEmptyOrTeamId="$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")"
  if [ -z "$winnerEmptyOrTeamId" ]; then
    stuff1="$($PSQL "INSERT INTO teams (name) VALUES('$winner');")"
  else
    echo "winner: $winnerEmptyOrTeamId already exists"
    echo " "
  fi

  opponentEmptyOrTeamId="$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")"
  if [ -z "$opponentEmptyOrTeamId" ]; then
    stuff2="$($PSQL "INSERT INTO teams (name) VALUES('$opponent');")"
  else
    echo "opponent: $opponentEmpty already exists"
    echo " "
  fi

  winnerId="$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")"
  opponentId="$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")"

  makeGame="$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', $winnerId, $opponentId, $winner_goals, $opponent_goals)")"



done < <(tail -n +2 games.csv)

echo $VALUES