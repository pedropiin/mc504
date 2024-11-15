#ifndef METRICS_H
#define METRICS_H

#define NUM_ROUNDS 30

int get_normalized_throughput(int duration, int *throughputs, int round, int *min_throughput, int *max_throughput);

#endif
