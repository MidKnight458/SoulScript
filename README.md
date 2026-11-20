# SoulScript

Convierte tu escritura a mano en una tipografía real lista para instalar y usar en cualquier lugar.

## ¿Qué es SoulScript?

La mayoría de las fuentes digitales se sienten idénticas cada vez que repites una letra. **SoulScript** nace para conservar el carácter y la naturalidad de tu trazo: dibujas cada letra, número y símbolo directamente en pantalla y el sistema los transforma en un archivo de fuente **OpenType (`.otf`)**.

Para que tus textos no pierdan ese toque orgánico, puedes dibujar **hasta 3 variantes de cada carácter**, de modo que al escribir letras repetidas la tipografía alterne sus trazos de forma natural.

## Lo que puedes hacer

- **Dibujar con referencias claras:** un lienzo limpio con guías visuales (línea base, altura de minúsculas y ascendentes) para que tus letras queden alineadas entre sí.
- **Capturar hasta 3 variantes por carácter:** mayúsculas, minúsculas, números y signos de puntuación, con libertad para saltar los caracteres que no necesites.
- **Probar tu fuente al instante:** escribe en el panel de vista previa en vivo justo después de generar tu tipografía, antes de descargar nada.
- **Descargar tu archivo `.otf`:** un formato estándar compatible con Windows, macOS, Linux, editores de texto y programas de diseño.
- **Usar desde PC o tablet:** interfaz adaptativa pensada tanto para ratón como para lápiz óptico o pantalla táctil.

## Cómo funciona

1. **Dibuja:** traza cada carácter sobre el lienzo (puedes repetir hasta tres veces para darle variación natural, o avanzar al siguiente).
2. **Genera:** pulsa **Generar y Probar** para que el motor convierta tus trazos en vectores y compile tu fuente al momento.
3. **Prueba y descarga:** escribe en el área de vista previa para ver cómo luce tu letra y descárgala en formato `.otf`.

## Despliegue rápido en Render

Este proyecto incluye un Blueprint (`render.yaml`) que empaqueta toda la aplicación en un solo servicio web, sin configuraciones manuales de URLs ni CORS:

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/MidKnight458/SoulScript)

O desde tu panel de [Render](https://dashboard.render.com/):

1. Elige **New + → Blueprint**.
2. Conecta este repositorio (`MidKnight458/SoulScript`).
3. Confirma y haz clic en **Apply** para construir y publicar el servicio usando `render.yaml`.

> **Nota sobre el plan gratuito:** si la aplicación pasa varios minutos sin actividad, Render suspende el servicio y la primera visita tras el reposo puede tardar unos segundos en responder mientras vuelve a encenderse.

## Ejecutar en local

### Con Docker Compose (recomendado)

```bash
docker compose up --build
```

Luego abre `http://localhost:5173` en tu navegador.

### Sin Docker (desarrollo manual)

En una terminal, inicia el motor de compilación (Python 3.11+):

```bash
cd backend
pip install -r requirements.txt
uvicorn server:app --reload --port 8000
```

En otra terminal, inicia la interfaz web (Node.js 22+):

```bash
cd frontend
npm install
npm run dev
```

La aplicación quedará disponible en `http://localhost:5173`.

---

Construido con **React + TypeScript**, **FastAPI**, **OpenCV** y **Docker** por [MidKnight458](https://github.com/MidKnight458).
