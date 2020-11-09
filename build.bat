rmdir /Q /S build
mkdir build
cd build
set CC=clang
set CXX=clang++
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -G "Unix Makefiles" ..
cmake --build .
cd ..