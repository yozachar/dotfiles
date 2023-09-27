#!/usr/bin/bash

# Environment Variables & Paths

# generic
export CHROOT="$HOME/.local/share/chroot"
export EDITOR=micro
export GCM_CREDENTIAL_STORE=secretservice

# misc tools
export MEILI_NO_ANALYTICS=true
export PNPM_HOME="$HOME/.local/share/pnpm"
export RYE_NO_AUTO_INSTALL=1

# toolfather | `rtx env-vars ...`
#export JAVA_HOME="$(dirname $(dirname $(rtx which java)))"
# android
#export __ANDROID__="$HOME/.local/share/android"
#export ANDROID_AVD_HOME="$__ANDROID__/avd"
#export ANDROID_EMULATOR_HOME="$__ANDROID__/prefs"
#export ANDROID_HOME="$__ANDROID__/sdk"
#export ANDROID_NDK_HOME="$__ANDROID__/ndk"
#export ANDROID_USER_HOME="$__ANDROID__/prefs"

# append path
append_path() {
    if [ -z "$1" ]; then
        return
    fi
    case ":$PATH:" in
    *:"$1":*) ;;
    *)
        export PATH="${PATH:+$PATH:}$1"
        ;;
    esac
}

# remove path
remove_path() {
    if [ -z "$1" ]; then
        return
    fi
    TEMP=":$PATH:"
    TEMP="${TEMP/:$1:/:}"
    TEMP="${TEMP%:}"
    TEMP="${TEMP#:}"
    export PATH="$TEMP"
}

#append_path "$PNPM_HOME"
#append_path "$HOME/.local/bin"
#append_path "$HOME/.local/bin/dart-sdk/bin"
remove_path "$HOME/.local/share/rtx/shims"

unset append_path remove_path
