xhost +local:root
sudo docker run -it    -e DISPLAY=$DISPLAY \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/home/moonlab/diffusion_policy:/workspace" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --runtime=nvidia  \
    --gpus all \
    --privileged \
    --net=host \
    diffusion_policy:v1
