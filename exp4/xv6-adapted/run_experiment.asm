
_run_experiment: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
#include "types.h"
#include "user.h"

#define NUM_ROUNDS 30

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	8d 7d db             	lea    -0x25(%ebp),%edi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 28             	sub    $0x28,%esp
    int execs_cpu;
    int execs_io;
    char file_path[] = "./output.txt";
  17:	c7 45 db 2e 2f 6f 75 	movl   $0x756f2f2e,-0x25(%ebp)
  1e:	c7 45 df 74 70 75 74 	movl   $0x74757074,-0x21(%ebp)
  25:	c7 45 e3 2e 74 78 74 	movl   $0x7478742e,-0x1d(%ebp)
  2c:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  30:	c7 45 d0 1e 00 00 00 	movl   $0x1e,-0x30(%ebp)
  37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3e:	66 90                	xchg   %ax,%ax
    // --- Executing 30 rounds of the experiment ---
    for (int i = 0; i < NUM_ROUNDS; i++) {
        // --- Defining number of executions for each round ---
        execs_cpu = (random() % 9) + 6; // must be in [6, 14]
  40:	e8 1b 0a 00 00       	call   a60 <random>
  45:	89 c3                	mov    %eax,%ebx
  47:	b8 39 8e e3 38       	mov    $0x38e38e39,%eax
  4c:	f7 eb                	imul   %ebx
  4e:	89 d8                	mov    %ebx,%eax
  50:	c1 f8 1f             	sar    $0x1f,%eax
  53:	d1 fa                	sar    %edx
  55:	29 c2                	sub    %eax,%edx
  57:	8d 04 d2             	lea    (%edx,%edx,8),%eax
  5a:	29 c3                	sub    %eax,%ebx
        execs_io = 20 - execs_cpu; // must be 20 - X
  5c:	b8 14 00 00 00       	mov    $0x14,%eax
        execs_cpu = (random() % 9) + 6; // must be in [6, 14]
  61:	83 c3 06             	add    $0x6,%ebx
        execs_io = 20 - execs_cpu; // must be 20 - X
  64:	29 d8                	sub    %ebx,%eax
  66:	89 45 d4             	mov    %eax,-0x2c(%ebp)

        for (int j = 0; j < execs_cpu; j++) {
  69:	85 db                	test   %ebx,%ebx
  6b:	7e 0f                	jle    7c <main+0x7c>
  6d:	31 f6                	xor    %esi,%esi
  6f:	90                   	nop
            cpu_bound();
  70:	e8 ab 0e 00 00       	call   f20 <cpu_bound>
        for (int j = 0; j < execs_cpu; j++) {
  75:	83 c6 01             	add    $0x1,%esi
  78:	39 f3                	cmp    %esi,%ebx
  7a:	75 f4                	jne    70 <main+0x70>
        }

        for (int j = 0; j < execs_io; j++) {
  7c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
  7f:	31 db                	xor    %ebx,%ebx
  81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            io_bound(file_path);
  88:	83 ec 0c             	sub    $0xc,%esp
        for (int j = 0; j < execs_io; j++) {
  8b:	83 c3 01             	add    $0x1,%ebx
            io_bound(file_path);
  8e:	57                   	push   %edi
  8f:	e8 0c 0e 00 00       	call   ea0 <io_bound>
        for (int j = 0; j < execs_io; j++) {
  94:	83 c4 10             	add    $0x10,%esp
  97:	39 de                	cmp    %ebx,%esi
  99:	75 ed                	jne    88 <main+0x88>
    for (int i = 0; i < NUM_ROUNDS; i++) {
  9b:	83 6d d0 01          	subl   $0x1,-0x30(%ebp)
  9f:	75 9f                	jne    40 <main+0x40>
        }
    }

    return 0;
}
  a1:	8d 65 f0             	lea    -0x10(%ebp),%esp
  a4:	31 c0                	xor    %eax,%eax
  a6:	59                   	pop    %ecx
  a7:	5b                   	pop    %ebx
  a8:	5e                   	pop    %esi
  a9:	5f                   	pop    %edi
  aa:	5d                   	pop    %ebp
  ab:	8d 61 fc             	lea    -0x4(%ecx),%esp
  ae:	c3                   	ret    
  af:	90                   	nop

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  b1:	31 c0                	xor    %eax,%eax
{
  b3:	89 e5                	mov    %esp,%ebp
  b5:	53                   	push   %ebx
  b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  c7:	83 c0 01             	add    $0x1,%eax
  ca:	84 d2                	test   %dl,%dl
  cc:	75 f2                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d1:	89 c8                	mov    %ecx,%eax
  d3:	c9                   	leave  
  d4:	c3                   	ret    
  d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	53                   	push   %ebx
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
  e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ea:	0f b6 02             	movzbl (%edx),%eax
  ed:	84 c0                	test   %al,%al
  ef:	75 17                	jne    108 <strcmp+0x28>
  f1:	eb 3a                	jmp    12d <strcmp+0x4d>
  f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f7:	90                   	nop
  f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  fc:	83 c2 01             	add    $0x1,%edx
  ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 102:	84 c0                	test   %al,%al
 104:	74 1a                	je     120 <strcmp+0x40>
    p++, q++;
 106:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 108:	0f b6 19             	movzbl (%ecx),%ebx
 10b:	38 c3                	cmp    %al,%bl
 10d:	74 e9                	je     f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 10f:	29 d8                	sub    %ebx,%eax
}
 111:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 114:	c9                   	leave  
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 120:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 124:	31 c0                	xor    %eax,%eax
 126:	29 d8                	sub    %ebx,%eax
}
 128:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 12b:	c9                   	leave  
 12c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 12d:	0f b6 19             	movzbl (%ecx),%ebx
 130:	31 c0                	xor    %eax,%eax
 132:	eb db                	jmp    10f <strcmp+0x2f>
 134:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <strlen>:

uint
strlen(const char *s)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 146:	80 3a 00             	cmpb   $0x0,(%edx)
 149:	74 15                	je     160 <strlen+0x20>
 14b:	31 c0                	xor    %eax,%eax
 14d:	8d 76 00             	lea    0x0(%esi),%esi
 150:	83 c0 01             	add    $0x1,%eax
 153:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 157:	89 c1                	mov    %eax,%ecx
 159:	75 f5                	jne    150 <strlen+0x10>
    ;
  return n;
}
 15b:	89 c8                	mov    %ecx,%eax
 15d:	5d                   	pop    %ebp
 15e:	c3                   	ret    
 15f:	90                   	nop
  for(n = 0; s[n]; n++)
 160:	31 c9                	xor    %ecx,%ecx
}
 162:	5d                   	pop    %ebp
 163:	89 c8                	mov    %ecx,%eax
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	89 d7                	mov    %edx,%edi
 17f:	fc                   	cld    
 180:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 182:	8b 7d fc             	mov    -0x4(%ebp),%edi
 185:	89 d0                	mov    %edx,%eax
 187:	c9                   	leave  
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 19a:	0f b6 10             	movzbl (%eax),%edx
 19d:	84 d2                	test   %dl,%dl
 19f:	75 12                	jne    1b3 <strchr+0x23>
 1a1:	eb 1d                	jmp    1c0 <strchr+0x30>
 1a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a7:	90                   	nop
 1a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ac:	83 c0 01             	add    $0x1,%eax
 1af:	84 d2                	test   %dl,%dl
 1b1:	74 0d                	je     1c0 <strchr+0x30>
    if(*s == c)
 1b3:	38 d1                	cmp    %dl,%cl
 1b5:	75 f1                	jne    1a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1c0:	31 c0                	xor    %eax,%eax
}
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1d5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1d8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1d9:	31 db                	xor    %ebx,%ebx
{
 1db:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1de:	eb 27                	jmp    207 <gets+0x37>
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	6a 01                	push   $0x1
 1e5:	57                   	push   %edi
 1e6:	6a 00                	push   $0x0
 1e8:	e8 2e 01 00 00       	call   31b <read>
    if(cc < 1)
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	85 c0                	test   %eax,%eax
 1f2:	7e 1d                	jle    211 <gets+0x41>
      break;
    buf[i++] = c;
 1f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f8:	8b 55 08             	mov    0x8(%ebp),%edx
 1fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1ff:	3c 0a                	cmp    $0xa,%al
 201:	74 1d                	je     220 <gets+0x50>
 203:	3c 0d                	cmp    $0xd,%al
 205:	74 19                	je     220 <gets+0x50>
  for(i=0; i+1 < max; ){
 207:	89 de                	mov    %ebx,%esi
 209:	83 c3 01             	add    $0x1,%ebx
 20c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20f:	7c cf                	jl     1e0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 218:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21b:	5b                   	pop    %ebx
 21c:	5e                   	pop    %esi
 21d:	5f                   	pop    %edi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    
  buf[i] = '\0';
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	89 de                	mov    %ebx,%esi
 225:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 229:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	push   0x8(%ebp)
 24d:	e8 f1 00 00 00       	call   343 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	push   0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 f4 00 00 00       	call   35b <fstat>
  close(fd);
 267:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26a:	89 c6                	mov    %eax,%esi
  close(fd);
 26c:	e8 ba 00 00 00       	call   32b <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	8d 65 f8             	lea    -0x8(%ebp),%esp
 277:	89 f0                	mov    %esi,%eax
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 280:	be ff ff ff ff       	mov    $0xffffffff,%esi
 285:	eb ed                	jmp    274 <stat+0x34>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 02             	movsbl (%edx),%eax
 29a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 29d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2a5:	77 1e                	ja     2c5 <atoi+0x35>
 2a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ba:	0f be 02             	movsbl (%edx),%eax
 2bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c8:	89 c8                	mov    %ecx,%eax
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 45 10             	mov    0x10(%ebp),%eax
 2d7:	8b 55 08             	mov    0x8(%ebp),%edx
 2da:	56                   	push   %esi
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 c0                	test   %eax,%eax
 2e0:	7e 13                	jle    2f5 <memmove+0x25>
 2e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2e4:	89 d7                	mov    %edx,%edi
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 f8                	cmp    %edi,%eax
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    

000002fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fb:	b8 01 00 00 00       	mov    $0x1,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exit>:
SYSCALL(exit)
 303:	b8 02 00 00 00       	mov    $0x2,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <wait>:
SYSCALL(wait)
 30b:	b8 03 00 00 00       	mov    $0x3,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <pipe>:
SYSCALL(pipe)
 313:	b8 04 00 00 00       	mov    $0x4,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <read>:
SYSCALL(read)
 31b:	b8 05 00 00 00       	mov    $0x5,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <write>:
SYSCALL(write)
 323:	b8 10 00 00 00       	mov    $0x10,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <close>:
SYSCALL(close)
 32b:	b8 15 00 00 00       	mov    $0x15,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <kill>:
SYSCALL(kill)
 333:	b8 06 00 00 00       	mov    $0x6,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <exec>:
SYSCALL(exec)
 33b:	b8 07 00 00 00       	mov    $0x7,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <open>:
SYSCALL(open)
 343:	b8 0f 00 00 00       	mov    $0xf,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <mknod>:
SYSCALL(mknod)
 34b:	b8 11 00 00 00       	mov    $0x11,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <unlink>:
SYSCALL(unlink)
 353:	b8 12 00 00 00       	mov    $0x12,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <fstat>:
SYSCALL(fstat)
 35b:	b8 08 00 00 00       	mov    $0x8,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <link>:
SYSCALL(link)
 363:	b8 13 00 00 00       	mov    $0x13,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <mkdir>:
SYSCALL(mkdir)
 36b:	b8 14 00 00 00       	mov    $0x14,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <chdir>:
SYSCALL(chdir)
 373:	b8 09 00 00 00       	mov    $0x9,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <dup>:
SYSCALL(dup)
 37b:	b8 0a 00 00 00       	mov    $0xa,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <getpid>:
SYSCALL(getpid)
 383:	b8 0b 00 00 00       	mov    $0xb,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <sbrk>:
SYSCALL(sbrk)
 38b:	b8 0c 00 00 00       	mov    $0xc,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <sleep>:
SYSCALL(sleep)
 393:	b8 0d 00 00 00       	mov    $0xd,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <uptime>:
SYSCALL(uptime)
 39b:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    
 3a3:	66 90                	xchg   %ax,%ax
 3a5:	66 90                	xchg   %ax,%ax
 3a7:	66 90                	xchg   %ax,%ax
 3a9:	66 90                	xchg   %ax,%ax
 3ab:	66 90                	xchg   %ax,%ax
 3ad:	66 90                	xchg   %ax,%ax
 3af:	90                   	nop

000003b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	53                   	push   %ebx
 3b6:	83 ec 3c             	sub    $0x3c,%esp
 3b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3bc:	89 d1                	mov    %edx,%ecx
{
 3be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3c1:	85 d2                	test   %edx,%edx
 3c3:	0f 89 7f 00 00 00    	jns    448 <printint+0x98>
 3c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3cd:	74 79                	je     448 <printint+0x98>
    neg = 1;
 3cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3d8:	31 db                	xor    %ebx,%ebx
 3da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3e0:	89 c8                	mov    %ecx,%eax
 3e2:	31 d2                	xor    %edx,%edx
 3e4:	89 cf                	mov    %ecx,%edi
 3e6:	f7 75 c4             	divl   -0x3c(%ebp)
 3e9:	0f b6 92 f8 0f 00 00 	movzbl 0xff8(%edx),%edx
 3f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3f3:	89 d8                	mov    %ebx,%eax
 3f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 401:	76 dd                	jbe    3e0 <printint+0x30>
  if(neg)
 403:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 406:	85 c9                	test   %ecx,%ecx
 408:	74 0c                	je     416 <printint+0x66>
    buf[i++] = '-';
 40a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 40f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 411:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 416:	8b 7d b8             	mov    -0x48(%ebp),%edi
 419:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 41d:	eb 07                	jmp    426 <printint+0x76>
 41f:	90                   	nop
    putc(fd, buf[i]);
 420:	0f b6 13             	movzbl (%ebx),%edx
 423:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 426:	83 ec 04             	sub    $0x4,%esp
 429:	88 55 d7             	mov    %dl,-0x29(%ebp)
 42c:	6a 01                	push   $0x1
 42e:	56                   	push   %esi
 42f:	57                   	push   %edi
 430:	e8 ee fe ff ff       	call   323 <write>
  while(--i >= 0)
 435:	83 c4 10             	add    $0x10,%esp
 438:	39 de                	cmp    %ebx,%esi
 43a:	75 e4                	jne    420 <printint+0x70>
}
 43c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43f:	5b                   	pop    %ebx
 440:	5e                   	pop    %esi
 441:	5f                   	pop    %edi
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 448:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 44f:	eb 87                	jmp    3d8 <printint+0x28>
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 458:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop

00000460 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 469:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 46c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 46f:	0f b6 13             	movzbl (%ebx),%edx
 472:	84 d2                	test   %dl,%dl
 474:	74 6a                	je     4e0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 476:	8d 45 10             	lea    0x10(%ebp),%eax
 479:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 47c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 47f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 481:	89 45 d0             	mov    %eax,-0x30(%ebp)
 484:	eb 36                	jmp    4bc <printf+0x5c>
 486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
 490:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 493:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	74 15                	je     4b2 <printf+0x52>
  write(fd, &c, 1);
 49d:	83 ec 04             	sub    $0x4,%esp
 4a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4a3:	6a 01                	push   $0x1
 4a5:	57                   	push   %edi
 4a6:	56                   	push   %esi
 4a7:	e8 77 fe ff ff       	call   323 <write>
 4ac:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4af:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4b2:	0f b6 13             	movzbl (%ebx),%edx
 4b5:	83 c3 01             	add    $0x1,%ebx
 4b8:	84 d2                	test   %dl,%dl
 4ba:	74 24                	je     4e0 <printf+0x80>
    c = fmt[i] & 0xff;
 4bc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4bf:	85 c9                	test   %ecx,%ecx
 4c1:	74 cd                	je     490 <printf+0x30>
      }
    } else if(state == '%'){
 4c3:	83 f9 25             	cmp    $0x25,%ecx
 4c6:	75 ea                	jne    4b2 <printf+0x52>
      if(c == 'd'){
 4c8:	83 f8 25             	cmp    $0x25,%eax
 4cb:	0f 84 07 01 00 00    	je     5d8 <printf+0x178>
 4d1:	83 e8 63             	sub    $0x63,%eax
 4d4:	83 f8 15             	cmp    $0x15,%eax
 4d7:	77 17                	ja     4f0 <printf+0x90>
 4d9:	ff 24 85 a0 0f 00 00 	jmp    *0xfa0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5f                   	pop    %edi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop
  write(fd, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4f6:	6a 01                	push   $0x1
 4f8:	57                   	push   %edi
 4f9:	56                   	push   %esi
 4fa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4fe:	e8 20 fe ff ff       	call   323 <write>
        putc(fd, c);
 503:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 507:	83 c4 0c             	add    $0xc,%esp
 50a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 50d:	6a 01                	push   $0x1
 50f:	57                   	push   %edi
 510:	56                   	push   %esi
 511:	e8 0d fe ff ff       	call   323 <write>
        putc(fd, c);
 516:	83 c4 10             	add    $0x10,%esp
      state = 0;
 519:	31 c9                	xor    %ecx,%ecx
 51b:	eb 95                	jmp    4b2 <printf+0x52>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 520:	83 ec 0c             	sub    $0xc,%esp
 523:	b9 10 00 00 00       	mov    $0x10,%ecx
 528:	6a 00                	push   $0x0
 52a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 52d:	8b 10                	mov    (%eax),%edx
 52f:	89 f0                	mov    %esi,%eax
 531:	e8 7a fe ff ff       	call   3b0 <printint>
        ap++;
 536:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 53a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53d:	31 c9                	xor    %ecx,%ecx
 53f:	e9 6e ff ff ff       	jmp    4b2 <printf+0x52>
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 548:	8b 45 d0             	mov    -0x30(%ebp),%eax
 54b:	8b 10                	mov    (%eax),%edx
        ap++;
 54d:	83 c0 04             	add    $0x4,%eax
 550:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 553:	85 d2                	test   %edx,%edx
 555:	0f 84 8d 00 00 00    	je     5e8 <printf+0x188>
        while(*s != 0){
 55b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 55e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 560:	84 c0                	test   %al,%al
 562:	0f 84 4a ff ff ff    	je     4b2 <printf+0x52>
 568:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 56b:	89 d3                	mov    %edx,%ebx
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
          s++;
 573:	83 c3 01             	add    $0x1,%ebx
 576:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 579:	6a 01                	push   $0x1
 57b:	57                   	push   %edi
 57c:	56                   	push   %esi
 57d:	e8 a1 fd ff ff       	call   323 <write>
        while(*s != 0){
 582:	0f b6 03             	movzbl (%ebx),%eax
 585:	83 c4 10             	add    $0x10,%esp
 588:	84 c0                	test   %al,%al
 58a:	75 e4                	jne    570 <printf+0x110>
      state = 0;
 58c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 58f:	31 c9                	xor    %ecx,%ecx
 591:	e9 1c ff ff ff       	jmp    4b2 <printf+0x52>
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5a8:	6a 01                	push   $0x1
 5aa:	e9 7b ff ff ff       	jmp    52a <printf+0xca>
 5af:	90                   	nop
        putc(fd, *ap);
 5b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5b6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5b8:	6a 01                	push   $0x1
 5ba:	57                   	push   %edi
 5bb:	56                   	push   %esi
        putc(fd, *ap);
 5bc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5bf:	e8 5f fd ff ff       	call   323 <write>
        ap++;
 5c4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5cb:	31 c9                	xor    %ecx,%ecx
 5cd:	e9 e0 fe ff ff       	jmp    4b2 <printf+0x52>
 5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 5d8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5db:	83 ec 04             	sub    $0x4,%esp
 5de:	e9 2a ff ff ff       	jmp    50d <printf+0xad>
 5e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e7:	90                   	nop
          s = "(null)";
 5e8:	ba 98 0f 00 00       	mov    $0xf98,%edx
        while(*s != 0){
 5ed:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5f0:	b8 28 00 00 00       	mov    $0x28,%eax
 5f5:	89 d3                	mov    %edx,%ebx
 5f7:	e9 74 ff ff ff       	jmp    570 <printf+0x110>
 5fc:	66 90                	xchg   %ax,%ax
 5fe:	66 90                	xchg   %ax,%ax

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 f4 15 00 00       	mov    0x15f4,%eax
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 60e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	89 c2                	mov    %eax,%edx
 61a:	8b 00                	mov    (%eax),%eax
 61c:	39 ca                	cmp    %ecx,%edx
 61e:	73 30                	jae    650 <free+0x50>
 620:	39 c1                	cmp    %eax,%ecx
 622:	72 04                	jb     628 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 624:	39 c2                	cmp    %eax,%edx
 626:	72 f0                	jb     618 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 628:	8b 73 fc             	mov    -0x4(%ebx),%esi
 62b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 62e:	39 f8                	cmp    %edi,%eax
 630:	74 30                	je     662 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 632:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 635:	8b 42 04             	mov    0x4(%edx),%eax
 638:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 63b:	39 f1                	cmp    %esi,%ecx
 63d:	74 3a                	je     679 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 63f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 641:	5b                   	pop    %ebx
  freep = p;
 642:	89 15 f4 15 00 00    	mov    %edx,0x15f4
}
 648:	5e                   	pop    %esi
 649:	5f                   	pop    %edi
 64a:	5d                   	pop    %ebp
 64b:	c3                   	ret    
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 650:	39 c2                	cmp    %eax,%edx
 652:	72 c4                	jb     618 <free+0x18>
 654:	39 c1                	cmp    %eax,%ecx
 656:	73 c0                	jae    618 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 658:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65e:	39 f8                	cmp    %edi,%eax
 660:	75 d0                	jne    632 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 662:	03 70 04             	add    0x4(%eax),%esi
 665:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 668:	8b 02                	mov    (%edx),%eax
 66a:	8b 00                	mov    (%eax),%eax
 66c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 66f:	8b 42 04             	mov    0x4(%edx),%eax
 672:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 675:	39 f1                	cmp    %esi,%ecx
 677:	75 c6                	jne    63f <free+0x3f>
    p->s.size += bp->s.size;
 679:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 67c:	89 15 f4 15 00 00    	mov    %edx,0x15f4
    p->s.size += bp->s.size;
 682:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 685:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 688:	89 0a                	mov    %ecx,(%edx)
}
 68a:	5b                   	pop    %ebx
 68b:	5e                   	pop    %esi
 68c:	5f                   	pop    %edi
 68d:	5d                   	pop    %ebp
 68e:	c3                   	ret    
 68f:	90                   	nop

00000690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 699:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 69c:	8b 3d f4 15 00 00    	mov    0x15f4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a2:	8d 70 07             	lea    0x7(%eax),%esi
 6a5:	c1 ee 03             	shr    $0x3,%esi
 6a8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6ab:	85 ff                	test   %edi,%edi
 6ad:	0f 84 9d 00 00 00    	je     750 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6b5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6b8:	39 f1                	cmp    %esi,%ecx
 6ba:	73 6a                	jae    726 <malloc+0x96>
 6bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6c1:	39 de                	cmp    %ebx,%esi
 6c3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 6c6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6d0:	eb 17                	jmp    6e9 <malloc+0x59>
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6da:	8b 48 04             	mov    0x4(%eax),%ecx
 6dd:	39 f1                	cmp    %esi,%ecx
 6df:	73 4f                	jae    730 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6e1:	8b 3d f4 15 00 00    	mov    0x15f4,%edi
 6e7:	89 c2                	mov    %eax,%edx
 6e9:	39 d7                	cmp    %edx,%edi
 6eb:	75 eb                	jne    6d8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6ed:	83 ec 0c             	sub    $0xc,%esp
 6f0:	ff 75 e4             	push   -0x1c(%ebp)
 6f3:	e8 93 fc ff ff       	call   38b <sbrk>
  if(p == (char*)-1)
 6f8:	83 c4 10             	add    $0x10,%esp
 6fb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6fe:	74 1c                	je     71c <malloc+0x8c>
  hp->s.size = nu;
 700:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 703:	83 ec 0c             	sub    $0xc,%esp
 706:	83 c0 08             	add    $0x8,%eax
 709:	50                   	push   %eax
 70a:	e8 f1 fe ff ff       	call   600 <free>
  return freep;
 70f:	8b 15 f4 15 00 00    	mov    0x15f4,%edx
      if((p = morecore(nunits)) == 0)
 715:	83 c4 10             	add    $0x10,%esp
 718:	85 d2                	test   %edx,%edx
 71a:	75 bc                	jne    6d8 <malloc+0x48>
        return 0;
  }
}
 71c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 71f:	31 c0                	xor    %eax,%eax
}
 721:	5b                   	pop    %ebx
 722:	5e                   	pop    %esi
 723:	5f                   	pop    %edi
 724:	5d                   	pop    %ebp
 725:	c3                   	ret    
    if(p->s.size >= nunits){
 726:	89 d0                	mov    %edx,%eax
 728:	89 fa                	mov    %edi,%edx
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 730:	39 ce                	cmp    %ecx,%esi
 732:	74 4c                	je     780 <malloc+0xf0>
        p->s.size -= nunits;
 734:	29 f1                	sub    %esi,%ecx
 736:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 739:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 73c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 73f:	89 15 f4 15 00 00    	mov    %edx,0x15f4
}
 745:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 748:	83 c0 08             	add    $0x8,%eax
}
 74b:	5b                   	pop    %ebx
 74c:	5e                   	pop    %esi
 74d:	5f                   	pop    %edi
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 750:	c7 05 f4 15 00 00 f8 	movl   $0x15f8,0x15f4
 757:	15 00 00 
    base.s.size = 0;
 75a:	bf f8 15 00 00       	mov    $0x15f8,%edi
    base.s.ptr = freep = prevp = &base;
 75f:	c7 05 f8 15 00 00 f8 	movl   $0x15f8,0x15f8
 766:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 769:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 76b:	c7 05 fc 15 00 00 00 	movl   $0x0,0x15fc
 772:	00 00 00 
    if(p->s.size >= nunits){
 775:	e9 42 ff ff ff       	jmp    6bc <malloc+0x2c>
 77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 780:	8b 08                	mov    (%eax),%ecx
 782:	89 0a                	mov    %ecx,(%edx)
 784:	eb b9                	jmp    73f <malloc+0xaf>
 786:	66 90                	xchg   %ax,%ax
 788:	66 90                	xchg   %ax,%ax
 78a:	66 90                	xchg   %ax,%ax
 78c:	66 90                	xchg   %ax,%ax
 78e:	66 90                	xchg   %ax,%ax

00000790 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 04             	sub    $0x4,%esp
 799:	8b 5d 10             	mov    0x10(%ebp),%ebx
 79c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 79f:	85 db                	test   %ebx,%ebx
 7a1:	7e 3d                	jle    7e0 <min_distance_vertex+0x50>
    int min_idx = 0;
 7a3:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 7a5:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 7a7:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 7ac:	89 75 f0             	mov    %esi,-0x10(%ebp)
 7af:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 7b0:	8b 14 87             	mov    (%edi,%eax,4),%edx
 7b3:	39 ca                	cmp    %ecx,%edx
 7b5:	7d 14                	jge    7cb <min_distance_vertex+0x3b>
 7b7:	8b 75 0c             	mov    0xc(%ebp),%esi
 7ba:	8b 34 86             	mov    (%esi,%eax,4),%esi
 7bd:	85 f6                	test   %esi,%esi
 7bf:	8b 75 f0             	mov    -0x10(%ebp),%esi
 7c2:	0f 44 ca             	cmove  %edx,%ecx
 7c5:	0f 44 f0             	cmove  %eax,%esi
 7c8:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 7cb:	83 c0 01             	add    $0x1,%eax
 7ce:	39 c3                	cmp    %eax,%ebx
 7d0:	75 de                	jne    7b0 <min_distance_vertex+0x20>
 7d2:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 7d5:	83 c4 04             	add    $0x4,%esp
 7d8:	5b                   	pop    %ebx
 7d9:	89 f0                	mov    %esi,%eax
 7db:	5e                   	pop    %esi
 7dc:	5f                   	pop    %edi
 7dd:	5d                   	pop    %ebp
 7de:	c3                   	ret    
 7df:	90                   	nop
 7e0:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 7e3:	31 f6                	xor    %esi,%esi
}
 7e5:	5b                   	pop    %ebx
 7e6:	89 f0                	mov    %esi,%eax
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 7f9:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7fc:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 7ff:	89 e6                	mov    %esp,%esi
 801:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 808:	8d 41 0f             	lea    0xf(%ecx),%eax
 80b:	89 c2                	mov    %eax,%edx
 80d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 812:	29 c6                	sub    %eax,%esi
 814:	83 e2 f0             	and    $0xfffffff0,%edx
 817:	39 f4                	cmp    %esi,%esp
 819:	74 12                	je     82d <dijkstra+0x3d>
 81b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 821:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 828:	00 
 829:	39 f4                	cmp    %esi,%esp
 82b:	75 ee                	jne    81b <dijkstra+0x2b>
 82d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 833:	29 d4                	sub    %edx,%esp
 835:	85 d2                	test   %edx,%edx
 837:	0f 85 ef 00 00 00    	jne    92c <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 83d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 840:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 842:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 845:	8b 45 0c             	mov    0xc(%ebp),%eax
 848:	85 c0                	test   %eax,%eax
 84a:	0f 8e e6 00 00 00    	jle    936 <dijkstra+0x146>
 850:	89 d8                	mov    %ebx,%eax
 852:	89 fa                	mov    %edi,%edx
 854:	01 d9                	add    %ebx,%ecx
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 860:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 866:	83 c0 04             	add    $0x4,%eax
 869:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 86c:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 873:	39 c8                	cmp    %ecx,%eax
 875:	75 e9                	jne    860 <dijkstra+0x70>
    dist[src] = 0;
 877:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 87d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 888:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 88a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 88f:	31 c0                	xor    %eax,%eax
 891:	eb 07                	jmp    89a <dijkstra+0xaa>
 893:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 897:	90                   	nop
 898:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 89a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 89d:	39 ca                	cmp    %ecx,%edx
 89f:	7d 0a                	jge    8ab <dijkstra+0xbb>
 8a1:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 8a5:	0f 44 f0             	cmove  %eax,%esi
 8a8:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 8ab:	8d 50 01             	lea    0x1(%eax),%edx
 8ae:	39 55 0c             	cmp    %edx,0xc(%ebp)
 8b1:	75 e5                	jne    898 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 8b3:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 8b6:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 8bd:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 8c3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8c6:	75 18                	jne    8e0 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 8c8:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8cb:	8d 56 01             	lea    0x1(%esi),%edx
 8ce:	39 c6                	cmp    %eax,%esi
 8d0:	74 52                	je     924 <dijkstra+0x134>
 8d2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8d5:	eb b1                	jmp    888 <dijkstra+0x98>
 8d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8de:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 8e0:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 8e6:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 8e9:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 8ec:	31 d2                	xor    %edx,%edx
 8ee:	eb 02                	jmp    8f2 <dijkstra+0x102>
 8f0:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 8f2:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 8f5:	85 c9                	test   %ecx,%ecx
 8f7:	74 17                	je     910 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 8f9:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 8fc:	85 db                	test   %ebx,%ebx
 8fe:	75 10                	jne    910 <dijkstra+0x120>
 900:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 903:	03 0b                	add    (%ebx),%ecx
 905:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 908:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 90b:	7e 03                	jle    910 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 90d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 910:	8d 4a 01             	lea    0x1(%edx),%ecx
 913:	39 c2                	cmp    %eax,%edx
 915:	75 d9                	jne    8f0 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 917:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 91a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 91d:	8d 56 01             	lea    0x1(%esi),%edx
 920:	39 c6                	cmp    %eax,%esi
 922:	75 ae                	jne    8d2 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 924:	8d 65 f4             	lea    -0xc(%ebp),%esp
 927:	5b                   	pop    %ebx
 928:	5e                   	pop    %esi
 929:	5f                   	pop    %edi
 92a:	5d                   	pop    %ebp
 92b:	c3                   	ret    
    int visited[num_vertices];
 92c:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 931:	e9 07 ff ff ff       	jmp    83d <dijkstra+0x4d>
    dist[src] = 0;
 936:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 93c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 93f:	5b                   	pop    %ebx
 940:	5e                   	pop    %esi
 941:	5f                   	pop    %edi
 942:	5d                   	pop    %ebp
 943:	c3                   	ret    
 944:	66 90                	xchg   %ax,%ax
 946:	66 90                	xchg   %ax,%ax
 948:	66 90                	xchg   %ax,%ax
 94a:	66 90                	xchg   %ax,%ax
 94c:	66 90                	xchg   %ax,%ax
 94e:	66 90                	xchg   %ax,%ax

