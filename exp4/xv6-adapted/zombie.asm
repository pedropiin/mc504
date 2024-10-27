
_zombie: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 65 02 00 00       	call   27b <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 ef 02 00 00       	call   313 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 57 02 00 00       	call   283 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 c0                	xor    %eax,%eax
{
  33:	89 e5                	mov    %esp,%ebp
  35:	53                   	push   %ebx
  36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  51:	89 c8                	mov    %ecx,%eax
  53:	c9                   	leave  
  54:	c3                   	ret    
  55:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	75 17                	jne    88 <strcmp+0x28>
  71:	eb 3a                	jmp    ad <strcmp+0x4d>
  73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  77:	90                   	nop
  78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  7c:	83 c2 01             	add    $0x1,%edx
  7f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  82:	84 c0                	test   %al,%al
  84:	74 1a                	je     a0 <strcmp+0x40>
    p++, q++;
  86:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  88:	0f b6 19             	movzbl (%ecx),%ebx
  8b:	38 c3                	cmp    %al,%bl
  8d:	74 e9                	je     78 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  8f:	29 d8                	sub    %ebx,%eax
}
  91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  94:	c9                   	leave  
  95:	c3                   	ret    
  96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  a4:	31 c0                	xor    %eax,%eax
  a6:	29 d8                	sub    %ebx,%eax
}
  a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ab:	c9                   	leave  
  ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ad:	0f b6 19             	movzbl (%ecx),%ebx
  b0:	31 c0                	xor    %eax,%eax
  b2:	eb db                	jmp    8f <strcmp+0x2f>
  b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bf:	90                   	nop

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c0 01             	add    $0x1,%eax
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	89 c1                	mov    %eax,%ecx
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	89 c8                	mov    %ecx,%eax
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld    
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	8b 7d fc             	mov    -0x4(%ebp),%edi
 105:	89 d0                	mov    %edx,%eax
 107:	c9                   	leave  
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 12                	jne    133 <strchr+0x23>
 121:	eb 1d                	jmp    140 <strchr+0x30>
 123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 127:	90                   	nop
 128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 12c:	83 c0 01             	add    $0x1,%eax
 12f:	84 d2                	test   %dl,%dl
 131:	74 0d                	je     140 <strchr+0x30>
    if(*s == c)
 133:	38 d1                	cmp    %dl,%cl
 135:	75 f1                	jne    128 <strchr+0x18>
      return (char*)s;
  return 0;
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 140:	31 c0                	xor    %eax,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 155:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 159:	31 db                	xor    %ebx,%ebx
{
 15b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 15e:	eb 27                	jmp    187 <gets+0x37>
    cc = read(0, &c, 1);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	6a 01                	push   $0x1
 165:	57                   	push   %edi
 166:	6a 00                	push   $0x0
 168:	e8 2e 01 00 00       	call   29b <read>
    if(cc < 1)
 16d:	83 c4 10             	add    $0x10,%esp
 170:	85 c0                	test   %eax,%eax
 172:	7e 1d                	jle    191 <gets+0x41>
      break;
    buf[i++] = c;
 174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 178:	8b 55 08             	mov    0x8(%ebp),%edx
 17b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 17f:	3c 0a                	cmp    $0xa,%al
 181:	74 1d                	je     1a0 <gets+0x50>
 183:	3c 0d                	cmp    $0xd,%al
 185:	74 19                	je     1a0 <gets+0x50>
  for(i=0; i+1 < max; ){
 187:	89 de                	mov    %ebx,%esi
 189:	83 c3 01             	add    $0x1,%ebx
 18c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 18f:	7c cf                	jl     160 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 191:	8b 45 08             	mov    0x8(%ebp),%eax
 194:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 198:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19b:	5b                   	pop    %ebx
 19c:	5e                   	pop    %esi
 19d:	5f                   	pop    %edi
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    
  buf[i] = '\0';
 1a0:	8b 45 08             	mov    0x8(%ebp),%eax
 1a3:	89 de                	mov    %ebx,%esi
 1a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ac:	5b                   	pop    %ebx
 1ad:	5e                   	pop    %esi
 1ae:	5f                   	pop    %edi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	push   0x8(%ebp)
 1cd:	e8 f1 00 00 00       	call   2c3 <open>
  if(fd < 0)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	push   0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 f4 00 00 00       	call   2db <fstat>
  close(fd);
 1e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ea:	89 c6                	mov    %eax,%esi
  close(fd);
 1ec:	e8 ba 00 00 00       	call   2ab <close>
  return r;
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	0f be 02             	movsbl (%edx),%eax
 21a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 21d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 220:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 225:	77 1e                	ja     245 <atoi+0x35>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 230:	83 c2 01             	add    $0x1,%edx
 233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 23a:	0f be 02             	movsbl (%edx),%eax
 23d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 248:	89 c8                	mov    %ecx,%eax
 24a:	c9                   	leave  
 24b:	c3                   	ret    
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 45 10             	mov    0x10(%ebp),%eax
 257:	8b 55 08             	mov    0x8(%ebp),%edx
 25a:	56                   	push   %esi
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 c0                	test   %eax,%eax
 260:	7e 13                	jle    275 <memmove+0x25>
 262:	01 d0                	add    %edx,%eax
  dst = vdst;
 264:	89 d7                	mov    %edx,%edi
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 271:	39 f8                	cmp    %edi,%eax
 273:	75 fb                	jne    270 <memmove+0x20>
  return vdst;
}
 275:	5e                   	pop    %esi
 276:	89 d0                	mov    %edx,%eax
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    
 323:	66 90                	xchg   %ax,%ax
 325:	66 90                	xchg   %ax,%ax
 327:	66 90                	xchg   %ax,%ax
 329:	66 90                	xchg   %ax,%ax
 32b:	66 90                	xchg   %ax,%ax
 32d:	66 90                	xchg   %ax,%ax
 32f:	90                   	nop

00000330 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	83 ec 3c             	sub    $0x3c,%esp
 339:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 33c:	89 d1                	mov    %edx,%ecx
{
 33e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 341:	85 d2                	test   %edx,%edx
 343:	0f 89 7f 00 00 00    	jns    3c8 <printint+0x98>
 349:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 34d:	74 79                	je     3c8 <printint+0x98>
    neg = 1;
 34f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 356:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 358:	31 db                	xor    %ebx,%ebx
 35a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 360:	89 c8                	mov    %ecx,%eax
 362:	31 d2                	xor    %edx,%edx
 364:	89 cf                	mov    %ecx,%edi
 366:	f7 75 c4             	divl   -0x3c(%ebp)
 369:	0f b6 92 78 0a 00 00 	movzbl 0xa78(%edx),%edx
 370:	89 45 c0             	mov    %eax,-0x40(%ebp)
 373:	89 d8                	mov    %ebx,%eax
 375:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 378:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 37b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 37e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 381:	76 dd                	jbe    360 <printint+0x30>
  if(neg)
 383:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 386:	85 c9                	test   %ecx,%ecx
 388:	74 0c                	je     396 <printint+0x66>
    buf[i++] = '-';
 38a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 38f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 391:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 396:	8b 7d b8             	mov    -0x48(%ebp),%edi
 399:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 39d:	eb 07                	jmp    3a6 <printint+0x76>
 39f:	90                   	nop
    putc(fd, buf[i]);
 3a0:	0f b6 13             	movzbl (%ebx),%edx
 3a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3a6:	83 ec 04             	sub    $0x4,%esp
 3a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ac:	6a 01                	push   $0x1
 3ae:	56                   	push   %esi
 3af:	57                   	push   %edi
 3b0:	e8 ee fe ff ff       	call   2a3 <write>
  while(--i >= 0)
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	39 de                	cmp    %ebx,%esi
 3ba:	75 e4                	jne    3a0 <printint+0x70>
}
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3cf:	eb 87                	jmp    358 <printint+0x28>
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 3ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 3ef:	0f b6 13             	movzbl (%ebx),%edx
 3f2:	84 d2                	test   %dl,%dl
 3f4:	74 6a                	je     460 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 3f6:	8d 45 10             	lea    0x10(%ebp),%eax
 3f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 3fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 3ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 401:	89 45 d0             	mov    %eax,-0x30(%ebp)
 404:	eb 36                	jmp    43c <printf+0x5c>
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 413:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 418:	83 f8 25             	cmp    $0x25,%eax
 41b:	74 15                	je     432 <printf+0x52>
  write(fd, &c, 1);
 41d:	83 ec 04             	sub    $0x4,%esp
 420:	88 55 e7             	mov    %dl,-0x19(%ebp)
 423:	6a 01                	push   $0x1
 425:	57                   	push   %edi
 426:	56                   	push   %esi
 427:	e8 77 fe ff ff       	call   2a3 <write>
 42c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 42f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 432:	0f b6 13             	movzbl (%ebx),%edx
 435:	83 c3 01             	add    $0x1,%ebx
 438:	84 d2                	test   %dl,%dl
 43a:	74 24                	je     460 <printf+0x80>
    c = fmt[i] & 0xff;
 43c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 43f:	85 c9                	test   %ecx,%ecx
 441:	74 cd                	je     410 <printf+0x30>
      }
    } else if(state == '%'){
 443:	83 f9 25             	cmp    $0x25,%ecx
 446:	75 ea                	jne    432 <printf+0x52>
      if(c == 'd'){
 448:	83 f8 25             	cmp    $0x25,%eax
 44b:	0f 84 07 01 00 00    	je     558 <printf+0x178>
 451:	83 e8 63             	sub    $0x63,%eax
 454:	83 f8 15             	cmp    $0x15,%eax
 457:	77 17                	ja     470 <printf+0x90>
 459:	ff 24 85 20 0a 00 00 	jmp    *0xa20(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 460:	8d 65 f4             	lea    -0xc(%ebp),%esp
 463:	5b                   	pop    %ebx
 464:	5e                   	pop    %esi
 465:	5f                   	pop    %edi
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
  write(fd, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 476:	6a 01                	push   $0x1
 478:	57                   	push   %edi
 479:	56                   	push   %esi
 47a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 47e:	e8 20 fe ff ff       	call   2a3 <write>
        putc(fd, c);
 483:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 487:	83 c4 0c             	add    $0xc,%esp
 48a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 48d:	6a 01                	push   $0x1
 48f:	57                   	push   %edi
 490:	56                   	push   %esi
 491:	e8 0d fe ff ff       	call   2a3 <write>
        putc(fd, c);
 496:	83 c4 10             	add    $0x10,%esp
      state = 0;
 499:	31 c9                	xor    %ecx,%ecx
 49b:	eb 95                	jmp    432 <printf+0x52>
 49d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4a0:	83 ec 0c             	sub    $0xc,%esp
 4a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a8:	6a 00                	push   $0x0
 4aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4ad:	8b 10                	mov    (%eax),%edx
 4af:	89 f0                	mov    %esi,%eax
 4b1:	e8 7a fe ff ff       	call   330 <printint>
        ap++;
 4b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4bd:	31 c9                	xor    %ecx,%ecx
 4bf:	e9 6e ff ff ff       	jmp    432 <printf+0x52>
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4cb:	8b 10                	mov    (%eax),%edx
        ap++;
 4cd:	83 c0 04             	add    $0x4,%eax
 4d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4d3:	85 d2                	test   %edx,%edx
 4d5:	0f 84 8d 00 00 00    	je     568 <printf+0x188>
        while(*s != 0){
 4db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 4de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 4e0:	84 c0                	test   %al,%al
 4e2:	0f 84 4a ff ff ff    	je     432 <printf+0x52>
 4e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 4eb:	89 d3                	mov    %edx,%ebx
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 4f3:	83 c3 01             	add    $0x1,%ebx
 4f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4f9:	6a 01                	push   $0x1
 4fb:	57                   	push   %edi
 4fc:	56                   	push   %esi
 4fd:	e8 a1 fd ff ff       	call   2a3 <write>
        while(*s != 0){
 502:	0f b6 03             	movzbl (%ebx),%eax
 505:	83 c4 10             	add    $0x10,%esp
 508:	84 c0                	test   %al,%al
 50a:	75 e4                	jne    4f0 <printf+0x110>
      state = 0;
 50c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 50f:	31 c9                	xor    %ecx,%ecx
 511:	e9 1c ff ff ff       	jmp    432 <printf+0x52>
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 520:	83 ec 0c             	sub    $0xc,%esp
 523:	b9 0a 00 00 00       	mov    $0xa,%ecx
 528:	6a 01                	push   $0x1
 52a:	e9 7b ff ff ff       	jmp    4aa <printf+0xca>
 52f:	90                   	nop
        putc(fd, *ap);
 530:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 536:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 538:	6a 01                	push   $0x1
 53a:	57                   	push   %edi
 53b:	56                   	push   %esi
        putc(fd, *ap);
 53c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 53f:	e8 5f fd ff ff       	call   2a3 <write>
        ap++;
 544:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 548:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54b:	31 c9                	xor    %ecx,%ecx
 54d:	e9 e0 fe ff ff       	jmp    432 <printf+0x52>
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 558:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 55b:	83 ec 04             	sub    $0x4,%esp
 55e:	e9 2a ff ff ff       	jmp    48d <printf+0xad>
 563:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 567:	90                   	nop
          s = "(null)";
 568:	ba 18 0a 00 00       	mov    $0xa18,%edx
        while(*s != 0){
 56d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 570:	b8 28 00 00 00       	mov    $0x28,%eax
 575:	89 d3                	mov    %edx,%ebx
 577:	e9 74 ff ff ff       	jmp    4f0 <printf+0x110>
 57c:	66 90                	xchg   %ax,%ax
 57e:	66 90                	xchg   %ax,%ax

00000580 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 580:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 581:	a1 e0 0d 00 00       	mov    0xde0,%eax
{
 586:	89 e5                	mov    %esp,%ebp
 588:	57                   	push   %edi
 589:	56                   	push   %esi
 58a:	53                   	push   %ebx
 58b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 58e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	89 c2                	mov    %eax,%edx
 59a:	8b 00                	mov    (%eax),%eax
 59c:	39 ca                	cmp    %ecx,%edx
 59e:	73 30                	jae    5d0 <free+0x50>
 5a0:	39 c1                	cmp    %eax,%ecx
 5a2:	72 04                	jb     5a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5a4:	39 c2                	cmp    %eax,%edx
 5a6:	72 f0                	jb     598 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ae:	39 f8                	cmp    %edi,%eax
 5b0:	74 30                	je     5e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5b5:	8b 42 04             	mov    0x4(%edx),%eax
 5b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5bb:	39 f1                	cmp    %esi,%ecx
 5bd:	74 3a                	je     5f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5c1:	5b                   	pop    %ebx
  freep = p;
 5c2:	89 15 e0 0d 00 00    	mov    %edx,0xde0
}
 5c8:	5e                   	pop    %esi
 5c9:	5f                   	pop    %edi
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d0:	39 c2                	cmp    %eax,%edx
 5d2:	72 c4                	jb     598 <free+0x18>
 5d4:	39 c1                	cmp    %eax,%ecx
 5d6:	73 c0                	jae    598 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 5d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5de:	39 f8                	cmp    %edi,%eax
 5e0:	75 d0                	jne    5b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 5e2:	03 70 04             	add    0x4(%eax),%esi
 5e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5e8:	8b 02                	mov    (%edx),%eax
 5ea:	8b 00                	mov    (%eax),%eax
 5ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 5ef:	8b 42 04             	mov    0x4(%edx),%eax
 5f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5f5:	39 f1                	cmp    %esi,%ecx
 5f7:	75 c6                	jne    5bf <free+0x3f>
    p->s.size += bp->s.size;
 5f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 5fc:	89 15 e0 0d 00 00    	mov    %edx,0xde0
    p->s.size += bp->s.size;
 602:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 605:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 608:	89 0a                	mov    %ecx,(%edx)
}
 60a:	5b                   	pop    %ebx
 60b:	5e                   	pop    %esi
 60c:	5f                   	pop    %edi
 60d:	5d                   	pop    %ebp
 60e:	c3                   	ret    
 60f:	90                   	nop

00000610 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 619:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 61c:	8b 3d e0 0d 00 00    	mov    0xde0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 622:	8d 70 07             	lea    0x7(%eax),%esi
 625:	c1 ee 03             	shr    $0x3,%esi
 628:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 62b:	85 ff                	test   %edi,%edi
 62d:	0f 84 9d 00 00 00    	je     6d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 633:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 635:	8b 4a 04             	mov    0x4(%edx),%ecx
 638:	39 f1                	cmp    %esi,%ecx
 63a:	73 6a                	jae    6a6 <malloc+0x96>
 63c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 641:	39 de                	cmp    %ebx,%esi
 643:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 646:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 64d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 650:	eb 17                	jmp    669 <malloc+0x59>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 658:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 65a:	8b 48 04             	mov    0x4(%eax),%ecx
 65d:	39 f1                	cmp    %esi,%ecx
 65f:	73 4f                	jae    6b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 661:	8b 3d e0 0d 00 00    	mov    0xde0,%edi
 667:	89 c2                	mov    %eax,%edx
 669:	39 d7                	cmp    %edx,%edi
 66b:	75 eb                	jne    658 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 66d:	83 ec 0c             	sub    $0xc,%esp
 670:	ff 75 e4             	push   -0x1c(%ebp)
 673:	e8 93 fc ff ff       	call   30b <sbrk>
  if(p == (char*)-1)
 678:	83 c4 10             	add    $0x10,%esp
 67b:	83 f8 ff             	cmp    $0xffffffff,%eax
 67e:	74 1c                	je     69c <malloc+0x8c>
  hp->s.size = nu;
 680:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	83 c0 08             	add    $0x8,%eax
 689:	50                   	push   %eax
 68a:	e8 f1 fe ff ff       	call   580 <free>
  return freep;
 68f:	8b 15 e0 0d 00 00    	mov    0xde0,%edx
      if((p = morecore(nunits)) == 0)
 695:	83 c4 10             	add    $0x10,%esp
 698:	85 d2                	test   %edx,%edx
 69a:	75 bc                	jne    658 <malloc+0x48>
        return 0;
  }
}
 69c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 69f:	31 c0                	xor    %eax,%eax
}
 6a1:	5b                   	pop    %ebx
 6a2:	5e                   	pop    %esi
 6a3:	5f                   	pop    %edi
 6a4:	5d                   	pop    %ebp
 6a5:	c3                   	ret    
    if(p->s.size >= nunits){
 6a6:	89 d0                	mov    %edx,%eax
 6a8:	89 fa                	mov    %edi,%edx
 6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6b0:	39 ce                	cmp    %ecx,%esi
 6b2:	74 4c                	je     700 <malloc+0xf0>
        p->s.size -= nunits;
 6b4:	29 f1                	sub    %esi,%ecx
 6b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6bf:	89 15 e0 0d 00 00    	mov    %edx,0xde0
}
 6c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6c8:	83 c0 08             	add    $0x8,%eax
}
 6cb:	5b                   	pop    %ebx
 6cc:	5e                   	pop    %esi
 6cd:	5f                   	pop    %edi
 6ce:	5d                   	pop    %ebp
 6cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 6d0:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 6d7:	0d 00 00 
    base.s.size = 0;
 6da:	bf e4 0d 00 00       	mov    $0xde4,%edi
    base.s.ptr = freep = prevp = &base;
 6df:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 6e6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 6eb:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 6f2:	00 00 00 
    if(p->s.size >= nunits){
 6f5:	e9 42 ff ff ff       	jmp    63c <malloc+0x2c>
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 700:	8b 08                	mov    (%eax),%ecx
 702:	89 0a                	mov    %ecx,(%edx)
 704:	eb b9                	jmp    6bf <malloc+0xaf>
 706:	66 90                	xchg   %ax,%ax
 708:	66 90                	xchg   %ax,%ax
 70a:	66 90                	xchg   %ax,%ax
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 04             	sub    $0x4,%esp
 719:	8b 5d 10             	mov    0x10(%ebp),%ebx
 71c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 71f:	85 db                	test   %ebx,%ebx
 721:	7e 3d                	jle    760 <min_distance_vertex+0x50>
    int min_idx = 0;
 723:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 725:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 727:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 72c:	89 75 f0             	mov    %esi,-0x10(%ebp)
 72f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 730:	8b 14 87             	mov    (%edi,%eax,4),%edx
 733:	39 ca                	cmp    %ecx,%edx
 735:	7d 14                	jge    74b <min_distance_vertex+0x3b>
 737:	8b 75 0c             	mov    0xc(%ebp),%esi
 73a:	8b 34 86             	mov    (%esi,%eax,4),%esi
 73d:	85 f6                	test   %esi,%esi
 73f:	8b 75 f0             	mov    -0x10(%ebp),%esi
 742:	0f 44 ca             	cmove  %edx,%ecx
 745:	0f 44 f0             	cmove  %eax,%esi
 748:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 74b:	83 c0 01             	add    $0x1,%eax
 74e:	39 c3                	cmp    %eax,%ebx
 750:	75 de                	jne    730 <min_distance_vertex+0x20>
 752:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 755:	83 c4 04             	add    $0x4,%esp
 758:	5b                   	pop    %ebx
 759:	89 f0                	mov    %esi,%eax
 75b:	5e                   	pop    %esi
 75c:	5f                   	pop    %edi
 75d:	5d                   	pop    %ebp
 75e:	c3                   	ret    
 75f:	90                   	nop
 760:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 763:	31 f6                	xor    %esi,%esi
}
 765:	5b                   	pop    %ebx
 766:	89 f0                	mov    %esi,%eax
 768:	5e                   	pop    %esi
 769:	5f                   	pop    %edi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 779:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 77c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 77f:	89 e6                	mov    %esp,%esi
 781:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 788:	8d 41 0f             	lea    0xf(%ecx),%eax
 78b:	89 c2                	mov    %eax,%edx
 78d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 792:	29 c6                	sub    %eax,%esi
 794:	83 e2 f0             	and    $0xfffffff0,%edx
 797:	39 f4                	cmp    %esi,%esp
 799:	74 12                	je     7ad <dijkstra+0x3d>
 79b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 7a1:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 7a8:	00 
 7a9:	39 f4                	cmp    %esi,%esp
 7ab:	75 ee                	jne    79b <dijkstra+0x2b>
 7ad:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 7b3:	29 d4                	sub    %edx,%esp
 7b5:	85 d2                	test   %edx,%edx
 7b7:	0f 85 ef 00 00 00    	jne    8ac <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 7bd:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 7c0:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 7c2:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 7c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 7c8:	85 c0                	test   %eax,%eax
 7ca:	0f 8e e6 00 00 00    	jle    8b6 <dijkstra+0x146>
 7d0:	89 d8                	mov    %ebx,%eax
 7d2:	89 fa                	mov    %edi,%edx
 7d4:	01 d9                	add    %ebx,%ecx
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 7e0:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 7e6:	83 c0 04             	add    $0x4,%eax
 7e9:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 7ec:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 7f3:	39 c8                	cmp    %ecx,%eax
 7f5:	75 e9                	jne    7e0 <dijkstra+0x70>
    dist[src] = 0;
 7f7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 7fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 808:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 80a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 80f:	31 c0                	xor    %eax,%eax
 811:	eb 07                	jmp    81a <dijkstra+0xaa>
 813:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 817:	90                   	nop
 818:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 81a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 81d:	39 ca                	cmp    %ecx,%edx
 81f:	7d 0a                	jge    82b <dijkstra+0xbb>
 821:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 825:	0f 44 f0             	cmove  %eax,%esi
 828:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 82b:	8d 50 01             	lea    0x1(%eax),%edx
 82e:	39 55 0c             	cmp    %edx,0xc(%ebp)
 831:	75 e5                	jne    818 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 833:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 836:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 83d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 843:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 846:	75 18                	jne    860 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 848:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 84b:	8d 56 01             	lea    0x1(%esi),%edx
 84e:	39 c6                	cmp    %eax,%esi
 850:	74 52                	je     8a4 <dijkstra+0x134>
 852:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 855:	eb b1                	jmp    808 <dijkstra+0x98>
 857:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 860:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 866:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 869:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 86c:	31 d2                	xor    %edx,%edx
 86e:	eb 02                	jmp    872 <dijkstra+0x102>
 870:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 872:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 875:	85 c9                	test   %ecx,%ecx
 877:	74 17                	je     890 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 879:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 87c:	85 db                	test   %ebx,%ebx
 87e:	75 10                	jne    890 <dijkstra+0x120>
 880:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 883:	03 0b                	add    (%ebx),%ecx
 885:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 888:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 88b:	7e 03                	jle    890 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 88d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 890:	8d 4a 01             	lea    0x1(%edx),%ecx
 893:	39 c2                	cmp    %eax,%edx
 895:	75 d9                	jne    870 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 897:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 89a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 89d:	8d 56 01             	lea    0x1(%esi),%edx
 8a0:	39 c6                	cmp    %eax,%esi
 8a2:	75 ae                	jne    852 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 8a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a7:	5b                   	pop    %ebx
 8a8:	5e                   	pop    %esi
 8a9:	5f                   	pop    %edi
 8aa:	5d                   	pop    %ebp
 8ab:	c3                   	ret    
    int visited[num_vertices];
 8ac:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 8b1:	e9 07 ff ff ff       	jmp    7bd <dijkstra+0x4d>
    dist[src] = 0;
 8b6:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8bf:	5b                   	pop    %ebx
 8c0:	5e                   	pop    %esi
 8c1:	5f                   	pop    %edi
 8c2:	5d                   	pop    %ebp
 8c3:	c3                   	ret    
 8c4:	66 90                	xchg   %ax,%ax
 8c6:	66 90                	xchg   %ax,%ax
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 8d4:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 8d9:	56                   	push   %esi
 8da:	53                   	push   %ebx
 8db:	83 ec 0c             	sub    $0xc,%esp
 8de:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8e1:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 8e4:	e8 f7 00 00 00       	call   9e0 <random>
 8e9:	89 c1                	mov    %eax,%ecx
 8eb:	f7 ef                	imul   %edi
 8ed:	89 c8                	mov    %ecx,%eax
 8ef:	c1 f8 1f             	sar    $0x1f,%eax
 8f2:	c1 fa 06             	sar    $0x6,%edx
 8f5:	29 c2                	sub    %eax,%edx
 8f7:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 8fd:	29 c1                	sub    %eax,%ecx
 8ff:	83 f9 63             	cmp    $0x63,%ecx
 902:	89 ca                	mov    %ecx,%edx
 904:	8d 41 64             	lea    0x64(%ecx),%eax
 907:	0f 4e d0             	cmovle %eax,%edx
 90a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 90c:	e8 cf 00 00 00       	call   9e0 <random>
 911:	89 c1                	mov    %eax,%ecx
 913:	f7 ef                	imul   %edi
 915:	89 c8                	mov    %ecx,%eax
 917:	c1 f8 1f             	sar    $0x1f,%eax
 91a:	c1 fa 07             	sar    $0x7,%edx
 91d:	29 c2                	sub    %eax,%edx
 91f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 925:	29 c1                	sub    %eax,%ecx
 927:	8d 41 32             	lea    0x32(%ecx),%eax
 92a:	89 ca                	mov    %ecx,%edx
 92c:	83 f9 31             	cmp    $0x31,%ecx
 92f:	0f 4e d0             	cmovle %eax,%edx
 932:	8b 45 10             	mov    0x10(%ebp),%eax
 935:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 937:	8b 13                	mov    (%ebx),%edx
 939:	85 d2                	test   %edx,%edx
 93b:	7e 38                	jle    975 <gen_random_digraph+0xa5>
 93d:	89 f1                	mov    %esi,%ecx
 93f:	31 ff                	xor    %edi,%edi
 941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 948:	31 c0                	xor    %eax,%eax
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 950:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 957:	8b 13                	mov    (%ebx),%edx
 959:	83 c0 01             	add    $0x1,%eax
 95c:	39 c2                	cmp    %eax,%edx
 95e:	7f f0                	jg     950 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 960:	83 c7 01             	add    $0x1,%edi
 963:	81 c1 20 03 00 00    	add    $0x320,%ecx
 969:	39 fa                	cmp    %edi,%edx
 96b:	7f db                	jg     948 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 96d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 973:	7f 22                	jg     997 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 975:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 97b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 982:	8d 04 86             	lea    (%esi,%eax,4),%eax
 985:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 988:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 98e:	05 20 03 00 00       	add    $0x320,%eax
 993:	39 d0                	cmp    %edx,%eax
 995:	75 f1                	jne    988 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 997:	8b 45 10             	mov    0x10(%ebp),%eax
 99a:	31 c9                	xor    %ecx,%ecx
 99c:	8b 00                	mov    (%eax),%eax
 99e:	85 c0                	test   %eax,%eax
 9a0:	7e 31                	jle    9d3 <gen_random_digraph+0x103>
 9a2:	89 75 08             	mov    %esi,0x8(%ebp)
 9a5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 9a7:	e8 34 00 00 00       	call   9e0 <random>
    for (int i = 0; i < *num_edges; i++) {
 9ac:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 9af:	99                   	cltd   
 9b0:	f7 3b                	idivl  (%ebx)
 9b2:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 9b4:	e8 27 00 00 00       	call   9e0 <random>
        graph[new_edge_u][new_edge_v] = 1;
 9b9:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 9bf:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 9c2:	99                   	cltd   
 9c3:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 9c5:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 9c8:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 9cf:	39 30                	cmp    %esi,(%eax)
 9d1:	7f d4                	jg     9a7 <gen_random_digraph+0xd7>
    }
}
 9d3:	83 c4 0c             	add    $0xc,%esp
 9d6:	5b                   	pop    %ebx
 9d7:	5e                   	pop    %esi
 9d8:	5f                   	pop    %edi
 9d9:	5d                   	pop    %ebp
 9da:	c3                   	ret    
 9db:	66 90                	xchg   %ax,%ax
 9dd:	66 90                	xchg   %ax,%ax
 9df:	90                   	nop

000009e0 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 9e0:	69 0d dc 0d 00 00 0d 	imul   $0x19660d,0xddc,%ecx
 9e7:	66 19 00 
 9ea:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 9ef:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 9f5:	89 c8                	mov    %ecx,%eax
 9f7:	f7 ea                	imul   %edx
 9f9:	89 d0                	mov    %edx,%eax
 9fb:	89 ca                	mov    %ecx,%edx
 9fd:	c1 fa 1f             	sar    $0x1f,%edx
 a00:	c1 f8 1d             	sar    $0x1d,%eax
 a03:	29 d0                	sub    %edx,%eax
 a05:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 a0b:	89 c8                	mov    %ecx,%eax
 a0d:	29 d0                	sub    %edx,%eax
 a0f:	a3 dc 0d 00 00       	mov    %eax,0xddc
    return seed;
 a14:	c3                   	ret    
