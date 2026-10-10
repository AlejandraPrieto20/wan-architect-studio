# WAN Architect Studio

Herramienta web para diseñar redes WAN empresariales: direccionamiento IP (VLSM), topología,
scripts para Cisco / Huawei / Fortinet / MikroTik, exportación a Excel y módulo de ciberdefensa.

La app es **un solo archivo**: `index.html`. Ábrelo en el navegador; no requiere instalación.

> Regla principal: lee [`DIRECTIVA_PRIMARIA.md`](DIRECTIVA_PRIMARIA.md). El control de versiones nunca modifica la app.

## Estructura
| Archivo | Para qué sirve |
|---|---|
| `index.html` | La aplicación completa |
| `DIRECTIVA_PRIMARIA.md` | Reglas que rigen el proyecto |
| `CHANGELOG.md` | Historial legible de cambios |
| `scripts/publish-github.sh` | Publica el repo (público) en GitHub |
| `scripts/export.sh` | Exporta el proyecto completo (zip + bundle con historial) |
| `scripts/restore.sh` | Restaura desde una exportación para seguir editando |
| `scripts/verify.sh` | Revisa que la app no tenga cambios sin registrar |

## Control de versiones: uso diario
```bash
git status                       # ver qué cambió
git add index.html
git commit -m "fix: describe el cambio"
git tag -a v4.1.0 -m "Versión 4.1.0"   # marcar versión estable
git push origin main --tags
git log --oneline --decorate     # ver historial
git checkout v4.0.0 -- index.html  # recuperar una versión anterior de la app
```

## Publicar en GitHub (una sola vez)
```bash
bash scripts/publish-github.sh
```

## Exportar (copia de seguridad)
```bash
bash scripts/export.sh
```
Genera en `dist/`:
- `*.bundle`: **todo el repositorio con historial completo** (el respaldo principal).
- `*.zip`: la versión actual de los archivos, sin historial.
- `SHA256SUMS.txt`: sumas de verificación.

## Restaurar y volver a editar tras una pérdida
```bash
bash scripts/restore.sh dist/wan-architect-studio_*.bundle mi-copia
cd mi-copia && git log --oneline
```
Con el `.zip` también puedes recuperar los archivos, pero sin historial.
Si ya tienes el repo público en GitHub, basta con `git clone https://github.com/AlejandraPrieto20/wan-architect-studio.git`.

## Licencia
MIT. Ver [`LICENSE`](LICENSE).
