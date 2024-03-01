#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"
winningGoals="$($PSQL "SELECT SUM(winner_goals) FROM games")"
opponentGoals="$($PSQL "SELECT SUM(opponent_goals) FROM games")"
# totalGoals="$($PSQL "SELECT $winningGoals + $opponentGoals AS result")"
averageWinningGoals="$($PSQL "SELECT AVG(winner_goals) FROM games")"
# averageTotalGoals="$($PSQL "SELECT AVG($totalGoals) FROM games")"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo $winningGoals

echo -e "\nTotal number of goals in all games from both teams combined:"
echo  "$($PSQL "SELECT $winningGoals + $opponentGoals  AS result")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo $averageWinningGoals

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND($averageWinningGoals, 2) AS result")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "
  SELECT AVG(winner_goals + opponent_goals) AS average FROM games
")" 

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "
  SELECT MAX(winner_goals) FROM games
")" 

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo  "$($PSQL "
  SELECT COUNT(*) FROM games WHERE winner_goals > 2
")"

echo -e "\nWinner of the 2018 tournament team name:"
echo  "$($PSQL "
  SELECT name FROM teams JOIN games ON games.winner_id = teams.team_id WHERE round='Final' AND year=2018 
")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$(
  $PSQL "
    SELECT name FROM teams WHERE team_id IN (SELECT winner_id FROM games WHERE year = 2014 AND round = 'Eighth-Final')
    UNION
    SELECT name FROM teams WHERE team_id IN (SELECT opponent_id FROM games WHERE year = 2014 AND round = 'Eighth-Final')
    ORDER BY name ASC
")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT teams.name AS winning_team FROM games JOIN teams ON games.winner_id = teams.team_id ORDER BY winning_team")"

echo -e "\nYear and team name of all the champions:"
echo  "$($PSQL "SELECT year, name FROM games INNER JOIN teams ON games.winner_id = teams.team_id WHERE round='Final' ORDER BY games.year ASC")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"
