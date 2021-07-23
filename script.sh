sudo apt update
sudo apt upgrade
sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev libwxgtk3.0-dev
sudo apt update
sudo apt upgrade
mkdir -p ~/bin
mkdir -p ~/android/lineage
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
ccache -o compression=true
cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1
repo sync
