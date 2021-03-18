apk add curl

mkdir /imagemagick /test

cd /imagemagick

cp /imagemagick.tar.gz .

# unzip imagemagick.zip
tar -xvf imagemagick.tar.gz

echo "apk add repo"

apk add --repository /imagemagick imagemagick-custom --allow-untrusted

sleep 5

echo "execute download"

cd /test 

imageName="image"

curl -L -O https://www.programmfabrik.de/wp-content/uploads/2018/08/Logo_edb_pf_c.png 

mv Logo_edb_pf_c.png $imageName.png

apk add potrace

echo "execute convert"

# let's convert a few images and test if format works
convert $imageName.png -resize 100x100 $imageName.jpg
convert $imageName.png -resize 100x100 $imageName.jpeg
convert $imageName.png -resize 100x100 $imageName.tif
convert $imageName.png -resize 100x100 $imageName.tiff
convert $imageName.png -resize 100x100 $imageName.png
convert $imageName.png -resize 100x100 $imageName.jp2
convert $imageName.png -resize 100x100 $imageName.gif
convert $imageName.png -resize 100x100 $imageName.webp
convert $imageName.png -resize 100x100 $imageName.psd
convert $imageName.png -resize 100x100 $imageName.ico
convert $imageName.png -resize 100x100 $imageName.bmp
convert $imageName.png -resize 100x100 $imageName.eps
convert $imageName.png -resize 100x100 $imageName.ai
convert $imageName.png -resize 100x100 $imageName.ppm
convert $imageName.png -resize 100x100 $imageName.heic
convert $imageName.png -resize 100x100 $imageName.svg

sleep 10

identify $imageName.jpg
identify $imageName.jpeg
identify $imageName.tif
identify $imageName.tiff
identify $imageName.png
identify $imageName.jp2
identify $imageName.gif
identify $imageName.webp
identify $imageName.psd
identify $imageName.ico
identify $imageName.bmp
identify $imageName.eps
identify $imageName.ai
identify $imageName.ppm
identify $imageName.heic
identify $imageName.svg

sleep 60

echo "execute watch"

watch -n 1 echo world
