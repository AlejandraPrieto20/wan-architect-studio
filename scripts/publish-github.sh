#!/usr/bin/env bash
# Publica el repositorio como PUBLICO en github.com/AlejandraPrieto20
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
OWNER=AlejandraPrieto20; REPO=wan-architect-studio
if command -v gh >/dev/null 2>&1; then
  gh auth status >/dev/null 2>&1 || gh auth login
  if gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
    git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$OWNER/$REPO.git"
    git push -u origin --all && git push origin --tags
  else
    gh repo create "$OWNER/$REPO" --public --source=. --remote=origin \
      --description "WAN Architect Studio: diseño de redes WAN (VLSM), topología, scripts y ciberdefensa" --push
    git push origin --tags
  fi
else
  echo "No tienes GitHub CLI. Haz esto manualmente:"
  echo " 1) Crea https://github.com/new -> nombre: $REPO -> Public -> SIN README ni licencia."
  echo " 2) Ejecuta:"
  echo "    git remote add origin https://github.com/$OWNER/$REPO.git"
  echo "    git push -u origin main --tags"
fi
