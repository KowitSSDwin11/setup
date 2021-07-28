#!/usr/bin/env bash

echo "Creating android/lineage"
mkdir -p ~/android/lineage
cd ~/android/lineage
echo "Initializing the PE source repository"
repo init -q --no-repo-verify --depth=1 -u https://github.com/LineageOS/android.git -b lineage-17.1
echo "Downloading the source code"
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j30 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
echo "Cloning device tree"
git clone --depth 1 https://github.com/RenanQueiroz/android_device_motorola_titan -b lineage-17.1 device/motorola/titan
echo "Cloning device kernel"
git clone --depth 1 https://github.com/RenanQueiroz/android_kernel_motorola_msm8226 -b lineage-17.0 kernel/motorola/msm8226
echo "Cloning device vendor"
git clone --depth 1 https://github.com/RenanQueiroz/proprietary_vendor_motorola-b lineage-16.0 vendor/motorola
echo "Cloning device common"
git clone --depth 1 https://github.com/MotoDevelopment/android_device_motorola_msm8226-common -b lineage-17.1 device/motorola/msm8226-common
echo "Cloning qcom"
git clone --depth 1 https://github.com/LineageOS/android_system_qcom -b lineage-17.1 system/qcom
echo "Preparing the device-specific code"
cd ~/android/lineage
source build/envsetup.sh
echo "breakfast"
breakfast titan
echo "Croot"
croot
echo "brunch titan"
