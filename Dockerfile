# ETAPA 1: Compilación del Frontend (React + Vite)
FROM node:22-alpine AS frontend-builder
WORKDIR /app/frontend

COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci

COPY frontend/ ./
ARG VITE_API_URL=""
ENV VITE_API_URL=$VITE_API_URL
RUN npm run build

# ETAPA 2: Runtime unificado (FastAPI + Frontend estático)
FROM python:3.11-slim AS runtime
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    STATIC_DIR=/app/static

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY backend/server.py ./
COPY --from=frontend-builder /app/frontend/dist ./static

EXPOSE 10000

CMD ["sh", "-c", "uvicorn server:app --host 0.0.0.0 --port ${PORT:-10000}"]
