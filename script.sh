cd

wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip

unzip platform-tools-latest-linux.zip -d ~

sudo nano ~/.profile
 
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi

source ~/.profile

sudo apt-get update && sudo apt-get upgrade 

sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev git adb fastboot

sudo apt-get update && sudo apt-get upgrade

mkdir -p ~/bin

mkdir -p ~/android/lineage

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo

sudo nano ~/.profile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

source ~/.profile

git config --global user.email "rushi@titan.com"

git config --global user.name "rushi"

sudo nano ~/.bashrc 

export USE_CCACHE=1

export CCACHE_EXEC=/usr/bin/ccache

source ~/.bashrc

source ~/.profile

ccache -M 50G

ccache -o compression=true

cd ~/android/lineage

repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

repo sync -j14

cd ~/android/lineage

source build/envsetup.sh

breakfast titan

git clone https://github.com/RenanQueiroz/android_device_motorola_titan -b lineage-17.1 device/motorola/titan

git clone https://github.com/RenanQueiroz/android_kernel_motorola_msm8226 -b lineage-17.0 kernel/motorola/msm8226

git clone https://github.com/RenanQueiroz/proprietary_vendor_motorola -b lineage-16.0 vendor/motorola

git clone https://github.com/MotoDevelopment/android_device_motorola_msm8226-common -b lineage-17.1 device/motorola/msm8226-common

croot

brunch titan
