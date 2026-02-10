CC = gcc
CFLAGS = -fPIC -Wall
LDFLAGS = -shared
LIBS = -lusb-1.0
TARGET = libusbir.so

all: $(TARGET)

$(TARGET): usbir.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $<

install:
	install -d /usr/local/lib
	install -m 755 $(TARGET) /usr/local/lib
	install -d /usr/local/include
	install -m 644 usbir.h /usr/local/include
	ldconfig

clean:
	rm -f *.o $(TARGET)
