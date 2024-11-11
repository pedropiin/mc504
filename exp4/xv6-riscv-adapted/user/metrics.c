/*Routine to calculate evaluation metrics
*/

#include "metrics.h"
#include "../kernel/types.h"
#include "user.h"

// --- THROUGHPUT ---
int max_throughput = 0;
int min_throughput = __INT32_MAX__;

int get_normalized_throughput(int duration, int throughputs[NUM_ROUNDS], int round) {
    // Update min and max throughputs
    if (throughputs[round] > max_throughput) max_throughput = throughputs[round];
    if (throughputs[round] < min_throughput) min_throughput = throughputs[round];
    // Calculate average throughput
    int sum_throughput = 0;
    for (int i = 0; i < NUM_ROUNDS; i++) {
        sum_throughput += throughputs[i];
    }
    float average_throughput = (float)sum_throughput / NUM_ROUNDS;
    // Calculate normalized throughput
    float norm_throughput = 1 - ((average_throughput - min_throughput) / (float)(max_throughput - min_throughput));
    
    return norm_throughput;
}
