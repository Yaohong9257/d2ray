#!/bin/sh

set -e

apk add openssh openssl wget unzip

source image/crypt.sh

chmod 600 ./id_root

# versions
VER_XRAY=1.4.2
VER_SO=2.5.20
VER_NG=1.6.5

# upload files
for filename in confs/*; do
    basename=$(basename $filename)
    hash_sha256 $basename $(cat ./key)
    output=$crypt_ret
    encrypt "$(cat $filename)" $(cat ./key)
    echo "$crypt_ret" > $output
    scp -P77 -o StrictHostKeychecking=no -i ./id_root $output root@parrot.quacker.org:/dat/apps/nginx/http_dl/root/pub
    rm $output
done

# build zip
URL_SO=https://github.com/FelisCatus/SwitchyOmega/releases/download/v$VER_SO/SwitchyOmega_Chromium.crx
URL_NG=https://github.com/2dust/v2rayNG/releases/download/$VER_NG/v2rayNG_1.5.16_arm64-v8a.apk
URL_XRAY_WIN=https://github.com/XTLS/Xray-core/releases/download/v$VER_XRAY/Xray-windows-64.zip
URL_XRAY_MAC=https://github.com/XTLS/Xray-core/releases/download/v$VER_XRAY/Xray-macos-64.zip
URL_XRAY_LINUX=https://github.com/XTLS/Xray-core/releases/download/v$VER_XRAY/Xray-linux-64.zip

wget $URL_SO -P zip/chrome/
wget $URL_NG -P image/nginx/index/android/
wget $URL_XRAY_WIN -P zip/windows/
wget $URL_XRAY_MAC -P zip/macos/
wget $URL_XRAY_LINUX -P image/

zip -r pc.zip zip/
mv pc.zip image/nginx/index/

# build htpassword
touch .htpasswd
htpasswd -b ./.htpasswd liangyifang liangyifang
htpasswd -b ./.htpasswd ruyuechun ruyuechun
htpasswd -b ./.htpasswd liuxiangdong liuxiangdong
encrypt "$(cat ./.htpasswd)" "$(cat ./key)"
echo "$crypt_ret" > image/nginx/.htpasswd