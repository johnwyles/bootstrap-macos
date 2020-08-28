#!/bin/bash

# Adapted from: https://stackoverflow.com/a/17378420
install_chrome_extension () {
  preferences_dir_path=~/Library/Application\ Support/Google/Chrome/Default/Extensions
  pref_file_path=$preferences_dir_path/$1.json
  upd_url="https://clients2.google.com/service/update2/crx"
  mkdir -p $preferences_dir_path
  echo "{" > "$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
  echo "}" >> "$pref_file_path"
  echo Added \""$pref_file_path"\"
}

# I don't even know what these extensions are but they're installed now...
# ...so we'll keep them I guess?
install_chrome_extension "aapocclcgogkmnckokdopfmhonfmgoek"
install_chrome_extension "aclagjkmidmkcdhkhlicmgkgmpgccaod"
install_chrome_extension "aohghmighlieiainnegkcijnfilokake"
install_chrome_extension "aomjjhallfgjeglblehebfpbcfeobpgk"
install_chrome_extension "apdfllckaahabafndbhieahigkjlhalf"
install_chrome_extension "blpcfgokakmgnkcojhhkbfbldkacnbeo"
install_chrome_extension "chphlpgkkbolifaimnlloiipkdnihall"
install_chrome_extension "cjpalhdlnbpafiamejdnhcphjbkeiagm"
install_chrome_extension "felcaaldnbdncclmgdcncolpebgiejap"
install_chrome_extension "fojaboengkcdjplnfcocfnchkjdikfei"
install_chrome_extension "ghbmnnjooekpmoecnnnilnnbdlolhkhi"
install_chrome_extension "glnpjglilkicbckjpbgcfkogebgllemb"
install_chrome_extension "hdokiejnpimakedhajhdlcegeplioahd"
install_chrome_extension "kbmfpngjjgdllneeigpgjifpgocmfgmb"
install_chrome_extension "kdjchigefmkankimfkgolpfincgbffkg"
install_chrome_extension "lifhekgaodigcpmnakfhaaaboididbdn"
install_chrome_extension "ljfidlkcmdmmibngdfikhffffdmphjae"
install_chrome_extension "nmmhkkegccagdldgiimedpiccmgmieda"
install_chrome_extension "ohloajnmmkniehhbmjakbejnomonmijc"
install_chrome_extension "pjkljhegncpnkpknbcohdijeoejaedia"
install_chrome_extension "pkedcjkdefgpdelpbcmbmeomcjbeemfm"
