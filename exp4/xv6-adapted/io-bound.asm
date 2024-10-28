
_io-bound: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	8b 75 08             	mov    0x8(%ebp),%esi
   7:	53                   	push   %ebx
   8:	bb 64 00 00 00       	mov    $0x64,%ebx
   d:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	56                   	push   %esi
  14:	e8 d7 0d 00 00       	call   df0 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
  19:	83 c4 10             	add    $0x10,%esp
  1c:	83 eb 01             	sub    $0x1,%ebx
  1f:	75 ef                	jne    10 <io_bound+0x10>
  21:	bb 32 00 00 00       	mov    $0x32,%ebx
  26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	56                   	push   %esi
  34:	e8 37 0a 00 00       	call   a70 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
  39:	83 c4 10             	add    $0x10,%esp
  3c:	83 eb 01             	sub    $0x1,%ebx
  3f:	75 ef                	jne    30 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	56                   	push   %esi
  45:	e8 d9 02 00 00       	call   323 <unlink>
  4a:	83 c4 10             	add    $0x10,%esp
  4d:	85 c0                	test   %eax,%eax
  4f:	75 07                	jne    58 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 e8 0e 00 00       	push   $0xee8
  60:	6a 01                	push   $0x1
  62:	e8 c9 03 00 00       	call   430 <printf>
  67:	83 c4 10             	add    $0x10,%esp
  6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  6d:	5b                   	pop    %ebx
  6e:	5e                   	pop    %esi
  6f:	5d                   	pop    %ebp
  70:	c3                   	ret    
  71:	66 90                	xchg   %ax,%ax
  73:	66 90                	xchg   %ax,%ax
  75:	66 90                	xchg   %ax,%ax
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  81:	31 c0                	xor    %eax,%eax
{
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a1:	89 c8                	mov    %ecx,%eax
  a3:	c9                   	leave  
  a4:	c3                   	ret    
  a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 17                	jne    d8 <strcmp+0x28>
  c1:	eb 3a                	jmp    fd <strcmp+0x4d>
  c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c7:	90                   	nop
  c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  cc:	83 c2 01             	add    $0x1,%edx
  cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  d2:	84 c0                	test   %al,%al
  d4:	74 1a                	je     f0 <strcmp+0x40>
    p++, q++;
  d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  d8:	0f b6 19             	movzbl (%ecx),%ebx
  db:	38 c3                	cmp    %al,%bl
  dd:	74 e9                	je     c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  df:	29 d8                	sub    %ebx,%eax
}
  e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e4:	c9                   	leave  
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  f4:	31 c0                	xor    %eax,%eax
  f6:	29 d8                	sub    %ebx,%eax
}
  f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fb:	c9                   	leave  
  fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  fd:	0f b6 19             	movzbl (%ecx),%ebx
 100:	31 c0                	xor    %eax,%eax
 102:	eb db                	jmp    df <strcmp+0x2f>
 104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 3a 00             	cmpb   $0x0,(%edx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 c0                	xor    %eax,%eax
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	83 c0 01             	add    $0x1,%eax
 123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 127:	89 c1                	mov    %eax,%ecx
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	89 c8                	mov    %ecx,%eax
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret    
 12f:	90                   	nop
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	8b 7d fc             	mov    -0x4(%ebp),%edi
 155:	89 d0                	mov    %edx,%eax
 157:	c9                   	leave  
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	75 12                	jne    183 <strchr+0x23>
 171:	eb 1d                	jmp    190 <strchr+0x30>
 173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 177:	90                   	nop
 178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 17c:	83 c0 01             	add    $0x1,%eax
 17f:	84 d2                	test   %dl,%dl
 181:	74 0d                	je     190 <strchr+0x30>
    if(*s == c)
 183:	38 d1                	cmp    %dl,%cl
 185:	75 f1                	jne    178 <strchr+0x18>
      return (char*)s;
  return 0;
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 190:	31 c0                	xor    %eax,%eax
}
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1a9:	31 db                	xor    %ebx,%ebx
{
 1ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ae:	eb 27                	jmp    1d7 <gets+0x37>
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	57                   	push   %edi
 1b6:	6a 00                	push   $0x0
 1b8:	e8 2e 01 00 00       	call   2eb <read>
    if(cc < 1)
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	85 c0                	test   %eax,%eax
 1c2:	7e 1d                	jle    1e1 <gets+0x41>
      break;
    buf[i++] = c;
 1c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c8:	8b 55 08             	mov    0x8(%ebp),%edx
 1cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cf:	3c 0a                	cmp    $0xa,%al
 1d1:	74 1d                	je     1f0 <gets+0x50>
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	74 19                	je     1f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1d7:	89 de                	mov    %ebx,%esi
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1df:	7c cf                	jl     1b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1eb:	5b                   	pop    %ebx
 1ec:	5e                   	pop    %esi
 1ed:	5f                   	pop    %edi
 1ee:	5d                   	pop    %ebp
 1ef:	c3                   	ret    
  buf[i] = '\0';
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	89 de                	mov    %ebx,%esi
 1f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fc:	5b                   	pop    %ebx
 1fd:	5e                   	pop    %esi
 1fe:	5f                   	pop    %edi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	push   0x8(%ebp)
 21d:	e8 f1 00 00 00       	call   313 <open>
  if(fd < 0)
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	ff 75 0c             	push   0xc(%ebp)
 22f:	89 c3                	mov    %eax,%ebx
 231:	50                   	push   %eax
 232:	e8 f4 00 00 00       	call   32b <fstat>
  close(fd);
 237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	e8 ba 00 00 00       	call   2fb <close>
  return r;
 241:	83 c4 10             	add    $0x10,%esp
}
 244:	8d 65 f8             	lea    -0x8(%ebp),%esp
 247:	89 f0                	mov    %esi,%eax
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 02             	movsbl (%edx),%eax
 26a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 26d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 298:	89 c8                	mov    %ecx,%eax
 29a:	c9                   	leave  
 29b:	c3                   	ret    
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
 2a7:	8b 55 08             	mov    0x8(%ebp),%edx
 2aa:	56                   	push   %esi
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 c0                	test   %eax,%eax
 2b0:	7e 13                	jle    2c5 <memmove+0x25>
 2b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b4:	89 d7                	mov    %edx,%edi
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    

