#include <mulle-multififo/mulle-multififo.h>



int  main( int argc, char *argv[])
{
   struct mulle_pointermultififo   fifo;
   void                        *pointer;
   unsigned int                i;
   int                         rval;

   _mulle_pointermultififo_init( &fifo, 100, NULL);

   printf( "WRITE:\n");
   for( i = 0; i < 101; i++)
   {
      rval = _mulle_pointermultififo_write( &fifo, (void *) (intptr_t) i + 1);
      printf( "%u: %d\n", _mulle_pointermultififo_get_count( &fifo), rval);
   }

   printf( "READ:\n");
   for( i = 0; i < 101; i++)
   {
      pointer = _mulle_pointermultififo_read_barrier( &fifo);
      printf( "%ld\n", (long) (intptr_t) pointer);
   }

   _mulle_pointermultififo_done( &fifo);

   return( 0);
}