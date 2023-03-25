#!/system/bin/sh

vendor_spl=$(getprop ro.vendor.build.security_patch)
[ -z "$vendor_spl" ] && exit 0

# Late props which must be set after boot_completed
{
    until [[ "$(getprop sys.boot_completed)" == "1" ]]; do
        sleep 1
    done

    resetprop ro.build.version.security_patch "$vendor_spl"
}&
