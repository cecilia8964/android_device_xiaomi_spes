# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1

# Remove pixel headers to avoid conflicts
rm -rf hardware/google/pixel/kernel_headers/Android.bp

# Remove hardware/lineage/compat to avoid conflicts
rm -rf hardware/lineage/compat/Android.bp

# Sepolicy fix for imsrcsd
echo -e "${color}Switch back to legacy imsrcsd sepolicy${end}"
rm -rf device/qcom/sepolicy_vndr/legacy-um/qva/vendor/bengal/ims/imsservice.te
cp device/qcom/sepolicy_vndr/legacy-um/qva/vendor/bengal/legacy-ims/hal_rcsservice.te device/qcom/sepolicy_vndr/legacy-um/qva/vendor/bengal/ims/hal_rcsservice.te

# Vendor & Kernel Sources
git clone https://github.com/cecilia8964/android_vendor_xiaomi_spes.git -b 14.0 vendor/xiaomi/spes --depth=1
git clone https://github.com/cecilia8964/android_kernel_xiaomi_sm6225.git kernel/xiaomi/sm6225 --depth=1

# Lineage-21 Hardware Source
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi --depth=1

# JamesDSP
git clone https://github.com/Arijit78/packages_apps_JamesDSPManager.git packages/apps/JamesDSPManager --depth=1

# Remove voltage-priv_keys (unofficial build only)
rm -rf vendor/voltage-priv
