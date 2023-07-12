# buildroot makefile
NAME=speederv2
SOURCES0=main.cpp log.cpp common.cpp lib/fec.cpp lib/rs.cpp packet.cpp delay_manager.cpp fd_manager.cpp connection.cpp fec_manager.cpp misc.cpp tunnel_client.cpp tunnel_server.cpp
SOURCES=${SOURCES0} my_ev.cpp -isystem libev 
FLAGS= -std=c++11   -Wall -Wextra -Wno-unused-variable -Wno-unused-parameter -Wno-missing-field-initializers ${OPT}

all:git_version
	rm -f ${NAME}
	$(CXX) -o ${NAME} -I. ${SOURCES} ${FLAGS} -lrt -ggdb -O2

clean:	
	rm -f ${TAR}
	rm -f ${NAME} 
	rm -f git_version.h

git_version:
	    echo "const char *gitversion = \"$(shell git rev-parse HEAD)\";" > git_version.h
