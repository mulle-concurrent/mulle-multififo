# Debugging with valgrind and gdb

[Watch a memory range in gdb?](https://stackoverflow.com/questions/11004374/watch-a-memory-range-in-gdb)

Run tests to produce executables: `mulle-sde test run --keep-exe`


### Shell 1

``` shell
EXE='./test/30-multithreaded/multi-producer-multi-consumer.exe'
valgrind --tool=memcheck --vgdb=yes --vgdb-exit=yes --vgdb-error=0 "${EXE}"
```

### Shell 2

Remove old log, which otherwise gets appended to:

``` shell
rm gdb.txt
EXE='./test/30-multithreaded/multi-producer-multi-consumer.exe'
vgdb "${EXE}"
```

In gdb now say:

```
target remote | vgdb
monitor set vgdb-exit yes
```

#### Step past data structure creation

````
b main
c
n
n
```

Examine data structure and figure out addresses. In the case of
`multi-producer-multi-consumer.exe` its:

```
(gdb) p fifo
$1 = { read = 0x0, write = 0x0, size = 4, allocator = 0x0, storage = 0x4aba4f0}
```

We want to watch "write","read" all 64 bits and "storage" which is 4 * 64 bits.

Don't use expressions to watch something as they will "go away". Figure out
the address and the size and then set watchpoints:

```
watch (int64_t [2]) *&fifo
watch (int64_t [4]) *&*fifo->storage
```

#### Automate watchpoints

Turn on logging, so that the watchpoint information is sent to a logfile
`gdb.txt`. Automate the watchpoints, so we don't have to continue all the time.


```
set logging enabled on

commands 2
  continue
end

commands 3
  continue
end
```

Now run it with

```
c
```

### Automating it more


commands.txt

``` gdb
target remote | vgdb
b main
c
n
n
p fifo
watch -l (int64_t [2]) *&fifo
watch -l (int64_t [4]) *&*fifo->storage
set logging enabled on
```

I haven't figured out how to automate this :(
```
commands 2
  continue
end
commands 3
  continue
end
c
monitor v.kill
```


### Kill kill and quit

```
monitor v.kill
quit
```

