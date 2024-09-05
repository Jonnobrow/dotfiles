# Based on https://github.com/direnv/direnv/wiki/Sops
use_sops() {
  local path=${1:-$PWD/secrets.sops.yaml}
  if [ -e "$path" ]; then
    if grep -q -E '^sops:' "$path"; then
      eval "$(sops --decrypt --output-type dotenv "$path" 2>/dev/null | direnv dotenv bash /dev/stdin || false)"
    else
      if [ -n "$(command -v yq)" ]; then
        eval "$(yq eval --output-format props "$path" | direnv dotenv bash /dev/stdin)"
        export SOPS_WARNING="unencrypted $path"
      fi
    fi
  fi
  watch_file "$path"
}
