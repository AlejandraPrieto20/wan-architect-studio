#!/usr/bin/env bash
# Uso: bash scripts/restore.sh <archivo.bundle|archivo.zip> [carpeta_destino]
set -euo pipefail
SRC="${1:?Indica el archivo .bundle o .zip}"
DEST="${2:-wan-architect-studio-restaurado}"
[ -e "$DEST" ] && { echo "ERROR: '$DEST' ya existe. Elige otro destino."; exit 1; }
case "$SRC" in
  *.bundle)
    git clone -q "$SRC" "$DEST"   # clone ya valida que el bundle sea integro
    cd "$DEST"
    git remote set-url origin https://github.com/AlejandraPrieto20/wan-architect-studio.git
    echo "Restaurado con historial completo en: $DEST"
    git log --oneline --decorate | head
    ;;
  *.zip)
    unzip -q "$SRC" -d "$DEST.tmp"
    mv "$DEST.tmp"/* "$DEST" && rmdir "$DEST.tmp"
    cd "$DEST"
    git init -q -b main
    # Si Git no tiene identidad configurada, se usa una local solo en este repo
    git config user.name  >/dev/null 2>&1 || git config user.name  "AlejandraPrieto20"
    git config user.email >/dev/null 2>&1 || git config user.email "AlejandraPrieto20@users.noreply.github.com"
    git remote add origin https://github.com/AlejandraPrieto20/wan-architect-studio.git
    git add -A && git commit -q -m "chore: restauracion desde zip (sin historial previo)"
    echo "Restaurado desde zip (nuevo historial) en: $DEST"
    ;;
  *) echo "Formato no soportado (usa .bundle o .zip)"; exit 1 ;;
esac
echo "Listo para editar. Para publicar: bash scripts/publish-github.sh"
