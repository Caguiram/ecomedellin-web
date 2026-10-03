# EcoMedellín ♻️

Prototipo académico de una plataforma para gestionar solicitudes de recolección de residuos en Medellín. Permite recorrer los flujos de usuario, recolector y administrador desde el navegador.

**Tecnologías:** HTML, CSS, JavaScript y un modelo SQL para MySQL.

## Funcionalidades

- Registro y acceso simulado por roles.
- Programación de recolecciones e historial de solicitudes.
- Registro de peso y acumulación de puntos.
- Canje de puntos, edición de perfil y panel administrativo.
- Persistencia de la demostración mediante `localStorage`.

## Probar el prototipo

Abre `index.html` en un navegador y pulsa **Demo rápida**. También puedes recorrer los roles de prueba:

| Rol | Correo de demostración |
| --- | --- |
| Administrador | `admin@eco.com` |
| Recolector | `recolector@eco.com` |

El acceso es una simulación y acepta cualquier texto como contraseña. Utiliza únicamente datos ficticios.

Opcionalmente, si tienes Python instalado:

```bash
python -m http.server 8000
```

Abre `http://localhost:8000`.

## Estructura

```text
index.html       Interfaz y lógica de la demostración
base_datos.sql   Modelo relacional propuesto y datos ficticios
README.md        Guía del proyecto
```

El archivo SQL es una propuesta independiente: la interfaz no se conecta a MySQL. El mapa mostrado es una imagen de referencia externa y requiere conexión a Internet.

## Alcance

Es un prototipo educativo, sin servidor ni autenticación real. Las contraseñas y roles de demostración no constituyen un sistema de seguridad. El navegador conserva los datos localmente; no hay sincronización entre equipos. No uses datos personales ni contraseñas reales. El modelo SQL también contiene contraseñas de prueba en texto claro y debe rediseñarse antes de cualquier uso real.

## Créditos

Proyecto de equipo **EcoMedellín**, desarrollado en el contexto de **Ingeniería de Software I — Politécnico Grancolombiano**. Esta publicación conserva la atribución colectiva de la entrega original y organiza el material como parte del portafolio académico de Cristian Aguirre Ramirez.
