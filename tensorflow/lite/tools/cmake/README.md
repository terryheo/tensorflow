# Build TensorFlow Lite with CMake

This page describes how to build the TensorFlow Lite static library with CMake tool.

#### Step 1. Clone TensorFlow repository

```sh
git clone https://github.com/tensorflow/tensorflow.git tensorflow_src
```

#### Step 2. Create CMake build directory and run CMake tool

```sh
mkdir tflite_build && cd tflite_build && cmake ../tensorflow_src/tensorflow/lite/tools/cmake
```

#### Step 3. Build TensorFlow Lite

```sh
cmake --build .
```

**Note:** This should compile a static library `libtensorflow-lite.a` in the current directory.