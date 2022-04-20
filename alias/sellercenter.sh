# DIRECTORY
alias sc-home="cd ${WORKSPACE_DIR}/sellercenter"
alias sc-source="sc-home && cd sellercenter"

# MACHINE
alias sc-eval='sc-home && docker-machine env ${SC_MACHINE_NAME} && eval "$(docker-machine env ${SC_MACHINE_NAME})"'
alias sc-exec="sc-eval && docker-compose exec sellercenter"

alias sc-machine-ip="sc-eval && docker-machine ip ${SC_MACHINE_NAME}"
alias sc-start-machine="docker-machine start ${SC_MACHINE_NAME} && sc-eval && print_info \"replace your host file /etc/hosts to point machine ${SC_MACHINE_NAME} ip\" && sc-machine-ip"
alias sc-stop-machine="docker-machine stop ${SC_MACHINE_NAME}"

alias sc-destroy-machine="docker-machine rm ${SC_MACHINE_NAME}"
alias sc-create-machine="docker-machine create --driver virtualbox --virtualbox-cpu-count 5 --virtualbox-disk-size 30720 --virtualbox-memory 6144 --virtualbox-hostonly-nictype virtio --virtualbox-nat-nictype virtio ${SC_MACHINE_NAME} && docker-machine-nfs ${SC_MACHINE_NAME}"

# CONTROL
alias sc-start="sc-home && sc-start-machine && docker-compose up -d"
alias sc-stop="sc-eval && docker-compose down --remove-orphans && sc-stop-machine"
alias sc-restart="sc-stop && sc-start"
alias sc-start-workers="sc-eval && docker-compose start crontab gearman-workers gearman-redis gearman"
alias sc-stop-workers="sc-eval && docker-compose stop crontab gearman-workers gearman-redis gearman"
alias sc-restart-workers="sc-stop-workers && sc-start-workers"
alias sc-run="sc-eval && docker-compose up -d"
alias sc-run-without-workers="sc-eval && docker-compose up -d && sc-stop-workers"
alias sc-down="sc-eval && docker-compose down --remove-orphans"
alias sc-reload="sc-down && sc-run"

# STANDALONE
alias sc-start-database="sc-eval && docker-compose run -p '3306:3306' database"
alias sc-start-redis="sc-eval && docker-compose run -p '6379:6379' redis"

# MAKE
alias sc-class="sc-exec make class"
alias sc-migrate="sc-exec make migrate"
alias sc-deps="sc-exec make deps_dev"
alias sc-dev="sc-exec make dev"
alias sc-clean-cache="sc-exec make remove_dic flush_cache recreate_cache"
alias sc-create-migration="sc-exec make create-migration"
alias sc-recreate="sc-exec make recreate_database minify_dev icon post_configuration recreate_cache support"
alias sc-reset-db="sc-exec make rebuild_database prepare_test_db post_configuration"
alias sc-build-front="sc-exec make compress icon"
alias sc-sass-watch="sc-exec npm run-script sass-watch"
alias sc-js-watch="sc-exec npm run-script js-watch"