000002cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cb:	b8 01 00 00 00       	mov    $0x1,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <exit>:
SYSCALL(exit)
 2d3:	b8 02 00 00 00       	mov    $0x2,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <wait>:
SYSCALL(wait)
 2db:	b8 03 00 00 00       	mov    $0x3,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <pipe>:
SYSCALL(pipe)
 2e3:	b8 04 00 00 00       	mov    $0x4,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <read>:
SYSCALL(read)
 2eb:	b8 05 00 00 00       	mov    $0x5,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <write>:
SYSCALL(write)
 2f3:	b8 10 00 00 00       	mov    $0x10,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <close>:
SYSCALL(close)
 2fb:	b8 15 00 00 00       	mov    $0x15,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <kill>:
SYSCALL(kill)
 303:	b8 06 00 00 00       	mov    $0x6,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <exec>:
SYSCALL(exec)
 30b:	b8 07 00 00 00       	mov    $0x7,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <open>:
SYSCALL(open)
 313:	b8 0f 00 00 00       	mov    $0xf,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mknod>:
SYSCALL(mknod)
 31b:	b8 11 00 00 00       	mov    $0x11,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <unlink>:
SYSCALL(unlink)
 323:	b8 12 00 00 00       	mov    $0x12,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <fstat>:
SYSCALL(fstat)
 32b:	b8 08 00 00 00       	mov    $0x8,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <link>:
SYSCALL(link)
 333:	b8 13 00 00 00       	mov    $0x13,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <mkdir>:
SYSCALL(mkdir)
 33b:	b8 14 00 00 00       	mov    $0x14,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <chdir>:
SYSCALL(chdir)
 343:	b8 09 00 00 00       	mov    $0x9,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <dup>:
SYSCALL(dup)
 34b:	b8 0a 00 00 00       	mov    $0xa,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <getpid>:
SYSCALL(getpid)
 353:	b8 0b 00 00 00       	mov    $0xb,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <sbrk>:
SYSCALL(sbrk)
 35b:	b8 0c 00 00 00       	mov    $0xc,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <sleep>:
SYSCALL(sleep)
 363:	b8 0d 00 00 00       	mov    $0xd,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <uptime>:
