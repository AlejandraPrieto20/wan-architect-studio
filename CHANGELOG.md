# Changelog
Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/) y [SemVer](https://semver.org/lang/es/).

## [4.0.0] - 2026-10-08
### Añadido
- Nueva interfaz gráfica: tema claro tipo "plano técnico" con menú lateral de 5 pasos.
- Validación de la red base (formato y CIDR) y aviso de capacidad insuficiente.
- Control de versiones, directiva primaria y scripts de exportación/restauración.

### Cambiado
- Wildcards OSPF calculados por subred (antes fijo `0.0.0.63`).
- Iconos SVG propios; ya no depende de Tailwind ni Lucide.

### Se mantiene
- Cálculo VLSM, topología, scripts Cisco/Huawei/Fortinet/MikroTik, Excel y Ciberdefensa.
