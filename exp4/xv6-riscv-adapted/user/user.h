struct stat;

#define MAX_VERT 200
#define MAX_EDGE 400
#define NUM_ROUNDS 30

// system calls
int fork(void);
int exit(int) __attribute__((noreturn));
int wait(int*);
int pipe(int*);
int write(int, const void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(const char*, char**);
int open(const char*, int);
int mknod(const char*, short, short);
int unlink(const char*);
int fstat(int fd, struct stat*);
int link(const char*, const char*);
int mkdir(const char*);
int chdir(const char*);
int dup(int);
int getpid(void);
char* sbrk(int);
int sleep(int);
int uptime(void);

// ulib.c
int stat(const char*, struct stat*);
char* strcpy(char*, const char*);
void *memmove(void*, const void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void fprintf(int, const char*, ...) __attribute__ ((format (printf, 2, 3)));
void printf(const char*, ...) __attribute__ ((format (printf, 1, 2)));
char* gets(char*, int max);
uint strlen(const char*);
void* memset(void*, int, uint);
int atoi(const char*);
int memcmp(const void *, const void *, uint);
void *memcpy(void *, const void *, uint);
void dijkstra(int** graph, int num_vertices, int num_edges, int src, int* dist, int *memory_time);
int random();
int permute_line(char file_path[], int *t_read, int *t_write_second, int *memory_time);
int write_random_string(char file_path[], int *t_write, int *memory_time);
void io_bound(char file_path[], int *efficiency, int *memory_time);
void cpu_bound(int *memory_time);


// temp
char* strncpy(char *, const char *, const int n);
//temp

// umalloc.c
void* malloc(uint);
void free(void*);
