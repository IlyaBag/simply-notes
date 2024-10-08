FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

WORKDIR /app/notes

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]