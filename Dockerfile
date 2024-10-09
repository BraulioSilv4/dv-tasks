FROM ros:humble

# Run in /recrutas_tarefa
# docker build -t picontainer .
# Command to run: docker run -it --network=host --ipc=host -v $PWD:/root/ros2_ws/src/recrutas_tarefa picontainer

WORKDIR /

RUN apt-get update \
&& apt-get install -y \
ros-humble-navigation2 \
ros-humble-nav2-bringup \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p ~/ros2_ws/src

RUN /bin/bash -c "source /opt/ros/humble/setup.bash && \
cd /root/ros2_ws && \
rosdep install --from-paths src --ignore-src -r -y && \
colcon build && \
echo 'source /root/ros2_ws/install/setup.bash' >> /root/.bashrc && \
echo 'source /opt/ros/humble/setup.bash' >> /root/.bashrc"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
