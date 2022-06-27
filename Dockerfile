FROM alamia442/bot:shell

WORKDIR /app

COPY . .

CMD ["bash", "start.sh"]
