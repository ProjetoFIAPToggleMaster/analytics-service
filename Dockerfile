FROM python:3.11-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --timeout=120 -r requirements.txt

COPY . .

EXPOSE 8005

CMD ["gunicorn", "--bind", "0.0.0.0:8005", "--workers", "1", "--threads", "2", "--timeout", "120", "app:app"]