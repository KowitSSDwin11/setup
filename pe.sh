#!/usr/bin/env bash

echo "Creating android/pe"
mkdir -p ~/android/pe
cd ~/android/pe
echo "Initializing the PE source repository"
repo init -q --no-repo-verify --depth=1 -u https://github.com/PixelExperience/manifest -b ten-plus
echo "Downloading the source code"
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j30 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
echo "Cloning device tree"
git clone --depth 1 https://github.com/thedeadfish59/android_device_motorola_titan -b ten device/motorola/titan
echo "Cloning device kernel"
git clone --depth 1 https://github.com/thedeadfish59/android_kernel_motorola_msm8226 -b ten kernel/motorola/msm8226
echo "Cloning device vendor"
git clone --depth 1 https://github.com/thedeadfish59/proprietary_vendor_motorola -b ten vendor/motorola
echo "Cloning device common"
git clone --depth 1 https://github.com/thedeadfish59/android_device_motorola_msm8226-common -b ten device/motorola/msm8226-common
echo "Cloning qcom"
git clone --depth 1 https://github.com/thedeadfish59/android_system_qcom -b ten system/qcom
echo "Preparing the device-specific code"
cd ~/android/pe
source build/envsetup.sh
echo "Lunch"
lunch aosp_titan-userdebug
echo "Croot"
croot
mka bacon -j30
