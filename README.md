# OrangeFox Recovery Device Tree for Redmi Note 12 Pro 5G (ruby)

This is the fully functioning, scratch-built Minimal Recovery Device Tree for the MediaTek Dimensity 1080 (MT6877V) device, codenamed `ruby` (or `rubyx`), running Android 14 HyperOS.

## Specifications

- **Maintainer:** Arush
- **Codename:** `ruby`
- **SoC:** MediaTek Dimensity 1080 (MT6877V)
- **Architecture:** ARM64
- **Partitions:** Virtual A/B (VAB) Dynamic Partitions
- **Target:** `bootimage`
- **Branch:** `fox_12.1`
- **Keymaster:** `android.hardware.keymaster@4.1-service.beanpod` (Hardware Decryption Working)

## Included Features

1. **Dynamic Partition Layout:** Full mapping of all `system`, `vendor`, `product`, and `mi_ext` dynamic partitions.
2. **AVB 2.0 Bypassing:** Automatic neutralization of all three VBMETA partitions (`vbmeta`, `vbmeta_system`, `vbmeta_vendor`) via `OF_PATCH_AVB20=1`.
3. **Anti-Rollback Spoofing:** Hardcoded `PLATFORM_VERSION=15.0.0` to bypass HyperOS 14 firmware checks.
4. **Prebuilt Stock Kernel:** Extracts the exact `134MB` prebuilt Android 14 kernel and DTB blob structure natively.
5. **Hardware Decryption:** Manually injected `keymaster` and `gatekeeper` services from the `beanpod` daemon to decrypt `/data` seamlessly.

---

## 🛠 Compilation Instructions (Local Linux)

If you are not using the included `.github/workflows/build.yml` GitHub Actions CI script, follow these steps to build manually on Ubuntu 20.04/22.04:

**1. Sync the OrangeFox Branch:**

```bash
mkdir ~/fox_12.1 && cd ~/fox_12.1
repo init --depth=1 -u https://gitlab.com/OrangeFox/Manifest.git -b fox_12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

**2. Clone this Device Tree:**

```bash
git clone https://github.com/arushkivi/ruby_redmi_note_12_pro_5G_device_tree.git device/xiaomi/ruby
```

**3. Build the Image:**

```bash
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C"
source build/envsetup.sh
lunch twrp_ruby-eng
mka adbd bootimage
```

The resulting build will be located at:
`out/target/product/ruby/OrangeFox-ruby-Arush.zip` (and `.img`).

---

## ⚡ Flashing Instructions (MTK Client)

Because exactly packing an `AOSP` recovery into the `5MB` HyperOS `vendor_boot` layout is impossible, `ruby` operates strictly as a `boot` Virtual A/B device.

You **Must** flash this image to BOTH boot slots over BROM.

1. Power off the device completely.
2. Run this MTK Client script on your PC:

```bash
python mtk w boot_a,boot_b OrangeFox-Unofficial-ruby.img,OrangeFox-Unofficial-ruby.img
```

3. Hold `Volume Down` and quickly plug the USB cable in to trigger BROM.
4. Once flashed, hold `Volume Up` + `Power` continuously to boot straight into OrangeFox!
