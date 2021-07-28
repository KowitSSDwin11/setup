#!/usr/bin/env bash

echo "Creating android/pe"
mkdir -p ~/android/sos
cd ~/android/sos
echo "Initializing the SOS source repository"
repo init -q --no-repo-verify --depth=1 -u https://github.com/SuperiorOS/manifest -b ten
echo "Downloading the source code"
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j30 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
echo "Cloning device tree"
git clone --depth 1 https://github.com/rushiranpise/android_device_motorola_titan -b sos device/motorola/titan
echo "Cloning device kernel"
git clone --depth 1 https://github.com/rushiranpise/android_kernel_motorola_msm8226 -b sos kernel/motorola/msm8226
echo "Cloning device vendor"
git clone --depth 1 https://github.com/rushiranpise/proprietary_vendor_motorola -b sos vendor/motorola
echo "Cloning device common"
git clone --depth 1 https://github.com/rushiranpise/android_device_motorola_msm8226-common -b sos device/motorola/msm8226-common
echo "Cloning qcom"
git clone --depth 1 https://github.com/rushiranpise/android_system_qcom -b sos system/qcom
echo "Preparing the device-specific code"
cd ~/android/sos
source build/envsetup.sh
echo "Lunch"
lunch superior_titan-userdebug
echo "Croot"
croot
echo "mka bacon -j30"
