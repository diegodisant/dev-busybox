#!/bin/zsh

BUSYBOX_HOME="${HOME}/Documents/personal-dev/dev-busybox"
ENV_FILE_PATH="${BUSYBOX_HOME}/.env"

if [ -f "${ENV_FILE_PATH}" ]; then
  export $(egrep -v '^#' ${ENV_FILE_PATH} | xargs)
else
  echo -e "\e[41m\e\[97m\e[1m [E] Error: Unable to read .env file, run: cp .env.dist .env \e[0m\n"
fi
