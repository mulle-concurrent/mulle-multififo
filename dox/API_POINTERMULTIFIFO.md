Here's a Markdown C documentation for the functions contained in the [mulle-multififo](https://github.com/mulle-concurrent/mulle-multififo) project:

### `mulle_pointermultififo`

A multi-producer/multi-consumer FIFO implementation that holds `void *` pointers. It is designed for multi-threaded configurations with multiple producers and consumers operating on the FIFO.

#### `_mulle_pointermultififo_init`

```c
void _mulle_pointermultififo_init(struct mulle_pointermultififo *p,
                                   unsigned int size,
                                   struct mulle_allocator *allocator);
```

Initializes the FIFO for use. Specify a size for the FIFO. The FIFO must be at least two entries sized. It is recommended to make the FIFO at least as big as the expected number of threads competing for access.

- `p`: A pointer to a `struct mulle_pointermultififo` instance.
- `size`: The size of the FIFO.
- `allocator`: A pointer to a `struct mulle_allocator` instance.

#### `_mulle_pointermultififo_done`

```c
void _mulle_pointermultififo_done(struct mulle_pointermultififo *p);
```

Frees the FIFO when no other thread needs it. This is necessary to avoid leaks.

- `p`: A pointer to a `struct mulle_pointermultififo` instance.

#### `_mulle_pointermultififo_read_barrier`

```c
void *_mulle_pointermultififo_read_barrier(struct mulle_pointermultififo *p);
```

Reads from the FIFO. Returns `NULL` if empty. Does not block. Puts up a memory barrier to ensure that the memory pointed to by the returned pointer is valid.

- `p`: A pointer to a `struct mulle_pointermultififo` instance.

#### `_mulle_pointermultififo_write`

```c
int _mulle_pointermultififo_write(struct mulle_pointermultififo *p,
                                   void *pointer);
```

Writes to the FIFO. Returns `-1` if full, `0` on success. Does not block.

- `p`: A pointer to a `struct mulle_pointermultififo` instance.
- `pointer`: A `void *` pointer to the data to be written to the FIFO.

#### Usage

The operations are non-blocking and lock-free. If the FIFO is full, your write will return with an error. If the FIFO is empty on read, you will get a `NULL` pointer.


I apologize for the oversight. Here's the documentation for the `_mulle_pointermultififo_get_count` function:

#### `_mulle_pointermultififo_get_count`

```c
unsigned int _mulle_pointermultififo_get_count(struct mulle_pointermultififo *p);
```

Retrieves the number of elements currently stored in the FIFO.

- `p`: A pointer to a `struct mulle_pointermultififo` instance.

#### Example

```c
#include <stdio.h>
#include "mulle_pointermultififo.h"

int main() {
    struct mulle_pointermultififo fifo;
    _mulle_pointermultififo_init(&fifo, 10, NULL);
    
    _mulle_pointermultififo_write(&fifo, (void *)1);
    _mulle_pointermultififo_write(&fifo, (void *)2);
    
    unsigned int count = _mulle_pointermultififo_get_count(&fifo);
    
    printf("Number of elements in FIFO: %u\n", count);
    
    _mulle_pointermultififo_done(&fifo);
    return 0;
}
```

In this example, we initialize a `mulle_pointermultififo` with a size of 10 and write two elements to it. We then call the `_mulle_pointermultififo_get_count` function to retrieve the number of elements in the FIFO and print the result. Finally, we clean up the FIFO with `_mulle_pointermultififo_done`.
