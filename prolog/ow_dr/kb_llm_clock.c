/* A clock only: no files, handles, threads, transport or provider state. */
#define WIN32_LEAN_AND_MEAN
#ifdef _WIN32
#include <windows.h>
#else
#define _POSIX_C_SOURCE 200809L
#include <time.h>
#endif
#include <SWI-Prolog.h>

static foreign_t monotonic_milliseconds(term_t value)
{
    double milliseconds;
#ifdef _WIN32
    LARGE_INTEGER counter, frequency;
    if (!QueryPerformanceFrequency(&frequency) || !QueryPerformanceCounter(&counter))
        return PL_resource_error("monotonic_clock");
    milliseconds = (double)counter.QuadPart * 1000.0 / (double)frequency.QuadPart;
#else
    struct timespec now;
    if (clock_gettime(CLOCK_MONOTONIC, &now) != 0)
        return PL_resource_error("monotonic_clock");
    milliseconds = (double)now.tv_sec * 1000.0 + (double)now.tv_nsec / 1000000.0;
#endif
    return PL_unify_float(value, milliseconds);
}

install_t install(void)
{
    PL_register_foreign_in_module("kb_llm_timing", "monotonic_milliseconds", 1,
                                 (pl_function_t)monotonic_milliseconds, 0);
}
