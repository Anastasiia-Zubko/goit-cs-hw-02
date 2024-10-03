FROM python:3.12

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . .

# Встановлюємо клієнт PostgreSQL
RUN apt-get update && apt-get install -y postgresql-client

# Встановлюємо залежності Python
RUN pip install -r requirements.txt

# Додаємо права на виконання для wait-for-it.sh
RUN chmod +x ./wait-for-it.sh

EXPOSE 8000

CMD ["./wait-for-it.sh", "postgres", "--", "python", "main.py"]
