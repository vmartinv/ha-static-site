#!/bin/sh
# Serve /share/<root> (the add-on option) on the ingress port with BusyBox httpd.
root=$(sed -n 's/.*"root"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' /data/options.json)
root=${root:-static_site}
case "$root" in */..*|..*) echo "invalid root: $root" >&2; exit 1 ;; esac
mkdir -p "/share/$root" 2>/dev/null
echo "Serving /share/$root"
exec httpd -f -v -p 8099 -h "/share/$root" -c /etc/httpd.conf
