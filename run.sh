

FONTS=( "Abel:400" "Acme:400" "Advent Pro:400" "Aladin:400" "Alice:400" "Amiri:400" "Anonymous Pro:400" "Baumans:400" "Butterfly Kids:400" "Cabin:400" "Caesar Dressing:400" "Crimson Text:400" "Diplomata:400" "Eagle Lake:400" "Elsie:400" "Faster One:400" "Lora:400" "Metal Mania:400" "Open Sans:400" "Old Standard TT:400" "Press Start 2P:400" "Rubik:400" "Sofia:400" "Warnes:400" )

RESULT_FILE=result.js

printf >"$RESULT_FILE"

printf >>"$RESULT_FILE" "{\n\tfonts:[\n"

for FONT_NAME_FULL in "${FONTS[@]}"
do

FONT_NAME=$(echo "${FONT_NAME_FULL%%:*}")
FONT_NAME_LOWERCASE=$(echo "${FONT_NAME,,}")
FONT_NAME_SNAKE=$(echo "${FONT_NAME_LOWERCASE// /_}")

CSS_PATH=../assets/fonts/editor/$FONT_NAME_SNAKE/
DESTINATION=/home/soil/whale/priv/drooky/app/assets/fonts/editor/$FONT_NAME_SNAKE/

CSS_FILE=fonts.css


printf " %s \n %s \n %s \n %s\n" "$FONT_NAME_FULL" "$CSS_FILE" "$CSS_PATH" "$DESTINATION"

./google-font-download --format=all --languages=latin --output=$CSS_FILE --path=$CSS_PATH --destination=$DESTINATION "${FONT_NAME_FULL}"

printf >>"$RESULT_FILE" "\t\t,{ name : \"%s\", style: { fontFamily : \"%s\" }}\n" "${FONT_NAME}" "${FONT_NAME}"
done

printf >>"$RESULT_FILE" "\t]\n}\n"
