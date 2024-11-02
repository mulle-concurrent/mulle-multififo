# This file will be regenerated by `mulle-sourcetree-to-cmake` via
# `mulle-sde reflect` and any edits will be lost.
#
# This file will be included by cmake/share/Files.cmake
#
# Disable generation of this file with:
#
# mulle-sde environment set MULLE_SOURCETREE_TO_CMAKE_DEPENDENCIES_FILE DISABLE
#
if( MULLE_TRACE_INCLUDE)
   message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

#
# Generated from sourcetree: 3F44B76F-7C7A-4AD4-A9AB-5146551EAC39;mulle-thread;no-all-load,no-cmake-searchpath,no-import,no-singlephase;
# Disable with : `mulle-sourcetree mark mulle-thread no-link`
# Disable for this platform: `mulle-sourcetree mark mulle-thread no-cmake-platform-${MULLE_UNAME}`
# Disable for a sdk: `mulle-sourcetree mark mulle-thread no-cmake-sdk-<name>`
#
if( NOT MULLE__THREAD_LIBRARY)
   find_library( MULLE__THREAD_LIBRARY NAMES
      ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-thread${CMAKE_DEBUG_POSTFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}
      ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-thread${CMAKE_STATIC_LIBRARY_SUFFIX}
      mulle-thread
      NO_CMAKE_SYSTEM_PATH NO_SYSTEM_ENVIRONMENT_PATH
   )
   if( NOT MULLE__THREAD_LIBRARY AND NOT DEPENDENCY_IGNORE_SYSTEM_LIBARIES)
      find_library( MULLE__THREAD_LIBRARY NAMES
         ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-thread${CMAKE_DEBUG_POSTFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}
         ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-thread${CMAKE_STATIC_LIBRARY_SUFFIX}
         mulle-thread
      )
   endif()
   message( STATUS "MULLE__THREAD_LIBRARY is ${MULLE__THREAD_LIBRARY}")
   #
   # The order looks ascending, but due to the way this file is read
   # it ends up being descending, which is what we need.
   #
   if( MULLE__THREAD_LIBRARY)
      #
      # Add MULLE__THREAD_LIBRARY to DEPENDENCY_LIBRARIES list.
      # Disable with: `mulle-sourcetree mark mulle-thread no-cmake-add`
      #
      list( APPEND DEPENDENCY_LIBRARIES ${MULLE__THREAD_LIBRARY})
      #
      # Inherit information from dependency.
      # Encompasses: no-cmake-searchpath,no-cmake-dependency,no-cmake-loader
      # Disable with: `mulle-sourcetree mark mulle-thread no-cmake-inherit`
      #
      # temporarily expand CMAKE_MODULE_PATH
      get_filename_component( _TMP_MULLE__THREAD_ROOT "${MULLE__THREAD_LIBRARY}" DIRECTORY)
      get_filename_component( _TMP_MULLE__THREAD_ROOT "${_TMP_MULLE__THREAD_ROOT}" DIRECTORY)
      #
      #
      # Search for "Definitions.cmake" and "DependenciesAndLibraries.cmake" to include.
      # Disable with: `mulle-sourcetree mark mulle-thread no-cmake-dependency`
      #
      foreach( _TMP_MULLE__THREAD_NAME "mulle-thread")
         set( _TMP_MULLE__THREAD_DIR "${_TMP_MULLE__THREAD_ROOT}/include/${_TMP_MULLE__THREAD_NAME}/cmake")
         # use explicit path to avoid "surprises"
         if( IS_DIRECTORY "${_TMP_MULLE__THREAD_DIR}")
            list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_MULLE__THREAD_DIR}")
            # we only want top level INHERIT_OBJC_LOADERS, so disable them
            if( NOT NO_INHERIT_OBJC_LOADERS)
               set( NO_INHERIT_OBJC_LOADERS OFF)
            endif()
            list( APPEND _TMP_INHERIT_OBJC_LOADERS ${NO_INHERIT_OBJC_LOADERS})
            set( NO_INHERIT_OBJC_LOADERS ON)
            #
            include( "${_TMP_MULLE__THREAD_DIR}/DependenciesAndLibraries.cmake" OPTIONAL)
            #
            list( GET _TMP_INHERIT_OBJC_LOADERS -1 NO_INHERIT_OBJC_LOADERS)
            list( REMOVE_AT _TMP_INHERIT_OBJC_LOADERS -1)
            list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_MULLE__THREAD_DIR}")
            #
            unset( MULLE__THREAD_DEFINITIONS)
            include( "${_TMP_MULLE__THREAD_DIR}/Definitions.cmake" OPTIONAL)
            list( APPEND INHERITED_DEFINITIONS ${MULLE__THREAD_DEFINITIONS})
            break()
         else()
            message( STATUS "${_TMP_MULLE__THREAD_DIR} not found")
         endif()
      endforeach()
   else()
      # Disable with: `mulle-sourcetree mark mulle-thread no-require-link`
      message( SEND_ERROR "MULLE__THREAD_LIBRARY was not found")
   endif()
endif()


#
# Generated from sourcetree: C3DD90B8-8890-4D16-AB56-FDE2EF2AE35E;mulle-allocator;no-all-load,no-cmake-inherit,no-import,no-singlephase;
# Disable with : `mulle-sourcetree mark mulle-allocator no-link`
# Disable for this platform: `mulle-sourcetree mark mulle-allocator no-cmake-platform-${MULLE_UNAME}`
# Disable for a sdk: `mulle-sourcetree mark mulle-allocator no-cmake-sdk-<name>`
#
if( NOT MULLE__ALLOCATOR_LIBRARY)
   find_library( MULLE__ALLOCATOR_LIBRARY NAMES
      ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-allocator${CMAKE_DEBUG_POSTFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}
      ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-allocator${CMAKE_STATIC_LIBRARY_SUFFIX}
      mulle-allocator
      NO_CMAKE_SYSTEM_PATH NO_SYSTEM_ENVIRONMENT_PATH
   )
   if( NOT MULLE__ALLOCATOR_LIBRARY AND NOT DEPENDENCY_IGNORE_SYSTEM_LIBARIES)
      find_library( MULLE__ALLOCATOR_LIBRARY NAMES
         ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-allocator${CMAKE_DEBUG_POSTFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}
         ${CMAKE_STATIC_LIBRARY_PREFIX}mulle-allocator${CMAKE_STATIC_LIBRARY_SUFFIX}
         mulle-allocator
      )
   endif()
   message( STATUS "MULLE__ALLOCATOR_LIBRARY is ${MULLE__ALLOCATOR_LIBRARY}")
   #
   # The order looks ascending, but due to the way this file is read
   # it ends up being descending, which is what we need.
   #
   if( MULLE__ALLOCATOR_LIBRARY)
      #
      # Add MULLE__ALLOCATOR_LIBRARY to DEPENDENCY_LIBRARIES list.
      # Disable with: `mulle-sourcetree mark mulle-allocator no-cmake-add`
      #
      list( APPEND DEPENDENCY_LIBRARIES ${MULLE__ALLOCATOR_LIBRARY})
      # intentionally left blank
   else()
      # Disable with: `mulle-sourcetree mark mulle-allocator no-require-link`
      message( SEND_ERROR "MULLE__ALLOCATOR_LIBRARY was not found")
   endif()
endif()
