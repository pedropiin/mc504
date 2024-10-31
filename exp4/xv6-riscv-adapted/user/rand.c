#include "../kernel/types.h"
#include "user.h"
#define MOD 2147483647
int random() {
    int seed = uptime()%MOD;
    seed = ((seed * 1664525)%MOD + 1013904223)%MOD;
    return seed;
}