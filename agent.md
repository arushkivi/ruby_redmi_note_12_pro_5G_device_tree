# Technical Implementation Log: OrangeFox for ruby

## Device Specifications

- **Device:** Xiaomi Redmi Note 12 Pro 5G / Pro+ 5G
- **Codename:** `ruby` (also referred to as `rubyx`)
- **Chipset:** MediaTek Dimensity 1080 (MT6877V)
- **Android Base:** HyperOS (Android 14)
- **Partition Scheme:** Virtual A/B (VAB)
- **Recovery Location:** Integrated into `boot` partition (No dedicated recovery partition).

## Build Environment

- **OrangeFox Branch:** `fox_12.1`
- **Build Target:** `bootimage`
- **Build Host:** GitHub Actions (Ubuntu 22.04)

## Key Configurations & Fixes

### 1. Repository Structure

- OrangeFox-specific variables must reside in `vendorsetup.sh`, not `BoardConfig.mk`.
- Added missing metadata files: `fox.mk`, `fox_ruby.mk`, `twrp_ruby.mk` (inherited as `twrp.mk`), `system.prop`, and `vendor.prop`.

### 2. Decryption (HyperOS/MTK)

- **Keymaster:** Version 4.1 (`OF_DEFAULT_KEYMASTER_VERSION=4.1`).
- **Service:** `android.hardware.keymaster@4.1-service.beanpod`.
- **Properties:** Set `ro.crypto.volume.filenames_mode=aes-256-cts` in `system.prop` to match HyperOS encryption.

### 3. AVB & Security

- **AVB Patching:** `OF_PATCH_AVB20=1` enabled to automatically patch vbmeta headers in the boot image.
- **Rollback Protection:** `PLATFORM_VERSION` spoofed to `15.0.0` in `BoardConfig.mk` to bypass downgrade blocks.

### 4. Build System (GitHub Actions)

- **Repo Tool:** Required manual installation to `/home/runner/bin` and explicit `GITHUB_PATH` export.
- **Sync Strategy:** Shallow cloning (`--depth 1`) was causing "unsupported checkout state" errors because the OrangeFox sync script manipulates the recovery tree. Switched to deep sync for the `sync` repository.
- **Silent Failures:** Added `set -e` and workspace verification steps to catch early sync failures.
- **Versioning:** `FOX_VERSION` is obsolete in R11.3+. Use `FOX_MAINTAINER_PATCH_VERSION` instead.

## Flashing Instructions (MTK Client)

The built `OrangeFox-Unofficial-ruby.img` (built as `boot.img`) should be flashed to **both** boot slots:

```bash
python3 mtk.py w boot_a,boot_b OrangeFox-Unofficial-ruby.img,OrangeFox-Unofficial-ruby.img
```

## Useful Commands

- **Sync Local:**
  ```bash
  ./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
  ```
- **Build Command:**
  ```bash
  source build/envsetup.sh
  lunch fox_ruby-eng
  mka adbd bootimage
  ```
