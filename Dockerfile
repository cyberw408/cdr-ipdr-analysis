
FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libpq-dev curl

COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel && pip install -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["gunicorn", "cdr_ipdr_analysis.wsgi:application", "--bind", "0.0.0.0:8000"]
