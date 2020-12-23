#! /bin/bash

podman build -f GWT-base.dockerfile -t gwt .
podman build -f GWT-MyApp.dockerfile -t gwt-myapp .

podman run --rm -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/dri:/dev/dri \
  -p 8888:8888 \
  -p 9876:9876 \
  --security-opt=label=type:container_runtime_t \
  -e DISPLAY \
  gwt-myapp
