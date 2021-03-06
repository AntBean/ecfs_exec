all: ecfs_exec test
ecfs_exec: ecfs_exec.o maps.o 
	gcc -DDEBUG -g -shared ecfs_exec.o maps.o libecfsreader64.a -o libecfsexec.so 
ecfs_exec.o:
	gcc -DDEBUG -c -fPIC ecfs_exec.c
maps.o: maps.c
	gcc -c -fPIC maps.c
test:
	make -C example
clean:
	rm -f ecfs_exec *.o
