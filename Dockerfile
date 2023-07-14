FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

# installing flask dependencies
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

ENV FLASK_APP=app/flask-app.py

CMD ["flask", "run", "--host=0.0.0.0"]
