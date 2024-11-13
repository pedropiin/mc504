/*Routine to calculate evaluation metrics
*/

#include "metrics.h"
#include "../kernel/types.h"
#include "user.h"

int get_normalized_throughput(int duration, int *throughputs, int round, int *min_throughput, int *max_throughput) {
    // Update min and max throughputs
    printf("entered normalized throughtput with duration = %d, round = %d, min_throughput = %d and max = %d\n", duration, round, *min_throughput, *max_throughput);
    if (throughputs[round] > *max_throughput) {
        *max_throughput = throughputs[round];
    }
    printf("now max is = %d\n", *max_throughput);
    if (throughputs[round] < *min_throughput) {
        *min_throughput = throughputs[round];
    }
    printf("now min is = %d\n", *min_throughput);
    // Calculate average throughput
    int sum_throughput = 0;
    for (int i = 0; i <= round; i++) {
        sum_throughput += throughputs[i];
    }
    printf("sum is = %d\n", sum_throughput);
    float average_throughput = (float)sum_throughput / (round + 1);
    printf("avg is = %f\n", average_throughput);
    // Calculate normalized throughput
    float norm_throughput = 1 - ((average_throughput - *min_throughput) / (float)(*max_throughput - *min_throughput + 1));
    printf("calculated\n");
    return norm_throughput;
}
