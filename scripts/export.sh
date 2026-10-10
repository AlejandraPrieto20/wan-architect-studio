#!/usr/bin/env bash
# Exporta el proyecto. Solo LEE el repositorio; no toca index.html.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
if [ -n "$(git status --porcelain)" ]; then
  echo "AVISO: hay cambios sin commit; la exportacion incluye solo lo ya registrado en Git."
fi
NAME=wan-architect-studio
VER=$(git describe --tags --always)
STAMP=$(date +%Y%m%d)
OUT=dist; mkdir -p "$OUT"
git bundle create "$OUT/${NAME}_${VER}_${STAMP}.bundle" --all
git bundle verify "$OUT/${NAME}_${VER}_${STAMP}.bundle" >/dev/null
git archive --format=zip --prefix="${NAME}/" -o "$OUT/${NAME}_${VER}_${STAMP}.zip" HEAD
( cd "$OUT" && sha256sum *.bundle *.zip > SHA256SUMS.txt )
echo "Exportacion lista en $OUT/:"; ls -1 "$OUT"
