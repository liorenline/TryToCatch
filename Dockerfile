FROM php:8.2-cli

WORKDIR /app

COPY . .

RUN chmod +x main.sh

CMD ["bash", "main.sh"]