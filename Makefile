PREFIX  = x86_64-w64-mingw32
CC      = $(PREFIX)-c++
all: studio-link.cpp studio-link.h version.rc
	$(PREFIX)-windres version.rc version.o
	$(CC) -DWINDOWS -DFD_SETSIZE=8192 -g -gdwarf-2 -static-libgcc -static-libstdc++ -Wall -shared -o studio-link.dll studio-link.cpp vstsdk2.4/public.sdk/source/vst2.x/audioeffect.cpp vstsdk2.4/public.sdk/source/vst2.x/audioeffectx.cpp vstsdk2.4/public.sdk/source/vst2.x/vstplugmain.cpp -I vstsdk2.4/public.sdk/source/vst2.x/ -I vstsdk2.4/ -I ../my_include  ../baresip/libbaresip.a ../re/libre.a ../rem/librem.a version.o -L ../opus -L ../openssl -lssl -lcrypto -lwsock32 -lws2_32 -liphlpapi -lwinmm -lcrypt32 -lopus -static -Wl,--export-all-symbols -fstack-protector
