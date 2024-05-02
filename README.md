# Chromium with NoVNC

## Installation
- ### Heroku
    [![Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vital987/chrome-novnc)

- ### Manual
  - ```sh
    HOST_PORT=8080 VNC_PASS=CHANGE_IT docker-compose up -d
    ```
  - ```sh
    docker run \
        --name chrome-novnc \
        -e PORT=8080 \
        -p 8080:8080 \
        -e VNC_PASS=CHANGE_IT \
        vital987/chrome-novnc:latest
    ```

## Environment variables:
|VARIABLE      |DESCRIPTION              |DEFAULT VALUE  |
|-------------:|:------------------------|:-------------:|
|VNC_PASS      |VNC Password             |CHANGE_IT      |
|VNC_TITLE     |VNC Session Title        |Chromium       |
|VNC_SHARED    |VNC Shared Mode          |false          |
|VNC_RESOLUTION|VNC Resolution           |1280x720       |
|PORT          |NoVNC HTTPS Port         |Heroku specific|
|APP_NAME      |Name of the app          |Heroku specific|
|NO_SLEEP      |Prevent app from sleeping|Heroku specific|
