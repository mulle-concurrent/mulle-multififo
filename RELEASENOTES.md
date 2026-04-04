### 1.0.3








* pointer-multififo `init/done/read_barrier/write` declarations are exported `(MULLE__MULTIFIFO_GLOBAL)` so the API symbols are visible for shared/core builds
* broadened build macro handling so `MULLE__CORE_BUILD` is treated like a library build, ensuring correct symbol visibility when built as core
