FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN mkdir -p data output
# Generate the dataset on first run if it doesn't exist
RUN python src/generate_data.py

CMD ["python", "src/04_etl_pipeline.py"]
