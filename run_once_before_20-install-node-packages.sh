{{ if (eq .chezmoi.os "linux") -}}
#!/usr/bin/env bash
set -euo pipefail

xargs yarn global add < "Npmfile"
{{- end }}
