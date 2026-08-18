# 📥 PigguVerse — Installation Guide

Installation instructions for the **PigguVerse** kernel on the **POCO X6 Pro (`duchamp`)** — Android 14, Linux 6.1 LTS.

> ⚠️ Make sure your bootloader is unlocked before flashing. Always keep a backup of your current `boot.img`.
> After flashing a root variant, install the matching manager app from the [Root Managers](#-root-managers) section.

---

## Method 1 — Horizon Kernel Flasher (easiest, requires root)
> Won't work on roms with **[Fenrir](https://github.com/R0rt1z2/fenrir)**

Best if you are already rooted and just want to swap kernels.

1. Install **[Horizon Kernel Flasher](https://github.com/libxzr/HorizonKernelFlasher)**.
2. Open it and grant root permission.
3. Select the `PigguVerse-*.zip` you downloaded.
4. Flash and reboot.

---

## Method 2 — AOSP Recovery (ADB sideload)
> Won't work on roms with **[Fenrir](https://github.com/R0rt1z2/fenrir)**

Use this if you are not rooted. AOSP custom roms ships with their own **AOSP recovery** so flashing is done by sideloading over ADB.

1. Reboot to recovery:
   ```bash
   adb reboot recovery
   ```
2. In AOSP recovery, choose **Apply update → Apply from ADB**.
3. Sideload the zip:
   ```bash
   adb sideload PigguVerse-<root>-<flavor>-<date>.zip
   ```
4. Reboot system.

---

## Method 3 — Manual patch with `magiskboot` (no recovery, no root)

Use this if you only have a `boot.img` from your current ROM and can flash via fastboot.

1. Get **`magiskboot`** from **[PinNaCode/magiskboot_build](https://github.com/PinNaCode/magiskboot_build)** (standalone builds for Android/Linux/Windows).
2. Extract the kernel image from the PigguVerse zip — inside the `.zip` it is the file named **`Image`**.
3. Unpack your ROM's `boot.img`:
   ```bash
   magiskboot unpack boot.img
   ```
   This produces a file called **`kernel`** (plus other components).
4. Replace the extracted `kernel` with the **`Image`** from the PigguVerse zip (rename it to `kernel`):
   ```bash
   cp Image kernel
   ```
5. Repack:
   ```bash
   magiskboot repack boot.img
   ```
   This creates **`new-boot.img`**.
6. Flash it:
   ```bash
   fastboot flash boot new-boot.img
   ```
7. Reboot.

---

## 🧩 Root Managers

After flashing a root variant, install the matching manager app:

| Variant | Manager app |
|---------|-------------|
| **SukiSU** | [SukiSU-Ultra](https://github.com/SukiSU-Ultra/SukiSU-Ultra/releases) |
| **SUSFS module** | [BRENE](https://github.com/rrr333nnn333/BRENE/releases/latest) |
