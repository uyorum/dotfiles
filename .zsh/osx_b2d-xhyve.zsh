b2d_xhyve_root="/usr/local/share/boot2docker-xhyve"
if [ -f ${b2d_xhyve_root}/.mac_address ]; then
  export DOCKER_HOST=tcp://`${b2d_xhyve_root}/uuid2ip/mac2ip.sh $(cat ${b2d_xhyve_root}/.mac_address)`:2375
  alias start-docker=' \
    pushd ${b2d_xhyve_root} >/dev/null; \
    make run; \
    popd >/dev/null'
  alias halt-docker=' \
    pushd ${b2d_xhyve_root} >/dev/null; \
    make halt; \
    popd >/dev/null'
fi
