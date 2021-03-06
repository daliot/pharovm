#!/bin/bash

PREBUILT_IMAGE_URL="https://ci.inria.fr/pharo/job/Cog-Git-Tracker/lastSuccessfulBuild/artifact/vmmaker-image.zip"
URL="https://files.pharo.org/image/14/latest.zip"
VERSION="Pharo-1.4"

NO_COLOR='\033[0m' #disable any colors
YELLOW='\033[0;33m'

WGET_CERTCHECK="--no-check-certificate"
# on macs wget is pretty old and not recognizing this option 
wget --help | grep -- "$WGET_CERTCHECK" 2>&1 > /dev/null || WGET_CERTCHECK=''

# ----------------------------------------------------------------------------

openImage() {
    IMAGE=$1
    SCRIPT=$2

    echo -e "${YELLOW}OPENING IMAGE" $NO_COLOR
    echo "    $IMAGE"
    echo "    $SCRIPT"
    
    [ -z $PHAROVM ]  ||   ( echo "using " $PHAROVM \
        &&  $PHAROVM  "$IMAGE" "$SCRIPT"; exit 0 )
    
    [ -z $PHARO_VM ] ||   ( echo "using " $PHARO_VM \
        &&  $PHARO_VM  "$IMAGE" "$SCRIPT"; exit 0 )
    
    [ -z $SQUEAKVM ] ||   ( echo "using " $SQUEAKVM \
        &&  $SQUEAKVM  "$IMAGE" "$SCRIPT"; exit 0 )

    for vm in CogVM cog pharo squeak StackVM stackVM; do
        hash $vm 2>&-    && echo "using " `which ${vm}` \
            && $vm  "$IMAGE" "$SCRIPT"; exit 0
    done  
    
    hash gnome-open 2>&- && echo "using " `which gnome-open` \
        && gnome-open "$IMAGE"; exit 0
    
    hash open 2>&-       && echo "using " `which open` \
        && open "$IMAGE" --args "$SCRIPT"; exit 0
}

# ----------------------------------------------------------------------------
echo -e "${YELLOW}LOADING PREBUILT IMAGE" $NO_COLOR
echo "    $PREBUILT_IMAGE_URL"

wget $WGET_CERTCHECK "$PREBUILT_IMAGE_URL" --output-document="image.zip" && \
unzip image.zip && \
rm image.zip  && \
openImage "$PWD/generator.image" "$PWD/ImageConfiguration.st" && exit 1


# ----------------------------------------------------------------------------
echo -e "${YELLOW}FETCHING FRESH IMAGE" $NO_COLOR
echo "   $URL$VERSION.zip"

wget $WGET_CERTCHECK "$URL$VERSION.zip" --output-document="image.zip"

# ----------------------------------------------------------------------------
echo -e "${YELLOW}UNZIPPING" $NO_COLOR
echo "    $PWD/image.zip"

unzip image.zip && \
rm image.zip    && \
mv $VERSION/*  .   && \
rm -rf $VERSION    || exit 1


# ----------------------------------------------------------------------------
# try to open the image...
set -e
openImage "$PWD/$VERSION.image" "$PWD/../codegen-scripts/LoadVMMaker.st"
rm -rf "$PWD/$VERSION.image" "$PWD/$VERSION.changes";
openImage "$PWD/$generator.image" "$PWD/ImageConfiguration.st"

