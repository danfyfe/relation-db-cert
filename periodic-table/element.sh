# no argument given:
if [ $# -eq 0 ]; then
    echo "Please provide an element as an argument."
    exit 0
fi

# for finding argument type
get_variable_type() {
  local value="$1"
    if [[ "$value" =~ ^[0-9]+$ ]]; then
        echo "integer"
    else
        echo "string"
    fi
}

elementArg="$1"
argument_type=$(get_variable_type "$elementArg")


PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
# input 'element' can be the atomic_number, name, or symbol
found_element=""

# check finds type to fix some issue with the variables being injected into the SQL statements
if [[ -z "$argument_type" || "$argument_type" == "string" ]]; then
    found_element="$(
      $PSQL "
      SELECT
        elements.atomic_number,
        elements.name,
        elements.symbol,
        types.type,
        properties.atomic_mass,
        properties.melting_point_celsius,
        properties.boiling_point_celsius
      FROM elements
      LEFT JOIN properties ON elements.atomic_number = properties.atomic_number
      LEFT JOIN types ON properties.type_id = types.type_id
      WHERE symbol = '$elementArg' OR name = '$elementArg';"
    )"
else
    found_element="$(
      $PSQL "
      SELECT
        elements.atomic_number,
        elements.name,
        elements.symbol,
        types.type,
        properties.atomic_mass,
        properties.melting_point_celsius,
        properties.boiling_point_celsius
      FROM elements
      LEFT JOIN properties ON elements.atomic_number = properties.atomic_number
      LEFT JOIN types ON properties.type_id = types.type_id
      WHERE elements.atomic_number = $elementArg;"
    )"
fi


if [ -z "$found_element" ]; then
  # element not found:
  echo "I could not find that element in the database."
else
  # element found:
  # return column names as string
  column_names=$(echo "$found_element" | awk 'NR==1 {print}')
  # convert column names to array
  IFS='|' read -r -a columns <<< "$column_names"
  # there is probably a better way to do this
  atomic_number="${columns[0]}"
  name="${columns[1]}"
  symbol="${columns[2]}"
  type="${columns[3]}"
  atomic_mass="${columns[4]}"
  melting_point_celsius="${columns[5]}"
  boiling_point_celsius="${columns[6]}"
  echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
fi

exit 0