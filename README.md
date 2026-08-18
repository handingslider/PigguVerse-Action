<div align="center">

# 🐷 PigguVerse Kernel

**A custom GKI kernel for `duchamp` (POCO X6 Pro) — Android 14, Linux 6.1 LTS**

[![SukiSU](https://img.shields.io/badge/SukiSU--Ultra-Supported-blue)](https://github.com/SukiSU-Ultra/SukiSU-Ultra)
[![SUSFS](https://img.shields.io/badge/SUSFS-Integrated-orange)](https://gitlab.com/simonpunk/susfs4ksu)

</div>

---

## ⚠️ Disclaimer

I am **not responsible** for bricked devices, damaged hardware, lost data, or anything else that may go wrong.
By flashing this kernel **you** are choosing to modify your device. Do your research, back up your data, and proceed at your own risk.

---

## ✨ Features

- 🏗️ **GKI based** — built on the official `android14-6.1-lts` common kernel
- 🔐 **Root solution** — [SukiSU-Ultra](https://github.com/SukiSU-Ultra/SukiSU-Ultra)
- 🛡️ **SUSFS** — optional root-hiding patches (Rooted builds only)
- 📦 **DroidSpaces** — full namespace / container support (PID, IPC, mqueue, binfmt)
- 🛡️  **BBRv3** — Backported BBRv3 TCP congestion algorithm(Thanks to [Wild-Kernels](https://github.com/WildKernels/kernel_patches) for patches)
- 🎛️ Two build flavors per variant: **Upstream GKI** (Latest GKI 6.1 kernel possible) and **AOSP** (Kernel used in duchamp AOSP roms)

---

## 📦 Build Naming

Release zips are named:

```
PigguVerse-<root>-<flavor>-<date>.zip
```

| Field | Values |
|-------|--------|
| `root` | `SukiSU` |
| `flavor` | `GKI`, `AOSP` |

Example: `PigguVerse-SukiSU-AOSP-20260629_1200.zip`

---

## 📥 Installation

There are three ways to flash PigguVerse — via a root-enabled kernel flasher, via recovery (ADB sideload), or by manually patching `boot.img` with `magiskboot`.

📖 **Full step-by-step guide:
[Documentation/INSTALLATION.md](Documentation/INSTALLATION.md)**

---

## 🏆 Credits

This project stands on the shoulders of the wider GKI / Wild Kernels community. Huge thanks to:

- 🔥 **[Wild Kernels](https://github.com/WildKernels)** — SUSFS fixes
- 🚀 **[SukiSU-Ultra](https://github.com/SukiSU-Ultra/SukiSU-Ultra)**
- 🛡️ **[SUSFS](https://gitlab.com/simonpunk/susfs4ksu)**
- 📦 **[SUSFS Module](https://github.com/rrr333nnn333/BRENE/releases/latest)**
- 📦 **[DroidSpaces](https://github.com/ravindu644/Droidspaces-OSS)**
  
🤖 Special thanks to **[Claude (Anthropic)](https://claude.ai/)** and **[ChatGPT (OpenAI)](https://chatgpt.com/)** for fixes.

🙏 And thanks to the open-source community for everything that makes this possible.

---

<div align="center">

**🚨 Flash responsibly. Back up first. Proceed at your own risk. 🚨**

</div>
