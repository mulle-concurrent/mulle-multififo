# mulle-multififo

#### 🐛 mulle-multififo multi-producer/multi-consumer FIFO holding `void *`

Written for multi-thread configurations. You can have multiple producers and
consumers operating on the FIFO. The size of the FIFO is set at runtime.
Use [mulle-fifo](//github.com/mulle-concurrent/mulle-fifo) if your require only
a dual-thread solution.

You can not store 0 pointers or `~0` pointers into the FIFO.

The operations are non-blocking and lock-free. If the FIFO is full your write
will return with an error. If the FIFO is empty on ready you will get a NULL
pointer.


## Usage

``` c
void   _mulle_pointermultififo_init( struct mulle_pointermultififo *p,
                                     unsigned int size,
                                     struct mulle_allocator *allocator)
```

Call `..._init` to initalize the FIFO for use. Specify a size for the FIFO.
A FIFO must be at least two entries sized. Tip: Make the FIFO _at_ _least_ as
big as the expected number of threads competing for access.


``` c
void   _mulle_pointermultififo_done( struct mulle_pointermultififo *p)
```

Call `..._done` to free the FIFO when no other thread needs it. This is
necessary to avoid leaks.


``` c
void   *_mulle_pointermultififo_read_barrier( struct mulle_pointermultififo *p)
```

Read from the FIFO. Will return NULL if empty. Will not block. Will put up
a memory barrier to ensure that the memory pointed to by the returned pointer
is valid.


``` c
int   _mulle_pointermultififo_write( struct mulle_pointermultififo *p,
                                     void *pointer)
```

Write to the FIFO. Will return -1 if full, 0 on success. Will not block.



## Add

Use [mulle-sde](//github.com/mulle-sde) to add mulle-multififo to your project:

``` console
mulle-sde dependency add --c --github mulle-concurrent mulle-multififo
```

## Install

### mulle-sde

Use [mulle-sde](//github.com/mulle-sde) to build and install mulle-multififo
and all its dependencies:

``` sh
mulle-sde install --prefix /usr/local \
   https://github.com/mulle-concurrent/mulle-multififo/archive/latest.tar.gz
```

### Manual Installation


Install the requirements:

Requirements                                               | Description
-----------------------------------------------------------|-----------------------
[mulle-allocator](//github.com/mulle-c/mulle-allocator)    | Memory allocation wrapper
[mulle-thread](//github.com/mulle-concurrent/mulle-thread) | Thread wrapper

Install into `/usr/local`:

``` sh
cmake -B build \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_PREFIX_PATH=/usr/local \
      -DCMAKE_BUILD_TYPE=Release &&
cmake --build build --config Release &&
cmake --install build --config Release
```

### Steal

Read [STEAL.md](//github.com/mulle-c11/dox/STEAL.md) on how to steal the
source code and incorporate it in your own projects.
