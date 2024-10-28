
_kill: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 27                	jle    4a <main+0x4a>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  31:	e8 0a 02 00 00       	call   240 <atoi>
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 a5 02 00 00       	call   2e3 <kill>
  for(i=1; i<argc; i++)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	39 de                	cmp    %ebx,%esi
  43:	75 e3                	jne    28 <main+0x28>
  exit();
  45:	e8 69 02 00 00       	call   2b3 <exit>
    printf(2, "usage: kill pid...\n");
  4a:	50                   	push   %eax
  4b:	50                   	push   %eax
  4c:	68 48 0f 00 00       	push   $0xf48
  51:	6a 02                	push   $0x2
  53:	e8 b8 03 00 00       	call   410 <printf>
    exit();
  58:	e8 56 02 00 00       	call   2b3 <exit>
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave  
  84:	c3                   	ret    
  85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a7:	90                   	nop
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
    p++, q++;
  b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave  
  c5:	c3                   	ret    
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave  
  dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave  
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	57                   	push   %edi
 196:	6a 00                	push   $0x0
 198:	e8 2e 01 00 00       	call   2cb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 1d                	je     1d0 <gets+0x50>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 19                	je     1d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1b7:	89 de                	mov    %ebx,%esi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    
  buf[i] = '\0';
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	89 de                	mov    %ebx,%esi
 1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave  
 27b:	c3                   	ret    
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    
 353:	66 90                	xchg   %ax,%ax
 355:	66 90                	xchg   %ax,%ax
 357:	66 90                	xchg   %ax,%ax
 359:	66 90                	xchg   %ax,%ax
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 3c             	sub    $0x3c,%esp
 369:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 36c:	89 d1                	mov    %edx,%ecx
{
 36e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 371:	85 d2                	test   %edx,%edx
 373:	0f 89 7f 00 00 00    	jns    3f8 <printint+0x98>
 379:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 37d:	74 79                	je     3f8 <printint+0x98>
    neg = 1;
 37f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 386:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 388:	31 db                	xor    %ebx,%ebx
 38a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 38d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 390:	89 c8                	mov    %ecx,%eax
 392:	31 d2                	xor    %edx,%edx
 394:	89 cf                	mov    %ecx,%edi
 396:	f7 75 c4             	divl   -0x3c(%ebp)
 399:	0f b6 92 bc 0f 00 00 	movzbl 0xfbc(%edx),%edx
 3a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3a3:	89 d8                	mov    %ebx,%eax
 3a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3b1:	76 dd                	jbe    390 <printint+0x30>
  if(neg)
 3b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3b6:	85 c9                	test   %ecx,%ecx
 3b8:	74 0c                	je     3c6 <printint+0x66>
    buf[i++] = '-';
 3ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3cd:	eb 07                	jmp    3d6 <printint+0x76>
 3cf:	90                   	nop
    putc(fd, buf[i]);
 3d0:	0f b6 13             	movzbl (%ebx),%edx
 3d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3d6:	83 ec 04             	sub    $0x4,%esp
 3d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3dc:	6a 01                	push   $0x1
 3de:	56                   	push   %esi
 3df:	57                   	push   %edi
 3e0:	e8 ee fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 3e5:	83 c4 10             	add    $0x10,%esp
 3e8:	39 de                	cmp    %ebx,%esi
 3ea:	75 e4                	jne    3d0 <printint+0x70>
}
 3ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5f                   	pop    %edi
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3ff:	eb 87                	jmp    388 <printint+0x28>
 401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 408:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 419:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 41c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 41f:	0f b6 13             	movzbl (%ebx),%edx
 422:	84 d2                	test   %dl,%dl
 424:	74 6a                	je     490 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 426:	8d 45 10             	lea    0x10(%ebp),%eax
 429:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 42c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 42f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 431:	89 45 d0             	mov    %eax,-0x30(%ebp)
 434:	eb 36                	jmp    46c <printf+0x5c>
 436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43d:	8d 76 00             	lea    0x0(%esi),%esi
 440:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 443:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 448:	83 f8 25             	cmp    $0x25,%eax
 44b:	74 15                	je     462 <printf+0x52>
  write(fd, &c, 1);
 44d:	83 ec 04             	sub    $0x4,%esp
 450:	88 55 e7             	mov    %dl,-0x19(%ebp)
 453:	6a 01                	push   $0x1
 455:	57                   	push   %edi
 456:	56                   	push   %esi
 457:	e8 77 fe ff ff       	call   2d3 <write>
 45c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 45f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 462:	0f b6 13             	movzbl (%ebx),%edx
 465:	83 c3 01             	add    $0x1,%ebx
 468:	84 d2                	test   %dl,%dl
 46a:	74 24                	je     490 <printf+0x80>
    c = fmt[i] & 0xff;
 46c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 46f:	85 c9                	test   %ecx,%ecx
 471:	74 cd                	je     440 <printf+0x30>
      }
    } else if(state == '%'){
 473:	83 f9 25             	cmp    $0x25,%ecx
 476:	75 ea                	jne    462 <printf+0x52>
      if(c == 'd'){
 478:	83 f8 25             	cmp    $0x25,%eax
 47b:	0f 84 07 01 00 00    	je     588 <printf+0x178>
 481:	83 e8 63             	sub    $0x63,%eax
 484:	83 f8 15             	cmp    $0x15,%eax
 487:	77 17                	ja     4a0 <printf+0x90>
 489:	ff 24 85 64 0f 00 00 	jmp    *0xf64(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 490:	8d 65 f4             	lea    -0xc(%ebp),%esp
 493:	5b                   	pop    %ebx
 494:	5e                   	pop    %esi
 495:	5f                   	pop    %edi
 496:	5d                   	pop    %ebp
 497:	c3                   	ret    
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop
  write(fd, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4a6:	6a 01                	push   $0x1
 4a8:	57                   	push   %edi
 4a9:	56                   	push   %esi
 4aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ae:	e8 20 fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4b7:	83 c4 0c             	add    $0xc,%esp
 4ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4bd:	6a 01                	push   $0x1
 4bf:	57                   	push   %edi
 4c0:	56                   	push   %esi
 4c1:	e8 0d fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c9:	31 c9                	xor    %ecx,%ecx
 4cb:	eb 95                	jmp    462 <printf+0x52>
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4d0:	83 ec 0c             	sub    $0xc,%esp
 4d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4d8:	6a 00                	push   $0x0
 4da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4dd:	8b 10                	mov    (%eax),%edx
 4df:	89 f0                	mov    %esi,%eax
 4e1:	e8 7a fe ff ff       	call   360 <printint>
        ap++;
 4e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ed:	31 c9                	xor    %ecx,%ecx
 4ef:	e9 6e ff ff ff       	jmp    462 <printf+0x52>
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4fb:	8b 10                	mov    (%eax),%edx
        ap++;
 4fd:	83 c0 04             	add    $0x4,%eax
 500:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 503:	85 d2                	test   %edx,%edx
 505:	0f 84 8d 00 00 00    	je     598 <printf+0x188>
        while(*s != 0){
 50b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 50e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 510:	84 c0                	test   %al,%al
 512:	0f 84 4a ff ff ff    	je     462 <printf+0x52>
 518:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 51b:	89 d3                	mov    %edx,%ebx
 51d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 520:	83 ec 04             	sub    $0x4,%esp
          s++;
 523:	83 c3 01             	add    $0x1,%ebx
 526:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 529:	6a 01                	push   $0x1
 52b:	57                   	push   %edi
 52c:	56                   	push   %esi
 52d:	e8 a1 fd ff ff       	call   2d3 <write>
        while(*s != 0){
 532:	0f b6 03             	movzbl (%ebx),%eax
 535:	83 c4 10             	add    $0x10,%esp
 538:	84 c0                	test   %al,%al
 53a:	75 e4                	jne    520 <printf+0x110>
      state = 0;
 53c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 53f:	31 c9                	xor    %ecx,%ecx
 541:	e9 1c ff ff ff       	jmp    462 <printf+0x52>
 546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 550:	83 ec 0c             	sub    $0xc,%esp
 553:	b9 0a 00 00 00       	mov    $0xa,%ecx
 558:	6a 01                	push   $0x1
 55a:	e9 7b ff ff ff       	jmp    4da <printf+0xca>
 55f:	90                   	nop
        putc(fd, *ap);
 560:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 563:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 566:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 568:	6a 01                	push   $0x1
 56a:	57                   	push   %edi
 56b:	56                   	push   %esi
        putc(fd, *ap);
 56c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 56f:	e8 5f fd ff ff       	call   2d3 <write>
        ap++;
 574:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 578:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57b:	31 c9                	xor    %ecx,%ecx
 57d:	e9 e0 fe ff ff       	jmp    462 <printf+0x52>
 582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 588:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 58b:	83 ec 04             	sub    $0x4,%esp
 58e:	e9 2a ff ff ff       	jmp    4bd <printf+0xad>
 593:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 597:	90                   	nop
          s = "(null)";
 598:	ba 5c 0f 00 00       	mov    $0xf5c,%edx
        while(*s != 0){
 59d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5a0:	b8 28 00 00 00       	mov    $0x28,%eax
 5a5:	89 d3                	mov    %edx,%ebx
 5a7:	e9 74 ff ff ff       	jmp    520 <printf+0x110>
 5ac:	66 90                	xchg   %ax,%ax
 5ae:	66 90                	xchg   %ax,%ax

000005b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b1:	a1 a8 15 00 00       	mov    0x15a8,%eax
{
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	57                   	push   %edi
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
 5bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c8:	89 c2                	mov    %eax,%edx
 5ca:	8b 00                	mov    (%eax),%eax
 5cc:	39 ca                	cmp    %ecx,%edx
 5ce:	73 30                	jae    600 <free+0x50>
 5d0:	39 c1                	cmp    %eax,%ecx
 5d2:	72 04                	jb     5d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d4:	39 c2                	cmp    %eax,%edx
 5d6:	72 f0                	jb     5c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5de:	39 f8                	cmp    %edi,%eax
 5e0:	74 30                	je     612 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5e5:	8b 42 04             	mov    0x4(%edx),%eax
 5e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5eb:	39 f1                	cmp    %esi,%ecx
 5ed:	74 3a                	je     629 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5f1:	5b                   	pop    %ebx
  freep = p;
 5f2:	89 15 a8 15 00 00    	mov    %edx,0x15a8
}
 5f8:	5e                   	pop    %esi
 5f9:	5f                   	pop    %edi
 5fa:	5d                   	pop    %ebp
 5fb:	c3                   	ret    
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 600:	39 c2                	cmp    %eax,%edx
 602:	72 c4                	jb     5c8 <free+0x18>
 604:	39 c1                	cmp    %eax,%ecx
 606:	73 c0                	jae    5c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 608:	8b 73 fc             	mov    -0x4(%ebx),%esi
 60b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60e:	39 f8                	cmp    %edi,%eax
 610:	75 d0                	jne    5e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 612:	03 70 04             	add    0x4(%eax),%esi
 615:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 618:	8b 02                	mov    (%edx),%eax
 61a:	8b 00                	mov    (%eax),%eax
 61c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 61f:	8b 42 04             	mov    0x4(%edx),%eax
 622:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 625:	39 f1                	cmp    %esi,%ecx
 627:	75 c6                	jne    5ef <free+0x3f>
    p->s.size += bp->s.size;
 629:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 62c:	89 15 a8 15 00 00    	mov    %edx,0x15a8
    p->s.size += bp->s.size;
 632:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 635:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 638:	89 0a                	mov    %ecx,(%edx)
}
 63a:	5b                   	pop    %ebx
 63b:	5e                   	pop    %esi
 63c:	5f                   	pop    %edi
 63d:	5d                   	pop    %ebp
 63e:	c3                   	ret    
 63f:	90                   	nop

00000640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 649:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 64c:	8b 3d a8 15 00 00    	mov    0x15a8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 652:	8d 70 07             	lea    0x7(%eax),%esi
 655:	c1 ee 03             	shr    $0x3,%esi
 658:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 65b:	85 ff                	test   %edi,%edi
 65d:	0f 84 9d 00 00 00    	je     700 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 663:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 665:	8b 4a 04             	mov    0x4(%edx),%ecx
 668:	39 f1                	cmp    %esi,%ecx
 66a:	73 6a                	jae    6d6 <malloc+0x96>
 66c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 671:	39 de                	cmp    %ebx,%esi
 673:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 676:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 67d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 680:	eb 17                	jmp    699 <malloc+0x59>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 688:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 68a:	8b 48 04             	mov    0x4(%eax),%ecx
 68d:	39 f1                	cmp    %esi,%ecx
 68f:	73 4f                	jae    6e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 691:	8b 3d a8 15 00 00    	mov    0x15a8,%edi
 697:	89 c2                	mov    %eax,%edx
 699:	39 d7                	cmp    %edx,%edi
 69b:	75 eb                	jne    688 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 69d:	83 ec 0c             	sub    $0xc,%esp
 6a0:	ff 75 e4             	push   -0x1c(%ebp)
 6a3:	e8 93 fc ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 6a8:	83 c4 10             	add    $0x10,%esp
 6ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ae:	74 1c                	je     6cc <malloc+0x8c>
  hp->s.size = nu;
 6b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6b3:	83 ec 0c             	sub    $0xc,%esp
 6b6:	83 c0 08             	add    $0x8,%eax
 6b9:	50                   	push   %eax
 6ba:	e8 f1 fe ff ff       	call   5b0 <free>
  return freep;
 6bf:	8b 15 a8 15 00 00    	mov    0x15a8,%edx
      if((p = morecore(nunits)) == 0)
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	85 d2                	test   %edx,%edx
 6ca:	75 bc                	jne    688 <malloc+0x48>
        return 0;
  }
}
 6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6cf:	31 c0                	xor    %eax,%eax
}
 6d1:	5b                   	pop    %ebx
 6d2:	5e                   	pop    %esi
 6d3:	5f                   	pop    %edi
 6d4:	5d                   	pop    %ebp
 6d5:	c3                   	ret    
    if(p->s.size >= nunits){
 6d6:	89 d0                	mov    %edx,%eax
 6d8:	89 fa                	mov    %edi,%edx
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6e0:	39 ce                	cmp    %ecx,%esi
 6e2:	74 4c                	je     730 <malloc+0xf0>
        p->s.size -= nunits;
 6e4:	29 f1                	sub    %esi,%ecx
 6e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6ef:	89 15 a8 15 00 00    	mov    %edx,0x15a8
}
 6f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6f8:	83 c0 08             	add    $0x8,%eax
}
 6fb:	5b                   	pop    %ebx
 6fc:	5e                   	pop    %esi
 6fd:	5f                   	pop    %edi
 6fe:	5d                   	pop    %ebp
 6ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 700:	c7 05 a8 15 00 00 ac 	movl   $0x15ac,0x15a8
 707:	15 00 00 
    base.s.size = 0;
 70a:	bf ac 15 00 00       	mov    $0x15ac,%edi
    base.s.ptr = freep = prevp = &base;
 70f:	c7 05 ac 15 00 00 ac 	movl   $0x15ac,0x15ac
 716:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 719:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 71b:	c7 05 b0 15 00 00 00 	movl   $0x0,0x15b0
 722:	00 00 00 
    if(p->s.size >= nunits){
 725:	e9 42 ff ff ff       	jmp    66c <malloc+0x2c>
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 730:	8b 08                	mov    (%eax),%ecx
 732:	89 0a                	mov    %ecx,(%edx)
 734:	eb b9                	jmp    6ef <malloc+0xaf>
 736:	66 90                	xchg   %ax,%ax
 738:	66 90                	xchg   %ax,%ax
 73a:	66 90                	xchg   %ax,%ax
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 04             	sub    $0x4,%esp
 749:	8b 5d 10             	mov    0x10(%ebp),%ebx
 74c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 74f:	85 db                	test   %ebx,%ebx
 751:	7e 3d                	jle    790 <min_distance_vertex+0x50>
    int min_idx = 0;
 753:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 755:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 757:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 75c:	89 75 f0             	mov    %esi,-0x10(%ebp)
 75f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 760:	8b 14 87             	mov    (%edi,%eax,4),%edx
 763:	39 ca                	cmp    %ecx,%edx
 765:	7d 14                	jge    77b <min_distance_vertex+0x3b>
 767:	8b 75 0c             	mov    0xc(%ebp),%esi
 76a:	8b 34 86             	mov    (%esi,%eax,4),%esi
 76d:	85 f6                	test   %esi,%esi
 76f:	8b 75 f0             	mov    -0x10(%ebp),%esi
 772:	0f 44 ca             	cmove  %edx,%ecx
 775:	0f 44 f0             	cmove  %eax,%esi
 778:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 77b:	83 c0 01             	add    $0x1,%eax
 77e:	39 c3                	cmp    %eax,%ebx
 780:	75 de                	jne    760 <min_distance_vertex+0x20>
 782:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 785:	83 c4 04             	add    $0x4,%esp
 788:	5b                   	pop    %ebx
 789:	89 f0                	mov    %esi,%eax
 78b:	5e                   	pop    %esi
 78c:	5f                   	pop    %edi
 78d:	5d                   	pop    %ebp
 78e:	c3                   	ret    
 78f:	90                   	nop
 790:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 793:	31 f6                	xor    %esi,%esi
}
 795:	5b                   	pop    %ebx
 796:	89 f0                	mov    %esi,%eax
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007a0 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 7a9:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7ac:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 7af:	89 e6                	mov    %esp,%esi
 7b1:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 7b8:	8d 41 0f             	lea    0xf(%ecx),%eax
 7bb:	89 c2                	mov    %eax,%edx
 7bd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 7c2:	29 c6                	sub    %eax,%esi
 7c4:	83 e2 f0             	and    $0xfffffff0,%edx
 7c7:	39 f4                	cmp    %esi,%esp
 7c9:	74 12                	je     7dd <dijkstra+0x3d>
 7cb:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 7d1:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 7d8:	00 
 7d9:	39 f4                	cmp    %esi,%esp
 7db:	75 ee                	jne    7cb <dijkstra+0x2b>
 7dd:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 7e3:	29 d4                	sub    %edx,%esp
 7e5:	85 d2                	test   %edx,%edx
 7e7:	0f 85 ef 00 00 00    	jne    8dc <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 7ed:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 7f0:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 7f2:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 7f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f8:	85 c0                	test   %eax,%eax
 7fa:	0f 8e e6 00 00 00    	jle    8e6 <dijkstra+0x146>
 800:	89 d8                	mov    %ebx,%eax
 802:	89 fa                	mov    %edi,%edx
 804:	01 d9                	add    %ebx,%ecx
 806:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 810:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 816:	83 c0 04             	add    $0x4,%eax
 819:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 81c:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 823:	39 c8                	cmp    %ecx,%eax
 825:	75 e9                	jne    810 <dijkstra+0x70>
    dist[src] = 0;
 827:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 82d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 838:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 83a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 83f:	31 c0                	xor    %eax,%eax
 841:	eb 07                	jmp    84a <dijkstra+0xaa>
 843:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 847:	90                   	nop
 848:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 84a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 84d:	39 ca                	cmp    %ecx,%edx
 84f:	7d 0a                	jge    85b <dijkstra+0xbb>
 851:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 855:	0f 44 f0             	cmove  %eax,%esi
 858:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 85b:	8d 50 01             	lea    0x1(%eax),%edx
 85e:	39 55 0c             	cmp    %edx,0xc(%ebp)
 861:	75 e5                	jne    848 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 863:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 866:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 86d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 873:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 876:	75 18                	jne    890 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 878:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 87b:	8d 56 01             	lea    0x1(%esi),%edx
 87e:	39 c6                	cmp    %eax,%esi
 880:	74 52                	je     8d4 <dijkstra+0x134>
 882:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 885:	eb b1                	jmp    838 <dijkstra+0x98>
 887:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 890:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 896:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 899:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 89c:	31 d2                	xor    %edx,%edx
 89e:	eb 02                	jmp    8a2 <dijkstra+0x102>
 8a0:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 8a2:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 8a5:	85 c9                	test   %ecx,%ecx
 8a7:	74 17                	je     8c0 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 8a9:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 8ac:	85 db                	test   %ebx,%ebx
 8ae:	75 10                	jne    8c0 <dijkstra+0x120>
 8b0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8b3:	03 0b                	add    (%ebx),%ecx
 8b5:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8b8:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 8bb:	7e 03                	jle    8c0 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 8bd:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 8c0:	8d 4a 01             	lea    0x1(%edx),%ecx
 8c3:	39 c2                	cmp    %eax,%edx
 8c5:	75 d9                	jne    8a0 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 8c7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8ca:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8cd:	8d 56 01             	lea    0x1(%esi),%edx
 8d0:	39 c6                	cmp    %eax,%esi
 8d2:	75 ae                	jne    882 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 8d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d7:	5b                   	pop    %ebx
 8d8:	5e                   	pop    %esi
 8d9:	5f                   	pop    %edi
 8da:	5d                   	pop    %ebp
 8db:	c3                   	ret    
    int visited[num_vertices];
 8dc:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 8e1:	e9 07 ff ff ff       	jmp    7ed <dijkstra+0x4d>
    dist[src] = 0;
 8e6:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ef:	5b                   	pop    %ebx
 8f0:	5e                   	pop    %esi
 8f1:	5f                   	pop    %edi
 8f2:	5d                   	pop    %ebp
 8f3:	c3                   	ret    
 8f4:	66 90                	xchg   %ax,%ax
 8f6:	66 90                	xchg   %ax,%ax
 8f8:	66 90                	xchg   %ax,%ax
 8fa:	66 90                	xchg   %ax,%ax
 8fc:	66 90                	xchg   %ax,%ax
 8fe:	66 90                	xchg   %ax,%ax

00000900 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 904:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 909:	56                   	push   %esi
 90a:	53                   	push   %ebx
 90b:	83 ec 0c             	sub    $0xc,%esp
 90e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 911:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 914:	e8 f7 00 00 00       	call   a10 <random>
 919:	89 c1                	mov    %eax,%ecx
 91b:	f7 ef                	imul   %edi
 91d:	89 c8                	mov    %ecx,%eax
 91f:	c1 f8 1f             	sar    $0x1f,%eax
 922:	c1 fa 06             	sar    $0x6,%edx
 925:	29 c2                	sub    %eax,%edx
 927:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 92d:	29 c1                	sub    %eax,%ecx
 92f:	83 f9 63             	cmp    $0x63,%ecx
 932:	89 ca                	mov    %ecx,%edx
 934:	8d 41 64             	lea    0x64(%ecx),%eax
 937:	0f 4e d0             	cmovle %eax,%edx
 93a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 93c:	e8 cf 00 00 00       	call   a10 <random>
 941:	89 c1                	mov    %eax,%ecx
 943:	f7 ef                	imul   %edi
 945:	89 c8                	mov    %ecx,%eax
 947:	c1 f8 1f             	sar    $0x1f,%eax
 94a:	c1 fa 07             	sar    $0x7,%edx
 94d:	29 c2                	sub    %eax,%edx
 94f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 955:	29 c1                	sub    %eax,%ecx
 957:	8d 41 32             	lea    0x32(%ecx),%eax
 95a:	89 ca                	mov    %ecx,%edx
 95c:	83 f9 31             	cmp    $0x31,%ecx
 95f:	0f 4e d0             	cmovle %eax,%edx
 962:	8b 45 10             	mov    0x10(%ebp),%eax
 965:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 967:	8b 13                	mov    (%ebx),%edx
 969:	85 d2                	test   %edx,%edx
 96b:	7e 38                	jle    9a5 <gen_random_digraph+0xa5>
 96d:	89 f1                	mov    %esi,%ecx
 96f:	31 ff                	xor    %edi,%edi
 971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 978:	31 c0                	xor    %eax,%eax
 97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 980:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 987:	8b 13                	mov    (%ebx),%edx
 989:	83 c0 01             	add    $0x1,%eax
 98c:	39 c2                	cmp    %eax,%edx
 98e:	7f f0                	jg     980 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 990:	83 c7 01             	add    $0x1,%edi
 993:	81 c1 20 03 00 00    	add    $0x320,%ecx
 999:	39 fa                	cmp    %edi,%edx
 99b:	7f db                	jg     978 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 99d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 9a3:	7f 22                	jg     9c7 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 9a5:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 9ab:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 9b2:	8d 04 86             	lea    (%esi,%eax,4),%eax
 9b5:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 9b8:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 9be:	05 20 03 00 00       	add    $0x320,%eax
 9c3:	39 d0                	cmp    %edx,%eax
 9c5:	75 f1                	jne    9b8 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 9c7:	8b 45 10             	mov    0x10(%ebp),%eax
 9ca:	31 c9                	xor    %ecx,%ecx
 9cc:	8b 00                	mov    (%eax),%eax
 9ce:	85 c0                	test   %eax,%eax
 9d0:	7e 31                	jle    a03 <gen_random_digraph+0x103>
 9d2:	89 75 08             	mov    %esi,0x8(%ebp)
 9d5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 9d7:	e8 34 00 00 00       	call   a10 <random>
    for (int i = 0; i < *num_edges; i++) {
 9dc:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 9df:	99                   	cltd   
 9e0:	f7 3b                	idivl  (%ebx)
 9e2:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 9e4:	e8 27 00 00 00       	call   a10 <random>
        graph[new_edge_u][new_edge_v] = 1;
 9e9:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 9ef:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 9f2:	99                   	cltd   
 9f3:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 9f5:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 9f8:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 9ff:	39 30                	cmp    %esi,(%eax)
 a01:	7f d4                	jg     9d7 <gen_random_digraph+0xd7>
    }
}
 a03:	83 c4 0c             	add    $0xc,%esp
 a06:	5b                   	pop    %ebx
 a07:	5e                   	pop    %esi
 a08:	5f                   	pop    %edi
 a09:	5d                   	pop    %ebp
 a0a:	c3                   	ret    
 a0b:	66 90                	xchg   %ax,%ax
 a0d:	66 90                	xchg   %ax,%ax
 a0f:	90                   	nop

00000a10 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 a10:	69 0d a4 15 00 00 0d 	imul   $0x19660d,0x15a4,%ecx
 a17:	66 19 00 
 a1a:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 a1f:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 a25:	89 c8                	mov    %ecx,%eax
 a27:	f7 ea                	imul   %edx
 a29:	89 d0                	mov    %edx,%eax
 a2b:	89 ca                	mov    %ecx,%edx
 a2d:	c1 fa 1f             	sar    $0x1f,%edx
 a30:	c1 f8 1d             	sar    $0x1d,%eax
 a33:	29 d0                	sub    %edx,%eax
 a35:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 a3b:	89 c8                	mov    %ecx,%eax
 a3d:	29 d0                	sub    %edx,%eax
 a3f:	a3 a4 15 00 00       	mov    %eax,0x15a4
    return seed;
 a44:	c3                   	ret    
 a45:	66 90                	xchg   %ax,%ax
 a47:	66 90                	xchg   %ax,%ax
 a49:	66 90                	xchg   %ax,%ax
 a4b:	66 90                	xchg   %ax,%ax
 a4d:	66 90                	xchg   %ax,%ax
 a4f:	90                   	nop

00000a50 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	57                   	push   %edi
 a54:	56                   	push   %esi
 a55:	53                   	push   %ebx
 a56:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 a5c:	83 0c 24 00          	orl    $0x0,(%esp)
 a60:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 a66:	83 0c 24 00          	orl    $0x0,(%esp)
 a6a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
 a70:	6a 00                	push   $0x0
 a72:	ff 75 08             	push   0x8(%ebp)
 a75:	e8 79 f8 ff ff       	call   2f3 <open>
    if (fp < 0 ) {
 a7a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
 a7d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
 a83:	85 c0                	test   %eax,%eax
 a85:	0f 88 99 01 00 00    	js     c24 <permute_line+0x1d4>
 a8b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 a91:	31 db                	xor    %ebx,%ebx
 a93:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
 a99:	89 f7                	mov    %esi,%edi
 a9b:	89 de                	mov    %ebx,%esi
 a9d:	89 c3                	mov    %eax,%ebx
 a9f:	eb 12                	jmp    ab3 <permute_line+0x63>
 aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 aa8:	83 c7 66             	add    $0x66,%edi
 aab:	83 fe 64             	cmp    $0x64,%esi
 aae:	74 16                	je     ac6 <permute_line+0x76>
        line_idx++;
 ab0:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 ab3:	83 ec 04             	sub    $0x4,%esp
 ab6:	6a 66                	push   $0x66
 ab8:	57                   	push   %edi
 ab9:	53                   	push   %ebx
 aba:	e8 0c f8 ff ff       	call   2cb <read>
 abf:	83 c4 10             	add    $0x10,%esp
 ac2:	85 c0                	test   %eax,%eax
 ac4:	7f e2                	jg     aa8 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
 ac6:	89 f3                	mov    %esi,%ebx
 ac8:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
 ace:	e8 3d ff ff ff       	call   a10 <random>
 ad3:	89 c1                	mov    %eax,%ecx
 ad5:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 ada:	f7 e9                	imul   %ecx
 adc:	89 c8                	mov    %ecx,%eax
 ade:	c1 f8 1f             	sar    $0x1f,%eax
 ae1:	c1 fa 05             	sar    $0x5,%edx
 ae4:	29 c2                	sub    %eax,%edx
 ae6:	6b c2 64             	imul   $0x64,%edx,%eax
 ae9:	29 c1                	sub    %eax,%ecx
 aeb:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
 aed:	e8 1e ff ff ff       	call   a10 <random>
 af2:	89 c1                	mov    %eax,%ecx
 af4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 af9:	f7 e9                	imul   %ecx
 afb:	89 c8                	mov    %ecx,%eax
 afd:	c1 f8 1f             	sar    $0x1f,%eax
 b00:	c1 fa 05             	sar    $0x5,%edx
 b03:	29 c2                	sub    %eax,%edx
 b05:	6b c2 64             	imul   $0x64,%edx,%eax
 b08:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
 b0a:	39 cf                	cmp    %ecx,%edi
 b0c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
 b12:	74 5f                	je     b73 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
 b14:	6b c7 66             	imul   $0x66,%edi,%eax
 b17:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
 b1d:	83 ec 08             	sub    $0x8,%esp
 b20:	01 c1                	add    %eax,%ecx
 b22:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b28:	51                   	push   %ecx
 b29:	50                   	push   %eax
 b2a:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
 b30:	e8 2b f5 ff ff       	call   60 <strcpy>
        strcpy(lines[line1], lines[line2]);
 b35:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 b3b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 b41:	6b d2 66             	imul   $0x66,%edx,%edx
 b44:	01 c2                	add    %eax,%edx
 b46:	58                   	pop    %eax
 b47:	59                   	pop    %ecx
 b48:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
 b4e:	52                   	push   %edx
 b4f:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 b55:	51                   	push   %ecx
 b56:	e8 05 f5 ff ff       	call   60 <strcpy>
        strcpy(lines[line2], temp);
 b5b:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 b61:	5f                   	pop    %edi
 b62:	58                   	pop    %eax
 b63:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b69:	50                   	push   %eax
 b6a:	52                   	push   %edx
 b6b:	e8 f0 f4 ff ff       	call   60 <strcpy>
 b70:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 b73:	83 ec 0c             	sub    $0xc,%esp
 b76:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 b7c:	e8 5a f7 ff ff       	call   2db <close>
    fp = open(file_path, O_RDWR);
 b81:	58                   	pop    %eax
 b82:	5a                   	pop    %edx
 b83:	6a 02                	push   $0x2
 b85:	ff 75 08             	push   0x8(%ebp)
 b88:	e8 66 f7 ff ff       	call   2f3 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 b8d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 b8e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 b90:	58                   	pop    %eax
 b91:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 b97:	50                   	push   %eax
 b98:	57                   	push   %edi
 b99:	e8 6d f7 ff ff       	call   30b <fstat>
    char *buffer = malloc(0);
 b9e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 ba5:	e8 96 fa ff ff       	call   640 <malloc>
    memset(buffer, 0, 0);  
 baa:	83 c4 0c             	add    $0xc,%esp
 bad:	6a 00                	push   $0x0
 baf:	6a 00                	push   $0x0
 bb1:	50                   	push   %eax
 bb2:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 bb8:	e8 63 f5 ff ff       	call   120 <memset>
    write(fp, buffer, 0);
 bbd:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 bc3:	83 c4 0c             	add    $0xc,%esp
 bc6:	6a 00                	push   $0x0
 bc8:	52                   	push   %edx
 bc9:	57                   	push   %edi
 bca:	e8 04 f7 ff ff       	call   2d3 <write>
    free(buffer);
 bcf:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 bd5:	89 14 24             	mov    %edx,(%esp)
 bd8:	e8 d3 f9 ff ff       	call   5b0 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 bdd:	83 c4 10             	add    $0x10,%esp
 be0:	85 ff                	test   %edi,%edi
 be2:	78 59                	js     c3d <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 be4:	85 db                	test   %ebx,%ebx
 be6:	74 26                	je     c0e <permute_line+0x1be>
 be8:	6b db 66             	imul   $0x66,%ebx,%ebx
 beb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 bf1:	01 c3                	add    %eax,%ebx
 bf3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bf7:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 bf8:	83 ec 04             	sub    $0x4,%esp
 bfb:	6a 66                	push   $0x66
 bfd:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 bfe:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 c01:	57                   	push   %edi
 c02:	e8 cc f6 ff ff       	call   2d3 <write>
    for (int i = 0; i < line_idx; i++) {
 c07:	83 c4 10             	add    $0x10,%esp
 c0a:	39 de                	cmp    %ebx,%esi
 c0c:	75 ea                	jne    bf8 <permute_line+0x1a8>
    }

    close(fp);
 c0e:	83 ec 0c             	sub    $0xc,%esp
 c11:	57                   	push   %edi
 c12:	e8 c4 f6 ff ff       	call   2db <close>
    return 0;
 c17:	83 c4 10             	add    $0x10,%esp
 c1a:	31 c0                	xor    %eax,%eax
 c1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 c1f:	5b                   	pop    %ebx
 c20:	5e                   	pop    %esi
 c21:	5f                   	pop    %edi
 c22:	5d                   	pop    %ebp
 c23:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 c24:	83 ec 08             	sub    $0x8,%esp
 c27:	68 d0 0f 00 00       	push   $0xfd0
 c2c:	6a 01                	push   $0x1
 c2e:	e8 dd f7 ff ff       	call   410 <printf>
        return -1;
 c33:	83 c4 10             	add    $0x10,%esp
 c36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c3b:	eb df                	jmp    c1c <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 c3d:	83 ec 08             	sub    $0x8,%esp
 c40:	68 18 10 00 00       	push   $0x1018
 c45:	6a 01                	push   $0x1
 c47:	e8 c4 f7 ff ff       	call   410 <printf>
        return -1;
 c4c:	83 c4 10             	add    $0x10,%esp
 c4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c54:	eb c6                	jmp    c1c <permute_line+0x1cc>
 c56:	66 90                	xchg   %ax,%ax
 c58:	66 90                	xchg   %ax,%ax
 c5a:	66 90                	xchg   %ax,%ax
 c5c:	66 90                	xchg   %ax,%ax
 c5e:	66 90                	xchg   %ax,%ax

00000c60 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
 c60:	55                   	push   %ebp
 c61:	89 e5                	mov    %esp,%ebp
 c63:	57                   	push   %edi
 c64:	56                   	push   %esi
 c65:	53                   	push   %ebx
 c66:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 c6c:	83 0c 24 00          	orl    $0x0,(%esp)
 c70:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 c76:	83 0c 24 00          	orl    $0x0,(%esp)
 c7a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
 c80:	6a 00                	push   $0x0
 c82:	ff 75 08             	push   0x8(%ebp)
 c85:	e8 69 f6 ff ff       	call   2f3 <open>
    if (fp < 0) {
 c8a:	83 c4 10             	add    $0x10,%esp
 c8d:	85 c0                	test   %eax,%eax
 c8f:	0f 88 b1 00 00 00    	js     d46 <add_line+0xe6>
 c95:	89 c3                	mov    %eax,%ebx
 c97:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 c9d:	31 f6                	xor    %esi,%esi
 c9f:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
 ca5:	89 c7                	mov    %eax,%edi
 ca7:	eb 12                	jmp    cbb <add_line+0x5b>
 ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 cb0:	83 c7 66             	add    $0x66,%edi
 cb3:	83 fe 64             	cmp    $0x64,%esi
 cb6:	74 1c                	je     cd4 <add_line+0x74>
        line_idx++;
 cb8:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 cbb:	83 ec 04             	sub    $0x4,%esp
 cbe:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
 cc4:	6a 66                	push   $0x66
 cc6:	57                   	push   %edi
 cc7:	53                   	push   %ebx
 cc8:	e8 fe f5 ff ff       	call   2cb <read>
 ccd:	83 c4 10             	add    $0x10,%esp
 cd0:	85 c0                	test   %eax,%eax
 cd2:	7f dc                	jg     cb0 <add_line+0x50>
    }
    close(fp); 
 cd4:	83 ec 0c             	sub    $0xc,%esp
 cd7:	53                   	push   %ebx
 cd8:	e8 fe f5 ff ff       	call   2db <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 cdd:	58                   	pop    %eax
 cde:	5a                   	pop    %edx
 cdf:	ff 75 0c             	push   0xc(%ebp)
 ce2:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 ce8:	e8 73 f3 ff ff       	call   60 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 ced:	59                   	pop    %ecx
 cee:	5b                   	pop    %ebx
 cef:	6a 01                	push   $0x1
 cf1:	ff 75 08             	push   0x8(%ebp)
 cf4:	e8 fa f5 ff ff       	call   2f3 <open>
    if (fp < 0) {
 cf9:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
 cfc:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
 cfe:	85 c0                	test   %eax,%eax
 d00:	78 5d                	js     d5f <add_line+0xff>
 d02:	6b ce 66             	imul   $0x66,%esi,%ecx
 d05:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
 d0b:	8d 78 66             	lea    0x66(%eax),%edi
 d0e:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
 d11:	eb 08                	jmp    d1b <add_line+0xbb>
 d13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d17:	90                   	nop
 d18:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
 d1b:	83 ec 04             	sub    $0x4,%esp
 d1e:	6a 66                	push   $0x66
 d20:	50                   	push   %eax
 d21:	53                   	push   %ebx
 d22:	e8 ac f5 ff ff       	call   2d3 <write>
    for (int i = 0; i < line_idx; i++) {
 d27:	89 f8                	mov    %edi,%eax
 d29:	83 c4 10             	add    $0x10,%esp
 d2c:	39 f7                	cmp    %esi,%edi
 d2e:	75 e8                	jne    d18 <add_line+0xb8>
    }

    close(fp);
 d30:	83 ec 0c             	sub    $0xc,%esp
 d33:	53                   	push   %ebx
 d34:	e8 a2 f5 ff ff       	call   2db <close>
    return 0;
 d39:	83 c4 10             	add    $0x10,%esp
 d3c:	31 c0                	xor    %eax,%eax
}
 d3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 d41:	5b                   	pop    %ebx
 d42:	5e                   	pop    %esi
 d43:	5f                   	pop    %edi
 d44:	5d                   	pop    %ebp
 d45:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
 d46:	83 ec 08             	sub    $0x8,%esp
 d49:	68 54 10 00 00       	push   $0x1054
 d4e:	6a 01                	push   $0x1
 d50:	e8 bb f6 ff ff       	call   410 <printf>
        return -1;
 d55:	83 c4 10             	add    $0x10,%esp
 d58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d5d:	eb df                	jmp    d3e <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 d5f:	83 ec 08             	sub    $0x8,%esp
 d62:	68 78 10 00 00       	push   $0x1078
 d67:	6a 01                	push   $0x1
 d69:	e8 a2 f6 ff ff       	call   410 <printf>
        return -1;
 d6e:	83 c4 10             	add    $0x10,%esp
 d71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d76:	eb c6                	jmp    d3e <add_line+0xde>
 d78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d7f:	90                   	nop

00000d80 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
 d80:	55                   	push   %ebp
 d81:	89 e5                	mov    %esp,%ebp
 d83:	57                   	push   %edi
 d84:	56                   	push   %esi
 d85:	53                   	push   %ebx
 d86:	83 ec 0c             	sub    $0xc,%esp
 d89:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d8c:	8d 73 64             	lea    0x64(%ebx),%esi
 d8f:	89 f7                	mov    %esi,%edi
 d91:	8b 75 0c             	mov    0xc(%ebp),%esi
 d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
 d98:	e8 73 fc ff ff       	call   a10 <random>
 d9d:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 d9f:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
 da2:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
 da5:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 da9:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 dac:	39 fb                	cmp    %edi,%ebx
 dae:	75 e8                	jne    d98 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
 db0:	8b 45 08             	mov    0x8(%ebp),%eax
 db3:	ba 0a 00 00 00       	mov    $0xa,%edx
 db8:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
 dbc:	83 c4 0c             	add    $0xc,%esp
 dbf:	5b                   	pop    %ebx
 dc0:	5e                   	pop    %esi
 dc1:	5f                   	pop    %edi
 dc2:	5d                   	pop    %ebp
 dc3:	c3                   	ret    
 dc4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 dcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 dcf:	90                   	nop

00000dd0 <write_random_string>:

int write_random_string(char file_path[]) {
 dd0:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 dd1:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
 dd6:	89 e5                	mov    %esp,%ebp
 dd8:	57                   	push   %edi
 dd9:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 dda:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
 de0:	be 9c 10 00 00       	mov    $0x109c,%esi
int write_random_string(char file_path[]) {
 de5:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
 de6:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
 deb:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 df1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 df3:	0f b7 06             	movzwl (%esi),%eax
 df6:	8d 75 e6             	lea    -0x1a(%ebp),%esi
 df9:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 dfc:	8d 7d 82             	lea    -0x7e(%ebp),%edi
 dff:	90                   	nop
        int idx_new_char = random() % size_char_set;
 e00:	e8 0b fc ff ff       	call   a10 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e05:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
 e08:	89 c1                	mov    %eax,%ecx
 e0a:	f7 e3                	mul    %ebx
 e0c:	c1 ea 06             	shr    $0x6,%edx
 e0f:	6b d2 55             	imul   $0x55,%edx,%edx
 e12:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
 e14:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
 e1b:	ff 
 e1c:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e1f:	39 f7                	cmp    %esi,%edi
 e21:	75 dd                	jne    e00 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
 e23:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
 e28:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
 e2b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
 e2f:	8d 45 82             	lea    -0x7e(%ebp),%eax
 e32:	50                   	push   %eax
 e33:	ff 75 08             	push   0x8(%ebp)
 e36:	e8 25 fe ff ff       	call   c60 <add_line>

    return 0;
}
 e3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e3e:	31 c0                	xor    %eax,%eax
 e40:	5b                   	pop    %ebx
 e41:	5e                   	pop    %esi
 e42:	5f                   	pop    %edi
 e43:	5d                   	pop    %ebp
 e44:	c3                   	ret    
 e45:	66 90                	xchg   %ax,%ax
 e47:	66 90                	xchg   %ax,%ax
 e49:	66 90                	xchg   %ax,%ax
 e4b:	66 90                	xchg   %ax,%ax
 e4d:	66 90                	xchg   %ax,%ax
 e4f:	90                   	nop

00000e50 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
 e50:	55                   	push   %ebp
 e51:	89 e5                	mov    %esp,%ebp
 e53:	56                   	push   %esi
 e54:	8b 75 08             	mov    0x8(%ebp),%esi
 e57:	53                   	push   %ebx
 e58:	bb 64 00 00 00       	mov    $0x64,%ebx
 e5d:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
 e60:	83 ec 0c             	sub    $0xc,%esp
 e63:	56                   	push   %esi
 e64:	e8 67 ff ff ff       	call   dd0 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
 e69:	83 c4 10             	add    $0x10,%esp
 e6c:	83 eb 01             	sub    $0x1,%ebx
 e6f:	75 ef                	jne    e60 <io_bound+0x10>
 e71:	bb 32 00 00 00       	mov    $0x32,%ebx
 e76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e7d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
 e80:	83 ec 0c             	sub    $0xc,%esp
 e83:	56                   	push   %esi
 e84:	e8 c7 fb ff ff       	call   a50 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
 e89:	83 c4 10             	add    $0x10,%esp
 e8c:	83 eb 01             	sub    $0x1,%ebx
 e8f:	75 ef                	jne    e80 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
 e91:	83 ec 0c             	sub    $0xc,%esp
 e94:	56                   	push   %esi
 e95:	e8 69 f4 ff ff       	call   303 <unlink>
 e9a:	83 c4 10             	add    $0x10,%esp
 e9d:	85 c0                	test   %eax,%eax
 e9f:	75 07                	jne    ea8 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
 ea1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 ea4:	5b                   	pop    %ebx
 ea5:	5e                   	pop    %esi
 ea6:	5d                   	pop    %ebp
 ea7:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
 ea8:	83 ec 08             	sub    $0x8,%esp
 eab:	68 f4 10 00 00       	push   $0x10f4
 eb0:	6a 01                	push   $0x1
 eb2:	e8 59 f5 ff ff       	call   410 <printf>
 eb7:	83 c4 10             	add    $0x10,%esp
 eba:	8d 65 f8             	lea    -0x8(%ebp),%esp
 ebd:	5b                   	pop    %ebx
 ebe:	5e                   	pop    %esi
 ebf:	5d                   	pop    %ebp
 ec0:	c3                   	ret    
 ec1:	66 90                	xchg   %ax,%ax
 ec3:	66 90                	xchg   %ax,%ax
 ec5:	66 90                	xchg   %ax,%ax
 ec7:	66 90                	xchg   %ax,%ax
 ec9:	66 90                	xchg   %ax,%ax
 ecb:	66 90                	xchg   %ax,%ax
 ecd:	66 90                	xchg   %ax,%ax
 ecf:	90                   	nop

00000ed0 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
 ed0:	55                   	push   %ebp
 ed1:	89 e5                	mov    %esp,%ebp
 ed3:	57                   	push   %edi
 ed4:	56                   	push   %esi
 ed5:	53                   	push   %ebx
 ed6:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
 edd:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 ee3:	83 0c 24 00          	orl    $0x0,(%esp)
 ee7:	39 c4                	cmp    %eax,%esp
 ee9:	75 f2                	jne    edd <cpu_bound+0xd>
 eeb:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
 ef1:	be e8 03 00 00       	mov    $0x3e8,%esi
 ef6:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
 efc:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
 f02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
 f08:	83 ec 04             	sub    $0x4,%esp
 f0b:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
 f11:	57                   	push   %edi
 f12:	50                   	push   %eax
 f13:	53                   	push   %ebx
 f14:	e8 e7 f9 ff ff       	call   900 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 f19:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 f1f:	89 04 24             	mov    %eax,(%esp)
 f22:	6a 00                	push   $0x0
 f24:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 f2a:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 f30:	53                   	push   %ebx
 f31:	e8 6a f8 ff ff       	call   7a0 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
 f36:	83 c4 20             	add    $0x20,%esp
 f39:	83 ee 01             	sub    $0x1,%esi
 f3c:	75 ca                	jne    f08 <cpu_bound+0x38>
    }
 f3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 f41:	5b                   	pop    %ebx
 f42:	5e                   	pop    %esi
 f43:	5f                   	pop    %edi
 f44:	5d                   	pop    %ebp
 f45:	c3                   	ret    