00000950 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 954:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 959:	56                   	push   %esi
 95a:	53                   	push   %ebx
 95b:	83 ec 0c             	sub    $0xc,%esp
 95e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 961:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 964:	e8 f7 00 00 00       	call   a60 <random>
 969:	89 c1                	mov    %eax,%ecx
 96b:	f7 ef                	imul   %edi
 96d:	89 c8                	mov    %ecx,%eax
 96f:	c1 f8 1f             	sar    $0x1f,%eax
 972:	c1 fa 06             	sar    $0x6,%edx
 975:	29 c2                	sub    %eax,%edx
 977:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 97d:	29 c1                	sub    %eax,%ecx
 97f:	83 f9 63             	cmp    $0x63,%ecx
 982:	89 ca                	mov    %ecx,%edx
 984:	8d 41 64             	lea    0x64(%ecx),%eax
 987:	0f 4e d0             	cmovle %eax,%edx
 98a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 98c:	e8 cf 00 00 00       	call   a60 <random>
 991:	89 c1                	mov    %eax,%ecx
 993:	f7 ef                	imul   %edi
 995:	89 c8                	mov    %ecx,%eax
 997:	c1 f8 1f             	sar    $0x1f,%eax
 99a:	c1 fa 07             	sar    $0x7,%edx
 99d:	29 c2                	sub    %eax,%edx
 99f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 9a5:	29 c1                	sub    %eax,%ecx
 9a7:	8d 41 32             	lea    0x32(%ecx),%eax
 9aa:	89 ca                	mov    %ecx,%edx
 9ac:	83 f9 31             	cmp    $0x31,%ecx
 9af:	0f 4e d0             	cmovle %eax,%edx
 9b2:	8b 45 10             	mov    0x10(%ebp),%eax
 9b5:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 9b7:	8b 13                	mov    (%ebx),%edx
 9b9:	85 d2                	test   %edx,%edx
 9bb:	7e 38                	jle    9f5 <gen_random_digraph+0xa5>
 9bd:	89 f1                	mov    %esi,%ecx
 9bf:	31 ff                	xor    %edi,%edi
 9c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 9c8:	31 c0                	xor    %eax,%eax
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 9d0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 9d7:	8b 13                	mov    (%ebx),%edx
 9d9:	83 c0 01             	add    $0x1,%eax
 9dc:	39 c2                	cmp    %eax,%edx
 9de:	7f f0                	jg     9d0 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 9e0:	83 c7 01             	add    $0x1,%edi
 9e3:	81 c1 20 03 00 00    	add    $0x320,%ecx
 9e9:	39 fa                	cmp    %edi,%edx
 9eb:	7f db                	jg     9c8 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 9ed:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 9f3:	7f 22                	jg     a17 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 9f5:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 9fb:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 a02:	8d 04 86             	lea    (%esi,%eax,4),%eax
 a05:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 a08:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 a0e:	05 20 03 00 00       	add    $0x320,%eax
 a13:	39 d0                	cmp    %edx,%eax
 a15:	75 f1                	jne    a08 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 a17:	8b 45 10             	mov    0x10(%ebp),%eax
 a1a:	31 c9                	xor    %ecx,%ecx
 a1c:	8b 00                	mov    (%eax),%eax
 a1e:	85 c0                	test   %eax,%eax
 a20:	7e 31                	jle    a53 <gen_random_digraph+0x103>
 a22:	89 75 08             	mov    %esi,0x8(%ebp)
 a25:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 a27:	e8 34 00 00 00       	call   a60 <random>
    for (int i = 0; i < *num_edges; i++) {
 a2c:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 a2f:	99                   	cltd   
 a30:	f7 3b                	idivl  (%ebx)
 a32:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 a34:	e8 27 00 00 00       	call   a60 <random>
        graph[new_edge_u][new_edge_v] = 1;
 a39:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 a3f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 a42:	99                   	cltd   
 a43:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 a45:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 a48:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 a4f:	39 30                	cmp    %esi,(%eax)
 a51:	7f d4                	jg     a27 <gen_random_digraph+0xd7>
    }
}
 a53:	83 c4 0c             	add    $0xc,%esp
 a56:	5b                   	pop    %ebx
 a57:	5e                   	pop    %esi
 a58:	5f                   	pop    %edi
 a59:	5d                   	pop    %ebp
 a5a:	c3                   	ret    
 a5b:	66 90                	xchg   %ax,%ax
 a5d:	66 90                	xchg   %ax,%ax
 a5f:	90                   	nop

