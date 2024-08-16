#!/bin/bash

CC=g++
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    #CFLAGS="-O3 -fPIC -std=c++11 -fno-gnu-unique"
    CFLAGS="-O0 -fPIC -std=c++11 -fno-gnu-unique"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CFLAGS="-O3 -fPIC -std=c++11"
fi
LDFLAGS=
INCFLAGS="-Ifirmware/ap_types/"
PROJECT=myproject
LIB_STAMP=mystamp

echo "CC=${CC}"
echo "CFLAGS=${CFLAGS}"
echo "INCFLAGS=${INCFLAGS}"

${CC} ${CFLAGS} ${INCFLAGS} -c firmware/${PROJECT}.cpp -o ${PROJECT}.o
${CC} ${CFLAGS} ${INCFLAGS} -c ${PROJECT}_bridge.cpp -o ${PROJECT}_bridge.o
${CC} ${CFLAGS} ${INCFLAGS} -shared ${PROJECT}.o ${PROJECT}_bridge.o -o firmware/${PROJECT}-${LIB_STAMP}.so
${CC} ${CFLAGS} ${INCFLAGS} -o a.out ${PROJECT}_test.cpp firmware/${PROJECT}-${LIB_STAMP}.so
rm -f *.o
