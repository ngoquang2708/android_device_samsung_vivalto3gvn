#Copyright 2016 - The Android Open Source Project
#Copyright 2016 - The CyanogenMod Project

Device configuration for Samsung Galaxy V SM-G313HZ (vivalto3gvn)

## Pre-requisites
* Android build environment set up.
* Basic knowledge of Linux Terminal commands.

##How to build
* First of all, initialize the repo in a directory of your choice with staging/cm-14.0 branch.
* To get device specific stuffs and source patches, use this local manifest [vivalto3gvn.xml](https://github.com/ngoquang2708/android_local_manifests/blob/staging/cm-14.0-vivalto3gvn/vivalto3gvn.xml), and put it in `.repo/local_manifests`.
* `repo sync`
* `source build/envsetup.sh && brunch vivalto3gvn`
