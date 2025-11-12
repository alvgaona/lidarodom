# LiDAR Odometry

This repository contains implementations of LiDAR odometry algorithms dedicated exclusively for research purposes.

## Robosense

To run Robosense node you can either use Pixi to run it or build a Docker image.

### Pixi

To run Robosense ROS2 nodes using Pixi, do these few steps:

1. [Prerequisite] Install pixi in your system.
2. Install pixi dependencies.
```sh
pixi install
```
3. Build the ROS2 packages.
```sh
pixi run build-pkg rslidar_sdk`
```
4. Launch the node
```sh
pixi run ros2 launch rslidar_sdk start.py
```

### Docker

To run Robosense ROS2 nodes from within a container, do these few steps:

1. Build the Docker image.
```sh
docker build -t rslidar_sdk .
```
2. Run the Docker container.
```sh
docker run -it --rm rslidar_sdk
```
3. Launch the node
```sh
ros2 launch rslidar_sdk start.py
```
