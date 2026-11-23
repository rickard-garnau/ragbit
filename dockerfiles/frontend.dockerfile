FROM python:3.13-slim

# puts in app folder in the root and changes my directory to /app
WORKDIR /app/

# /app/frontend, but I'm still in /app
COPY frontend frontend

# instead of installing a package -> keep structure as it is
ENV PYTHONPATH=/app/frontend

# install uv
RUN pip install --no-cache-dir uv

# change directory
WORKDIR /app/frontend/src/frontend

# install packages
RUN uv sync --no-dev

# runs the api
CMD [ "uv" , "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]


