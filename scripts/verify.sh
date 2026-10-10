#!/usr/bin/env bash
# Solo informa. No modifica ningun archivo (Directiva Primaria, regla 1).
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
if git diff --quiet HEAD -- index.html && [ -z "$(git ls-files --others --exclude-standard -- index.html)" ]; then
  echo "OK: index.html coincide con el ultimo commit ($(git rev-parse --short HEAD))."
else
  echo "AVISO: index.html tiene cambios sin registrar. Usa: git add index.html && git commit"
  exit 1
fi
