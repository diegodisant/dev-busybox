# DIRECTORY
alias gsc-home="cd ${WORKSPACE_DIR}/global-sellercenter"
alias gsc-source="gsc-home && cd sellercenter"

# MACHINE
alias gsc-eval='gsc-home && docker-machine env ${MACHINE_NAME} && eval "$(docker-machine env ${MACHINE_NAME})"'
alias gsc-exec="gsc-eval && docker-compose exec sellercenter"

alias gsc-machine-ip="gsc-eval && docker-machine ip ${MACHINE_NAME}"
alias gsc-start-machine="docker-machine start ${MACHINE_NAME} && gsc-eval && print_info \"replace your host file /etc/hosts to point machine ${MACHINE_NAME} ip\" && gsc-machine-ip"
alias gsc-stop-machine="docker-machine stop ${MACHINE_NAME}"

alias gsc-destroy-machine="docker-machine rm ${MACHINE_NAME}"
alias gsc-create-machine="docker-machine create --driver virtualbox --virtualbox-cpu-count 5 --virtualbox-disk-size 30720 --virtualbox-memory 6144 --virtualbox-hostonly-nictype virtio --virtualbox-nat-nictype virtio ${MACHINE_NAME} && docker-machine-nfs ${MACHINE_NAME}"

# CONTROL
alias gsc-start="gsc-home && gsc-start-machine && docker-compose up -d"
alias gsc-stop="gsc-eval && docker-compose down --remove-orphans && gsc-stop-machine"
alias gsc-restart="gsc-stop && gsc-start"
alias gsc-start-workers="gsc-eval && docker-compose start crontab gearman-workers gearman-redis gearman"
alias gsc-stop-workers="gsc-eval && docker-compose stop crontab gearman-workers gearman-redis gearman"
alias gsc-restart-workers="gsc-stop-workers && gsc-start-workers"
alias gsc-run="gsc-eval && docker-compose up -d"
alias gsc-run-without-workers="gsc-eval && docker-compose up -d && gsc-stop-workers"
alias gsc-down="gsc-eval && docker-compose down --remove-orphans"
alias gsc-reload="gsc-down && gsc-run"

# STANDALONE
alias gsc-start-database="gsc-eval && docker-compose run -p '3306:3306' database"
alias gsc-start-redis="gsc-eval && docker-compose run -p '6379:6379' redis"

# MAKE
alias gsc-class="gsc-exec make class"
alias gsc-migrate="gsc-exec make migrate"
alias gsc-deps="gsc-exec make deps_dev"
alias gsc-dev="gsc-exec make dev"
alias gsc-clean-cache="gsc-exec make remove_dic flush_cache recreate_cache"
alias gsc-create-migration="gsc-exec make create-migration"
alias gsc-recreate="gsc-exec make recreate_database minify_dev icon post_configuration recreate_cache support"
alias gsc-reset-db="gsc-exec make rebuild_database prepare_test_db post_configuration"
alias gsc-build-front="gsc-exec make compress icon"
alias gsc-sass-watch="gsc-exec npm run-script sass-watch"
alias gsc-js-watch="gsc-exec npm run-script js-watch"
