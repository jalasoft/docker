FROM python:3.7

RUN mkdir -p /opencv/src

RUN apt-get update && \
    apt-get install -y vim gcc g++ cmake build-essential python3-dev \
	    python-numpy pkg-config libgtk2.0-dev libavcodec-dev libavformat-dev \
	    libavresample-dev libtbb2 libtbb-dev libswscale-dev libjpeg-dev libpng-dev

WORKDIR /opencv/src
RUN wget https://github.com/opencv/opencv/archive/3.4.zip && \
    mv 3.4.zip opencv.zip && \    
    unzip opencv.zip && \
    rm opencv.zip && \
    wget https://github.com/opencv/opencv_contrib/archive/3.4.zip && \
    mv 3.4.zip opencv_contrib.zip && \
    unzip opencv_contrib.zip && \
    rm opencv_contrib.zip && \
    mkdir -p /opencv/build

WORKDIR /opencv/build

RUN cmake -S ../src/opencv-3.4/ -B . \
	-D CMAKE_BUILD_TYPE=Release \
	-D CMAKE_INSTALL_PREFIX="/usr/local" \ 
	-D PYTHON3_EXECUTABLE=/usr/local/bin/python3.7 \ 
 	-D PYTHON3_INCLUDE_DIR=/usr/local/include/python3.7m \
	-D PYTHON3_LIBRARY=/usr/local/lib/libpython3.7m.so \
	-D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.7/site-packages \
	-D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.7/dist-packages/numpy/core/include \
	-D WITH_CUDA=OFF \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
	-D OPENCV_EXTRA_MODULES_PATH=/opencv/src/opencv_contrib-3.4/modules \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D BUILD_EXAMPLES=OFF \
	-D BUILD_TESTS=OFF \
	-D BUILD_PERF_TESTS=OFF \ 
	-D BUILD_opencv_python_tests=OFF && \
    make -j4 && \
    make install && \
    pip install numpy