00000a60 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 a60:	69 0d f0 15 00 00 0d 	imul   $0x19660d,0x15f0,%ecx
 a67:	66 19 00 
 a6a:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 a6f:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 a75:	89 c8                	mov    %ecx,%eax
 a77:	f7 ea                	imul   %edx
 a79:	89 d0                	mov    %edx,%eax
 a7b:	89 ca                	mov    %ecx,%edx
 a7d:	c1 fa 1f             	sar    $0x1f,%edx
 a80:	c1 f8 1d             	sar    $0x1d,%eax
 a83:	29 d0                	sub    %edx,%eax
 a85:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 a8b:	89 c8                	mov    %ecx,%eax
 a8d:	29 d0                	sub    %edx,%eax
 a8f:	a3 f0 15 00 00       	mov    %eax,0x15f0
    return seed;
 a94:	c3                   	ret    
 a95:	66 90                	xchg   %ax,%ax
 a97:	66 90                	xchg   %ax,%ax
 a99:	66 90                	xchg   %ax,%ax
 a9b:	66 90                	xchg   %ax,%ax
 a9d:	66 90                	xchg   %ax,%ax
 a9f:	90                   	nop

00000aa0 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	57                   	push   %edi
 aa4:	56                   	push   %esi
 aa5:	53                   	push   %ebx
 aa6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 aac:	83 0c 24 00          	orl    $0x0,(%esp)
 ab0:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 ab6:	83 0c 24 00          	orl    $0x0,(%esp)
 aba:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
 ac0:	6a 00                	push   $0x0
 ac2:	ff 75 08             	push   0x8(%ebp)
 ac5:	e8 79 f8 ff ff       	call   343 <open>
    if (fp < 0 ) {
 aca:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
 acd:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
 ad3:	85 c0                	test   %eax,%eax
 ad5:	0f 88 99 01 00 00    	js     c74 <permute_line+0x1d4>
 adb:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 ae1:	31 db                	xor    %ebx,%ebx
 ae3:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
 ae9:	89 f7                	mov    %esi,%edi
 aeb:	89 de                	mov    %ebx,%esi
 aed:	89 c3                	mov    %eax,%ebx
 aef:	eb 12                	jmp    b03 <permute_line+0x63>
 af1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 af8:	83 c7 66             	add    $0x66,%edi
 afb:	83 fe 64             	cmp    $0x64,%esi
 afe:	74 16                	je     b16 <permute_line+0x76>
        line_idx++;
 b00:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 b03:	83 ec 04             	sub    $0x4,%esp
 b06:	6a 66                	push   $0x66
 b08:	57                   	push   %edi
 b09:	53                   	push   %ebx
 b0a:	e8 0c f8 ff ff       	call   31b <read>
 b0f:	83 c4 10             	add    $0x10,%esp
 b12:	85 c0                	test   %eax,%eax
 b14:	7f e2                	jg     af8 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
 b16:	89 f3                	mov    %esi,%ebx
 b18:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
 b1e:	e8 3d ff ff ff       	call   a60 <random>
 b23:	89 c1                	mov    %eax,%ecx
 b25:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 b2a:	f7 e9                	imul   %ecx
 b2c:	89 c8                	mov    %ecx,%eax
 b2e:	c1 f8 1f             	sar    $0x1f,%eax
 b31:	c1 fa 05             	sar    $0x5,%edx
 b34:	29 c2                	sub    %eax,%edx
 b36:	6b c2 64             	imul   $0x64,%edx,%eax
 b39:	29 c1                	sub    %eax,%ecx
 b3b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
 b3d:	e8 1e ff ff ff       	call   a60 <random>
 b42:	89 c1                	mov    %eax,%ecx
 b44:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 b49:	f7 e9                	imul   %ecx
 b4b:	89 c8                	mov    %ecx,%eax
 b4d:	c1 f8 1f             	sar    $0x1f,%eax
 b50:	c1 fa 05             	sar    $0x5,%edx
 b53:	29 c2                	sub    %eax,%edx
 b55:	6b c2 64             	imul   $0x64,%edx,%eax
 b58:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
 b5a:	39 cf                	cmp    %ecx,%edi
 b5c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
 b62:	74 5f                	je     bc3 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
 b64:	6b c7 66             	imul   $0x66,%edi,%eax
 b67:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
 b6d:	83 ec 08             	sub    $0x8,%esp
 b70:	01 c1                	add    %eax,%ecx
 b72:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b78:	51                   	push   %ecx
 b79:	50                   	push   %eax
 b7a:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
 b80:	e8 2b f5 ff ff       	call   b0 <strcpy>
        strcpy(lines[line1], lines[line2]);
 b85:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 b8b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 b91:	6b d2 66             	imul   $0x66,%edx,%edx
 b94:	01 c2                	add    %eax,%edx
 b96:	58                   	pop    %eax
 b97:	59                   	pop    %ecx
 b98:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
 b9e:	52                   	push   %edx
 b9f:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 ba5:	51                   	push   %ecx
 ba6:	e8 05 f5 ff ff       	call   b0 <strcpy>
        strcpy(lines[line2], temp);
 bab:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 bb1:	5f                   	pop    %edi
 bb2:	58                   	pop    %eax
 bb3:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 bb9:	50                   	push   %eax
 bba:	52                   	push   %edx
 bbb:	e8 f0 f4 ff ff       	call   b0 <strcpy>
 bc0:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 bc3:	83 ec 0c             	sub    $0xc,%esp
 bc6:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 bcc:	e8 5a f7 ff ff       	call   32b <close>
    fp = open(file_path, O_RDWR);
 bd1:	58                   	pop    %eax
 bd2:	5a                   	pop    %edx
 bd3:	6a 02                	push   $0x2
 bd5:	ff 75 08             	push   0x8(%ebp)
 bd8:	e8 66 f7 ff ff       	call   343 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 bdd:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 bde:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 be0:	58                   	pop    %eax
 be1:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 be7:	50                   	push   %eax
 be8:	57                   	push   %edi
 be9:	e8 6d f7 ff ff       	call   35b <fstat>
    char *buffer = malloc(0);
 bee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 bf5:	e8 96 fa ff ff       	call   690 <malloc>
    memset(buffer, 0, 0);  
 bfa:	83 c4 0c             	add    $0xc,%esp
 bfd:	6a 00                	push   $0x0
 bff:	6a 00                	push   $0x0
 c01:	50                   	push   %eax
 c02:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 c08:	e8 63 f5 ff ff       	call   170 <memset>
    write(fp, buffer, 0);
 c0d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 c13:	83 c4 0c             	add    $0xc,%esp
 c16:	6a 00                	push   $0x0
 c18:	52                   	push   %edx
 c19:	57                   	push   %edi
 c1a:	e8 04 f7 ff ff       	call   323 <write>
    free(buffer);
 c1f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 c25:	89 14 24             	mov    %edx,(%esp)
 c28:	e8 d3 f9 ff ff       	call   600 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 c2d:	83 c4 10             	add    $0x10,%esp
 c30:	85 ff                	test   %edi,%edi
 c32:	78 59                	js     c8d <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 c34:	85 db                	test   %ebx,%ebx
 c36:	74 26                	je     c5e <permute_line+0x1be>
 c38:	6b db 66             	imul   $0x66,%ebx,%ebx
 c3b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 c41:	01 c3                	add    %eax,%ebx
 c43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c47:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 c48:	83 ec 04             	sub    $0x4,%esp
 c4b:	6a 66                	push   $0x66
 c4d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 c4e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 c51:	57                   	push   %edi
 c52:	e8 cc f6 ff ff       	call   323 <write>
    for (int i = 0; i < line_idx; i++) {
 c57:	83 c4 10             	add    $0x10,%esp
 c5a:	39 de                	cmp    %ebx,%esi
 c5c:	75 ea                	jne    c48 <permute_line+0x1a8>
    }

    close(fp);
 c5e:	83 ec 0c             	sub    $0xc,%esp
 c61:	57                   	push   %edi
 c62:	e8 c4 f6 ff ff       	call   32b <close>
    return 0;
 c67:	83 c4 10             	add    $0x10,%esp
 c6a:	31 c0                	xor    %eax,%eax
 c6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 c6f:	5b                   	pop    %ebx
 c70:	5e                   	pop    %esi
 c71:	5f                   	pop    %edi
 c72:	5d                   	pop    %ebp
 c73:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 c74:	83 ec 08             	sub    $0x8,%esp
 c77:	68 0c 10 00 00       	push   $0x100c
 c7c:	6a 01                	push   $0x1
 c7e:	e8 dd f7 ff ff       	call   460 <printf>
        return -1;
 c83:	83 c4 10             	add    $0x10,%esp
 c86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c8b:	eb df                	jmp    c6c <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 c8d:	83 ec 08             	sub    $0x8,%esp
 c90:	68 54 10 00 00       	push   $0x1054
 c95:	6a 01                	push   $0x1
 c97:	e8 c4 f7 ff ff       	call   460 <printf>
        return -1;
 c9c:	83 c4 10             	add    $0x10,%esp
 c9f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ca4:	eb c6                	jmp    c6c <permute_line+0x1cc>
 ca6:	66 90                	xchg   %ax,%ax
 ca8:	66 90                	xchg   %ax,%ax
 caa:	66 90                	xchg   %ax,%ax
 cac:	66 90                	xchg   %ax,%ax
 cae:	66 90                	xchg   %ax,%ax

00000cb0 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
 cb0:	55                   	push   %ebp
 cb1:	89 e5                	mov    %esp,%ebp
 cb3:	57                   	push   %edi
 cb4:	56                   	push   %esi
 cb5:	53                   	push   %ebx
 cb6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 cbc:	83 0c 24 00          	orl    $0x0,(%esp)
 cc0:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 cc6:	83 0c 24 00          	orl    $0x0,(%esp)
 cca:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
 cd0:	6a 00                	push   $0x0
 cd2:	ff 75 08             	push   0x8(%ebp)
 cd5:	e8 69 f6 ff ff       	call   343 <open>
    if (fp < 0) {
 cda:	83 c4 10             	add    $0x10,%esp
 cdd:	85 c0                	test   %eax,%eax
 cdf:	0f 88 b1 00 00 00    	js     d96 <add_line+0xe6>
 ce5:	89 c3                	mov    %eax,%ebx
 ce7:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 ced:	31 f6                	xor    %esi,%esi
 cef:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
 cf5:	89 c7                	mov    %eax,%edi
 cf7:	eb 12                	jmp    d0b <add_line+0x5b>
 cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 d00:	83 c7 66             	add    $0x66,%edi
 d03:	83 fe 64             	cmp    $0x64,%esi
 d06:	74 1c                	je     d24 <add_line+0x74>
        line_idx++;
 d08:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 d0b:	83 ec 04             	sub    $0x4,%esp
 d0e:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
 d14:	6a 66                	push   $0x66
 d16:	57                   	push   %edi
 d17:	53                   	push   %ebx
 d18:	e8 fe f5 ff ff       	call   31b <read>
 d1d:	83 c4 10             	add    $0x10,%esp
 d20:	85 c0                	test   %eax,%eax
 d22:	7f dc                	jg     d00 <add_line+0x50>
    }
    close(fp); 
 d24:	83 ec 0c             	sub    $0xc,%esp
 d27:	53                   	push   %ebx
 d28:	e8 fe f5 ff ff       	call   32b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 d2d:	58                   	pop    %eax
 d2e:	5a                   	pop    %edx
 d2f:	ff 75 0c             	push   0xc(%ebp)
 d32:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 d38:	e8 73 f3 ff ff       	call   b0 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 d3d:	59                   	pop    %ecx
 d3e:	5b                   	pop    %ebx
 d3f:	6a 01                	push   $0x1
 d41:	ff 75 08             	push   0x8(%ebp)
 d44:	e8 fa f5 ff ff       	call   343 <open>
    if (fp < 0) {
 d49:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
 d4c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
 d4e:	85 c0                	test   %eax,%eax
 d50:	78 5d                	js     daf <add_line+0xff>
 d52:	6b ce 66             	imul   $0x66,%esi,%ecx
 d55:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
 d5b:	8d 78 66             	lea    0x66(%eax),%edi
 d5e:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
 d61:	eb 08                	jmp    d6b <add_line+0xbb>
 d63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d67:	90                   	nop
 d68:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
 d6b:	83 ec 04             	sub    $0x4,%esp
 d6e:	6a 66                	push   $0x66
 d70:	50                   	push   %eax
 d71:	53                   	push   %ebx
 d72:	e8 ac f5 ff ff       	call   323 <write>
    for (int i = 0; i < line_idx; i++) {
 d77:	89 f8                	mov    %edi,%eax
 d79:	83 c4 10             	add    $0x10,%esp
 d7c:	39 f7                	cmp    %esi,%edi
 d7e:	75 e8                	jne    d68 <add_line+0xb8>
    }

    close(fp);
 d80:	83 ec 0c             	sub    $0xc,%esp
 d83:	53                   	push   %ebx
 d84:	e8 a2 f5 ff ff       	call   32b <close>
    return 0;
 d89:	83 c4 10             	add    $0x10,%esp
 d8c:	31 c0                	xor    %eax,%eax
}
 d8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 d91:	5b                   	pop    %ebx
 d92:	5e                   	pop    %esi
 d93:	5f                   	pop    %edi
 d94:	5d                   	pop    %ebp
 d95:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
 d96:	83 ec 08             	sub    $0x8,%esp
 d99:	68 90 10 00 00       	push   $0x1090
 d9e:	6a 01                	push   $0x1
 da0:	e8 bb f6 ff ff       	call   460 <printf>
        return -1;
 da5:	83 c4 10             	add    $0x10,%esp
 da8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 dad:	eb df                	jmp    d8e <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 daf:	83 ec 08             	sub    $0x8,%esp
 db2:	68 b4 10 00 00       	push   $0x10b4
 db7:	6a 01                	push   $0x1
 db9:	e8 a2 f6 ff ff       	call   460 <printf>
        return -1;
 dbe:	83 c4 10             	add    $0x10,%esp
 dc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 dc6:	eb c6                	jmp    d8e <add_line+0xde>
 dc8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 dcf:	90                   	nop

00000dd0 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
 dd0:	55                   	push   %ebp
 dd1:	89 e5                	mov    %esp,%ebp
 dd3:	57                   	push   %edi
 dd4:	56                   	push   %esi
 dd5:	53                   	push   %ebx
 dd6:	83 ec 0c             	sub    $0xc,%esp
 dd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ddc:	8d 73 64             	lea    0x64(%ebx),%esi
 ddf:	89 f7                	mov    %esi,%edi
 de1:	8b 75 0c             	mov    0xc(%ebp),%esi
 de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
 de8:	e8 73 fc ff ff       	call   a60 <random>
 ded:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 def:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
 df2:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
 df5:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 df9:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 dfc:	39 fb                	cmp    %edi,%ebx
 dfe:	75 e8                	jne    de8 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
 e00:	8b 45 08             	mov    0x8(%ebp),%eax
 e03:	ba 0a 00 00 00       	mov    $0xa,%edx
 e08:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
 e0c:	83 c4 0c             	add    $0xc,%esp
 e0f:	5b                   	pop    %ebx
 e10:	5e                   	pop    %esi
 e11:	5f                   	pop    %edi
 e12:	5d                   	pop    %ebp
 e13:	c3                   	ret    
 e14:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 e1f:	90                   	nop

00000e20 <write_random_string>:

int write_random_string(char file_path[]) {
 e20:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e21:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
 e26:	89 e5                	mov    %esp,%ebp
 e28:	57                   	push   %edi
 e29:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e2a:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
 e30:	be d8 10 00 00       	mov    $0x10d8,%esi
int write_random_string(char file_path[]) {
 e35:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
 e36:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
 e3b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e41:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 e43:	0f b7 06             	movzwl (%esi),%eax
 e46:	8d 75 e6             	lea    -0x1a(%ebp),%esi
 e49:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e4c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
 e4f:	90                   	nop
        int idx_new_char = random() % size_char_set;
 e50:	e8 0b fc ff ff       	call   a60 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e55:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
 e58:	89 c1                	mov    %eax,%ecx
 e5a:	f7 e3                	mul    %ebx
 e5c:	c1 ea 06             	shr    $0x6,%edx
 e5f:	6b d2 55             	imul   $0x55,%edx,%edx
 e62:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
 e64:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
 e6b:	ff 
 e6c:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e6f:	39 f7                	cmp    %esi,%edi
 e71:	75 dd                	jne    e50 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
 e73:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
 e78:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
 e7b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
 e7f:	8d 45 82             	lea    -0x7e(%ebp),%eax
 e82:	50                   	push   %eax
 e83:	ff 75 08             	push   0x8(%ebp)
 e86:	e8 25 fe ff ff       	call   cb0 <add_line>

    return 0;
}
 e8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e8e:	31 c0                	xor    %eax,%eax
 e90:	5b                   	pop    %ebx
 e91:	5e                   	pop    %esi
 e92:	5f                   	pop    %edi
 e93:	5d                   	pop    %ebp
 e94:	c3                   	ret    
 e95:	66 90                	xchg   %ax,%ax
 e97:	66 90                	xchg   %ax,%ax
 e99:	66 90                	xchg   %ax,%ax
 e9b:	66 90                	xchg   %ax,%ax
 e9d:	66 90                	xchg   %ax,%ax
 e9f:	90                   	nop

00000ea0 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
 ea0:	55                   	push   %ebp
 ea1:	89 e5                	mov    %esp,%ebp
 ea3:	56                   	push   %esi
 ea4:	8b 75 08             	mov    0x8(%ebp),%esi
 ea7:	53                   	push   %ebx
 ea8:	bb 64 00 00 00       	mov    $0x64,%ebx
 ead:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
 eb0:	83 ec 0c             	sub    $0xc,%esp
 eb3:	56                   	push   %esi
 eb4:	e8 67 ff ff ff       	call   e20 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
 eb9:	83 c4 10             	add    $0x10,%esp
 ebc:	83 eb 01             	sub    $0x1,%ebx
 ebf:	75 ef                	jne    eb0 <io_bound+0x10>
 ec1:	bb 32 00 00 00       	mov    $0x32,%ebx
 ec6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ecd:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
 ed0:	83 ec 0c             	sub    $0xc,%esp
 ed3:	56                   	push   %esi
 ed4:	e8 c7 fb ff ff       	call   aa0 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
 ed9:	83 c4 10             	add    $0x10,%esp
 edc:	83 eb 01             	sub    $0x1,%ebx
 edf:	75 ef                	jne    ed0 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
 ee1:	83 ec 0c             	sub    $0xc,%esp
 ee4:	56                   	push   %esi
 ee5:	e8 69 f4 ff ff       	call   353 <unlink>
 eea:	83 c4 10             	add    $0x10,%esp
 eed:	85 c0                	test   %eax,%eax
 eef:	75 07                	jne    ef8 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
 ef1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 ef4:	5b                   	pop    %ebx
 ef5:	5e                   	pop    %esi
 ef6:	5d                   	pop    %ebp
 ef7:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
 ef8:	83 ec 08             	sub    $0x8,%esp
 efb:	68 30 11 00 00       	push   $0x1130
 f00:	6a 01                	push   $0x1
 f02:	e8 59 f5 ff ff       	call   460 <printf>
 f07:	83 c4 10             	add    $0x10,%esp
 f0a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 f0d:	5b                   	pop    %ebx
 f0e:	5e                   	pop    %esi
 f0f:	5d                   	pop    %ebp
 f10:	c3                   	ret    
 f11:	66 90                	xchg   %ax,%ax
 f13:	66 90                	xchg   %ax,%ax
 f15:	66 90                	xchg   %ax,%ax
 f17:	66 90                	xchg   %ax,%ax
 f19:	66 90                	xchg   %ax,%ax
 f1b:	66 90                	xchg   %ax,%ax
 f1d:	66 90                	xchg   %ax,%ax
 f1f:	90                   	nop

00000f20 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
 f20:	55                   	push   %ebp
 f21:	89 e5                	mov    %esp,%ebp
 f23:	57                   	push   %edi
 f24:	56                   	push   %esi
 f25:	53                   	push   %ebx
 f26:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
 f2d:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 f33:	83 0c 24 00          	orl    $0x0,(%esp)
 f37:	39 c4                	cmp    %eax,%esp
 f39:	75 f2                	jne    f2d <cpu_bound+0xd>
 f3b:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
 f41:	be e8 03 00 00       	mov    $0x3e8,%esi
 f46:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
 f4c:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
 f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
 f58:	83 ec 04             	sub    $0x4,%esp
 f5b:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
 f61:	57                   	push   %edi
 f62:	50                   	push   %eax
 f63:	53                   	push   %ebx
 f64:	e8 e7 f9 ff ff       	call   950 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 f69:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 f6f:	89 04 24             	mov    %eax,(%esp)
 f72:	6a 00                	push   $0x0
 f74:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 f7a:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 f80:	53                   	push   %ebx
 f81:	e8 6a f8 ff ff       	call   7f0 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
 f86:	83 c4 20             	add    $0x20,%esp
 f89:	83 ee 01             	sub    $0x1,%esi
 f8c:	75 ca                	jne    f58 <cpu_bound+0x38>
    }
 f8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 f91:	5b                   	pop    %ebx
 f92:	5e                   	pop    %esi
 f93:	5f                   	pop    %edi
 f94:	5d                   	pop    %ebp
 f95:	c3                   	ret    
