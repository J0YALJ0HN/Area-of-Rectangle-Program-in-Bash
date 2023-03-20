#!/bin/bash

while true; do
#Explanation prompt

printf "\nAREA OF A RECTANGLE PROGRAM BY JOYAL JOHN 2023\n"
printf "\nThis is a calculation program that takes in your numerical inputs based on either inches or centimetres, then calculates the area and converts the measurements into either inches or metres \n \n \n"
#Prompt the user to select the type of measurement

echo "Enter the type of measurement inches (i) or centimeters(c): "
read type

case $type in

i)
#Prompt the user for the width of the rectangle in inches

echo "Enter the width of the rectangle in inches: "
read width

if ! [[ $width =~ ^[0-9]+([.][0-9]+)?$ ]]; then
echo "Invalid input. Width must be a number."
continue
fi
#Prompt the user for the height of the rectangle in inches

echo "Enter the height of the rectangle in inches: "
read height

if ! [[ $height =~ ^[0-9]+([.][0-9]+)?$ ]]; then
echo "Invalid input. Height must be a number."
continue
fi

;;
c)
#Prompt the user for the height of the rectangle in centimeters

echo "Enter the width of the rectangle in centimeters: "
read width

if ! [[ $width =~ ^[0-9]+([.][0-9]+)?$ ]]; then
echo "Invalid input. Width must be a number."
continue
fi
#Prompt the user for the height of the rectangle in centimeters

echo "Enter the height of the rectangle in centimeters: "
read height

if ! [[ $height =~ ^[0-9]+([.][0-9]+)?$ ]]; then
echo "Invalid input. Height must be a number."
continue
fi

;;
*)
echo "invalid input please try again"
continue
;;

esac
#Area calculation

area=$(echo "$width * $height" | bc)
#Prompt the user to select the type of measurement in which they want to see the area

echo "Enter the type of measurement in which you want to see the area metres(m) or inches(in): "
read output_type
#Convert the area to the selected type of measurement

if [ "$type" == "c" ] && [ "$output_type" == "m" ]; then
area=$(echo "scale=4; $area / 10000" | bc)
elif [ "$type" == "i" ] && [ "$output_type" == "m" ]; then
area=$(echo "scale=4; $area / 39.3701" | bc)
elif [ "$type" == "c" ] && [ "$output_type" == "in" ]; then
area=$(echo "scale=4; $area / 2.54" | bc)
elif [ "$type" == "i" ] && [ "$output_type" == "in" ]; then
area=$area
else
echo "Invalid type"
continue
fi
#Display area of the rectangle

echo "The area of the rectangle is: $area $output_type^2"
#Prompt user to input new data or quit with y/n

read -p "Enter 'y' to input new data or 'n' to quit: " input_new_data
if [ "$input_new_data" == "n" ]; then
break
fi
done
