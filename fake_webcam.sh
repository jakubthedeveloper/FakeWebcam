#!/bin/bash
sudo modprobe -r v4l2loopback
sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="fake Cam" exclusive_caps=1
ffmpeg -stream_loop -1 -re -i travolta.mp4 -f v4l2 -vcodec rawvideo -pix_fmt yuv420p /dev/video10
