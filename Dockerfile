FROM alpine:3.19.1

LABEL AboutImage "Alpine_Chromium_NoVNC"

LABEL Maintainer "Apurv Vyavahare <apurvvyavahare@gmail.com>"

#VNC Server Password
ENV	VNC_PASS="CHANGE_IT" \
#VNC Server Title(w/o spaces)
	VNC_TITLE="Chromium" \
#VNC Resolution(720p is preferable)
	VNC_RESOLUTION="1280x720" \
#VNC Shared Mode
	VNC_SHARED=false \
#Local Display Server Port
	DISPLAY=:0 \
#NoVNC Port
	NOVNC_PORT=$PORT \
	PORT=8080 \
#Heroku No-Sleep Mode
	NO_SLEEP=false \
#Locale
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8 \
	TZ="Asia/Kolkata"

COPY assets/ /

# Packages
RUN	apk update && \
	apk add --no-cache tzdata ca-certificates supervisor curl wget openssl bash python3 py3-requests sed unzip xvfb x11vnc websockify openbox chromium chromium-chromedriver nss alsa-lib font-noto font-noto-cjk && \
# noVNC SSL certificate
	openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 -subj "/C=IN/O=Dis/CN=www.google.com" -keyout /etc/ssl/novnc.key -out /etc/ssl/novnc.cert > /dev/null 2>&1 && \
# TimeZone
	cp /usr/share/zoneinfo/$TZ /etc/localtime && \
	echo $TZ > /etc/timezone && \
# Selenium Grid
	apk add --no-cache openjdk11-jre && \
	wget https://github.com/SeleniumHQ/selenium/releases/download/selenium-4.21.0/selenium-server-4.21.0.jar -O /opt/selenium-server.jar && \	
# Wipe Temp Files
	apk del build-base curl wget unzip tzdata openssl && \
	rm -rf /var/cache/apk/* /tmp/*

EXPOSE ${PORT}
EXPOSE 4444

ENTRYPOINT ["supervisord", "-l", "/var/log/supervisord.log", "-c"]

CMD ["/config/supervisord.conf"]
