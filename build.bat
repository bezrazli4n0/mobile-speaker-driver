rmdir /Q /S build
mkdir build
cd build
set CC=clang
set CXX=clang++
cmake -G "Unix Makefiles" ..
cmake --build .
cd ..