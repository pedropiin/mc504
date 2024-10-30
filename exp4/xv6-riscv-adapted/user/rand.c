#include "../kernel/types.h"
#include "user.h"

int random() {
    int seed = uptime();
    seed = (seed * 1664525 + 1013904223)%2000000000;
    return seed;
}