SYSCALL(uptime)
 36b:	b8 0e 00 00 00       	mov    $0xe,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    
 373:	66 90                	xchg   %ax,%ax
 375:	66 90                	xchg   %ax,%ax
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	83 ec 3c             	sub    $0x3c,%esp
 389:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 38c:	89 d1                	mov    %edx,%ecx
{
 38e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 391:	85 d2                	test   %edx,%edx
 393:	0f 89 7f 00 00 00    	jns    418 <printint+0x98>
 399:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39d:	74 79                	je     418 <printint+0x98>
    neg = 1;
 39f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3a8:	31 db                	xor    %ebx,%ebx
 3aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	89 cf                	mov    %ecx,%edi
 3b6:	f7 75 c4             	divl   -0x3c(%ebp)
 3b9:	0f b6 92 78 0f 00 00 	movzbl 0xf78(%edx),%edx
 3c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3c3:	89 d8                	mov    %ebx,%eax
 3c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3d1:	76 dd                	jbe    3b0 <printint+0x30>
  if(neg)
 3d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3d6:	85 c9                	test   %ecx,%ecx
 3d8:	74 0c                	je     3e6 <printint+0x66>
    buf[i++] = '-';
 3da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3ed:	eb 07                	jmp    3f6 <printint+0x76>
 3ef:	90                   	nop
    putc(fd, buf[i]);
 3f0:	0f b6 13             	movzbl (%ebx),%edx
 3f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3f6:	83 ec 04             	sub    $0x4,%esp
 3f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3fc:	6a 01                	push   $0x1
 3fe:	56                   	push   %esi
 3ff:	57                   	push   %edi
 400:	e8 ee fe ff ff       	call   2f3 <write>
  while(--i >= 0)
 405:	83 c4 10             	add    $0x10,%esp
 408:	39 de                	cmp    %ebx,%esi
 40a:	75 e4                	jne    3f0 <printint+0x70>
}
 40c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40f:	5b                   	pop    %ebx
 410:	5e                   	pop    %esi
 411:	5f                   	pop    %edi
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 418:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 41f:	eb 87                	jmp    3a8 <printint+0x28>
 421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 439:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 43c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 43f:	0f b6 13             	movzbl (%ebx),%edx
 442:	84 d2                	test   %dl,%dl
 444:	74 6a                	je     4b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 446:	8d 45 10             	lea    0x10(%ebp),%eax
 449:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 44c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 44f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 451:	89 45 d0             	mov    %eax,-0x30(%ebp)
 454:	eb 36                	jmp    48c <printf+0x5c>
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 463:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	74 15                	je     482 <printf+0x52>
  write(fd, &c, 1);
 46d:	83 ec 04             	sub    $0x4,%esp
 470:	88 55 e7             	mov    %dl,-0x19(%ebp)
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	56                   	push   %esi
 477:	e8 77 fe ff ff       	call   2f3 <write>
 47c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 47f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 482:	0f b6 13             	movzbl (%ebx),%edx
 485:	83 c3 01             	add    $0x1,%ebx
 488:	84 d2                	test   %dl,%dl
 48a:	74 24                	je     4b0 <printf+0x80>
    c = fmt[i] & 0xff;
 48c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 48f:	85 c9                	test   %ecx,%ecx
 491:	74 cd                	je     460 <printf+0x30>
      }
    } else if(state == '%'){
 493:	83 f9 25             	cmp    $0x25,%ecx
 496:	75 ea                	jne    482 <printf+0x52>
      if(c == 'd'){
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	0f 84 07 01 00 00    	je     5a8 <printf+0x178>
 4a1:	83 e8 63             	sub    $0x63,%eax
 4a4:	83 f8 15             	cmp    $0x15,%eax
 4a7:	77 17                	ja     4c0 <printf+0x90>
 4a9:	ff 24 85 20 0f 00 00 	jmp    *0xf20(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
 4b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop
  write(fd, &c, 1);
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4c6:	6a 01                	push   $0x1
 4c8:	57                   	push   %edi
 4c9:	56                   	push   %esi
 4ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ce:	e8 20 fe ff ff       	call   2f3 <write>
        putc(fd, c);
 4d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4d7:	83 c4 0c             	add    $0xc,%esp
 4da:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4dd:	6a 01                	push   $0x1
 4df:	57                   	push   %edi
 4e0:	56                   	push   %esi
 4e1:	e8 0d fe ff ff       	call   2f3 <write>
        putc(fd, c);
 4e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4e9:	31 c9                	xor    %ecx,%ecx
 4eb:	eb 95                	jmp    482 <printf+0x52>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f8:	6a 00                	push   $0x0
 4fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4fd:	8b 10                	mov    (%eax),%edx
 4ff:	89 f0                	mov    %esi,%eax
 501:	e8 7a fe ff ff       	call   380 <printint>
        ap++;
 506:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 50a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 50d:	31 c9                	xor    %ecx,%ecx
 50f:	e9 6e ff ff ff       	jmp    482 <printf+0x52>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 518:	8b 45 d0             	mov    -0x30(%ebp),%eax
 51b:	8b 10                	mov    (%eax),%edx
        ap++;
 51d:	83 c0 04             	add    $0x4,%eax
 520:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 523:	85 d2                	test   %edx,%edx
 525:	0f 84 8d 00 00 00    	je     5b8 <printf+0x188>
        while(*s != 0){
 52b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 52e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 530:	84 c0                	test   %al,%al
 532:	0f 84 4a ff ff ff    	je     482 <printf+0x52>
 538:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 53b:	89 d3                	mov    %edx,%ebx
 53d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
          s++;
 543:	83 c3 01             	add    $0x1,%ebx
 546:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 549:	6a 01                	push   $0x1
 54b:	57                   	push   %edi
 54c:	56                   	push   %esi
 54d:	e8 a1 fd ff ff       	call   2f3 <write>
        while(*s != 0){
 552:	0f b6 03             	movzbl (%ebx),%eax
 555:	83 c4 10             	add    $0x10,%esp
 558:	84 c0                	test   %al,%al
 55a:	75 e4                	jne    540 <printf+0x110>
      state = 0;
 55c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 55f:	31 c9                	xor    %ecx,%ecx
 561:	e9 1c ff ff ff       	jmp    482 <printf+0x52>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 570:	83 ec 0c             	sub    $0xc,%esp
 573:	b9 0a 00 00 00       	mov    $0xa,%ecx
 578:	6a 01                	push   $0x1
 57a:	e9 7b ff ff ff       	jmp    4fa <printf+0xca>
 57f:	90                   	nop
        putc(fd, *ap);
 580:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 583:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 586:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 588:	6a 01                	push   $0x1
 58a:	57                   	push   %edi
 58b:	56                   	push   %esi
        putc(fd, *ap);
 58c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 58f:	e8 5f fd ff ff       	call   2f3 <write>
        ap++;
 594:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 598:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59b:	31 c9                	xor    %ecx,%ecx
 59d:	e9 e0 fe ff ff       	jmp    482 <printf+0x52>
 5a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 5a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5ab:	83 ec 04             	sub    $0x4,%esp
 5ae:	e9 2a ff ff ff       	jmp    4dd <printf+0xad>
 5b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b7:	90                   	nop
          s = "(null)";
 5b8:	ba 17 0f 00 00       	mov    $0xf17,%edx
        while(*s != 0){
 5bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5c0:	b8 28 00 00 00       	mov    $0x28,%eax
 5c5:	89 d3                	mov    %edx,%ebx
 5c7:	e9 74 ff ff ff       	jmp    540 <printf+0x110>
 5cc:	66 90                	xchg   %ax,%ax
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	a1 00 15 00 00       	mov    0x1500,%eax
{
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	89 c2                	mov    %eax,%edx
 5ea:	8b 00                	mov    (%eax),%eax
 5ec:	39 ca                	cmp    %ecx,%edx
 5ee:	73 30                	jae    620 <free+0x50>
 5f0:	39 c1                	cmp    %eax,%ecx
 5f2:	72 04                	jb     5f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f4:	39 c2                	cmp    %eax,%edx
 5f6:	72 f0                	jb     5e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	39 f8                	cmp    %edi,%eax
 600:	74 30                	je     632 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 602:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 605:	8b 42 04             	mov    0x4(%edx),%eax
 608:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 60b:	39 f1                	cmp    %esi,%ecx
 60d:	74 3a                	je     649 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 60f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 611:	5b                   	pop    %ebx
  freep = p;
 612:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret    
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 620:	39 c2                	cmp    %eax,%edx
 622:	72 c4                	jb     5e8 <free+0x18>
 624:	39 c1                	cmp    %eax,%ecx
 626:	73 c0                	jae    5e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 628:	8b 73 fc             	mov    -0x4(%ebx),%esi
 62b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 62e:	39 f8                	cmp    %edi,%eax
 630:	75 d0                	jne    602 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 632:	03 70 04             	add    0x4(%eax),%esi
 635:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 638:	8b 02                	mov    (%edx),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 63f:	8b 42 04             	mov    0x4(%edx),%eax
 642:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 645:	39 f1                	cmp    %esi,%ecx
 647:	75 c6                	jne    60f <free+0x3f>
    p->s.size += bp->s.size;
 649:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 64c:	89 15 00 15 00 00    	mov    %edx,0x1500
    p->s.size += bp->s.size;
 652:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 655:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 658:	89 0a                	mov    %ecx,(%edx)
}
 65a:	5b                   	pop    %ebx
 65b:	5e                   	pop    %esi
 65c:	5f                   	pop    %edi
 65d:	5d                   	pop    %ebp
 65e:	c3                   	ret    
 65f:	90                   	nop

00000660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 66c:	8b 3d 00 15 00 00    	mov    0x1500,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 672:	8d 70 07             	lea    0x7(%eax),%esi
 675:	c1 ee 03             	shr    $0x3,%esi
 678:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 67b:	85 ff                	test   %edi,%edi
 67d:	0f 84 9d 00 00 00    	je     720 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 683:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 685:	8b 4a 04             	mov    0x4(%edx),%ecx
 688:	39 f1                	cmp    %esi,%ecx
 68a:	73 6a                	jae    6f6 <malloc+0x96>
 68c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 691:	39 de                	cmp    %ebx,%esi
 693:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 696:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 69d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6a0:	eb 17                	jmp    6b9 <malloc+0x59>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6aa:	8b 48 04             	mov    0x4(%eax),%ecx
 6ad:	39 f1                	cmp    %esi,%ecx
 6af:	73 4f                	jae    700 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6b1:	8b 3d 00 15 00 00    	mov    0x1500,%edi
 6b7:	89 c2                	mov    %eax,%edx
 6b9:	39 d7                	cmp    %edx,%edi
 6bb:	75 eb                	jne    6a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6bd:	83 ec 0c             	sub    $0xc,%esp
 6c0:	ff 75 e4             	push   -0x1c(%ebp)
 6c3:	e8 93 fc ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 6c8:	83 c4 10             	add    $0x10,%esp
 6cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ce:	74 1c                	je     6ec <malloc+0x8c>
  hp->s.size = nu;
 6d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	83 c0 08             	add    $0x8,%eax
 6d9:	50                   	push   %eax
 6da:	e8 f1 fe ff ff       	call   5d0 <free>
  return freep;
 6df:	8b 15 00 15 00 00    	mov    0x1500,%edx
      if((p = morecore(nunits)) == 0)
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	85 d2                	test   %edx,%edx
 6ea:	75 bc                	jne    6a8 <malloc+0x48>
        return 0;
  }
}
 6ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6ef:	31 c0                	xor    %eax,%eax
}
 6f1:	5b                   	pop    %ebx
 6f2:	5e                   	pop    %esi
 6f3:	5f                   	pop    %edi
 6f4:	5d                   	pop    %ebp
 6f5:	c3                   	ret    
    if(p->s.size >= nunits){
 6f6:	89 d0                	mov    %edx,%eax
 6f8:	89 fa                	mov    %edi,%edx
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 700:	39 ce                	cmp    %ecx,%esi
 702:	74 4c                	je     750 <malloc+0xf0>
        p->s.size -= nunits;
 704:	29 f1                	sub    %esi,%ecx
 706:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 70c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 70f:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 715:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 718:	83 c0 08             	add    $0x8,%eax
}
 71b:	5b                   	pop    %ebx
 71c:	5e                   	pop    %esi
 71d:	5f                   	pop    %edi
 71e:	5d                   	pop    %ebp
 71f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 720:	c7 05 00 15 00 00 04 	movl   $0x1504,0x1500
 727:	15 00 00 
    base.s.size = 0;
 72a:	bf 04 15 00 00       	mov    $0x1504,%edi
    base.s.ptr = freep = prevp = &base;
 72f:	c7 05 04 15 00 00 04 	movl   $0x1504,0x1504
 736:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 739:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 73b:	c7 05 08 15 00 00 00 	movl   $0x0,0x1508
 742:	00 00 00 
    if(p->s.size >= nunits){
 745:	e9 42 ff ff ff       	jmp    68c <malloc+0x2c>
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 750:	8b 08                	mov    (%eax),%ecx
 752:	89 0a                	mov    %ecx,(%edx)
 754:	eb b9                	jmp    70f <malloc+0xaf>
 756:	66 90                	xchg   %ax,%ax
 758:	66 90                	xchg   %ax,%ax
 75a:	66 90                	xchg   %ax,%ax
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 04             	sub    $0x4,%esp
 769:	8b 5d 10             	mov    0x10(%ebp),%ebx
 76c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 76f:	85 db                	test   %ebx,%ebx
 771:	7e 3d                	jle    7b0 <min_distance_vertex+0x50>
    int min_idx = 0;
 773:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 775:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 777:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 77c:	89 75 f0             	mov    %esi,-0x10(%ebp)
 77f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 780:	8b 14 87             	mov    (%edi,%eax,4),%edx
 783:	39 ca                	cmp    %ecx,%edx
 785:	7d 14                	jge    79b <min_distance_vertex+0x3b>
 787:	8b 75 0c             	mov    0xc(%ebp),%esi
 78a:	8b 34 86             	mov    (%esi,%eax,4),%esi
 78d:	85 f6                	test   %esi,%esi
 78f:	8b 75 f0             	mov    -0x10(%ebp),%esi
 792:	0f 44 ca             	cmove  %edx,%ecx
 795:	0f 44 f0             	cmove  %eax,%esi
 798:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 79b:	83 c0 01             	add    $0x1,%eax
 79e:	39 c3                	cmp    %eax,%ebx
 7a0:	75 de                	jne    780 <min_distance_vertex+0x20>
 7a2:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 7a5:	83 c4 04             	add    $0x4,%esp
 7a8:	5b                   	pop    %ebx
 7a9:	89 f0                	mov    %esi,%eax
 7ab:	5e                   	pop    %esi
 7ac:	5f                   	pop    %edi
 7ad:	5d                   	pop    %ebp
 7ae:	c3                   	ret    
 7af:	90                   	nop
 7b0:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 7b3:	31 f6                	xor    %esi,%esi
}
 7b5:	5b                   	pop    %ebx
 7b6:	89 f0                	mov    %esi,%eax
 7b8:	5e                   	pop    %esi
 7b9:	5f                   	pop    %edi
 7ba:	5d                   	pop    %ebp
 7bb:	c3                   	ret    
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007c0 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 7c9:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7cc:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 7cf:	89 e6                	mov    %esp,%esi
 7d1:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 7d8:	8d 41 0f             	lea    0xf(%ecx),%eax
 7db:	89 c2                	mov    %eax,%edx
 7dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 7e2:	29 c6                	sub    %eax,%esi
 7e4:	83 e2 f0             	and    $0xfffffff0,%edx
 7e7:	39 f4                	cmp    %esi,%esp
 7e9:	74 12                	je     7fd <dijkstra+0x3d>
 7eb:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 7f1:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 7f8:	00 
 7f9:	39 f4                	cmp    %esi,%esp
 7fb:	75 ee                	jne    7eb <dijkstra+0x2b>
 7fd:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 803:	29 d4                	sub    %edx,%esp
 805:	85 d2                	test   %edx,%edx
 807:	0f 85 ef 00 00 00    	jne    8fc <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 80d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 810:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 812:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 815:	8b 45 0c             	mov    0xc(%ebp),%eax
 818:	85 c0                	test   %eax,%eax
 81a:	0f 8e e6 00 00 00    	jle    906 <dijkstra+0x146>
 820:	89 d8                	mov    %ebx,%eax
 822:	89 fa                	mov    %edi,%edx
 824:	01 d9                	add    %ebx,%ecx
 826:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 830:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 836:	83 c0 04             	add    $0x4,%eax
 839:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 83c:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 843:	39 c8                	cmp    %ecx,%eax
 845:	75 e9                	jne    830 <dijkstra+0x70>
    dist[src] = 0;
 847:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 84d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 858:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 85a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 85f:	31 c0                	xor    %eax,%eax
 861:	eb 07                	jmp    86a <dijkstra+0xaa>
 863:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 867:	90                   	nop
 868:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 86a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 86d:	39 ca                	cmp    %ecx,%edx
 86f:	7d 0a                	jge    87b <dijkstra+0xbb>
 871:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 875:	0f 44 f0             	cmove  %eax,%esi
 878:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 87b:	8d 50 01             	lea    0x1(%eax),%edx
 87e:	39 55 0c             	cmp    %edx,0xc(%ebp)
 881:	75 e5                	jne    868 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 883:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 886:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 88d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 893:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 896:	75 18                	jne    8b0 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 898:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 89b:	8d 56 01             	lea    0x1(%esi),%edx
 89e:	39 c6                	cmp    %eax,%esi
 8a0:	74 52                	je     8f4 <dijkstra+0x134>
 8a2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8a5:	eb b1                	jmp    858 <dijkstra+0x98>
 8a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ae:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 8b0:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 8b6:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 8b9:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 8bc:	31 d2                	xor    %edx,%edx
 8be:	eb 02                	jmp    8c2 <dijkstra+0x102>
 8c0:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 8c2:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 8c5:	85 c9                	test   %ecx,%ecx
 8c7:	74 17                	je     8e0 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 8c9:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 8cc:	85 db                	test   %ebx,%ebx
 8ce:	75 10                	jne    8e0 <dijkstra+0x120>
 8d0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8d3:	03 0b                	add    (%ebx),%ecx
 8d5:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8d8:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 8db:	7e 03                	jle    8e0 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 8dd:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 8e0:	8d 4a 01             	lea    0x1(%edx),%ecx
 8e3:	39 c2                	cmp    %eax,%edx
 8e5:	75 d9                	jne    8c0 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 8e7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8ea:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8ed:	8d 56 01             	lea    0x1(%esi),%edx
 8f0:	39 c6                	cmp    %eax,%esi
 8f2:	75 ae                	jne    8a2 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 8f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8f7:	5b                   	pop    %ebx
 8f8:	5e                   	pop    %esi
 8f9:	5f                   	pop    %edi
 8fa:	5d                   	pop    %ebp
 8fb:	c3                   	ret    
    int visited[num_vertices];
 8fc:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 901:	e9 07 ff ff ff       	jmp    80d <dijkstra+0x4d>
    dist[src] = 0;
 906:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 90c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 90f:	5b                   	pop    %ebx
 910:	5e                   	pop    %esi
 911:	5f                   	pop    %edi
 912:	5d                   	pop    %ebp
 913:	c3                   	ret    
 914:	66 90                	xchg   %ax,%ax
 916:	66 90                	xchg   %ax,%ax
 918:	66 90                	xchg   %ax,%ax
 91a:	66 90                	xchg   %ax,%ax
 91c:	66 90                	xchg   %ax,%ax
 91e:	66 90                	xchg   %ax,%ax

00000920 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 924:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 929:	56                   	push   %esi
 92a:	53                   	push   %ebx
 92b:	83 ec 0c             	sub    $0xc,%esp
 92e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 931:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 934:	e8 f7 00 00 00       	call   a30 <random>
 939:	89 c1                	mov    %eax,%ecx
 93b:	f7 ef                	imul   %edi
 93d:	89 c8                	mov    %ecx,%eax
 93f:	c1 f8 1f             	sar    $0x1f,%eax
 942:	c1 fa 06             	sar    $0x6,%edx
 945:	29 c2                	sub    %eax,%edx
 947:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 94d:	29 c1                	sub    %eax,%ecx
 94f:	83 f9 63             	cmp    $0x63,%ecx
 952:	89 ca                	mov    %ecx,%edx
 954:	8d 41 64             	lea    0x64(%ecx),%eax
 957:	0f 4e d0             	cmovle %eax,%edx
 95a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 95c:	e8 cf 00 00 00       	call   a30 <random>
 961:	89 c1                	mov    %eax,%ecx
 963:	f7 ef                	imul   %edi
 965:	89 c8                	mov    %ecx,%eax
 967:	c1 f8 1f             	sar    $0x1f,%eax
 96a:	c1 fa 07             	sar    $0x7,%edx
 96d:	29 c2                	sub    %eax,%edx
 96f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 975:	29 c1                	sub    %eax,%ecx
 977:	8d 41 32             	lea    0x32(%ecx),%eax
 97a:	89 ca                	mov    %ecx,%edx
 97c:	83 f9 31             	cmp    $0x31,%ecx
 97f:	0f 4e d0             	cmovle %eax,%edx
 982:	8b 45 10             	mov    0x10(%ebp),%eax
 985:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 987:	8b 13                	mov    (%ebx),%edx
 989:	85 d2                	test   %edx,%edx
 98b:	7e 38                	jle    9c5 <gen_random_digraph+0xa5>
 98d:	89 f1                	mov    %esi,%ecx
 98f:	31 ff                	xor    %edi,%edi
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 998:	31 c0                	xor    %eax,%eax
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 9a0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 9a7:	8b 13                	mov    (%ebx),%edx
 9a9:	83 c0 01             	add    $0x1,%eax
 9ac:	39 c2                	cmp    %eax,%edx
 9ae:	7f f0                	jg     9a0 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 9b0:	83 c7 01             	add    $0x1,%edi
 9b3:	81 c1 20 03 00 00    	add    $0x320,%ecx
 9b9:	39 fa                	cmp    %edi,%edx
 9bb:	7f db                	jg     998 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 9bd:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 9c3:	7f 22                	jg     9e7 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 9c5:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 9cb:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 9d2:	8d 04 86             	lea    (%esi,%eax,4),%eax
 9d5:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 9d8:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 9de:	05 20 03 00 00       	add    $0x320,%eax
 9e3:	39 d0                	cmp    %edx,%eax
 9e5:	75 f1                	jne    9d8 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 9e7:	8b 45 10             	mov    0x10(%ebp),%eax
 9ea:	31 c9                	xor    %ecx,%ecx
 9ec:	8b 00                	mov    (%eax),%eax
 9ee:	85 c0                	test   %eax,%eax
 9f0:	7e 31                	jle    a23 <gen_random_digraph+0x103>
 9f2:	89 75 08             	mov    %esi,0x8(%ebp)
 9f5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 9f7:	e8 34 00 00 00       	call   a30 <random>
    for (int i = 0; i < *num_edges; i++) {
 9fc:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 9ff:	99                   	cltd   
 a00:	f7 3b                	idivl  (%ebx)
 a02:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 a04:	e8 27 00 00 00       	call   a30 <random>
        graph[new_edge_u][new_edge_v] = 1;
 a09:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 a0f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 a12:	99                   	cltd   
 a13:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 a15:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 a18:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 a1f:	39 30                	cmp    %esi,(%eax)
 a21:	7f d4                	jg     9f7 <gen_random_digraph+0xd7>
    }
}
 a23:	83 c4 0c             	add    $0xc,%esp
 a26:	5b                   	pop    %ebx
 a27:	5e                   	pop    %esi
 a28:	5f                   	pop    %edi
 a29:	5d                   	pop    %ebp
 a2a:	c3                   	ret    
 a2b:	66 90                	xchg   %ax,%ax
 a2d:	66 90                	xchg   %ax,%ax
 a2f:	90                   	nop

00000a30 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 a30:	69 0d fc 14 00 00 0d 	imul   $0x19660d,0x14fc,%ecx
 a37:	66 19 00 
 a3a:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 a3f:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 a45:	89 c8                	mov    %ecx,%eax
 a47:	f7 ea                	imul   %edx
 a49:	89 d0                	mov    %edx,%eax
 a4b:	89 ca                	mov    %ecx,%edx
 a4d:	c1 fa 1f             	sar    $0x1f,%edx
 a50:	c1 f8 1d             	sar    $0x1d,%eax
 a53:	29 d0                	sub    %edx,%eax
 a55:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 a5b:	89 c8                	mov    %ecx,%eax
 a5d:	29 d0                	sub    %edx,%eax
 a5f:	a3 fc 14 00 00       	mov    %eax,0x14fc
    return seed;
 a64:	c3                   	ret    
 a65:	66 90                	xchg   %ax,%ax
 a67:	66 90                	xchg   %ax,%ax
 a69:	66 90                	xchg   %ax,%ax
 a6b:	66 90                	xchg   %ax,%ax
 a6d:	66 90                	xchg   %ax,%ax
 a6f:	90                   	nop

00000a70 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	57                   	push   %edi
 a74:	56                   	push   %esi
 a75:	53                   	push   %ebx
 a76:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 a7c:	83 0c 24 00          	orl    $0x0,(%esp)
 a80:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 a86:	83 0c 24 00          	orl    $0x0,(%esp)
 a8a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
 a90:	6a 00                	push   $0x0
 a92:	ff 75 08             	push   0x8(%ebp)
 a95:	e8 79 f8 ff ff       	call   313 <open>
    if (fp < 0 ) {
 a9a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
 a9d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
 aa3:	85 c0                	test   %eax,%eax
 aa5:	0f 88 99 01 00 00    	js     c44 <permute_line+0x1d4>
 aab:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 ab1:	31 db                	xor    %ebx,%ebx
 ab3:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
 ab9:	89 f7                	mov    %esi,%edi
 abb:	89 de                	mov    %ebx,%esi
 abd:	89 c3                	mov    %eax,%ebx
 abf:	eb 12                	jmp    ad3 <permute_line+0x63>
 ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 ac8:	83 c7 66             	add    $0x66,%edi
 acb:	83 fe 64             	cmp    $0x64,%esi
 ace:	74 16                	je     ae6 <permute_line+0x76>
        line_idx++;
 ad0:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 ad3:	83 ec 04             	sub    $0x4,%esp
 ad6:	6a 66                	push   $0x66
 ad8:	57                   	push   %edi
 ad9:	53                   	push   %ebx
 ada:	e8 0c f8 ff ff       	call   2eb <read>
 adf:	83 c4 10             	add    $0x10,%esp
 ae2:	85 c0                	test   %eax,%eax
 ae4:	7f e2                	jg     ac8 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
 ae6:	89 f3                	mov    %esi,%ebx
 ae8:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
 aee:	e8 3d ff ff ff       	call   a30 <random>
 af3:	89 c1                	mov    %eax,%ecx
 af5:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 afa:	f7 e9                	imul   %ecx
 afc:	89 c8                	mov    %ecx,%eax
 afe:	c1 f8 1f             	sar    $0x1f,%eax
 b01:	c1 fa 05             	sar    $0x5,%edx
 b04:	29 c2                	sub    %eax,%edx
 b06:	6b c2 64             	imul   $0x64,%edx,%eax
 b09:	29 c1                	sub    %eax,%ecx
 b0b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
 b0d:	e8 1e ff ff ff       	call   a30 <random>
 b12:	89 c1                	mov    %eax,%ecx
 b14:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 b19:	f7 e9                	imul   %ecx
 b1b:	89 c8                	mov    %ecx,%eax
 b1d:	c1 f8 1f             	sar    $0x1f,%eax
 b20:	c1 fa 05             	sar    $0x5,%edx
 b23:	29 c2                	sub    %eax,%edx
 b25:	6b c2 64             	imul   $0x64,%edx,%eax
 b28:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
 b2a:	39 cf                	cmp    %ecx,%edi
 b2c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
 b32:	74 5f                	je     b93 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
 b34:	6b c7 66             	imul   $0x66,%edi,%eax
 b37:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
 b3d:	83 ec 08             	sub    $0x8,%esp
 b40:	01 c1                	add    %eax,%ecx
 b42:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b48:	51                   	push   %ecx
 b49:	50                   	push   %eax
 b4a:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
 b50:	e8 2b f5 ff ff       	call   80 <strcpy>
        strcpy(lines[line1], lines[line2]);
 b55:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 b5b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 b61:	6b d2 66             	imul   $0x66,%edx,%edx
 b64:	01 c2                	add    %eax,%edx
 b66:	58                   	pop    %eax
 b67:	59                   	pop    %ecx
 b68:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
 b6e:	52                   	push   %edx
 b6f:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 b75:	51                   	push   %ecx
 b76:	e8 05 f5 ff ff       	call   80 <strcpy>
        strcpy(lines[line2], temp);
 b7b:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 b81:	5f                   	pop    %edi
 b82:	58                   	pop    %eax
 b83:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b89:	50                   	push   %eax
 b8a:	52                   	push   %edx
 b8b:	e8 f0 f4 ff ff       	call   80 <strcpy>
 b90:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 b93:	83 ec 0c             	sub    $0xc,%esp
 b96:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 b9c:	e8 5a f7 ff ff       	call   2fb <close>
    fp = open(file_path, O_RDWR);
 ba1:	58                   	pop    %eax
 ba2:	5a                   	pop    %edx
 ba3:	6a 02                	push   $0x2
 ba5:	ff 75 08             	push   0x8(%ebp)
 ba8:	e8 66 f7 ff ff       	call   313 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 bad:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 bae:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 bb0:	58                   	pop    %eax
 bb1:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 bb7:	50                   	push   %eax
 bb8:	57                   	push   %edi
 bb9:	e8 6d f7 ff ff       	call   32b <fstat>
    char *buffer = malloc(0);
 bbe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 bc5:	e8 96 fa ff ff       	call   660 <malloc>
    memset(buffer, 0, 0);  
 bca:	83 c4 0c             	add    $0xc,%esp
 bcd:	6a 00                	push   $0x0
 bcf:	6a 00                	push   $0x0
 bd1:	50                   	push   %eax
 bd2:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 bd8:	e8 63 f5 ff ff       	call   140 <memset>
    write(fp, buffer, 0);
 bdd:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 be3:	83 c4 0c             	add    $0xc,%esp
 be6:	6a 00                	push   $0x0
 be8:	52                   	push   %edx
 be9:	57                   	push   %edi
 bea:	e8 04 f7 ff ff       	call   2f3 <write>
    free(buffer);
 bef:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 bf5:	89 14 24             	mov    %edx,(%esp)
 bf8:	e8 d3 f9 ff ff       	call   5d0 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 bfd:	83 c4 10             	add    $0x10,%esp
 c00:	85 ff                	test   %edi,%edi
 c02:	78 59                	js     c5d <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 c04:	85 db                	test   %ebx,%ebx
 c06:	74 26                	je     c2e <permute_line+0x1be>
 c08:	6b db 66             	imul   $0x66,%ebx,%ebx
 c0b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 c11:	01 c3                	add    %eax,%ebx
 c13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c17:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 c18:	83 ec 04             	sub    $0x4,%esp
 c1b:	6a 66                	push   $0x66
 c1d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 c1e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 c21:	57                   	push   %edi
 c22:	e8 cc f6 ff ff       	call   2f3 <write>
    for (int i = 0; i < line_idx; i++) {
 c27:	83 c4 10             	add    $0x10,%esp
 c2a:	39 de                	cmp    %ebx,%esi
 c2c:	75 ea                	jne    c18 <permute_line+0x1a8>
    }

    close(fp);
 c2e:	83 ec 0c             	sub    $0xc,%esp
 c31:	57                   	push   %edi
 c32:	e8 c4 f6 ff ff       	call   2fb <close>
    return 0;
 c37:	83 c4 10             	add    $0x10,%esp
 c3a:	31 c0                	xor    %eax,%eax
 c3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 c3f:	5b                   	pop    %ebx
 c40:	5e                   	pop    %esi
 c41:	5f                   	pop    %edi
 c42:	5d                   	pop    %ebp
 c43:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 c44:	83 ec 08             	sub    $0x8,%esp
 c47:	68 8c 0f 00 00       	push   $0xf8c
 c4c:	6a 01                	push   $0x1
 c4e:	e8 dd f7 ff ff       	call   430 <printf>
        return -1;
 c53:	83 c4 10             	add    $0x10,%esp
 c56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c5b:	eb df                	jmp    c3c <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 c5d:	83 ec 08             	sub    $0x8,%esp
 c60:	68 d4 0f 00 00       	push   $0xfd4
 c65:	6a 01                	push   $0x1
 c67:	e8 c4 f7 ff ff       	call   430 <printf>
        return -1;
 c6c:	83 c4 10             	add    $0x10,%esp
 c6f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c74:	eb c6                	jmp    c3c <permute_line+0x1cc>
 c76:	66 90                	xchg   %ax,%ax
 c78:	66 90                	xchg   %ax,%ax
 c7a:	66 90                	xchg   %ax,%ax
 c7c:	66 90                	xchg   %ax,%ax
 c7e:	66 90                	xchg   %ax,%ax

00000c80 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
 c80:	55                   	push   %ebp
 c81:	89 e5                	mov    %esp,%ebp
 c83:	57                   	push   %edi
 c84:	56                   	push   %esi
 c85:	53                   	push   %ebx
 c86:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 c8c:	83 0c 24 00          	orl    $0x0,(%esp)
 c90:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 c96:	83 0c 24 00          	orl    $0x0,(%esp)
 c9a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
 ca0:	6a 00                	push   $0x0
 ca2:	ff 75 08             	push   0x8(%ebp)
 ca5:	e8 69 f6 ff ff       	call   313 <open>
    if (fp < 0) {
 caa:	83 c4 10             	add    $0x10,%esp
 cad:	85 c0                	test   %eax,%eax
 caf:	0f 88 b1 00 00 00    	js     d66 <add_line+0xe6>
 cb5:	89 c3                	mov    %eax,%ebx
 cb7:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 cbd:	31 f6                	xor    %esi,%esi
 cbf:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
 cc5:	89 c7                	mov    %eax,%edi
 cc7:	eb 12                	jmp    cdb <add_line+0x5b>
 cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 cd0:	83 c7 66             	add    $0x66,%edi
 cd3:	83 fe 64             	cmp    $0x64,%esi
 cd6:	74 1c                	je     cf4 <add_line+0x74>
        line_idx++;
 cd8:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 cdb:	83 ec 04             	sub    $0x4,%esp
 cde:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
 ce4:	6a 66                	push   $0x66
 ce6:	57                   	push   %edi
 ce7:	53                   	push   %ebx
 ce8:	e8 fe f5 ff ff       	call   2eb <read>
 ced:	83 c4 10             	add    $0x10,%esp
 cf0:	85 c0                	test   %eax,%eax
 cf2:	7f dc                	jg     cd0 <add_line+0x50>
    }
    close(fp); 
 cf4:	83 ec 0c             	sub    $0xc,%esp
 cf7:	53                   	push   %ebx
 cf8:	e8 fe f5 ff ff       	call   2fb <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 cfd:	58                   	pop    %eax
 cfe:	5a                   	pop    %edx
 cff:	ff 75 0c             	push   0xc(%ebp)
 d02:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 d08:	e8 73 f3 ff ff       	call   80 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 d0d:	59                   	pop    %ecx
 d0e:	5b                   	pop    %ebx
 d0f:	6a 01                	push   $0x1
 d11:	ff 75 08             	push   0x8(%ebp)
 d14:	e8 fa f5 ff ff       	call   313 <open>
    if (fp < 0) {
 d19:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
 d1c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
 d1e:	85 c0                	test   %eax,%eax
 d20:	78 5d                	js     d7f <add_line+0xff>
 d22:	6b ce 66             	imul   $0x66,%esi,%ecx
 d25:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
 d2b:	8d 78 66             	lea    0x66(%eax),%edi
 d2e:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
 d31:	eb 08                	jmp    d3b <add_line+0xbb>
 d33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d37:	90                   	nop
 d38:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
 d3b:	83 ec 04             	sub    $0x4,%esp
 d3e:	6a 66                	push   $0x66
 d40:	50                   	push   %eax
 d41:	53                   	push   %ebx
 d42:	e8 ac f5 ff ff       	call   2f3 <write>
    for (int i = 0; i < line_idx; i++) {
 d47:	89 f8                	mov    %edi,%eax
 d49:	83 c4 10             	add    $0x10,%esp
 d4c:	39 f7                	cmp    %esi,%edi
 d4e:	75 e8                	jne    d38 <add_line+0xb8>
    }

    close(fp);
 d50:	83 ec 0c             	sub    $0xc,%esp
 d53:	53                   	push   %ebx
 d54:	e8 a2 f5 ff ff       	call   2fb <close>
    return 0;
 d59:	83 c4 10             	add    $0x10,%esp
 d5c:	31 c0                	xor    %eax,%eax
}
 d5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 d61:	5b                   	pop    %ebx
 d62:	5e                   	pop    %esi
 d63:	5f                   	pop    %edi
 d64:	5d                   	pop    %ebp
 d65:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
 d66:	83 ec 08             	sub    $0x8,%esp
 d69:	68 10 10 00 00       	push   $0x1010
 d6e:	6a 01                	push   $0x1
 d70:	e8 bb f6 ff ff       	call   430 <printf>
        return -1;
 d75:	83 c4 10             	add    $0x10,%esp
 d78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d7d:	eb df                	jmp    d5e <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 d7f:	83 ec 08             	sub    $0x8,%esp
 d82:	68 34 10 00 00       	push   $0x1034
 d87:	6a 01                	push   $0x1
 d89:	e8 a2 f6 ff ff       	call   430 <printf>
        return -1;
 d8e:	83 c4 10             	add    $0x10,%esp
 d91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d96:	eb c6                	jmp    d5e <add_line+0xde>
 d98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d9f:	90                   	nop

00000da0 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
 da0:	55                   	push   %ebp
 da1:	89 e5                	mov    %esp,%ebp
 da3:	57                   	push   %edi
 da4:	56                   	push   %esi
 da5:	53                   	push   %ebx
 da6:	83 ec 0c             	sub    $0xc,%esp
 da9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 dac:	8d 73 64             	lea    0x64(%ebx),%esi
 daf:	89 f7                	mov    %esi,%edi
 db1:	8b 75 0c             	mov    0xc(%ebp),%esi
 db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
 db8:	e8 73 fc ff ff       	call   a30 <random>
 dbd:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 dbf:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
 dc2:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
 dc5:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 dc9:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 dcc:	39 fb                	cmp    %edi,%ebx
 dce:	75 e8                	jne    db8 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
 dd0:	8b 45 08             	mov    0x8(%ebp),%eax
 dd3:	ba 0a 00 00 00       	mov    $0xa,%edx
 dd8:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
 ddc:	83 c4 0c             	add    $0xc,%esp
 ddf:	5b                   	pop    %ebx
 de0:	5e                   	pop    %esi
 de1:	5f                   	pop    %edi
 de2:	5d                   	pop    %ebp
 de3:	c3                   	ret    
 de4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 deb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 def:	90                   	nop

00000df0 <write_random_string>:

int write_random_string(char file_path[]) {
 df0:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 df1:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
 df6:	89 e5                	mov    %esp,%ebp
 df8:	57                   	push   %edi
 df9:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 dfa:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
 e00:	be 58 10 00 00       	mov    $0x1058,%esi
int write_random_string(char file_path[]) {
 e05:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
 e06:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
 e0b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e11:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 e13:	0f b7 06             	movzwl (%esi),%eax
 e16:	8d 75 e6             	lea    -0x1a(%ebp),%esi
 e19:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e1c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
 e1f:	90                   	nop
        int idx_new_char = random() % size_char_set;
 e20:	e8 0b fc ff ff       	call   a30 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e25:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
 e28:	89 c1                	mov    %eax,%ecx
 e2a:	f7 e3                	mul    %ebx
 e2c:	c1 ea 06             	shr    $0x6,%edx
 e2f:	6b d2 55             	imul   $0x55,%edx,%edx
 e32:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
 e34:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
 e3b:	ff 
 e3c:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e3f:	39 f7                	cmp    %esi,%edi
 e41:	75 dd                	jne    e20 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
 e43:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
 e48:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
 e4b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
 e4f:	8d 45 82             	lea    -0x7e(%ebp),%eax
 e52:	50                   	push   %eax
 e53:	ff 75 08             	push   0x8(%ebp)
 e56:	e8 25 fe ff ff       	call   c80 <add_line>

    return 0;
}
 e5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e5e:	31 c0                	xor    %eax,%eax
 e60:	5b                   	pop    %ebx
 e61:	5e                   	pop    %esi
 e62:	5f                   	pop    %edi
 e63:	5d                   	pop    %ebp
 e64:	c3                   	ret    
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
 eb4:	e8 67 fa ff ff       	call   920 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 eb9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 ebf:	89 04 24             	mov    %eax,(%esp)
 ec2:	6a 00                	push   $0x0
 ec4:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 eca:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 ed0:	53                   	push   %ebx
 ed1:	e8 ea f8 ff ff       	call   7c0 <dijkstra>
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
