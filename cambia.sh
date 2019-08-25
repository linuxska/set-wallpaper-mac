  
# Paths
home_path="/Users/$user/Documents"
wallpapers_path="$home_path/wallpaper"

# Test Internet Connection
wget  --spider http://google.com

if [ $? -eq 0 ]; then
  echo "Download to Internet"
  wallpaper_name=`date +"%s%3N"`.jpg
  wget -O "$wallpapers_path/$wallpaper_name" https://unsplash.it/2560/1440/?random
  cp $wallpapers_path/$wallpaper_name $wallpapers_path/nuevo.jpg
else
  echo "Set last wallpaper"
  wallpaper_name=`ls -t $wallpapers_path | head -1`
fi
ln -sf "$wallpapers_path/$wallpaper_name" /tmp/wallpaper.jpg
sleep 5
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/$user/Documents/wallpaper/nuevo.jpg"'
