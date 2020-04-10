#!/bin/bash
# Thu, 08.04.2020
# jaejun.lee.1991@gmail.com

#include
base_dir=$(dirname "$0")
. ${base_dir}/registry.config

function check_env(){
    if [ -z ${pull_registry} ] || [ -z ${push_registry} ]; then
      echo "[ERROR] You must set registry variables in registry.config!" | grep "[ERROR]" --color
      exit 1
    else
      echo "[PULL REGISTRY] ${pull_registry}" | grep "[PULL REGISTRY]" --color
      echo "[PUSH REGISTRY] ${push_registry}" | grep "[PUSH REGISTRY]" --color
    fi
}

function check_img() {
    image_pattern='hyperdata8.3_'
    echo -n "Enter the image name : "
    read name
    if [[ ${name} == *${image_pattern}* ]];then
        echo "Update $name image.."
    else
        echo "[ERROR] you must enter the image on hyperdata8.3_{tb, hl, efa, hd}!" | grep "[ERROR]" --color
        exit 1
    fi
}

function update_all(){
    image_list=( "hyperdata8.3_hd" "hyperdata8.3_tb" "hyperdata8.3_hl" "hyperdata8.3_eda" )
    for image in ${image_list[@]};do
        version=$(curl -X GET ${pull_registry}/v2/${image}/tags/list | jq -r '.tags | .[-1]')
        docker pull ${pull_registry}/${image}:${version}
        docker tag ${pull_registry}/${image}:${version} ${push_registry}/${image}:${version}
        docker push ${push_registry}/${image}:${version}
    done
}

function update_once(){
    version=$(curl -X GET ${pull_registry}/v2/${name}/tags/list | jq -r '.tags | .[-1]')
    docker pull ${pull_registry}/${name}:${version}
    docker tag ${pull_registry}/${name}:${version} ${push_registry}/${name}:${version}
    docker push ${push_registry}/${name}:${version}
}

function main() {
  case "${1:-}" in
  all)
    check_env
    update_all
    ;;
  img)
    check_env
    check_img
    update_once
    ;;
  *)
    set +x
    echo "usage:" >&2
    echo "   $0 all" >&2
    echo "   $0 img hyperdata8.3_hd" >&2
    ;;
  esac
}

main $1
