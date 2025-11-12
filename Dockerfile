FROM alvgaona/ros:humble-desktop

USER root
WORKDIR /root/rslidar_ws

# Copy workspace source code (only RoboSense packages)
COPY src/rs_driver/ ./src/rs_driver/
COPY src/rslidar_msg/ ./src/rslidar_msg/
COPY src/rslidar_sdk/ ./src/rslidar_sdk/

# Install dependencies not covered by rosdep and ROS dependencies
RUN apt-get update && \
    apt-get install -y libeigen3-dev libpcl-dev && \
    . /opt/ros/humble/setup.sh && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y && \
    rm -rf /var/lib/apt/lists/*

# Build the workspace
RUN . /opt/ros/humble/setup.sh && \
    colcon build --symlink-install

# Source the workspace in bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc && \
    echo "source /root/rslidar_ws/install/setup.bash" >> ~/.bashrc

# Set entrypoint
ENTRYPOINT ["/bin/bash"]
