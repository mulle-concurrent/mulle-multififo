/*
 * template: demo/library/PROJECT_SOURCE_DIR/PROJECT_NAME.h
 * vendor/extension: mulle-sde/c-demo
 */
#ifndef mulle_multififo_h__
#define mulle_multififo_h__

#include "include.h"

#include <stdint.h>

/*
 *  (c) 2021 mulle-kybernetik-tv <|ORGANIZATION|>
 *
 *  version:  major, minor, patch
 */
#define MULLE_MULTIFIFO_VERSION  ((0 << 20) | (0 << 8) | 3)


static inline unsigned int   mulle_multififo_get_version_major( void)
{
   return( MULLE_MULTIFIFO_VERSION >> 20);
}


static inline unsigned int   mulle_multififo_get_version_minor( void)
{
   return( (MULLE_MULTIFIFO_VERSION >> 8) & 0xFFF);
}


static inline unsigned int   mulle_multififo_get_version_patch( void)
{
   return( MULLE_MULTIFIFO_VERSION & 0xFF);
}


MULLE_MULTIFIFO_GLOBAL
uint32_t   mulle_multififo_get_version( void);


/*
 * The following files are auto-generated.
 * The _mulle-multififo-provide header is generated by
 * mulle-match-to-c during a reflect.
 */
#include "_mulle-multififo-provide.h"



/*
 * The versioncheck header can be generated with
 * mulle-project-dependency-versions, but it is optional.
 */
#ifdef __has_include
# if __has_include( "_mulle-multififo-versioncheck.h")
#  include "_mulle-multififo-versioncheck.h"
# endif
#endif

#endif
