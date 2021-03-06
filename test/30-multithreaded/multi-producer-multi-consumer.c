#include <mulle-multififo/mulle-multififo.h>

#include <time.h>
#include <stdlib.h>


static mulle_thread_rval_t   producer( void *arg)
{
   struct mulle_pointermultififo  *fifo = arg;
   struct timespec                 delay;
   int                             i;

   fprintf( stderr, "producer starts\n");

   i = 1;
   for(;;)
   {
      switch( rand() % 8)
      {
      case 0 :
      case 1 :
      case 2 :
      case 3 :
         if( _mulle_pointermultififo_write( fifo, (void *) (intptr_t) i) == -1)
         {
            fprintf( stderr, "producer full\n");
         }
         else
         {
            if( i == 1024)
               goto done;
            ++i;
         }
         break;

      case 4 :
      case 5 :
      case 6 :
      case 7 :
         delay.tv_sec  = 0;
         delay.tv_nsec = rand() % 10000;
         nanosleep( &delay, NULL);
      }
   }

done:
   fprintf( stderr, "producer quits\n");
}


static mulle_thread_rval_t   consumer( void *arg)
{
   struct mulle_pointermultififo   *fifo = arg;
   struct timespec                 delay;
   void                            *pointer;
   int                             i;

   for(;;)
   {
      switch( rand() % 8)
      {
      case 0 :
      case 1 :
      case 2 :
      case 3 :
         pointer = _mulle_pointermultififo_read_barrier( fifo);
         if( ! pointer)
         {
            fprintf( stderr, "consumer empty\n");
            continue;
         }
         printf( "%ld\n", (long) (intptr_t) pointer); fflush( stdout);
         if( pointer == (void *) 1024)
         {
            goto done;
         }
         break;

      case 4 :
      case 5 :
      case 6 :
      case 7 :
         delay.tv_sec  = 0;
         delay.tv_nsec = rand() % (10000 / 5);
         nanosleep( &delay, NULL);
      }
   }

done:
   fprintf( stderr, "consumer quits\n");
}



int  main( int argc, char *argv[])
{
   struct mulle_pointermultififo  fifo;
   mulle_thread_t                 producer_thread[ 3];
   mulle_thread_t                 consumer_thread[ 3];
   int                            i;

   _mulle_pointermultififo_init( &fifo, 100, NULL);

   for( i = 0; i < 3; i++)
      mulle_thread_create( producer, &fifo, &producer_thread[ i]);

   fprintf( stderr, "READ:\n");
   for( i = 0; i < 3; i++)
      mulle_thread_create( consumer, &fifo, &consumer_thread[ i]);

   for( i = 0; i < 3; i++)
   {
      mulle_thread_join( producer_thread[ i]);
      mulle_thread_join( consumer_thread[ i]);
   }

   _mulle_pointermultififo_done( &fifo);

   return( 0);
}