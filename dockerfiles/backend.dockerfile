FROM python:3.13-slim

# puts in app folder in the root and changes my directory to /app
WORKDIR /app/

# /app/backend, but I'm still in /app
COPY backend backend

# instead of installing a package -> keep structure as it is
ENV PYTHONPATH=/app/backend

# install uv
RUN pip install --no-cache-dir uv

# change directory
WORKDIR /app/backend/src/backend

# install packages
RUN uv sync --no-dev

# runs the api
CMD ["uv", "run", "uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]


