rmdir /Q /S build
mkdir build
cd build
cmake -G "Unix Makefiles" ..
cmake --build .
cd ..