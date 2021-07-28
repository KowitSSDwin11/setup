#!/usr/bin/env bash

echo "Creating android/sos"
mkdir -p ~/android/sos
cd ~/android/sos
echo "Initializing the SOS source repository"
repo init -q --no-repo-verify --depth=1 -u https://github.com/SuperiorOS/manifest -b ten
echo "Downloading the source code"
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j30 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
echo "Cloning device tree"
git clone --depth 1 https://github.com/hbarsaiyan/android_device_motorola_titan -b superior device/motorola/titan
echo "Cloning device kernel"
git clone --depth 1 https://github.com/RenanQueiroz/android_kernel_motorola_msm8226 -b lineage-17.0 kernel/motorola/msm8226
echo "Cloning device vendor"
git clone --depth 1 https://github.com/hbarsaiyan/proprietary_vendor_motorola -b superior vendor/motorola
echo "Cloning device common"
git clone --depth 1 https://github.com/hbarsaiyan/android_device_motorola_msm8226-common -b superior device/motorola/msm8226-common
echo "Preparing the device-specific code"
cd ~/android/sos
source build/envsetup.sh
echo "Lunch"
lunch superior_titan-userdebug
echo "Croot"
croot
echo "mka bacon -j30"
