#!/bin/zsh

BUSYBOX_HOME="${HOME}/Documents/personal-dev/dev-busybox"
BUSYBOX_SCRIPTS="${BUSYBOX_HOME}/scripts"

source "${BUSYBOX_HOME}/src/deps.sh"

function exec_script() {
  if [ $# -eq 0 ]; then
    print_error "provide script name to run, need to exists in scripts folder [${BUSYBOX_SCRIPTS}]"

    return;
  fi

  cd ${BUSYBOX_SCRIPTS} && ./${1}.sh
}

# ALIASES
alias box="cd ${BUSYBOX_HOME}"
alias box-scripts="cd ${BUSYBOX_SCRIPTS}"
alias box-workspace="cd ${WORKSPACE_DIR}"
alias box-exec="exec_script"

function setup_project() {
  if [ $# -eq 0 ]; then
    print_error "provide a project name in order to set up a project locally"
    print_info "usage box-setup <project name>"

    return
  fi

  print_info "setting up project ${2}"

  box-workspace
  cd ${1}

  if [ -f '.env.dist' ]; then
    print_warning "creating local .env file, please check and set correct values"
    cp .env.dist .env
  fi

  if [ -f 'docker-compose.override.yml.dist' ]; then
    print_warning "creating local docker-compose.override.yml file"
    cp docker-compose.override.yml.dist docker-compose.override.yml
  fi

  print_warning "downloading project images"
  docker-compose pull

  if [ -f 'docker-compose.cli.yml' ]; then
    print_warning "downloading images for docker-compose CLI services"
    docker-compose -f docker-compose.cli.yml pull
  fi

  print_sucess "all setup :) , please read README.md file"
}

alias box-setup="setup_project"
