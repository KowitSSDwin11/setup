sudo apt-get update && sudo apt-get upgrade

sudo apt-get install bc bison build-essential ccache curl repo flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev adb fastboot lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev libwxgtk3.0-dev

sudo apt-get update && sudo apt-get upgrade 

mkdir -p ~/bin

mkdir -p ~/android/lineage

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo

git config --global user.email "rushi@titan.com"

git config --global user.name "rushi"

git clone https://github.com/RenanQueiroz/android_device_motorola_titan -b lineage-17.1 device/motorola/titan

git clone https://github.com/RenanQueiroz/android_kernel_motorola_msm8226 -b lineage-17.0 kernel/motorola/msm8226

git clone https://github.com/RenanQueiroz/proprietary_vendor_motorola -b lineage-16.0 vendor/motorola

git clone https://github.com/MotoDevelopment/android_device_motorola_msm8226-common -b lineage-17.1 device/motorola/msm8226-common

export USE_CCACHE=1

export CCACHE_EXEC=/usr/bin/ccache

ccache -M 50G

ccache -o compression=true

cd ~/android/lineage

repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

repo sync

cd ~/android/lineage

source build/envsetup.sh

breakfast titan

croot

brunch titan
