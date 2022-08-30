#!/usr/bin/sh 

export OUTPUT_IMAGE_LOCATION="/home/$USER/.scripts-output/temp_japanese_image.png" 
export OUTPUT_TEXT_LOCATION="/home/$USER/.scripts-output/temp_japanese_text"
export OUTPUT_TEXT_LOCATION_FR="$OUTPUT_TEXT_LOCATION.txt"

# take the screenshot - image 
flameshot gui --raw > $OUTPUT_IMAGE_LOCATION

# extract the japanese text 
tesseract -l jpn_vert $OUTPUT_IMAGE_LOCATION $OUTPUT_TEXT_LOCATION

# copy to clipboard 
cat $OUTPUT_TEXT_LOCATION_FR | tr -d "[:space:]" | xclip -selection c 
