
_dijkstra: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 04             	sub    $0x4,%esp
   9:	8b 5d 10             	mov    0x10(%ebp),%ebx
   c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
   f:	85 db                	test   %ebx,%ebx
  11:	7e 3d                	jle    50 <min_distance_vertex+0x50>
    int min_idx = 0;
  13:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
  15:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
  17:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1c:	89 75 f0             	mov    %esi,-0x10(%ebp)
  1f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
  20:	8b 14 87             	mov    (%edi,%eax,4),%edx
  23:	39 ca                	cmp    %ecx,%edx
  25:	7d 14                	jge    3b <min_distance_vertex+0x3b>
  27:	8b 75 0c             	mov    0xc(%ebp),%esi
  2a:	8b 34 86             	mov    (%esi,%eax,4),%esi
  2d:	85 f6                	test   %esi,%esi
  2f:	8b 75 f0             	mov    -0x10(%ebp),%esi
  32:	0f 44 ca             	cmove  %edx,%ecx
  35:	0f 44 f0             	cmove  %eax,%esi
  38:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
  3b:	83 c0 01             	add    $0x1,%eax
  3e:	39 c3                	cmp    %eax,%ebx
  40:	75 de                	jne    20 <min_distance_vertex+0x20>
  42:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
  45:	83 c4 04             	add    $0x4,%esp
  48:	5b                   	pop    %ebx
  49:	89 f0                	mov    %esi,%eax
  4b:	5e                   	pop    %esi
  4c:	5f                   	pop    %edi
  4d:	5d                   	pop    %ebp
  4e:	c3                   	ret    
  4f:	90                   	nop
  50:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
  53:	31 f6                	xor    %esi,%esi
}
  55:	5b                   	pop    %ebx
  56:	89 f0                	mov    %esi,%eax
  58:	5e                   	pop    %esi
  59:	5f                   	pop    %edi
  5a:	5d                   	pop    %ebp
  5b:	c3                   	ret    
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000060 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	57                   	push   %edi
  64:	56                   	push   %esi
  65:	53                   	push   %ebx
  66:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
  69:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
  6c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
  6f:	89 e6                	mov    %esp,%esi
  71:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  78:	8d 41 0f             	lea    0xf(%ecx),%eax
  7b:	89 c2                	mov    %eax,%edx
  7d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  82:	29 c6                	sub    %eax,%esi
  84:	83 e2 f0             	and    $0xfffffff0,%edx
  87:	39 f4                	cmp    %esi,%esp
  89:	74 12                	je     9d <dijkstra+0x3d>
  8b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  91:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
  98:	00 
  99:	39 f4                	cmp    %esi,%esp
  9b:	75 ee                	jne    8b <dijkstra+0x2b>
  9d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  a3:	29 d4                	sub    %edx,%esp
  a5:	85 d2                	test   %edx,%edx
  a7:	0f 85 ef 00 00 00    	jne    19c <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
  ad:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
  b0:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
  b2:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
  b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  b8:	85 c0                	test   %eax,%eax
  ba:	0f 8e e6 00 00 00    	jle    1a6 <dijkstra+0x146>
  c0:	89 d8                	mov    %ebx,%eax
  c2:	89 fa                	mov    %edi,%edx
  c4:	01 d9                	add    %ebx,%ecx
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
  d0:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
  d6:	83 c0 04             	add    $0x4,%eax
  d9:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
  dc:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
  e3:	39 c8                	cmp    %ecx,%eax
  e5:	75 e9                	jne    d0 <dijkstra+0x70>
    dist[src] = 0;
  e7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  ed:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
  f8:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
  fa:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
  ff:	31 c0                	xor    %eax,%eax
 101:	eb 07                	jmp    10a <dijkstra+0xaa>
 103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 107:	90                   	nop
 108:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 10a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 10d:	39 ca                	cmp    %ecx,%edx
 10f:	7d 0a                	jge    11b <dijkstra+0xbb>
 111:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 115:	0f 44 f0             	cmove  %eax,%esi
 118:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 11b:	8d 50 01             	lea    0x1(%eax),%edx
 11e:	39 55 0c             	cmp    %edx,0xc(%ebp)
 121:	75 e5                	jne    108 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 123:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 126:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 12d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 133:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 136:	75 18                	jne    150 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 138:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 13b:	8d 56 01             	lea    0x1(%esi),%edx
 13e:	39 c6                	cmp    %eax,%esi
 140:	74 52                	je     194 <dijkstra+0x134>
 142:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 145:	eb b1                	jmp    f8 <dijkstra+0x98>
 147:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 150:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 156:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 159:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 15c:	31 d2                	xor    %edx,%edx
 15e:	eb 02                	jmp    162 <dijkstra+0x102>
 160:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 162:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 165:	85 c9                	test   %ecx,%ecx
 167:	74 17                	je     180 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 169:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 16c:	85 db                	test   %ebx,%ebx
 16e:	75 10                	jne    180 <dijkstra+0x120>
 170:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 173:	03 0b                	add    (%ebx),%ecx
 175:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 178:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 17b:	7e 03                	jle    180 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 17d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 180:	8d 4a 01             	lea    0x1(%edx),%ecx
 183:	39 c2                	cmp    %eax,%edx
 185:	75 d9                	jne    160 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 187:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 18a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 18d:	8d 56 01             	lea    0x1(%esi),%edx
 190:	39 c6                	cmp    %eax,%esi
 192:	75 ae                	jne    142 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 194:	8d 65 f4             	lea    -0xc(%ebp),%esp
 197:	5b                   	pop    %ebx
 198:	5e                   	pop    %esi
 199:	5f                   	pop    %edi
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    
    int visited[num_vertices];
 19c:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 1a1:	e9 07 ff ff ff       	jmp    ad <dijkstra+0x4d>
    dist[src] = 0;
 1a6:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 1ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1af:	5b                   	pop    %ebx
 1b0:	5e                   	pop    %esi
 1b1:	5f                   	pop    %edi
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	66 90                	xchg   %ax,%ax
 1b6:	66 90                	xchg   %ax,%ax
 1b8:	66 90                	xchg   %ax,%ax
 1ba:	66 90                	xchg   %ax,%ax
 1bc:	66 90                	xchg   %ax,%ax
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1c1:	31 c0                	xor    %eax,%eax
{
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	53                   	push   %ebx
 1c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	84 d2                	test   %dl,%dl
 1dc:	75 f2                	jne    1d0 <strcpy+0x10>
    ;
  return os;
}
 1de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e1:	89 c8                	mov    %ecx,%eax
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    
 1e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
 1f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1fa:	0f b6 02             	movzbl (%edx),%eax
 1fd:	84 c0                	test   %al,%al
 1ff:	75 17                	jne    218 <strcmp+0x28>
 201:	eb 3a                	jmp    23d <strcmp+0x4d>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 20c:	83 c2 01             	add    $0x1,%edx
 20f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 212:	84 c0                	test   %al,%al
 214:	74 1a                	je     230 <strcmp+0x40>
    p++, q++;
 216:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 218:	0f b6 19             	movzbl (%ecx),%ebx
 21b:	38 c3                	cmp    %al,%bl
 21d:	74 e9                	je     208 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 21f:	29 d8                	sub    %ebx,%eax
}
 221:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 224:	c9                   	leave  
 225:	c3                   	ret    
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 230:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 234:	31 c0                	xor    %eax,%eax
 236:	29 d8                	sub    %ebx,%eax
}
 238:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 23b:	c9                   	leave  
 23c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 23d:	0f b6 19             	movzbl (%ecx),%ebx
 240:	31 c0                	xor    %eax,%eax
 242:	eb db                	jmp    21f <strcmp+0x2f>
 244:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 3a 00             	cmpb   $0x0,(%edx)
 259:	74 15                	je     270 <strlen+0x20>
 25b:	31 c0                	xor    %eax,%eax
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c0 01             	add    $0x1,%eax
 263:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 267:	89 c1                	mov    %eax,%ecx
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	89 c8                	mov    %ecx,%eax
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
 26f:	90                   	nop
  for(n = 0; s[n]; n++)
 270:	31 c9                	xor    %ecx,%ecx
}
 272:	5d                   	pop    %ebp
 273:	89 c8                	mov    %ecx,%eax
 275:	c3                   	ret    
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	8b 7d fc             	mov    -0x4(%ebp),%edi
 295:	89 d0                	mov    %edx,%eax
 297:	c9                   	leave  
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	75 12                	jne    2c3 <strchr+0x23>
 2b1:	eb 1d                	jmp    2d0 <strchr+0x30>
 2b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b7:	90                   	nop
 2b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2bc:	83 c0 01             	add    $0x1,%eax
 2bf:	84 d2                	test   %dl,%dl
 2c1:	74 0d                	je     2d0 <strchr+0x30>
    if(*s == c)
 2c3:	38 d1                	cmp    %dl,%cl
 2c5:	75 f1                	jne    2b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2c7:	5d                   	pop    %ebp
 2c8:	c3                   	ret    
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2d0:	31 c0                	xor    %eax,%eax
}
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    
 2d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2e9:	31 db                	xor    %ebx,%ebx
{
 2eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ee:	eb 27                	jmp    317 <gets+0x37>
    cc = read(0, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	6a 01                	push   $0x1
 2f5:	57                   	push   %edi
 2f6:	6a 00                	push   $0x0
 2f8:	e8 2e 01 00 00       	call   42b <read>
    if(cc < 1)
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	7e 1d                	jle    321 <gets+0x41>
      break;
    buf[i++] = c;
 304:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 30f:	3c 0a                	cmp    $0xa,%al
 311:	74 1d                	je     330 <gets+0x50>
 313:	3c 0d                	cmp    $0xd,%al
 315:	74 19                	je     330 <gets+0x50>
  for(i=0; i+1 < max; ){
 317:	89 de                	mov    %ebx,%esi
 319:	83 c3 01             	add    $0x1,%ebx
 31c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31f:	7c cf                	jl     2f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 321:	8b 45 08             	mov    0x8(%ebp),%eax
 324:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 328:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32b:	5b                   	pop    %ebx
 32c:	5e                   	pop    %esi
 32d:	5f                   	pop    %edi
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    
  buf[i] = '\0';
 330:	8b 45 08             	mov    0x8(%ebp),%eax
 333:	89 de                	mov    %ebx,%esi
 335:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 339:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33c:	5b                   	pop    %ebx
 33d:	5e                   	pop    %esi
 33e:	5f                   	pop    %edi
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 00                	push   $0x0
 35a:	ff 75 08             	push   0x8(%ebp)
 35d:	e8 f1 00 00 00       	call   453 <open>
  if(fd < 0)
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	78 27                	js     390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	ff 75 0c             	push   0xc(%ebp)
 36f:	89 c3                	mov    %eax,%ebx
 371:	50                   	push   %eax
 372:	e8 f4 00 00 00       	call   46b <fstat>
  close(fd);
 377:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	e8 ba 00 00 00       	call   43b <close>
  return r;
 381:	83 c4 10             	add    $0x10,%esp
}
 384:	8d 65 f8             	lea    -0x8(%ebp),%esp
 387:	89 f0                	mov    %esi,%eax
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb ed                	jmp    384 <stat+0x34>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax

000003a0 <atoi>:

int
atoi(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a7:	0f be 02             	movsbl (%edx),%eax
 3aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3b5:	77 1e                	ja     3d5 <atoi+0x35>
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ca:	0f be 02             	movsbl (%edx),%eax
 3cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
  return n;
}
 3d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d8:	89 c8                	mov    %ecx,%eax
 3da:	c9                   	leave  
 3db:	c3                   	ret    
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 45 10             	mov    0x10(%ebp),%eax
 3e7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ea:	56                   	push   %esi
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 c0                	test   %eax,%eax
 3f0:	7e 13                	jle    405 <memmove+0x25>
 3f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 401:	39 f8                	cmp    %edi,%eax
 403:	75 fb                	jne    400 <memmove+0x20>
  return vdst;
}
 405:	5e                   	pop    %esi
 406:	89 d0                	mov    %edx,%eax
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40b:	b8 01 00 00 00       	mov    $0x1,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <exit>:
SYSCALL(exit)
 413:	b8 02 00 00 00       	mov    $0x2,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <wait>:
SYSCALL(wait)
 41b:	b8 03 00 00 00       	mov    $0x3,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <pipe>:
SYSCALL(pipe)
 423:	b8 04 00 00 00       	mov    $0x4,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <read>:
SYSCALL(read)
 42b:	b8 05 00 00 00       	mov    $0x5,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <write>:
SYSCALL(write)
 433:	b8 10 00 00 00       	mov    $0x10,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <close>:
SYSCALL(close)
 43b:	b8 15 00 00 00       	mov    $0x15,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <kill>:
SYSCALL(kill)
 443:	b8 06 00 00 00       	mov    $0x6,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <exec>:
SYSCALL(exec)
 44b:	b8 07 00 00 00       	mov    $0x7,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <open>:
SYSCALL(open)
 453:	b8 0f 00 00 00       	mov    $0xf,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mknod>:
SYSCALL(mknod)
 45b:	b8 11 00 00 00       	mov    $0x11,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <unlink>:
SYSCALL(unlink)
 463:	b8 12 00 00 00       	mov    $0x12,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <fstat>:
SYSCALL(fstat)
 46b:	b8 08 00 00 00       	mov    $0x8,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <link>:
SYSCALL(link)
 473:	b8 13 00 00 00       	mov    $0x13,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <mkdir>:
SYSCALL(mkdir)
 47b:	b8 14 00 00 00       	mov    $0x14,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <chdir>:
SYSCALL(chdir)
 483:	b8 09 00 00 00       	mov    $0x9,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <dup>:
SYSCALL(dup)
 48b:	b8 0a 00 00 00       	mov    $0xa,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <getpid>:
SYSCALL(getpid)
 493:	b8 0b 00 00 00       	mov    $0xb,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <sbrk>:
SYSCALL(sbrk)
 49b:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <sleep>:
SYSCALL(sleep)
 4a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <uptime>:
SYSCALL(uptime)
 4ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    
 4b3:	66 90                	xchg   %ax,%ax
 4b5:	66 90                	xchg   %ax,%ax
 4b7:	66 90                	xchg   %ax,%ax
 4b9:	66 90                	xchg   %ax,%ax
 4bb:	66 90                	xchg   %ax,%ax
 4bd:	66 90                	xchg   %ax,%ax
 4bf:	90                   	nop

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 3c             	sub    $0x3c,%esp
 4c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4cc:	89 d1                	mov    %edx,%ecx
{
 4ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4d1:	85 d2                	test   %edx,%edx
 4d3:	0f 89 7f 00 00 00    	jns    558 <printint+0x98>
 4d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4dd:	74 79                	je     558 <printint+0x98>
    neg = 1;
 4df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4e8:	31 db                	xor    %ebx,%ebx
 4ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4f0:	89 c8                	mov    %ecx,%eax
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	89 cf                	mov    %ecx,%edi
 4f6:	f7 75 c4             	divl   -0x3c(%ebp)
 4f9:	0f b6 92 48 0f 00 00 	movzbl 0xf48(%edx),%edx
 500:	89 45 c0             	mov    %eax,-0x40(%ebp)
 503:	89 d8                	mov    %ebx,%eax
 505:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 508:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 50b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 50e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 511:	76 dd                	jbe    4f0 <printint+0x30>
  if(neg)
 513:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 516:	85 c9                	test   %ecx,%ecx
 518:	74 0c                	je     526 <printint+0x66>
    buf[i++] = '-';
 51a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 51f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 521:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 526:	8b 7d b8             	mov    -0x48(%ebp),%edi
 529:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 52d:	eb 07                	jmp    536 <printint+0x76>
 52f:	90                   	nop
    putc(fd, buf[i]);
 530:	0f b6 13             	movzbl (%ebx),%edx
 533:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 536:	83 ec 04             	sub    $0x4,%esp
 539:	88 55 d7             	mov    %dl,-0x29(%ebp)
 53c:	6a 01                	push   $0x1
 53e:	56                   	push   %esi
 53f:	57                   	push   %edi
 540:	e8 ee fe ff ff       	call   433 <write>
  while(--i >= 0)
 545:	83 c4 10             	add    $0x10,%esp
 548:	39 de                	cmp    %ebx,%esi
 54a:	75 e4                	jne    530 <printint+0x70>
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 55f:	eb 87                	jmp    4e8 <printint+0x28>
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 57c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 57f:	0f b6 13             	movzbl (%ebx),%edx
 582:	84 d2                	test   %dl,%dl
 584:	74 6a                	je     5f0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 586:	8d 45 10             	lea    0x10(%ebp),%eax
 589:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 58c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 58f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 591:	89 45 d0             	mov    %eax,-0x30(%ebp)
 594:	eb 36                	jmp    5cc <printf+0x5c>
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
 5a0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5a3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	74 15                	je     5c2 <printf+0x52>
  write(fd, &c, 1);
 5ad:	83 ec 04             	sub    $0x4,%esp
 5b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5b3:	6a 01                	push   $0x1
 5b5:	57                   	push   %edi
 5b6:	56                   	push   %esi
 5b7:	e8 77 fe ff ff       	call   433 <write>
 5bc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5bf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5c2:	0f b6 13             	movzbl (%ebx),%edx
 5c5:	83 c3 01             	add    $0x1,%ebx
 5c8:	84 d2                	test   %dl,%dl
 5ca:	74 24                	je     5f0 <printf+0x80>
    c = fmt[i] & 0xff;
 5cc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5cf:	85 c9                	test   %ecx,%ecx
 5d1:	74 cd                	je     5a0 <printf+0x30>
      }
    } else if(state == '%'){
 5d3:	83 f9 25             	cmp    $0x25,%ecx
 5d6:	75 ea                	jne    5c2 <printf+0x52>
      if(c == 'd'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	0f 84 07 01 00 00    	je     6e8 <printf+0x178>
 5e1:	83 e8 63             	sub    $0x63,%eax
 5e4:	83 f8 15             	cmp    $0x15,%eax
 5e7:	77 17                	ja     600 <printf+0x90>
 5e9:	ff 24 85 f0 0e 00 00 	jmp    *0xef0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f3:	5b                   	pop    %ebx
 5f4:	5e                   	pop    %esi
 5f5:	5f                   	pop    %edi
 5f6:	5d                   	pop    %ebp
 5f7:	c3                   	ret    
 5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 606:	6a 01                	push   $0x1
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 60e:	e8 20 fe ff ff       	call   433 <write>
        putc(fd, c);
 613:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 617:	83 c4 0c             	add    $0xc,%esp
 61a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 61d:	6a 01                	push   $0x1
 61f:	57                   	push   %edi
 620:	56                   	push   %esi
 621:	e8 0d fe ff ff       	call   433 <write>
        putc(fd, c);
 626:	83 c4 10             	add    $0x10,%esp
      state = 0;
 629:	31 c9                	xor    %ecx,%ecx
 62b:	eb 95                	jmp    5c2 <printf+0x52>
 62d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 630:	83 ec 0c             	sub    $0xc,%esp
 633:	b9 10 00 00 00       	mov    $0x10,%ecx
 638:	6a 00                	push   $0x0
 63a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 63d:	8b 10                	mov    (%eax),%edx
 63f:	89 f0                	mov    %esi,%eax
 641:	e8 7a fe ff ff       	call   4c0 <printint>
        ap++;
 646:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 64a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64d:	31 c9                	xor    %ecx,%ecx
 64f:	e9 6e ff ff ff       	jmp    5c2 <printf+0x52>
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 658:	8b 45 d0             	mov    -0x30(%ebp),%eax
 65b:	8b 10                	mov    (%eax),%edx
        ap++;
 65d:	83 c0 04             	add    $0x4,%eax
 660:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 663:	85 d2                	test   %edx,%edx
 665:	0f 84 8d 00 00 00    	je     6f8 <printf+0x188>
        while(*s != 0){
 66b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 66e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 670:	84 c0                	test   %al,%al
 672:	0f 84 4a ff ff ff    	je     5c2 <printf+0x52>
 678:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 67b:	89 d3                	mov    %edx,%ebx
 67d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
          s++;
 683:	83 c3 01             	add    $0x1,%ebx
 686:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 689:	6a 01                	push   $0x1
 68b:	57                   	push   %edi
 68c:	56                   	push   %esi
 68d:	e8 a1 fd ff ff       	call   433 <write>
        while(*s != 0){
 692:	0f b6 03             	movzbl (%ebx),%eax
 695:	83 c4 10             	add    $0x10,%esp
 698:	84 c0                	test   %al,%al
 69a:	75 e4                	jne    680 <printf+0x110>
      state = 0;
 69c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 69f:	31 c9                	xor    %ecx,%ecx
 6a1:	e9 1c ff ff ff       	jmp    5c2 <printf+0x52>
 6a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b8:	6a 01                	push   $0x1
 6ba:	e9 7b ff ff ff       	jmp    63a <printf+0xca>
 6bf:	90                   	nop
        putc(fd, *ap);
 6c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6c6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6c8:	6a 01                	push   $0x1
 6ca:	57                   	push   %edi
 6cb:	56                   	push   %esi
        putc(fd, *ap);
 6cc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6cf:	e8 5f fd ff ff       	call   433 <write>
        ap++;
 6d4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6db:	31 c9                	xor    %ecx,%ecx
 6dd:	e9 e0 fe ff ff       	jmp    5c2 <printf+0x52>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6e8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6eb:	83 ec 04             	sub    $0x4,%esp
 6ee:	e9 2a ff ff ff       	jmp    61d <printf+0xad>
 6f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6f7:	90                   	nop
          s = "(null)";
 6f8:	ba e8 0e 00 00       	mov    $0xee8,%edx
        while(*s != 0){
 6fd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 700:	b8 28 00 00 00       	mov    $0x28,%eax
 705:	89 d3                	mov    %edx,%ebx
 707:	e9 74 ff ff ff       	jmp    680 <printf+0x110>
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 00 15 00 00       	mov    0x1500,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 728:	89 c2                	mov    %eax,%edx
 72a:	8b 00                	mov    (%eax),%eax
 72c:	39 ca                	cmp    %ecx,%edx
 72e:	73 30                	jae    760 <free+0x50>
 730:	39 c1                	cmp    %eax,%ecx
 732:	72 04                	jb     738 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 734:	39 c2                	cmp    %eax,%edx
 736:	72 f0                	jb     728 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 f8                	cmp    %edi,%eax
 740:	74 30                	je     772 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 742:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 745:	8b 42 04             	mov    0x4(%edx),%eax
 748:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 74b:	39 f1                	cmp    %esi,%ecx
 74d:	74 3a                	je     789 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 74f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 751:	5b                   	pop    %ebx
  freep = p;
 752:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 760:	39 c2                	cmp    %eax,%edx
 762:	72 c4                	jb     728 <free+0x18>
 764:	39 c1                	cmp    %eax,%ecx
 766:	73 c0                	jae    728 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76e:	39 f8                	cmp    %edi,%eax
 770:	75 d0                	jne    742 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 772:	03 70 04             	add    0x4(%eax),%esi
 775:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 778:	8b 02                	mov    (%edx),%eax
 77a:	8b 00                	mov    (%eax),%eax
 77c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 77f:	8b 42 04             	mov    0x4(%edx),%eax
 782:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 785:	39 f1                	cmp    %esi,%ecx
 787:	75 c6                	jne    74f <free+0x3f>
    p->s.size += bp->s.size;
 789:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 78c:	89 15 00 15 00 00    	mov    %edx,0x1500
    p->s.size += bp->s.size;
 792:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 795:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 798:	89 0a                	mov    %ecx,(%edx)
}
 79a:	5b                   	pop    %ebx
 79b:	5e                   	pop    %esi
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
 79e:	c3                   	ret    
 79f:	90                   	nop

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 3d 00 15 00 00    	mov    0x1500,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 70 07             	lea    0x7(%eax),%esi
 7b5:	c1 ee 03             	shr    $0x3,%esi
 7b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7bb:	85 ff                	test   %edi,%edi
 7bd:	0f 84 9d 00 00 00    	je     860 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7c5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7c8:	39 f1                	cmp    %esi,%ecx
 7ca:	73 6a                	jae    836 <malloc+0x96>
 7cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7d1:	39 de                	cmp    %ebx,%esi
 7d3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7d6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7e0:	eb 17                	jmp    7f9 <malloc+0x59>
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ea:	8b 48 04             	mov    0x4(%eax),%ecx
 7ed:	39 f1                	cmp    %esi,%ecx
 7ef:	73 4f                	jae    840 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f1:	8b 3d 00 15 00 00    	mov    0x1500,%edi
 7f7:	89 c2                	mov    %eax,%edx
 7f9:	39 d7                	cmp    %edx,%edi
 7fb:	75 eb                	jne    7e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7fd:	83 ec 0c             	sub    $0xc,%esp
 800:	ff 75 e4             	push   -0x1c(%ebp)
 803:	e8 93 fc ff ff       	call   49b <sbrk>
  if(p == (char*)-1)
 808:	83 c4 10             	add    $0x10,%esp
 80b:	83 f8 ff             	cmp    $0xffffffff,%eax
 80e:	74 1c                	je     82c <malloc+0x8c>
  hp->s.size = nu;
 810:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 813:	83 ec 0c             	sub    $0xc,%esp
 816:	83 c0 08             	add    $0x8,%eax
 819:	50                   	push   %eax
 81a:	e8 f1 fe ff ff       	call   710 <free>
  return freep;
 81f:	8b 15 00 15 00 00    	mov    0x1500,%edx
      if((p = morecore(nunits)) == 0)
 825:	83 c4 10             	add    $0x10,%esp
 828:	85 d2                	test   %edx,%edx
 82a:	75 bc                	jne    7e8 <malloc+0x48>
        return 0;
  }
}
 82c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 82f:	31 c0                	xor    %eax,%eax
}
 831:	5b                   	pop    %ebx
 832:	5e                   	pop    %esi
 833:	5f                   	pop    %edi
 834:	5d                   	pop    %ebp
 835:	c3                   	ret    
    if(p->s.size >= nunits){
 836:	89 d0                	mov    %edx,%eax
 838:	89 fa                	mov    %edi,%edx
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 840:	39 ce                	cmp    %ecx,%esi
 842:	74 4c                	je     890 <malloc+0xf0>
        p->s.size -= nunits;
 844:	29 f1                	sub    %esi,%ecx
 846:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 849:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 84c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 84f:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 855:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 858:	83 c0 08             	add    $0x8,%eax
}
 85b:	5b                   	pop    %ebx
 85c:	5e                   	pop    %esi
 85d:	5f                   	pop    %edi
 85e:	5d                   	pop    %ebp
 85f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 860:	c7 05 00 15 00 00 04 	movl   $0x1504,0x1500
 867:	15 00 00 
    base.s.size = 0;
 86a:	bf 04 15 00 00       	mov    $0x1504,%edi
    base.s.ptr = freep = prevp = &base;
 86f:	c7 05 04 15 00 00 04 	movl   $0x1504,0x1504
 876:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 879:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 87b:	c7 05 08 15 00 00 00 	movl   $0x0,0x1508
 882:	00 00 00 
    if(p->s.size >= nunits){
 885:	e9 42 ff ff ff       	jmp    7cc <malloc+0x2c>
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 890:	8b 08                	mov    (%eax),%ecx
 892:	89 0a                	mov    %ecx,(%edx)
 894:	eb b9                	jmp    84f <malloc+0xaf>
 896:	66 90                	xchg   %ax,%ax
 898:	66 90                	xchg   %ax,%ax
 89a:	66 90                	xchg   %ax,%ax
 89c:	66 90                	xchg   %ax,%ax
 89e:	66 90                	xchg   %ax,%ax

000008a0 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 8a4:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 8a9:	56                   	push   %esi
 8aa:	53                   	push   %ebx
 8ab:	83 ec 0c             	sub    $0xc,%esp
 8ae:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8b1:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 8b4:	e8 f7 00 00 00       	call   9b0 <random>
 8b9:	89 c1                	mov    %eax,%ecx
 8bb:	f7 ef                	imul   %edi
 8bd:	89 c8                	mov    %ecx,%eax
 8bf:	c1 f8 1f             	sar    $0x1f,%eax
 8c2:	c1 fa 06             	sar    $0x6,%edx
 8c5:	29 c2                	sub    %eax,%edx
 8c7:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 8cd:	29 c1                	sub    %eax,%ecx
 8cf:	83 f9 63             	cmp    $0x63,%ecx
 8d2:	89 ca                	mov    %ecx,%edx
 8d4:	8d 41 64             	lea    0x64(%ecx),%eax
 8d7:	0f 4e d0             	cmovle %eax,%edx
 8da:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 8dc:	e8 cf 00 00 00       	call   9b0 <random>
 8e1:	89 c1                	mov    %eax,%ecx
 8e3:	f7 ef                	imul   %edi
 8e5:	89 c8                	mov    %ecx,%eax
 8e7:	c1 f8 1f             	sar    $0x1f,%eax
 8ea:	c1 fa 07             	sar    $0x7,%edx
 8ed:	29 c2                	sub    %eax,%edx
 8ef:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 8f5:	29 c1                	sub    %eax,%ecx
 8f7:	8d 41 32             	lea    0x32(%ecx),%eax
 8fa:	89 ca                	mov    %ecx,%edx
 8fc:	83 f9 31             	cmp    $0x31,%ecx
 8ff:	0f 4e d0             	cmovle %eax,%edx
 902:	8b 45 10             	mov    0x10(%ebp),%eax
 905:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 907:	8b 13                	mov    (%ebx),%edx
 909:	85 d2                	test   %edx,%edx
 90b:	7e 38                	jle    945 <gen_random_digraph+0xa5>
 90d:	89 f1                	mov    %esi,%ecx
 90f:	31 ff                	xor    %edi,%edi
 911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 918:	31 c0                	xor    %eax,%eax
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 920:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 927:	8b 13                	mov    (%ebx),%edx
 929:	83 c0 01             	add    $0x1,%eax
 92c:	39 c2                	cmp    %eax,%edx
 92e:	7f f0                	jg     920 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 930:	83 c7 01             	add    $0x1,%edi
 933:	81 c1 20 03 00 00    	add    $0x320,%ecx
 939:	39 fa                	cmp    %edi,%edx
 93b:	7f db                	jg     918 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 93d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 943:	7f 22                	jg     967 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 945:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 94b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 952:	8d 04 86             	lea    (%esi,%eax,4),%eax
 955:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 958:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 95e:	05 20 03 00 00       	add    $0x320,%eax
 963:	39 d0                	cmp    %edx,%eax
 965:	75 f1                	jne    958 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 967:	8b 45 10             	mov    0x10(%ebp),%eax
 96a:	31 c9                	xor    %ecx,%ecx
 96c:	8b 00                	mov    (%eax),%eax
 96e:	85 c0                	test   %eax,%eax
 970:	7e 31                	jle    9a3 <gen_random_digraph+0x103>
 972:	89 75 08             	mov    %esi,0x8(%ebp)
 975:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 977:	e8 34 00 00 00       	call   9b0 <random>
    for (int i = 0; i < *num_edges; i++) {
 97c:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 97f:	99                   	cltd   
 980:	f7 3b                	idivl  (%ebx)
 982:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 984:	e8 27 00 00 00       	call   9b0 <random>
        graph[new_edge_u][new_edge_v] = 1;
 989:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 98f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 992:	99                   	cltd   
 993:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 995:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 998:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 99f:	39 30                	cmp    %esi,(%eax)
 9a1:	7f d4                	jg     977 <gen_random_digraph+0xd7>
    }
}
 9a3:	83 c4 0c             	add    $0xc,%esp
 9a6:	5b                   	pop    %ebx
 9a7:	5e                   	pop    %esi
 9a8:	5f                   	pop    %edi
 9a9:	5d                   	pop    %ebp
 9aa:	c3                   	ret    
 9ab:	66 90                	xchg   %ax,%ax
 9ad:	66 90                	xchg   %ax,%ax
 9af:	90                   	nop

000009b0 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 9b0:	69 0d fc 14 00 00 0d 	imul   $0x19660d,0x14fc,%ecx
 9b7:	66 19 00 
 9ba:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 9bf:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 9c5:	89 c8                	mov    %ecx,%eax
 9c7:	f7 ea                	imul   %edx
 9c9:	89 d0                	mov    %edx,%eax
 9cb:	89 ca                	mov    %ecx,%edx
 9cd:	c1 fa 1f             	sar    $0x1f,%edx
 9d0:	c1 f8 1d             	sar    $0x1d,%eax
 9d3:	29 d0                	sub    %edx,%eax
 9d5:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 9db:	89 c8                	mov    %ecx,%eax
 9dd:	29 d0                	sub    %edx,%eax
 9df:	a3 fc 14 00 00       	mov    %eax,0x14fc
    return seed;
 9e4:	c3                   	ret    
 9e5:	66 90                	xchg   %ax,%ax
 9e7:	66 90                	xchg   %ax,%ax
 9e9:	66 90                	xchg   %ax,%ax
 9eb:	66 90                	xchg   %ax,%ax
 9ed:	66 90                	xchg   %ax,%ax
 9ef:	90                   	nop

000009f0 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	57                   	push   %edi
 9f4:	56                   	push   %esi
 9f5:	53                   	push   %ebx
 9f6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 9fc:	83 0c 24 00          	orl    $0x0,(%esp)
 a00:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 a06:	83 0c 24 00          	orl    $0x0,(%esp)
 a0a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
 a10:	6a 00                	push   $0x0
 a12:	ff 75 08             	push   0x8(%ebp)
 a15:	e8 39 fa ff ff       	call   453 <open>
    if (fp < 0 ) {
 a1a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
 a1d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
 a23:	85 c0                	test   %eax,%eax
 a25:	0f 88 99 01 00 00    	js     bc4 <permute_line+0x1d4>
 a2b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 a31:	31 db                	xor    %ebx,%ebx
 a33:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
 a39:	89 f7                	mov    %esi,%edi
 a3b:	89 de                	mov    %ebx,%esi
 a3d:	89 c3                	mov    %eax,%ebx
 a3f:	eb 12                	jmp    a53 <permute_line+0x63>
 a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 a48:	83 c7 66             	add    $0x66,%edi
 a4b:	83 fe 64             	cmp    $0x64,%esi
 a4e:	74 16                	je     a66 <permute_line+0x76>
        line_idx++;
 a50:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 a53:	83 ec 04             	sub    $0x4,%esp
 a56:	6a 66                	push   $0x66
 a58:	57                   	push   %edi
 a59:	53                   	push   %ebx
 a5a:	e8 cc f9 ff ff       	call   42b <read>
 a5f:	83 c4 10             	add    $0x10,%esp
 a62:	85 c0                	test   %eax,%eax
 a64:	7f e2                	jg     a48 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
 a66:	89 f3                	mov    %esi,%ebx
 a68:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
 a6e:	e8 3d ff ff ff       	call   9b0 <random>
 a73:	89 c1                	mov    %eax,%ecx
 a75:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 a7a:	f7 e9                	imul   %ecx
 a7c:	89 c8                	mov    %ecx,%eax
 a7e:	c1 f8 1f             	sar    $0x1f,%eax
 a81:	c1 fa 05             	sar    $0x5,%edx
 a84:	29 c2                	sub    %eax,%edx
 a86:	6b c2 64             	imul   $0x64,%edx,%eax
 a89:	29 c1                	sub    %eax,%ecx
 a8b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
 a8d:	e8 1e ff ff ff       	call   9b0 <random>
 a92:	89 c1                	mov    %eax,%ecx
 a94:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 a99:	f7 e9                	imul   %ecx
 a9b:	89 c8                	mov    %ecx,%eax
 a9d:	c1 f8 1f             	sar    $0x1f,%eax
 aa0:	c1 fa 05             	sar    $0x5,%edx
 aa3:	29 c2                	sub    %eax,%edx
 aa5:	6b c2 64             	imul   $0x64,%edx,%eax
 aa8:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
 aaa:	39 cf                	cmp    %ecx,%edi
 aac:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
 ab2:	74 5f                	je     b13 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
 ab4:	6b c7 66             	imul   $0x66,%edi,%eax
 ab7:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
 abd:	83 ec 08             	sub    $0x8,%esp
 ac0:	01 c1                	add    %eax,%ecx
 ac2:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 ac8:	51                   	push   %ecx
 ac9:	50                   	push   %eax
 aca:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
 ad0:	e8 eb f6 ff ff       	call   1c0 <strcpy>
        strcpy(lines[line1], lines[line2]);
 ad5:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 adb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 ae1:	6b d2 66             	imul   $0x66,%edx,%edx
 ae4:	01 c2                	add    %eax,%edx
 ae6:	58                   	pop    %eax
 ae7:	59                   	pop    %ecx
 ae8:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
 aee:	52                   	push   %edx
 aef:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 af5:	51                   	push   %ecx
 af6:	e8 c5 f6 ff ff       	call   1c0 <strcpy>
        strcpy(lines[line2], temp);
 afb:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 b01:	5f                   	pop    %edi
 b02:	58                   	pop    %eax
 b03:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b09:	50                   	push   %eax
 b0a:	52                   	push   %edx
 b0b:	e8 b0 f6 ff ff       	call   1c0 <strcpy>
 b10:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 b13:	83 ec 0c             	sub    $0xc,%esp
 b16:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 b1c:	e8 1a f9 ff ff       	call   43b <close>
    fp = open(file_path, O_RDWR);
 b21:	58                   	pop    %eax
 b22:	5a                   	pop    %edx
 b23:	6a 02                	push   $0x2
 b25:	ff 75 08             	push   0x8(%ebp)
 b28:	e8 26 f9 ff ff       	call   453 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 b2d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 b2e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 b30:	58                   	pop    %eax
 b31:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b37:	50                   	push   %eax
 b38:	57                   	push   %edi
 b39:	e8 2d f9 ff ff       	call   46b <fstat>
    char *buffer = malloc(0);
 b3e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 b45:	e8 56 fc ff ff       	call   7a0 <malloc>
    memset(buffer, 0, 0);  
 b4a:	83 c4 0c             	add    $0xc,%esp
 b4d:	6a 00                	push   $0x0
 b4f:	6a 00                	push   $0x0
 b51:	50                   	push   %eax
 b52:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 b58:	e8 23 f7 ff ff       	call   280 <memset>
    write(fp, buffer, 0);
 b5d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 b63:	83 c4 0c             	add    $0xc,%esp
 b66:	6a 00                	push   $0x0
 b68:	52                   	push   %edx
 b69:	57                   	push   %edi
 b6a:	e8 c4 f8 ff ff       	call   433 <write>
    free(buffer);
 b6f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 b75:	89 14 24             	mov    %edx,(%esp)
 b78:	e8 93 fb ff ff       	call   710 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 b7d:	83 c4 10             	add    $0x10,%esp
 b80:	85 ff                	test   %edi,%edi
 b82:	78 59                	js     bdd <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 b84:	85 db                	test   %ebx,%ebx
 b86:	74 26                	je     bae <permute_line+0x1be>
 b88:	6b db 66             	imul   $0x66,%ebx,%ebx
 b8b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 b91:	01 c3                	add    %eax,%ebx
 b93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b97:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 b98:	83 ec 04             	sub    $0x4,%esp
 b9b:	6a 66                	push   $0x66
 b9d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 b9e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 ba1:	57                   	push   %edi
 ba2:	e8 8c f8 ff ff       	call   433 <write>
    for (int i = 0; i < line_idx; i++) {
 ba7:	83 c4 10             	add    $0x10,%esp
 baa:	39 de                	cmp    %ebx,%esi
 bac:	75 ea                	jne    b98 <permute_line+0x1a8>
    }

    close(fp);
 bae:	83 ec 0c             	sub    $0xc,%esp
 bb1:	57                   	push   %edi
 bb2:	e8 84 f8 ff ff       	call   43b <close>
    return 0;
 bb7:	83 c4 10             	add    $0x10,%esp
 bba:	31 c0                	xor    %eax,%eax
 bbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 bbf:	5b                   	pop    %ebx
 bc0:	5e                   	pop    %esi
 bc1:	5f                   	pop    %edi
 bc2:	5d                   	pop    %ebp
 bc3:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 bc4:	83 ec 08             	sub    $0x8,%esp
 bc7:	68 5c 0f 00 00       	push   $0xf5c
 bcc:	6a 01                	push   $0x1
 bce:	e8 9d f9 ff ff       	call   570 <printf>
        return -1;
 bd3:	83 c4 10             	add    $0x10,%esp
 bd6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 bdb:	eb df                	jmp    bbc <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 bdd:	83 ec 08             	sub    $0x8,%esp
 be0:	68 a4 0f 00 00       	push   $0xfa4
 be5:	6a 01                	push   $0x1
 be7:	e8 84 f9 ff ff       	call   570 <printf>
        return -1;
 bec:	83 c4 10             	add    $0x10,%esp
 bef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 bf4:	eb c6                	jmp    bbc <permute_line+0x1cc>
 bf6:	66 90                	xchg   %ax,%ax
 bf8:	66 90                	xchg   %ax,%ax
 bfa:	66 90                	xchg   %ax,%ax
 bfc:	66 90                	xchg   %ax,%ax
 bfe:	66 90                	xchg   %ax,%ax

00000c00 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
 c00:	55                   	push   %ebp
 c01:	89 e5                	mov    %esp,%ebp
 c03:	57                   	push   %edi
 c04:	56                   	push   %esi
 c05:	53                   	push   %ebx
 c06:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 c0c:	83 0c 24 00          	orl    $0x0,(%esp)
 c10:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 c16:	83 0c 24 00          	orl    $0x0,(%esp)
 c1a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
 c20:	6a 00                	push   $0x0
 c22:	ff 75 08             	push   0x8(%ebp)
 c25:	e8 29 f8 ff ff       	call   453 <open>
    if (fp < 0) {
 c2a:	83 c4 10             	add    $0x10,%esp
 c2d:	85 c0                	test   %eax,%eax
 c2f:	0f 88 b1 00 00 00    	js     ce6 <add_line+0xe6>
 c35:	89 c3                	mov    %eax,%ebx
 c37:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 c3d:	31 f6                	xor    %esi,%esi
 c3f:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
 c45:	89 c7                	mov    %eax,%edi
 c47:	eb 12                	jmp    c5b <add_line+0x5b>
 c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 c50:	83 c7 66             	add    $0x66,%edi
 c53:	83 fe 64             	cmp    $0x64,%esi
 c56:	74 1c                	je     c74 <add_line+0x74>
        line_idx++;
 c58:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 c5b:	83 ec 04             	sub    $0x4,%esp
 c5e:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
 c64:	6a 66                	push   $0x66
 c66:	57                   	push   %edi
 c67:	53                   	push   %ebx
 c68:	e8 be f7 ff ff       	call   42b <read>
 c6d:	83 c4 10             	add    $0x10,%esp
 c70:	85 c0                	test   %eax,%eax
 c72:	7f dc                	jg     c50 <add_line+0x50>
    }
    close(fp); 
 c74:	83 ec 0c             	sub    $0xc,%esp
 c77:	53                   	push   %ebx
 c78:	e8 be f7 ff ff       	call   43b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 c7d:	58                   	pop    %eax
 c7e:	5a                   	pop    %edx
 c7f:	ff 75 0c             	push   0xc(%ebp)
 c82:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 c88:	e8 33 f5 ff ff       	call   1c0 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 c8d:	59                   	pop    %ecx
 c8e:	5b                   	pop    %ebx
 c8f:	6a 01                	push   $0x1
 c91:	ff 75 08             	push   0x8(%ebp)
 c94:	e8 ba f7 ff ff       	call   453 <open>
    if (fp < 0) {
 c99:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
 c9c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
 c9e:	85 c0                	test   %eax,%eax
 ca0:	78 5d                	js     cff <add_line+0xff>
 ca2:	6b ce 66             	imul   $0x66,%esi,%ecx
 ca5:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
 cab:	8d 78 66             	lea    0x66(%eax),%edi
 cae:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
 cb1:	eb 08                	jmp    cbb <add_line+0xbb>
 cb3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 cb7:	90                   	nop
 cb8:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
 cbb:	83 ec 04             	sub    $0x4,%esp
 cbe:	6a 66                	push   $0x66
 cc0:	50                   	push   %eax
 cc1:	53                   	push   %ebx
 cc2:	e8 6c f7 ff ff       	call   433 <write>
    for (int i = 0; i < line_idx; i++) {
 cc7:	89 f8                	mov    %edi,%eax
 cc9:	83 c4 10             	add    $0x10,%esp
 ccc:	39 f7                	cmp    %esi,%edi
 cce:	75 e8                	jne    cb8 <add_line+0xb8>
    }

    close(fp);
 cd0:	83 ec 0c             	sub    $0xc,%esp
 cd3:	53                   	push   %ebx
 cd4:	e8 62 f7 ff ff       	call   43b <close>
    return 0;
 cd9:	83 c4 10             	add    $0x10,%esp
 cdc:	31 c0                	xor    %eax,%eax
}
 cde:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ce1:	5b                   	pop    %ebx
 ce2:	5e                   	pop    %esi
 ce3:	5f                   	pop    %edi
 ce4:	5d                   	pop    %ebp
 ce5:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
 ce6:	83 ec 08             	sub    $0x8,%esp
 ce9:	68 e0 0f 00 00       	push   $0xfe0
 cee:	6a 01                	push   $0x1
 cf0:	e8 7b f8 ff ff       	call   570 <printf>
        return -1;
 cf5:	83 c4 10             	add    $0x10,%esp
 cf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 cfd:	eb df                	jmp    cde <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 cff:	83 ec 08             	sub    $0x8,%esp
 d02:	68 04 10 00 00       	push   $0x1004
 d07:	6a 01                	push   $0x1
 d09:	e8 62 f8 ff ff       	call   570 <printf>
        return -1;
 d0e:	83 c4 10             	add    $0x10,%esp
 d11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d16:	eb c6                	jmp    cde <add_line+0xde>
 d18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d1f:	90                   	nop

00000d20 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
 d20:	55                   	push   %ebp
 d21:	89 e5                	mov    %esp,%ebp
 d23:	57                   	push   %edi
 d24:	56                   	push   %esi
 d25:	53                   	push   %ebx
 d26:	83 ec 0c             	sub    $0xc,%esp
 d29:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d2c:	8d 73 64             	lea    0x64(%ebx),%esi
 d2f:	89 f7                	mov    %esi,%edi
 d31:	8b 75 0c             	mov    0xc(%ebp),%esi
 d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
 d38:	e8 73 fc ff ff       	call   9b0 <random>
 d3d:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 d3f:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
 d42:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
 d45:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 d49:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 d4c:	39 fb                	cmp    %edi,%ebx
 d4e:	75 e8                	jne    d38 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
 d50:	8b 45 08             	mov    0x8(%ebp),%eax
 d53:	ba 0a 00 00 00       	mov    $0xa,%edx
 d58:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
 d5c:	83 c4 0c             	add    $0xc,%esp
 d5f:	5b                   	pop    %ebx
 d60:	5e                   	pop    %esi
 d61:	5f                   	pop    %edi
 d62:	5d                   	pop    %ebp
 d63:	c3                   	ret    
 d64:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d6f:	90                   	nop

00000d70 <write_random_string>:

int write_random_string(char file_path[]) {
 d70:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 d71:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
 d76:	89 e5                	mov    %esp,%ebp
 d78:	57                   	push   %edi
 d79:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 d7a:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
 d80:	be 28 10 00 00       	mov    $0x1028,%esi
int write_random_string(char file_path[]) {
 d85:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
 d86:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
 d8b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 d91:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 d93:	0f b7 06             	movzwl (%esi),%eax
 d96:	8d 75 e6             	lea    -0x1a(%ebp),%esi
 d99:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 d9c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
 d9f:	90                   	nop
        int idx_new_char = random() % size_char_set;
 da0:	e8 0b fc ff ff       	call   9b0 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 da5:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
 da8:	89 c1                	mov    %eax,%ecx
 daa:	f7 e3                	mul    %ebx
 dac:	c1 ea 06             	shr    $0x6,%edx
 daf:	6b d2 55             	imul   $0x55,%edx,%edx
 db2:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
 db4:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
 dbb:	ff 
 dbc:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 dbf:	39 f7                	cmp    %esi,%edi
 dc1:	75 dd                	jne    da0 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
 dc3:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
 dc8:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
 dcb:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
 dcf:	8d 45 82             	lea    -0x7e(%ebp),%eax
 dd2:	50                   	push   %eax
 dd3:	ff 75 08             	push   0x8(%ebp)
 dd6:	e8 25 fe ff ff       	call   c00 <add_line>

    return 0;
}
 ddb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 dde:	31 c0                	xor    %eax,%eax
 de0:	5b                   	pop    %ebx
 de1:	5e                   	pop    %esi
 de2:	5f                   	pop    %edi
 de3:	5d                   	pop    %ebp
 de4:	c3                   	ret    
 de5:	66 90                	xchg   %ax,%ax
 de7:	66 90                	xchg   %ax,%ax
 de9:	66 90                	xchg   %ax,%ax
 deb:	66 90                	xchg   %ax,%ax
 ded:	66 90                	xchg   %ax,%ax
 def:	90                   	nop

00000df0 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
 df0:	55                   	push   %ebp
 df1:	89 e5                	mov    %esp,%ebp
 df3:	56                   	push   %esi
 df4:	8b 75 08             	mov    0x8(%ebp),%esi
 df7:	53                   	push   %ebx
 df8:	bb 64 00 00 00       	mov    $0x64,%ebx
 dfd:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
 e00:	83 ec 0c             	sub    $0xc,%esp
 e03:	56                   	push   %esi
 e04:	e8 67 ff ff ff       	call   d70 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
 e09:	83 c4 10             	add    $0x10,%esp
 e0c:	83 eb 01             	sub    $0x1,%ebx
 e0f:	75 ef                	jne    e00 <io_bound+0x10>
 e11:	bb 32 00 00 00       	mov    $0x32,%ebx
 e16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e1d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
 e20:	83 ec 0c             	sub    $0xc,%esp
 e23:	56                   	push   %esi
 e24:	e8 c7 fb ff ff       	call   9f0 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
 e29:	83 c4 10             	add    $0x10,%esp
 e2c:	83 eb 01             	sub    $0x1,%ebx
 e2f:	75 ef                	jne    e20 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
 e31:	83 ec 0c             	sub    $0xc,%esp
 e34:	56                   	push   %esi
 e35:	e8 29 f6 ff ff       	call   463 <unlink>
 e3a:	83 c4 10             	add    $0x10,%esp
 e3d:	85 c0                	test   %eax,%eax
 e3f:	75 07                	jne    e48 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
 e41:	8d 65 f8             	lea    -0x8(%ebp),%esp
 e44:	5b                   	pop    %ebx
 e45:	5e                   	pop    %esi
 e46:	5d                   	pop    %ebp
 e47:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
 e48:	83 ec 08             	sub    $0x8,%esp
 e4b:	68 80 10 00 00       	push   $0x1080
 e50:	6a 01                	push   $0x1
 e52:	e8 19 f7 ff ff       	call   570 <printf>
 e57:	83 c4 10             	add    $0x10,%esp
 e5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 e5d:	5b                   	pop    %ebx
 e5e:	5e                   	pop    %esi
 e5f:	5d                   	pop    %ebp
 e60:	c3                   	ret    
 e61:	66 90                	xchg   %ax,%ax
 e63:	66 90                	xchg   %ax,%ax
 e65:	66 90                	xchg   %ax,%ax
 e67:	66 90                	xchg   %ax,%ax
 e69:	66 90                	xchg   %ax,%ax
 e6b:	66 90                	xchg   %ax,%ax
 e6d:	66 90                	xchg   %ax,%ax
 e6f:	90                   	nop

00000e70 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
 e70:	55                   	push   %ebp
 e71:	89 e5                	mov    %esp,%ebp
 e73:	57                   	push   %edi
 e74:	56                   	push   %esi
 e75:	53                   	push   %ebx
 e76:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
 e7d:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 e83:	83 0c 24 00          	orl    $0x0,(%esp)
 e87:	39 c4                	cmp    %eax,%esp
 e89:	75 f2                	jne    e7d <cpu_bound+0xd>
 e8b:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
 e91:	be e8 03 00 00       	mov    $0x3e8,%esi
 e96:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
 e9c:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
 ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
 ea8:	83 ec 04             	sub    $0x4,%esp
 eab:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
 eb1:	57                   	push   %edi
 eb2:	50                   	push   %eax
 eb3:	53                   	push   %ebx
 eb4:	e8 e7 f9 ff ff       	call   8a0 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 eb9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 ebf:	89 04 24             	mov    %eax,(%esp)
 ec2:	6a 00                	push   $0x0
 ec4:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 eca:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 ed0:	53                   	push   %ebx
 ed1:	e8 8a f1 ff ff       	call   60 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
 ed6:	83 c4 20             	add    $0x20,%esp
 ed9:	83 ee 01             	sub    $0x1,%esi
 edc:	75 ca                	jne    ea8 <cpu_bound+0x38>
    }
 ede:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ee1:	5b                   	pop    %ebx
 ee2:	5e                   	pop    %esi
 ee3:	5f                   	pop    %edi
 ee4:	5d                   	pop    %ebp
 ee5:	c3                   	ret    
