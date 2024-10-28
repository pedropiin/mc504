
_random-digraph: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
   4:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
   9:	56                   	push   %esi
   a:	53                   	push   %ebx
   b:	83 ec 0c             	sub    $0xc,%esp
   e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  11:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
  14:	e8 97 09 00 00       	call   9b0 <random>
  19:	89 c1                	mov    %eax,%ecx
  1b:	f7 ef                	imul   %edi
  1d:	89 c8                	mov    %ecx,%eax
  1f:	c1 f8 1f             	sar    $0x1f,%eax
  22:	c1 fa 06             	sar    $0x6,%edx
  25:	29 c2                	sub    %eax,%edx
  27:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
  2d:	29 c1                	sub    %eax,%ecx
  2f:	83 f9 63             	cmp    $0x63,%ecx
  32:	89 ca                	mov    %ecx,%edx
  34:	8d 41 64             	lea    0x64(%ecx),%eax
  37:	0f 4e d0             	cmovle %eax,%edx
  3a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
  3c:	e8 6f 09 00 00       	call   9b0 <random>
  41:	89 c1                	mov    %eax,%ecx
  43:	f7 ef                	imul   %edi
  45:	89 c8                	mov    %ecx,%eax
  47:	c1 f8 1f             	sar    $0x1f,%eax
  4a:	c1 fa 07             	sar    $0x7,%edx
  4d:	29 c2                	sub    %eax,%edx
  4f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
  55:	29 c1                	sub    %eax,%ecx
  57:	8d 41 32             	lea    0x32(%ecx),%eax
  5a:	89 ca                	mov    %ecx,%edx
  5c:	83 f9 31             	cmp    $0x31,%ecx
  5f:	0f 4e d0             	cmovle %eax,%edx
  62:	8b 45 10             	mov    0x10(%ebp),%eax
  65:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
  67:	8b 13                	mov    (%ebx),%edx
  69:	85 d2                	test   %edx,%edx
  6b:	7e 38                	jle    a5 <gen_random_digraph+0xa5>
  6d:	89 f1                	mov    %esi,%ecx
  6f:	31 ff                	xor    %edi,%edi
  71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
  78:	31 c0                	xor    %eax,%eax
  7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
  80:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
  87:	8b 13                	mov    (%ebx),%edx
  89:	83 c0 01             	add    $0x1,%eax
  8c:	39 c2                	cmp    %eax,%edx
  8e:	7f f0                	jg     80 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
  90:	83 c7 01             	add    $0x1,%edi
  93:	81 c1 20 03 00 00    	add    $0x320,%ecx
  99:	39 fa                	cmp    %edi,%edx
  9b:	7f db                	jg     78 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
  9d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
  a3:	7f 22                	jg     c7 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
  a5:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
  ab:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
  b2:	8d 04 86             	lea    (%esi,%eax,4),%eax
  b5:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
  b8:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
  be:	05 20 03 00 00       	add    $0x320,%eax
  c3:	39 d0                	cmp    %edx,%eax
  c5:	75 f1                	jne    b8 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
  c7:	8b 45 10             	mov    0x10(%ebp),%eax
  ca:	31 c9                	xor    %ecx,%ecx
  cc:	8b 00                	mov    (%eax),%eax
  ce:	85 c0                	test   %eax,%eax
  d0:	7e 31                	jle    103 <gen_random_digraph+0x103>
  d2:	89 75 08             	mov    %esi,0x8(%ebp)
  d5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
  d7:	e8 d4 08 00 00       	call   9b0 <random>
    for (int i = 0; i < *num_edges; i++) {
  dc:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
  df:	99                   	cltd   
  e0:	f7 3b                	idivl  (%ebx)
  e2:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
  e4:	e8 c7 08 00 00       	call   9b0 <random>
        graph[new_edge_u][new_edge_v] = 1;
  e9:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
  ef:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
  f2:	99                   	cltd   
  f3:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
  f5:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
  f8:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
  ff:	39 30                	cmp    %esi,(%eax)
 101:	7f d4                	jg     d7 <gen_random_digraph+0xd7>
    }
}
 103:	83 c4 0c             	add    $0xc,%esp
 106:	5b                   	pop    %ebx
 107:	5e                   	pop    %esi
 108:	5f                   	pop    %edi
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 111:	31 c0                	xor    %eax,%eax
{
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	8b 4d 08             	mov    0x8(%ebp),%ecx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 131:	89 c8                	mov    %ecx,%eax
 133:	c9                   	leave  
 134:	c3                   	ret    
 135:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	75 17                	jne    168 <strcmp+0x28>
 151:	eb 3a                	jmp    18d <strcmp+0x4d>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 15c:	83 c2 01             	add    $0x1,%edx
 15f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 162:	84 c0                	test   %al,%al
 164:	74 1a                	je     180 <strcmp+0x40>
    p++, q++;
 166:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 168:	0f b6 19             	movzbl (%ecx),%ebx
 16b:	38 c3                	cmp    %al,%bl
 16d:	74 e9                	je     158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 16f:	29 d8                	sub    %ebx,%eax
}
 171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 174:	c9                   	leave  
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 184:	31 c0                	xor    %eax,%eax
 186:	29 d8                	sub    %ebx,%eax
}
 188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18b:	c9                   	leave  
 18c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	31 c0                	xor    %eax,%eax
 192:	eb db                	jmp    16f <strcmp+0x2f>
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 3a 00             	cmpb   $0x0,(%edx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 c0                	xor    %eax,%eax
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c0 01             	add    $0x1,%eax
 1b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b7:	89 c1                	mov    %eax,%ecx
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	89 c8                	mov    %ecx,%eax
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    
 1bf:	90                   	nop
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	84 d2                	test   %dl,%dl
 211:	74 0d                	je     220 <strchr+0x30>
    if(*s == c)
 213:	38 d1                	cmp    %dl,%cl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 235:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 239:	31 db                	xor    %ebx,%ebx
{
 23b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 23e:	eb 27                	jmp    267 <gets+0x37>
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	6a 01                	push   $0x1
 245:	57                   	push   %edi
 246:	6a 00                	push   $0x0
 248:	e8 2e 01 00 00       	call   37b <read>
    if(cc < 1)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	7e 1d                	jle    271 <gets+0x41>
      break;
    buf[i++] = c;
 254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 258:	8b 55 08             	mov    0x8(%ebp),%edx
 25b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 25f:	3c 0a                	cmp    $0xa,%al
 261:	74 1d                	je     280 <gets+0x50>
 263:	3c 0d                	cmp    $0xd,%al
 265:	74 19                	je     280 <gets+0x50>
  for(i=0; i+1 < max; ){
 267:	89 de                	mov    %ebx,%esi
 269:	83 c3 01             	add    $0x1,%ebx
 26c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26f:	7c cf                	jl     240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 278:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27b:	5b                   	pop    %ebx
 27c:	5e                   	pop    %esi
 27d:	5f                   	pop    %edi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    
  buf[i] = '\0';
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	89 de                	mov    %ebx,%esi
 285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 289:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5f                   	pop    %edi
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	push   0x8(%ebp)
 2ad:	e8 f1 00 00 00       	call   3a3 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	push   0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 f4 00 00 00       	call   3bb <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 ba 00 00 00       	call   38b <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 02             	movsbl (%edx),%eax
 2fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 305:	77 1e                	ja     325 <atoi+0x35>
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 328:	89 c8                	mov    %ecx,%eax
 32a:	c9                   	leave  
 32b:	c3                   	ret    
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8b 55 08             	mov    0x8(%ebp),%edx
 33a:	56                   	push   %esi
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 c0                	test   %eax,%eax
 340:	7e 13                	jle    355 <memmove+0x25>
 342:	01 d0                	add    %edx,%eax
  dst = vdst;
 344:	89 d7                	mov    %edx,%edi
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    

0000035b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <exit>:
SYSCALL(exit)
 363:	b8 02 00 00 00       	mov    $0x2,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <wait>:
SYSCALL(wait)
 36b:	b8 03 00 00 00       	mov    $0x3,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <pipe>:
SYSCALL(pipe)
 373:	b8 04 00 00 00       	mov    $0x4,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <read>:
SYSCALL(read)
 37b:	b8 05 00 00 00       	mov    $0x5,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <write>:
SYSCALL(write)
 383:	b8 10 00 00 00       	mov    $0x10,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <close>:
SYSCALL(close)
 38b:	b8 15 00 00 00       	mov    $0x15,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <kill>:
SYSCALL(kill)
 393:	b8 06 00 00 00       	mov    $0x6,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <exec>:
SYSCALL(exec)
 39b:	b8 07 00 00 00       	mov    $0x7,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <open>:
SYSCALL(open)
 3a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mknod>:
SYSCALL(mknod)
 3ab:	b8 11 00 00 00       	mov    $0x11,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <unlink>:
SYSCALL(unlink)
 3b3:	b8 12 00 00 00       	mov    $0x12,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <fstat>:
SYSCALL(fstat)
 3bb:	b8 08 00 00 00       	mov    $0x8,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <link>:
SYSCALL(link)
 3c3:	b8 13 00 00 00       	mov    $0x13,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <mkdir>:
SYSCALL(mkdir)
 3cb:	b8 14 00 00 00       	mov    $0x14,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <chdir>:
SYSCALL(chdir)
 3d3:	b8 09 00 00 00       	mov    $0x9,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <dup>:
SYSCALL(dup)
 3db:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <getpid>:
SYSCALL(getpid)
 3e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <sbrk>:
SYSCALL(sbrk)
 3eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <sleep>:
SYSCALL(sleep)
 3f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <uptime>:
SYSCALL(uptime)
 3fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    
 403:	66 90                	xchg   %ax,%ax
 405:	66 90                	xchg   %ax,%ax
 407:	66 90                	xchg   %ax,%ax
 409:	66 90                	xchg   %ax,%ax
 40b:	66 90                	xchg   %ax,%ax
 40d:	66 90                	xchg   %ax,%ax
 40f:	90                   	nop

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 3c             	sub    $0x3c,%esp
 419:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 41c:	89 d1                	mov    %edx,%ecx
{
 41e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 421:	85 d2                	test   %edx,%edx
 423:	0f 89 7f 00 00 00    	jns    4a8 <printint+0x98>
 429:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 42d:	74 79                	je     4a8 <printint+0x98>
    neg = 1;
 42f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 436:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 438:	31 db                	xor    %ebx,%ebx
 43a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 43d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 440:	89 c8                	mov    %ecx,%eax
 442:	31 d2                	xor    %edx,%edx
 444:	89 cf                	mov    %ecx,%edi
 446:	f7 75 c4             	divl   -0x3c(%ebp)
 449:	0f b6 92 48 0f 00 00 	movzbl 0xf48(%edx),%edx
 450:	89 45 c0             	mov    %eax,-0x40(%ebp)
 453:	89 d8                	mov    %ebx,%eax
 455:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 458:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 45b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 45e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 461:	76 dd                	jbe    440 <printint+0x30>
  if(neg)
 463:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 466:	85 c9                	test   %ecx,%ecx
 468:	74 0c                	je     476 <printint+0x66>
    buf[i++] = '-';
 46a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 46f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 471:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 476:	8b 7d b8             	mov    -0x48(%ebp),%edi
 479:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 47d:	eb 07                	jmp    486 <printint+0x76>
 47f:	90                   	nop
    putc(fd, buf[i]);
 480:	0f b6 13             	movzbl (%ebx),%edx
 483:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 486:	83 ec 04             	sub    $0x4,%esp
 489:	88 55 d7             	mov    %dl,-0x29(%ebp)
 48c:	6a 01                	push   $0x1
 48e:	56                   	push   %esi
 48f:	57                   	push   %edi
 490:	e8 ee fe ff ff       	call   383 <write>
  while(--i >= 0)
 495:	83 c4 10             	add    $0x10,%esp
 498:	39 de                	cmp    %ebx,%esi
 49a:	75 e4                	jne    480 <printint+0x70>
}
 49c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49f:	5b                   	pop    %ebx
 4a0:	5e                   	pop    %esi
 4a1:	5f                   	pop    %edi
 4a2:	5d                   	pop    %ebp
 4a3:	c3                   	ret    
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4af:	eb 87                	jmp    438 <printint+0x28>
 4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop

000004c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4cf:	0f b6 13             	movzbl (%ebx),%edx
 4d2:	84 d2                	test   %dl,%dl
 4d4:	74 6a                	je     540 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4d6:	8d 45 10             	lea    0x10(%ebp),%eax
 4d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e4:	eb 36                	jmp    51c <printf+0x5c>
 4e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	74 15                	je     512 <printf+0x52>
  write(fd, &c, 1);
 4fd:	83 ec 04             	sub    $0x4,%esp
 500:	88 55 e7             	mov    %dl,-0x19(%ebp)
 503:	6a 01                	push   $0x1
 505:	57                   	push   %edi
 506:	56                   	push   %esi
 507:	e8 77 fe ff ff       	call   383 <write>
 50c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 50f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 512:	0f b6 13             	movzbl (%ebx),%edx
 515:	83 c3 01             	add    $0x1,%ebx
 518:	84 d2                	test   %dl,%dl
 51a:	74 24                	je     540 <printf+0x80>
    c = fmt[i] & 0xff;
 51c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 51f:	85 c9                	test   %ecx,%ecx
 521:	74 cd                	je     4f0 <printf+0x30>
      }
    } else if(state == '%'){
 523:	83 f9 25             	cmp    $0x25,%ecx
 526:	75 ea                	jne    512 <printf+0x52>
      if(c == 'd'){
 528:	83 f8 25             	cmp    $0x25,%eax
 52b:	0f 84 07 01 00 00    	je     638 <printf+0x178>
 531:	83 e8 63             	sub    $0x63,%eax
 534:	83 f8 15             	cmp    $0x15,%eax
 537:	77 17                	ja     550 <printf+0x90>
 539:	ff 24 85 f0 0e 00 00 	jmp    *0xef0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 540:	8d 65 f4             	lea    -0xc(%ebp),%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
  write(fd, &c, 1);
 550:	83 ec 04             	sub    $0x4,%esp
 553:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 556:	6a 01                	push   $0x1
 558:	57                   	push   %edi
 559:	56                   	push   %esi
 55a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 55e:	e8 20 fe ff ff       	call   383 <write>
        putc(fd, c);
 563:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 567:	83 c4 0c             	add    $0xc,%esp
 56a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 56d:	6a 01                	push   $0x1
 56f:	57                   	push   %edi
 570:	56                   	push   %esi
 571:	e8 0d fe ff ff       	call   383 <write>
        putc(fd, c);
 576:	83 c4 10             	add    $0x10,%esp
      state = 0;
 579:	31 c9                	xor    %ecx,%ecx
 57b:	eb 95                	jmp    512 <printf+0x52>
 57d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 10 00 00 00       	mov    $0x10,%ecx
 588:	6a 00                	push   $0x0
 58a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 58d:	8b 10                	mov    (%eax),%edx
 58f:	89 f0                	mov    %esi,%eax
 591:	e8 7a fe ff ff       	call   410 <printint>
        ap++;
 596:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 59a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59d:	31 c9                	xor    %ecx,%ecx
 59f:	e9 6e ff ff ff       	jmp    512 <printf+0x52>
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5ab:	8b 10                	mov    (%eax),%edx
        ap++;
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5b3:	85 d2                	test   %edx,%edx
 5b5:	0f 84 8d 00 00 00    	je     648 <printf+0x188>
        while(*s != 0){
 5bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 5be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5c0:	84 c0                	test   %al,%al
 5c2:	0f 84 4a ff ff ff    	je     512 <printf+0x52>
 5c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5cb:	89 d3                	mov    %edx,%ebx
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5d3:	83 c3 01             	add    $0x1,%ebx
 5d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d9:	6a 01                	push   $0x1
 5db:	57                   	push   %edi
 5dc:	56                   	push   %esi
 5dd:	e8 a1 fd ff ff       	call   383 <write>
        while(*s != 0){
 5e2:	0f b6 03             	movzbl (%ebx),%eax
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	84 c0                	test   %al,%al
 5ea:	75 e4                	jne    5d0 <printf+0x110>
      state = 0;
 5ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5ef:	31 c9                	xor    %ecx,%ecx
 5f1:	e9 1c ff ff ff       	jmp    512 <printf+0x52>
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 600:	83 ec 0c             	sub    $0xc,%esp
 603:	b9 0a 00 00 00       	mov    $0xa,%ecx
 608:	6a 01                	push   $0x1
 60a:	e9 7b ff ff ff       	jmp    58a <printf+0xca>
 60f:	90                   	nop
        putc(fd, *ap);
 610:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 613:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 616:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 618:	6a 01                	push   $0x1
 61a:	57                   	push   %edi
 61b:	56                   	push   %esi
        putc(fd, *ap);
 61c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 61f:	e8 5f fd ff ff       	call   383 <write>
        ap++;
 624:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 628:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62b:	31 c9                	xor    %ecx,%ecx
 62d:	e9 e0 fe ff ff       	jmp    512 <printf+0x52>
 632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 638:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 63b:	83 ec 04             	sub    $0x4,%esp
 63e:	e9 2a ff ff ff       	jmp    56d <printf+0xad>
 643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 647:	90                   	nop
          s = "(null)";
 648:	ba e8 0e 00 00       	mov    $0xee8,%edx
        while(*s != 0){
 64d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 650:	b8 28 00 00 00       	mov    $0x28,%eax
 655:	89 d3                	mov    %edx,%ebx
 657:	e9 74 ff ff ff       	jmp    5d0 <printf+0x110>
 65c:	66 90                	xchg   %ax,%ax
 65e:	66 90                	xchg   %ax,%ax

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 00 15 00 00       	mov    0x1500,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 66e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	89 c2                	mov    %eax,%edx
 67a:	8b 00                	mov    (%eax),%eax
 67c:	39 ca                	cmp    %ecx,%edx
 67e:	73 30                	jae    6b0 <free+0x50>
 680:	39 c1                	cmp    %eax,%ecx
 682:	72 04                	jb     688 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 684:	39 c2                	cmp    %eax,%edx
 686:	72 f0                	jb     678 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 f8                	cmp    %edi,%eax
 690:	74 30                	je     6c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 692:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 695:	8b 42 04             	mov    0x4(%edx),%eax
 698:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 69b:	39 f1                	cmp    %esi,%ecx
 69d:	74 3a                	je     6d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 69f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6a1:	5b                   	pop    %ebx
  freep = p;
 6a2:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b0:	39 c2                	cmp    %eax,%edx
 6b2:	72 c4                	jb     678 <free+0x18>
 6b4:	39 c1                	cmp    %eax,%ecx
 6b6:	73 c0                	jae    678 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6be:	39 f8                	cmp    %edi,%eax
 6c0:	75 d0                	jne    692 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6c2:	03 70 04             	add    0x4(%eax),%esi
 6c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c8:	8b 02                	mov    (%edx),%eax
 6ca:	8b 00                	mov    (%eax),%eax
 6cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cf:	8b 42 04             	mov    0x4(%edx),%eax
 6d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6d5:	39 f1                	cmp    %esi,%ecx
 6d7:	75 c6                	jne    69f <free+0x3f>
    p->s.size += bp->s.size;
 6d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6dc:	89 15 00 15 00 00    	mov    %edx,0x1500
    p->s.size += bp->s.size;
 6e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6e8:	89 0a                	mov    %ecx,(%edx)
}
 6ea:	5b                   	pop    %ebx
 6eb:	5e                   	pop    %esi
 6ec:	5f                   	pop    %edi
 6ed:	5d                   	pop    %ebp
 6ee:	c3                   	ret    
 6ef:	90                   	nop

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6fc:	8b 3d 00 15 00 00    	mov    0x1500,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 702:	8d 70 07             	lea    0x7(%eax),%esi
 705:	c1 ee 03             	shr    $0x3,%esi
 708:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 70b:	85 ff                	test   %edi,%edi
 70d:	0f 84 9d 00 00 00    	je     7b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 713:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 715:	8b 4a 04             	mov    0x4(%edx),%ecx
 718:	39 f1                	cmp    %esi,%ecx
 71a:	73 6a                	jae    786 <malloc+0x96>
 71c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 721:	39 de                	cmp    %ebx,%esi
 723:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 726:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 72d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 730:	eb 17                	jmp    749 <malloc+0x59>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 73a:	8b 48 04             	mov    0x4(%eax),%ecx
 73d:	39 f1                	cmp    %esi,%ecx
 73f:	73 4f                	jae    790 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 741:	8b 3d 00 15 00 00    	mov    0x1500,%edi
 747:	89 c2                	mov    %eax,%edx
 749:	39 d7                	cmp    %edx,%edi
 74b:	75 eb                	jne    738 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 74d:	83 ec 0c             	sub    $0xc,%esp
 750:	ff 75 e4             	push   -0x1c(%ebp)
 753:	e8 93 fc ff ff       	call   3eb <sbrk>
  if(p == (char*)-1)
 758:	83 c4 10             	add    $0x10,%esp
 75b:	83 f8 ff             	cmp    $0xffffffff,%eax
 75e:	74 1c                	je     77c <malloc+0x8c>
  hp->s.size = nu;
 760:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	83 c0 08             	add    $0x8,%eax
 769:	50                   	push   %eax
 76a:	e8 f1 fe ff ff       	call   660 <free>
  return freep;
 76f:	8b 15 00 15 00 00    	mov    0x1500,%edx
      if((p = morecore(nunits)) == 0)
 775:	83 c4 10             	add    $0x10,%esp
 778:	85 d2                	test   %edx,%edx
 77a:	75 bc                	jne    738 <malloc+0x48>
        return 0;
  }
}
 77c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 77f:	31 c0                	xor    %eax,%eax
}
 781:	5b                   	pop    %ebx
 782:	5e                   	pop    %esi
 783:	5f                   	pop    %edi
 784:	5d                   	pop    %ebp
 785:	c3                   	ret    
    if(p->s.size >= nunits){
 786:	89 d0                	mov    %edx,%eax
 788:	89 fa                	mov    %edi,%edx
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 790:	39 ce                	cmp    %ecx,%esi
 792:	74 4c                	je     7e0 <malloc+0xf0>
        p->s.size -= nunits;
 794:	29 f1                	sub    %esi,%ecx
 796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 79c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 79f:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 7a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7a8:	83 c0 08             	add    $0x8,%eax
}
 7ab:	5b                   	pop    %ebx
 7ac:	5e                   	pop    %esi
 7ad:	5f                   	pop    %edi
 7ae:	5d                   	pop    %ebp
 7af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7b0:	c7 05 00 15 00 00 04 	movl   $0x1504,0x1500
 7b7:	15 00 00 
    base.s.size = 0;
 7ba:	bf 04 15 00 00       	mov    $0x1504,%edi
    base.s.ptr = freep = prevp = &base;
 7bf:	c7 05 04 15 00 00 04 	movl   $0x1504,0x1504
 7c6:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7cb:	c7 05 08 15 00 00 00 	movl   $0x0,0x1508
 7d2:	00 00 00 
    if(p->s.size >= nunits){
 7d5:	e9 42 ff ff ff       	jmp    71c <malloc+0x2c>
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 08                	mov    (%eax),%ecx
 7e2:	89 0a                	mov    %ecx,(%edx)
 7e4:	eb b9                	jmp    79f <malloc+0xaf>
 7e6:	66 90                	xchg   %ax,%ax
 7e8:	66 90                	xchg   %ax,%ax
 7ea:	66 90                	xchg   %ax,%ax
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 04             	sub    $0x4,%esp
 7f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7fc:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 7ff:	85 db                	test   %ebx,%ebx
 801:	7e 3d                	jle    840 <min_distance_vertex+0x50>
    int min_idx = 0;
 803:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 805:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 807:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 80c:	89 75 f0             	mov    %esi,-0x10(%ebp)
 80f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 810:	8b 14 87             	mov    (%edi,%eax,4),%edx
 813:	39 ca                	cmp    %ecx,%edx
 815:	7d 14                	jge    82b <min_distance_vertex+0x3b>
 817:	8b 75 0c             	mov    0xc(%ebp),%esi
 81a:	8b 34 86             	mov    (%esi,%eax,4),%esi
 81d:	85 f6                	test   %esi,%esi
 81f:	8b 75 f0             	mov    -0x10(%ebp),%esi
 822:	0f 44 ca             	cmove  %edx,%ecx
 825:	0f 44 f0             	cmove  %eax,%esi
 828:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 82b:	83 c0 01             	add    $0x1,%eax
 82e:	39 c3                	cmp    %eax,%ebx
 830:	75 de                	jne    810 <min_distance_vertex+0x20>
 832:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 835:	83 c4 04             	add    $0x4,%esp
 838:	5b                   	pop    %ebx
 839:	89 f0                	mov    %esi,%eax
 83b:	5e                   	pop    %esi
 83c:	5f                   	pop    %edi
 83d:	5d                   	pop    %ebp
 83e:	c3                   	ret    
 83f:	90                   	nop
 840:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 843:	31 f6                	xor    %esi,%esi
}
 845:	5b                   	pop    %ebx
 846:	89 f0                	mov    %esi,%eax
 848:	5e                   	pop    %esi
 849:	5f                   	pop    %edi
 84a:	5d                   	pop    %ebp
 84b:	c3                   	ret    
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 859:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 85c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 85f:	89 e6                	mov    %esp,%esi
 861:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 868:	8d 41 0f             	lea    0xf(%ecx),%eax
 86b:	89 c2                	mov    %eax,%edx
 86d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 872:	29 c6                	sub    %eax,%esi
 874:	83 e2 f0             	and    $0xfffffff0,%edx
 877:	39 f4                	cmp    %esi,%esp
 879:	74 12                	je     88d <dijkstra+0x3d>
 87b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 881:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 888:	00 
 889:	39 f4                	cmp    %esi,%esp
 88b:	75 ee                	jne    87b <dijkstra+0x2b>
 88d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 893:	29 d4                	sub    %edx,%esp
 895:	85 d2                	test   %edx,%edx
 897:	0f 85 ef 00 00 00    	jne    98c <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 89d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 8a0:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 8a2:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 8a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8a8:	85 c0                	test   %eax,%eax
 8aa:	0f 8e e6 00 00 00    	jle    996 <dijkstra+0x146>
 8b0:	89 d8                	mov    %ebx,%eax
 8b2:	89 fa                	mov    %edi,%edx
 8b4:	01 d9                	add    %ebx,%ecx
 8b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 8c0:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 8c6:	83 c0 04             	add    $0x4,%eax
 8c9:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 8cc:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 8d3:	39 c8                	cmp    %ecx,%eax
 8d5:	75 e9                	jne    8c0 <dijkstra+0x70>
    dist[src] = 0;
 8d7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 8e8:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 8ea:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 8ef:	31 c0                	xor    %eax,%eax
 8f1:	eb 07                	jmp    8fa <dijkstra+0xaa>
 8f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8f7:	90                   	nop
 8f8:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 8fa:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 8fd:	39 ca                	cmp    %ecx,%edx
 8ff:	7d 0a                	jge    90b <dijkstra+0xbb>
 901:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 905:	0f 44 f0             	cmove  %eax,%esi
 908:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 90b:	8d 50 01             	lea    0x1(%eax),%edx
 90e:	39 55 0c             	cmp    %edx,0xc(%ebp)
 911:	75 e5                	jne    8f8 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 913:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 916:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 91d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 923:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 926:	75 18                	jne    940 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 928:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 92b:	8d 56 01             	lea    0x1(%esi),%edx
 92e:	39 c6                	cmp    %eax,%esi
 930:	74 52                	je     984 <dijkstra+0x134>
 932:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 935:	eb b1                	jmp    8e8 <dijkstra+0x98>
 937:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 940:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 946:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 949:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 94c:	31 d2                	xor    %edx,%edx
 94e:	eb 02                	jmp    952 <dijkstra+0x102>
 950:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 952:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 955:	85 c9                	test   %ecx,%ecx
 957:	74 17                	je     970 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 959:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 95c:	85 db                	test   %ebx,%ebx
 95e:	75 10                	jne    970 <dijkstra+0x120>
 960:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 963:	03 0b                	add    (%ebx),%ecx
 965:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 968:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 96b:	7e 03                	jle    970 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 96d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 970:	8d 4a 01             	lea    0x1(%edx),%ecx
 973:	39 c2                	cmp    %eax,%edx
 975:	75 d9                	jne    950 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 977:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 97a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 97d:	8d 56 01             	lea    0x1(%esi),%edx
 980:	39 c6                	cmp    %eax,%esi
 982:	75 ae                	jne    932 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 984:	8d 65 f4             	lea    -0xc(%ebp),%esp
 987:	5b                   	pop    %ebx
 988:	5e                   	pop    %esi
 989:	5f                   	pop    %edi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
    int visited[num_vertices];
 98c:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 991:	e9 07 ff ff ff       	jmp    89d <dijkstra+0x4d>
    dist[src] = 0;
 996:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 99c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 99f:	5b                   	pop    %ebx
 9a0:	5e                   	pop    %esi
 9a1:	5f                   	pop    %edi
 9a2:	5d                   	pop    %ebp
 9a3:	c3                   	ret    
 9a4:	66 90                	xchg   %ax,%ax
 9a6:	66 90                	xchg   %ax,%ax
 9a8:	66 90                	xchg   %ax,%ax
 9aa:	66 90                	xchg   %ax,%ax
 9ac:	66 90                	xchg   %ax,%ax
 9ae:	66 90                	xchg   %ax,%ax

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
 a15:	e8 89 f9 ff ff       	call   3a3 <open>
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
 a5a:	e8 1c f9 ff ff       	call   37b <read>
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
 ad0:	e8 3b f6 ff ff       	call   110 <strcpy>
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
 af6:	e8 15 f6 ff ff       	call   110 <strcpy>
        strcpy(lines[line2], temp);
 afb:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 b01:	5f                   	pop    %edi
 b02:	58                   	pop    %eax
 b03:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b09:	50                   	push   %eax
 b0a:	52                   	push   %edx
 b0b:	e8 00 f6 ff ff       	call   110 <strcpy>
 b10:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 b13:	83 ec 0c             	sub    $0xc,%esp
 b16:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 b1c:	e8 6a f8 ff ff       	call   38b <close>
    fp = open(file_path, O_RDWR);
 b21:	58                   	pop    %eax
 b22:	5a                   	pop    %edx
 b23:	6a 02                	push   $0x2
 b25:	ff 75 08             	push   0x8(%ebp)
 b28:	e8 76 f8 ff ff       	call   3a3 <open>


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
 b39:	e8 7d f8 ff ff       	call   3bb <fstat>
    char *buffer = malloc(0);
 b3e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 b45:	e8 a6 fb ff ff       	call   6f0 <malloc>
    memset(buffer, 0, 0);  
 b4a:	83 c4 0c             	add    $0xc,%esp
 b4d:	6a 00                	push   $0x0
 b4f:	6a 00                	push   $0x0
 b51:	50                   	push   %eax
 b52:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 b58:	e8 73 f6 ff ff       	call   1d0 <memset>
    write(fp, buffer, 0);
 b5d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 b63:	83 c4 0c             	add    $0xc,%esp
 b66:	6a 00                	push   $0x0
 b68:	52                   	push   %edx
 b69:	57                   	push   %edi
 b6a:	e8 14 f8 ff ff       	call   383 <write>
    free(buffer);
 b6f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 b75:	89 14 24             	mov    %edx,(%esp)
 b78:	e8 e3 fa ff ff       	call   660 <free>


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
 ba2:	e8 dc f7 ff ff       	call   383 <write>
    for (int i = 0; i < line_idx; i++) {
 ba7:	83 c4 10             	add    $0x10,%esp
 baa:	39 de                	cmp    %ebx,%esi
 bac:	75 ea                	jne    b98 <permute_line+0x1a8>
    }

    close(fp);
 bae:	83 ec 0c             	sub    $0xc,%esp
 bb1:	57                   	push   %edi
 bb2:	e8 d4 f7 ff ff       	call   38b <close>
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
 bce:	e8 ed f8 ff ff       	call   4c0 <printf>
        return -1;
 bd3:	83 c4 10             	add    $0x10,%esp
 bd6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 bdb:	eb df                	jmp    bbc <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 bdd:	83 ec 08             	sub    $0x8,%esp
 be0:	68 a4 0f 00 00       	push   $0xfa4
 be5:	6a 01                	push   $0x1
 be7:	e8 d4 f8 ff ff       	call   4c0 <printf>
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
 c25:	e8 79 f7 ff ff       	call   3a3 <open>
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
 c68:	e8 0e f7 ff ff       	call   37b <read>
 c6d:	83 c4 10             	add    $0x10,%esp
 c70:	85 c0                	test   %eax,%eax
 c72:	7f dc                	jg     c50 <add_line+0x50>
    }
    close(fp); 
 c74:	83 ec 0c             	sub    $0xc,%esp
 c77:	53                   	push   %ebx
 c78:	e8 0e f7 ff ff       	call   38b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 c7d:	58                   	pop    %eax
 c7e:	5a                   	pop    %edx
 c7f:	ff 75 0c             	push   0xc(%ebp)
 c82:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 c88:	e8 83 f4 ff ff       	call   110 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 c8d:	59                   	pop    %ecx
 c8e:	5b                   	pop    %ebx
 c8f:	6a 01                	push   $0x1
 c91:	ff 75 08             	push   0x8(%ebp)
 c94:	e8 0a f7 ff ff       	call   3a3 <open>
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
 cc2:	e8 bc f6 ff ff       	call   383 <write>
    for (int i = 0; i < line_idx; i++) {
 cc7:	89 f8                	mov    %edi,%eax
 cc9:	83 c4 10             	add    $0x10,%esp
 ccc:	39 f7                	cmp    %esi,%edi
 cce:	75 e8                	jne    cb8 <add_line+0xb8>
    }

    close(fp);
 cd0:	83 ec 0c             	sub    $0xc,%esp
 cd3:	53                   	push   %ebx
 cd4:	e8 b2 f6 ff ff       	call   38b <close>
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
 cf0:	e8 cb f7 ff ff       	call   4c0 <printf>
        return -1;
 cf5:	83 c4 10             	add    $0x10,%esp
 cf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 cfd:	eb df                	jmp    cde <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 cff:	83 ec 08             	sub    $0x8,%esp
 d02:	68 04 10 00 00       	push   $0x1004
 d07:	6a 01                	push   $0x1
 d09:	e8 b2 f7 ff ff       	call   4c0 <printf>
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
 e35:	e8 79 f5 ff ff       	call   3b3 <unlink>
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
 e52:	e8 69 f6 ff ff       	call   4c0 <printf>
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
 eb4:	e8 47 f1 ff ff       	call   0 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 eb9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 ebf:	89 04 24             	mov    %eax,(%esp)
 ec2:	6a 00                	push   $0x0
 ec4:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 eca:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 ed0:	53                   	push   %ebx
 ed1:	e8 7a f9 ff ff       	call   850 <dijkstra>
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
