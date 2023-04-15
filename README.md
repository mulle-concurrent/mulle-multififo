# mulle-multififo

#### 🐛 mulle-multififo multi-producer/multi-consumer FIFO holding `void *`

Written for multi-thread configurations. You can have multiple producers and
consumers operating on the FIFO. The size of the FIFO is set at runtime.
Use [mulle-fifo](//github.com/mulle-concurrent/mulle-fifo) if your require only
a dual-thread solution.


| Release Version                                       | Release Notes
|-------------------------------------------------------|--------------
| ![Mulle kybernetiK tag](https://img.shields.io/github/tag//mulle-multififo.svg?branch=release) [![Build Status](https://github.com//mulle-multififo/workflows/CI/badge.svg?branch=release)](//github.com//mulle-multififo/actions)| [RELEASENOTES](RELEASENOTES.md) |


## API

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







## Usage

You can not store 0 pointers or `~0` pointers into the FIFO.

The operations are non-blocking and lock-free. If the FIFO is full your write
will return with an error. If the FIFO is empty on ready you will get a NULL
pointer.





## Add

Use [mulle-sde](//github.com/mulle-sde) to add mulle-multififo to your project:

``` sh
mulle-sde add github:/
```

To only add the sources of mulle-multififo with dependency
sources use [clib](https://github.com/clibs/clib):


``` sh
clib install --out src/ /
```

Add `-isystem src/` to your `CFLAGS` and compile all the sources that were downloaded with your project.


## Install

### Install with mulle-sde

Use [mulle-sde](//github.com/mulle-sde) to build and install mulle-multififo and all dependencies:

``` sh
mulle-sde install --prefix /usr/local \
   https://github.com///archive/latest.tar.gz
```

### Manual Installation

Install the requirements:

| Requirements                                 | Description
|----------------------------------------------|-----------------------
| [mulle-thread](https://github.com/mulle-concurrent/mulle-thread)             | 🔠 Cross-platform thread/mutex/tss/atomic operations in C
| [mulle-allocator](https://github.com/mulle-c/mulle-allocator)             | 🔄 Flexible C memory allocation scheme

Install **mulle-multififo** into `/usr/local` with [cmake](https://cmake.org):

``` sh
cmake -B build \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_PREFIX_PATH=/usr/local \
      -DCMAKE_BUILD_TYPE=Release &&
cmake --build build --config Release &&
cmake --install build --config Release
```

## Author

[Nat!](https://mulle-kybernetik.com/weblog) for Mulle kybernetiK


