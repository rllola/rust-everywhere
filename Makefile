ifeq ($(shell uname),Darwin)
    LDFLAGS := -Wl,-dead_strip
else
    LDFLAGS := -Wl,--gc-sections -lpthread -ldl
endif

all: target/hello
	target/hello

target:
	mkdir -p $@

target/hello: target/main.o target/debug/libhello_world.a
	$(CC) -o $@ $^ $(LDFLAGS)

target/debug/libhello_world.a: src/lib.rs Cargo.toml
	cargo build

target/main.o: src/main.c | target
	$(CC) -o $@ -c $<

clean:
	rm -rf target
