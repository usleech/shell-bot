if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config detected"
	mkdir -p /app/.config/rclone
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> /app/.config/rclone/rclone.conf
fi

if [[ -n $SOCKS5 ]]; then
	sohttp -http 0.0.0.0:8800 -socks5 $SOCKS5 &
fi

if [[ -n $SSH ]] ; then
	sohttp -http 0.0.0.0:5225 -socks5 socks5://127.0.0.1:1337 &
fi

if [[ -n $V2RAY ]] ; then
	echo $V2RAY >> /app/.config/v2ray.json
	#python3 vmess2json.py $V2RAY >> /app/.config/v2ray.json
	sleep 5
	v2ray --config=/app/.config/v2ray.json &
fi

if [ -n $TOKEN ] && [ -n $OWNER ] ; then
	mkdir -p /app/.config
	cat >> /app/.config/config.json <<-EOL
	{
		"authToken": "$TOKEN",
		"owner": $OWNER
	}	
	EOL
fi

. /opt/venv/bin/activate

node server
