# Directiva Primaria del Proyecto

> Esta directiva rige sobre cualquier otra regla, script o flujo del repositorio.

## Principio rector
**El control de versiones protege la aplicación; nunca la modifica.**

## Reglas

1. **La app es `index.html`.** Es un único archivo autocontenido. Ningún script, hook,
   workflow o herramienta de este repositorio puede alterarlo, reescribirlo, minificarlo
   ni inyectarle contenido. Los scripts solo **leen** el archivo.
2. **Todo cambio a la app es explícito y humano.** Se hace editando `index.html` a mano,
   y queda registrado en un commit propio con mensaje claro. Nada se cambia "de forma automática".
3. **Todo queda versionado.** Cada cambio pasa por un commit en Git; las versiones
   estables se marcan con etiquetas (`v4.0.0`, `v4.1.0`, ...) siguiendo SemVer.
4. **Se cambia la app o la documentación, no ambas en el mismo commit.** Así el historial
   deja claro cuándo cambió el comportamiento de la herramienta.
5. **Cero secretos.** Contraseñas, tokens y claves van en `.env` (ignorado por `.gitignore`).
   Nunca se suben al repositorio público.
6. **El repositorio es público y exportable.** Debe poder exportarse (`scripts/export.sh`)
   y volver a importarse y editarse (`scripts/restore.sh`) sin perder historial.
7. **Ante la duda, no se toca la app.** Se abre primero un commit o rama de prueba.

## Cómo se verifica
`scripts/verify.sh` compara el `index.html` actual con la versión guardada en Git (`HEAD`)
y avisa si hay cambios sin registrar. Solo informa; no modifica nada.
