FROM alamia442/bot:shell

WORKDIR /app

COPY start.sh .

CMD ["bash", "start.sh"]
