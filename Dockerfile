FROM python:3.9-slim

WORKDIR /app

COPY book_catalog /app/book_catalog

RUN pip install --no-cache-dir -r /app/book_catalog/requirements.txt

EXPOSE 80

CMD ["uvicorn", "book_catalog.main:app", "--host", "0.0.0.0", "--port", "80"]
