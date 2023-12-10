# Chromium with NoVNC

## Warning
This project runs Chromium directly as the root user without sandboxing. Avoid deploying it in production environments.

## Heroku installation
[![Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vital987/chrome-novnc)

## Manual installation
```bash
docker run \
    --name chrome-novnc \
    -e PORT=9870 \
    -p 9870:9870 \
    -e VNC_PASS=TestPass987 \
    vital987/chrome-novnc:latest
```

## Environment variables: 
|      PORT      |                NoVNC HTTPS Port (Default: 9870)                |
|:--------------:|:--------------------------------------------------------------:|
|    VNC_PASS    |               VNC Password (Default: samplepass)               |
|    VNC_TITLE   |              VNC Session Title (Default: Chromium)             |
| VNC_RESOLUTION |               VNC Resolution (Default: 1280x720)               |
|    APP_NAME    |                Name of the app (Heroku specific)               |
|    NO_SLEEP    | Prevent app from sleeping (Heroku specific, default: disabled) |
