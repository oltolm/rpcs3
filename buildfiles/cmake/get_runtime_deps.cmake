file(GET_RUNTIME_DEPENDENCIES EXECUTABLES ${exe}
    RESOLVED_DEPENDENCIES_VAR resolved_deps
    UNRESOLVED_DEPENDENCIES_VAR unresolved_deps
    DIRECTORIES ${dir})
foreach(dep IN LISTS resolved_deps)
    cmake_path(GET dep PARENT_PATH dep_dir)
    cmake_path(GET exe PARENT_PATH exe_dir)
    cmake_path(COMPARE ${dep_dir} EQUAL ${dir} same)
    if(same)
        file(COPY ${dep} DESTINATION ${exe_dir})
    endif()
endforeach()
