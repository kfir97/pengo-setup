FROM pengo-base

RUN git clone https://github.com/kfir97/pengo-setup.git && \
    cd pengo-setup && rm Dockerfile README.md && \
    . /opt/ros/melodic/setup.sh && catkin_make

WORKDIR /pengo-setup

ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/melodic/setup.bash && source /pengo-setup/devel/setup.bash && exec $0 $@"]

CMD ["roslaunch", "robot_setup", "robot_setup.launch"]