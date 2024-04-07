log() {
  echo "[ ${0} ]" "${@}"
}

if [ -z $script_dir ]; then
  log "'script_dir' is not defined. Please define it in your script."
  exit 1
fi

check_for_docker() {
  if ! command -v "docker" > /dev/null 2>&1; then
    log "Docker is not installed."
    log "Please visit https://docs.docker.com/get-docker/"
    exit 1
  fi
  log "Docker is installed."
}

root_dir=$(cd -- "${script_dir}"/.. > /dev/null 2>&1 && pwd)
