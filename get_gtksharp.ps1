#/bin/sh
#
# ONLY USE THIS ON LINUX SYSTEMS
#
# REVIEW CAREFULLY BEFORE RUNNING IT!
#
# You will need to install nuget first
# On Debian/Ubuntu: sudo apt-get install nuget

$dest="/tmp/getting_gtk_sharp"

mkdir $dest

cd $dest

nuget install GtkSharp

echo "Invoking sudo to copy dll files to $PSHOME"
sudo cp */lib/*/*.dll $PSHOME

rm -rf $dest
