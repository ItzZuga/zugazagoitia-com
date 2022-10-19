#!/bin/bash

# This script is used to build the gallery of images for the website.
CURRENT_DIR=$(pwd)
IMAGE_DIR=$CURRENT_DIR/images
GALLERY_BUILD_DIR=$CURRENT_DIR/src/gallery
GALLERY_HTML=$GALLERY_BUILD_DIR/index.html

# Create the build directory if it doesn't exist.
if [ ! -d "$GALLERY_BUILD_DIR" ]; then
    mkdir -p "$GALLERY_BUILD_DIR"
fi


# Copy the images to the build directory.
cp -r "$IMAGE_DIR" "$GALLERY_BUILD_DIR"

# Find all the images in the image directory. Save only the file name.
IMAGES=$(find "$IMAGE_DIR" -type f -printf "%f\n")

# Create the gallery HTML.
echo "<html>" > "$GALLERY_HTML"
echo "<head>" >> "$GALLERY_HTML"
echo "<title>Gallery</title>" >> "$GALLERY_HTML"
echo "</head>" >> "$GALLERY_HTML"
echo "<body>" >> "$GALLERY_HTML"
echo "<header>" >> "$GALLERY_HTML"
echo "<h1>Gallery</h1>" >> "$GALLERY_HTML"
echo "<a href=\"../\" > Back to home</a>" >> "$GALLERY_HTML"
echo "</header>" >> "$GALLERY_HTML"
echo "<br>" >> "$GALLERY_HTML"

for IMAGE in $IMAGES; do
    echo "<img src=\"images/$IMAGE\" loading=\"lazy\" />" >> "$GALLERY_HTML"
done

echo "</body>" >> "$GALLERY_HTML"
echo "</html>" >> "$GALLERY_HTML"
