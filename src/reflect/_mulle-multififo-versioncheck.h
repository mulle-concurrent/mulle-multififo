/*
 *   This file will be regenerated by `mulle-project-versioncheck`.
 *   Any edits will be lost.
 */
#ifndef mulle_multififo_versioncheck_h__
#define mulle_multififo_versioncheck_h__

#if defined( MULLE__ALLOCATOR_VERSION)
# ifndef MULLE__ALLOCATOR_VERSION_MIN
#  define MULLE__ALLOCATOR_VERSION_MIN  ((5 << 20) | (0 << 8) | 2)
# endif
# ifndef MULLE__ALLOCATOR_VERSION_MAX
#  define MULLE__ALLOCATOR_VERSION_MAX  ((6 << 20) | (0 << 8) | 0)
# endif
# if MULLE__ALLOCATOR_VERSION < MULLE__ALLOCATOR_VERSION_MIN
#  error "mulle-allocator is too old"
# endif
# if MULLE__ALLOCATOR_VERSION >= MULLE__ALLOCATOR_VERSION_MAX
#  error "mulle-allocator is too new"
# endif
#endif

#if defined( MULLE__THREAD_VERSION)
# ifndef MULLE__THREAD_VERSION_MIN
#  define MULLE__THREAD_VERSION_MIN  ((4 << 20) | (5 << 8) | 2)
# endif
# ifndef MULLE__THREAD_VERSION_MAX
#  define MULLE__THREAD_VERSION_MAX  ((5 << 20) | (0 << 8) | 0)
# endif
# if MULLE__THREAD_VERSION < MULLE__THREAD_VERSION_MIN
#  error "mulle-thread is too old"
# endif
# if MULLE__THREAD_VERSION >= MULLE__THREAD_VERSION_MAX
#  error "mulle-thread is too new"
# endif
#endif

#endif
