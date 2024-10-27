
_echo: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  23:	83 c3 01             	add    $0x1,%ebx
  26:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  2a:	39 f3                	cmp    %esi,%ebx
  2c:	74 22                	je     50 <main+0x50>
  2e:	66 90                	xchg   %ax,%ax
  30:	68 58 0a 00 00       	push   $0xa58
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 5a 0a 00 00       	push   $0xa5a
  3e:	6a 01                	push   $0x1
  40:	e8 db 03 00 00       	call   420 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 f3                	cmp    %esi,%ebx
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 5f 0a 00 00       	push   $0xa5f
  55:	50                   	push   %eax
  56:	68 5a 0a 00 00       	push   $0xa5a
  5b:	6a 01                	push   $0x1
  5d:	e8 be 03 00 00       	call   420 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit();
  65:	e8 59 02 00 00       	call   2c3 <exit>
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave  
  94:	c3                   	ret    
  95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
    p++, q++;
  c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave  
  d5:	c3                   	ret    
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave  
  ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave  
 148:	c3                   	ret    
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 18f:	90                   	nop

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	57                   	push   %edi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 2e 01 00 00       	call   2db <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 1d                	je     1e0 <gets+0x50>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 19                	je     1e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1c7:	89 de                	mov    %ebx,%esi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    
  buf[i] = '\0';
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	89 de                	mov    %ebx,%esi
 1e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5f                   	pop    %edi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	push   0x8(%ebp)
 20d:	e8 f1 00 00 00       	call   303 <open>
  if(fd < 0)
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	push   0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 f4 00 00 00       	call   31b <fstat>
  close(fd);
 227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22a:	89 c6                	mov    %eax,%esi
  close(fd);
 22c:	e8 ba 00 00 00       	call   2eb <close>
  return r;
 231:	83 c4 10             	add    $0x10,%esp
}
 234:	8d 65 f8             	lea    -0x8(%ebp),%esp
 237:	89 f0                	mov    %esi,%eax
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 02             	movsbl (%edx),%eax
 25a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 25d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 260:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 265:	77 1e                	ja     285 <atoi+0x35>
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 288:	89 c8                	mov    %ecx,%eax
 28a:	c9                   	leave  
 28b:	c3                   	ret    
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 45 10             	mov    0x10(%ebp),%eax
 297:	8b 55 08             	mov    0x8(%ebp),%edx
 29a:	56                   	push   %esi
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 c0                	test   %eax,%eax
 2a0:	7e 13                	jle    2b5 <memmove+0x25>
 2a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a4:	89 d7                	mov    %edx,%edi
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    

000002bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2bb:	b8 01 00 00 00       	mov    $0x1,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <exit>:
SYSCALL(exit)
 2c3:	b8 02 00 00 00       	mov    $0x2,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <wait>:
SYSCALL(wait)
 2cb:	b8 03 00 00 00       	mov    $0x3,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <pipe>:
SYSCALL(pipe)
 2d3:	b8 04 00 00 00       	mov    $0x4,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <read>:
SYSCALL(read)
 2db:	b8 05 00 00 00       	mov    $0x5,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <write>:
SYSCALL(write)
 2e3:	b8 10 00 00 00       	mov    $0x10,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <close>:
SYSCALL(close)
 2eb:	b8 15 00 00 00       	mov    $0x15,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <kill>:
SYSCALL(kill)
 2f3:	b8 06 00 00 00       	mov    $0x6,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <exec>:
SYSCALL(exec)
 2fb:	b8 07 00 00 00       	mov    $0x7,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <open>:
SYSCALL(open)
 303:	b8 0f 00 00 00       	mov    $0xf,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <mknod>:
SYSCALL(mknod)
 30b:	b8 11 00 00 00       	mov    $0x11,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <unlink>:
SYSCALL(unlink)
 313:	b8 12 00 00 00       	mov    $0x12,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <fstat>:
SYSCALL(fstat)
 31b:	b8 08 00 00 00       	mov    $0x8,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <link>:
SYSCALL(link)
 323:	b8 13 00 00 00       	mov    $0x13,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <mkdir>:
SYSCALL(mkdir)
 32b:	b8 14 00 00 00       	mov    $0x14,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <chdir>:
SYSCALL(chdir)
 333:	b8 09 00 00 00       	mov    $0x9,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <dup>:
SYSCALL(dup)
 33b:	b8 0a 00 00 00       	mov    $0xa,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <getpid>:
SYSCALL(getpid)
 343:	b8 0b 00 00 00       	mov    $0xb,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <sbrk>:
SYSCALL(sbrk)
 34b:	b8 0c 00 00 00       	mov    $0xc,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <sleep>:
SYSCALL(sleep)
 353:	b8 0d 00 00 00       	mov    $0xd,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <uptime>:
SYSCALL(uptime)
 35b:	b8 0e 00 00 00       	mov    $0xe,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    
 363:	66 90                	xchg   %ax,%ax
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 3c             	sub    $0x3c,%esp
 379:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 37c:	89 d1                	mov    %edx,%ecx
{
 37e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 381:	85 d2                	test   %edx,%edx
 383:	0f 89 7f 00 00 00    	jns    408 <printint+0x98>
 389:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 38d:	74 79                	je     408 <printint+0x98>
    neg = 1;
 38f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 396:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 398:	31 db                	xor    %ebx,%ebx
 39a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 cf                	mov    %ecx,%edi
 3a6:	f7 75 c4             	divl   -0x3c(%ebp)
 3a9:	0f b6 92 c0 0a 00 00 	movzbl 0xac0(%edx),%edx
 3b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3b3:	89 d8                	mov    %ebx,%eax
 3b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3c1:	76 dd                	jbe    3a0 <printint+0x30>
  if(neg)
 3c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3c6:	85 c9                	test   %ecx,%ecx
 3c8:	74 0c                	je     3d6 <printint+0x66>
    buf[i++] = '-';
 3ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3dd:	eb 07                	jmp    3e6 <printint+0x76>
 3df:	90                   	nop
    putc(fd, buf[i]);
 3e0:	0f b6 13             	movzbl (%ebx),%edx
 3e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3e6:	83 ec 04             	sub    $0x4,%esp
 3e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ec:	6a 01                	push   $0x1
 3ee:	56                   	push   %esi
 3ef:	57                   	push   %edi
 3f0:	e8 ee fe ff ff       	call   2e3 <write>
  while(--i >= 0)
 3f5:	83 c4 10             	add    $0x10,%esp
 3f8:	39 de                	cmp    %ebx,%esi
 3fa:	75 e4                	jne    3e0 <printint+0x70>
}
 3fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ff:	5b                   	pop    %ebx
 400:	5e                   	pop    %esi
 401:	5f                   	pop    %edi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 408:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 40f:	eb 87                	jmp    398 <printint+0x28>
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 42c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 42f:	0f b6 13             	movzbl (%ebx),%edx
 432:	84 d2                	test   %dl,%dl
 434:	74 6a                	je     4a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 436:	8d 45 10             	lea    0x10(%ebp),%eax
 439:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 43c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 43f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 441:	89 45 d0             	mov    %eax,-0x30(%ebp)
 444:	eb 36                	jmp    47c <printf+0x5c>
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 453:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 458:	83 f8 25             	cmp    $0x25,%eax
 45b:	74 15                	je     472 <printf+0x52>
  write(fd, &c, 1);
 45d:	83 ec 04             	sub    $0x4,%esp
 460:	88 55 e7             	mov    %dl,-0x19(%ebp)
 463:	6a 01                	push   $0x1
 465:	57                   	push   %edi
 466:	56                   	push   %esi
 467:	e8 77 fe ff ff       	call   2e3 <write>
 46c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 46f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 472:	0f b6 13             	movzbl (%ebx),%edx
 475:	83 c3 01             	add    $0x1,%ebx
 478:	84 d2                	test   %dl,%dl
 47a:	74 24                	je     4a0 <printf+0x80>
    c = fmt[i] & 0xff;
 47c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 47f:	85 c9                	test   %ecx,%ecx
 481:	74 cd                	je     450 <printf+0x30>
      }
    } else if(state == '%'){
 483:	83 f9 25             	cmp    $0x25,%ecx
 486:	75 ea                	jne    472 <printf+0x52>
      if(c == 'd'){
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	0f 84 07 01 00 00    	je     598 <printf+0x178>
 491:	83 e8 63             	sub    $0x63,%eax
 494:	83 f8 15             	cmp    $0x15,%eax
 497:	77 17                	ja     4b0 <printf+0x90>
 499:	ff 24 85 68 0a 00 00 	jmp    *0xa68(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a3:	5b                   	pop    %ebx
 4a4:	5e                   	pop    %esi
 4a5:	5f                   	pop    %edi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
  write(fd, &c, 1);
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4b6:	6a 01                	push   $0x1
 4b8:	57                   	push   %edi
 4b9:	56                   	push   %esi
 4ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4be:	e8 20 fe ff ff       	call   2e3 <write>
        putc(fd, c);
 4c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4c7:	83 c4 0c             	add    $0xc,%esp
 4ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4cd:	6a 01                	push   $0x1
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	e8 0d fe ff ff       	call   2e3 <write>
        putc(fd, c);
 4d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4d9:	31 c9                	xor    %ecx,%ecx
 4db:	eb 95                	jmp    472 <printf+0x52>
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4e0:	83 ec 0c             	sub    $0xc,%esp
 4e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e8:	6a 00                	push   $0x0
 4ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4ed:	8b 10                	mov    (%eax),%edx
 4ef:	89 f0                	mov    %esi,%eax
 4f1:	e8 7a fe ff ff       	call   370 <printint>
        ap++;
 4f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4fd:	31 c9                	xor    %ecx,%ecx
 4ff:	e9 6e ff ff ff       	jmp    472 <printf+0x52>
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 508:	8b 45 d0             	mov    -0x30(%ebp),%eax
 50b:	8b 10                	mov    (%eax),%edx
        ap++;
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 513:	85 d2                	test   %edx,%edx
 515:	0f 84 8d 00 00 00    	je     5a8 <printf+0x188>
        while(*s != 0){
 51b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 51e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 520:	84 c0                	test   %al,%al
 522:	0f 84 4a ff ff ff    	je     472 <printf+0x52>
 528:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 52b:	89 d3                	mov    %edx,%ebx
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
          s++;
 533:	83 c3 01             	add    $0x1,%ebx
 536:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 539:	6a 01                	push   $0x1
 53b:	57                   	push   %edi
 53c:	56                   	push   %esi
 53d:	e8 a1 fd ff ff       	call   2e3 <write>
        while(*s != 0){
 542:	0f b6 03             	movzbl (%ebx),%eax
 545:	83 c4 10             	add    $0x10,%esp
 548:	84 c0                	test   %al,%al
 54a:	75 e4                	jne    530 <printf+0x110>
      state = 0;
 54c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 54f:	31 c9                	xor    %ecx,%ecx
 551:	e9 1c ff ff ff       	jmp    472 <printf+0x52>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 0a 00 00 00       	mov    $0xa,%ecx
 568:	6a 01                	push   $0x1
 56a:	e9 7b ff ff ff       	jmp    4ea <printf+0xca>
 56f:	90                   	nop
        putc(fd, *ap);
 570:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 573:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 576:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 578:	6a 01                	push   $0x1
 57a:	57                   	push   %edi
 57b:	56                   	push   %esi
        putc(fd, *ap);
 57c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 57f:	e8 5f fd ff ff       	call   2e3 <write>
        ap++;
 584:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 588:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58b:	31 c9                	xor    %ecx,%ecx
 58d:	e9 e0 fe ff ff       	jmp    472 <printf+0x52>
 592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 598:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 59b:	83 ec 04             	sub    $0x4,%esp
 59e:	e9 2a ff ff ff       	jmp    4cd <printf+0xad>
 5a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5a7:	90                   	nop
          s = "(null)";
 5a8:	ba 61 0a 00 00       	mov    $0xa61,%edx
        while(*s != 0){
 5ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5b0:	b8 28 00 00 00       	mov    $0x28,%eax
 5b5:	89 d3                	mov    %edx,%ebx
 5b7:	e9 74 ff ff ff       	jmp    530 <printf+0x110>
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 34 0e 00 00       	mov    0xe34,%eax
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	89 c2                	mov    %eax,%edx
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	39 ca                	cmp    %ecx,%edx
 5de:	73 30                	jae    610 <free+0x50>
 5e0:	39 c1                	cmp    %eax,%ecx
 5e2:	72 04                	jb     5e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e4:	39 c2                	cmp    %eax,%edx
 5e6:	72 f0                	jb     5d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ee:	39 f8                	cmp    %edi,%eax
 5f0:	74 30                	je     622 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5f5:	8b 42 04             	mov    0x4(%edx),%eax
 5f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5fb:	39 f1                	cmp    %esi,%ecx
 5fd:	74 3a                	je     639 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 601:	5b                   	pop    %ebx
  freep = p;
 602:	89 15 34 0e 00 00    	mov    %edx,0xe34
}
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 610:	39 c2                	cmp    %eax,%edx
 612:	72 c4                	jb     5d8 <free+0x18>
 614:	39 c1                	cmp    %eax,%ecx
 616:	73 c0                	jae    5d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 618:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 61e:	39 f8                	cmp    %edi,%eax
 620:	75 d0                	jne    5f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 622:	03 70 04             	add    0x4(%eax),%esi
 625:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 628:	8b 02                	mov    (%edx),%eax
 62a:	8b 00                	mov    (%eax),%eax
 62c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 62f:	8b 42 04             	mov    0x4(%edx),%eax
 632:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 635:	39 f1                	cmp    %esi,%ecx
 637:	75 c6                	jne    5ff <free+0x3f>
    p->s.size += bp->s.size;
 639:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 63c:	89 15 34 0e 00 00    	mov    %edx,0xe34
    p->s.size += bp->s.size;
 642:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 645:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 648:	89 0a                	mov    %ecx,(%edx)
}
 64a:	5b                   	pop    %ebx
 64b:	5e                   	pop    %esi
 64c:	5f                   	pop    %edi
 64d:	5d                   	pop    %ebp
 64e:	c3                   	ret    
 64f:	90                   	nop

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 65c:	8b 3d 34 0e 00 00    	mov    0xe34,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	8d 70 07             	lea    0x7(%eax),%esi
 665:	c1 ee 03             	shr    $0x3,%esi
 668:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 66b:	85 ff                	test   %edi,%edi
 66d:	0f 84 9d 00 00 00    	je     710 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 673:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 675:	8b 4a 04             	mov    0x4(%edx),%ecx
 678:	39 f1                	cmp    %esi,%ecx
 67a:	73 6a                	jae    6e6 <malloc+0x96>
 67c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 681:	39 de                	cmp    %ebx,%esi
 683:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 686:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 68d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 690:	eb 17                	jmp    6a9 <malloc+0x59>
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 69a:	8b 48 04             	mov    0x4(%eax),%ecx
 69d:	39 f1                	cmp    %esi,%ecx
 69f:	73 4f                	jae    6f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a1:	8b 3d 34 0e 00 00    	mov    0xe34,%edi
 6a7:	89 c2                	mov    %eax,%edx
 6a9:	39 d7                	cmp    %edx,%edi
 6ab:	75 eb                	jne    698 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6ad:	83 ec 0c             	sub    $0xc,%esp
 6b0:	ff 75 e4             	push   -0x1c(%ebp)
 6b3:	e8 93 fc ff ff       	call   34b <sbrk>
  if(p == (char*)-1)
 6b8:	83 c4 10             	add    $0x10,%esp
 6bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6be:	74 1c                	je     6dc <malloc+0x8c>
  hp->s.size = nu;
 6c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	83 c0 08             	add    $0x8,%eax
 6c9:	50                   	push   %eax
 6ca:	e8 f1 fe ff ff       	call   5c0 <free>
  return freep;
 6cf:	8b 15 34 0e 00 00    	mov    0xe34,%edx
      if((p = morecore(nunits)) == 0)
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	85 d2                	test   %edx,%edx
 6da:	75 bc                	jne    698 <malloc+0x48>
        return 0;
  }
}
 6dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6df:	31 c0                	xor    %eax,%eax
}
 6e1:	5b                   	pop    %ebx
 6e2:	5e                   	pop    %esi
 6e3:	5f                   	pop    %edi
 6e4:	5d                   	pop    %ebp
 6e5:	c3                   	ret    
    if(p->s.size >= nunits){
 6e6:	89 d0                	mov    %edx,%eax
 6e8:	89 fa                	mov    %edi,%edx
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6f0:	39 ce                	cmp    %ecx,%esi
 6f2:	74 4c                	je     740 <malloc+0xf0>
        p->s.size -= nunits;
 6f4:	29 f1                	sub    %esi,%ecx
 6f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6ff:	89 15 34 0e 00 00    	mov    %edx,0xe34
}
 705:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 708:	83 c0 08             	add    $0x8,%eax
}
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 710:	c7 05 34 0e 00 00 38 	movl   $0xe38,0xe34
 717:	0e 00 00 
    base.s.size = 0;
 71a:	bf 38 0e 00 00       	mov    $0xe38,%edi
    base.s.ptr = freep = prevp = &base;
 71f:	c7 05 38 0e 00 00 38 	movl   $0xe38,0xe38
 726:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 729:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 72b:	c7 05 3c 0e 00 00 00 	movl   $0x0,0xe3c
 732:	00 00 00 
    if(p->s.size >= nunits){
 735:	e9 42 ff ff ff       	jmp    67c <malloc+0x2c>
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb b9                	jmp    6ff <malloc+0xaf>
 746:	66 90                	xchg   %ax,%ax
 748:	66 90                	xchg   %ax,%ax
 74a:	66 90                	xchg   %ax,%ax
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 04             	sub    $0x4,%esp
 759:	8b 5d 10             	mov    0x10(%ebp),%ebx
 75c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 75f:	85 db                	test   %ebx,%ebx
 761:	7e 3d                	jle    7a0 <min_distance_vertex+0x50>
    int min_idx = 0;
 763:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 765:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 767:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 76c:	89 75 f0             	mov    %esi,-0x10(%ebp)
 76f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 770:	8b 14 87             	mov    (%edi,%eax,4),%edx
 773:	39 ca                	cmp    %ecx,%edx
 775:	7d 14                	jge    78b <min_distance_vertex+0x3b>
 777:	8b 75 0c             	mov    0xc(%ebp),%esi
 77a:	8b 34 86             	mov    (%esi,%eax,4),%esi
 77d:	85 f6                	test   %esi,%esi
 77f:	8b 75 f0             	mov    -0x10(%ebp),%esi
 782:	0f 44 ca             	cmove  %edx,%ecx
 785:	0f 44 f0             	cmove  %eax,%esi
 788:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 78b:	83 c0 01             	add    $0x1,%eax
 78e:	39 c3                	cmp    %eax,%ebx
 790:	75 de                	jne    770 <min_distance_vertex+0x20>
 792:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 795:	83 c4 04             	add    $0x4,%esp
 798:	5b                   	pop    %ebx
 799:	89 f0                	mov    %esi,%eax
 79b:	5e                   	pop    %esi
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
 79e:	c3                   	ret    
 79f:	90                   	nop
 7a0:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 7a3:	31 f6                	xor    %esi,%esi
}
 7a5:	5b                   	pop    %ebx
 7a6:	89 f0                	mov    %esi,%eax
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007b0 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 7b9:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 7bc:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 7bf:	89 e6                	mov    %esp,%esi
 7c1:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 7c8:	8d 41 0f             	lea    0xf(%ecx),%eax
 7cb:	89 c2                	mov    %eax,%edx
 7cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 7d2:	29 c6                	sub    %eax,%esi
 7d4:	83 e2 f0             	and    $0xfffffff0,%edx
 7d7:	39 f4                	cmp    %esi,%esp
 7d9:	74 12                	je     7ed <dijkstra+0x3d>
 7db:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 7e1:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 7e8:	00 
 7e9:	39 f4                	cmp    %esi,%esp
 7eb:	75 ee                	jne    7db <dijkstra+0x2b>
 7ed:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 7f3:	29 d4                	sub    %edx,%esp
 7f5:	85 d2                	test   %edx,%edx
 7f7:	0f 85 ef 00 00 00    	jne    8ec <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 7fd:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 800:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 802:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 805:	8b 45 0c             	mov    0xc(%ebp),%eax
 808:	85 c0                	test   %eax,%eax
 80a:	0f 8e e6 00 00 00    	jle    8f6 <dijkstra+0x146>
 810:	89 d8                	mov    %ebx,%eax
 812:	89 fa                	mov    %edi,%edx
 814:	01 d9                	add    %ebx,%ecx
 816:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 820:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 826:	83 c0 04             	add    $0x4,%eax
 829:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 82c:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 833:	39 c8                	cmp    %ecx,%eax
 835:	75 e9                	jne    820 <dijkstra+0x70>
    dist[src] = 0;
 837:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 83d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 848:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 84a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 84f:	31 c0                	xor    %eax,%eax
 851:	eb 07                	jmp    85a <dijkstra+0xaa>
 853:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 857:	90                   	nop
 858:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 85a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 85d:	39 ca                	cmp    %ecx,%edx
 85f:	7d 0a                	jge    86b <dijkstra+0xbb>
 861:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 865:	0f 44 f0             	cmove  %eax,%esi
 868:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 86b:	8d 50 01             	lea    0x1(%eax),%edx
 86e:	39 55 0c             	cmp    %edx,0xc(%ebp)
 871:	75 e5                	jne    858 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 873:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 876:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 87d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 883:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 886:	75 18                	jne    8a0 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 888:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 88b:	8d 56 01             	lea    0x1(%esi),%edx
 88e:	39 c6                	cmp    %eax,%esi
 890:	74 52                	je     8e4 <dijkstra+0x134>
 892:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 895:	eb b1                	jmp    848 <dijkstra+0x98>
 897:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 8a0:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 8a6:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 8a9:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 8ac:	31 d2                	xor    %edx,%edx
 8ae:	eb 02                	jmp    8b2 <dijkstra+0x102>
 8b0:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 8b2:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 8b5:	85 c9                	test   %ecx,%ecx
 8b7:	74 17                	je     8d0 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 8b9:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 8bc:	85 db                	test   %ebx,%ebx
 8be:	75 10                	jne    8d0 <dijkstra+0x120>
 8c0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8c3:	03 0b                	add    (%ebx),%ecx
 8c5:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8c8:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 8cb:	7e 03                	jle    8d0 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 8cd:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 8d0:	8d 4a 01             	lea    0x1(%edx),%ecx
 8d3:	39 c2                	cmp    %eax,%edx
 8d5:	75 d9                	jne    8b0 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 8d7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8da:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8dd:	8d 56 01             	lea    0x1(%esi),%edx
 8e0:	39 c6                	cmp    %eax,%esi
 8e2:	75 ae                	jne    892 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 8e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8e7:	5b                   	pop    %ebx
 8e8:	5e                   	pop    %esi
 8e9:	5f                   	pop    %edi
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret    
    int visited[num_vertices];
 8ec:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 8f1:	e9 07 ff ff ff       	jmp    7fd <dijkstra+0x4d>
    dist[src] = 0;
 8f6:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ff:	5b                   	pop    %ebx
 900:	5e                   	pop    %esi
 901:	5f                   	pop    %edi
 902:	5d                   	pop    %ebp
 903:	c3                   	ret    
 904:	66 90                	xchg   %ax,%ax
 906:	66 90                	xchg   %ax,%ax
 908:	66 90                	xchg   %ax,%ax
 90a:	66 90                	xchg   %ax,%ax
 90c:	66 90                	xchg   %ax,%ax
 90e:	66 90                	xchg   %ax,%ax

00000910 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 914:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 919:	56                   	push   %esi
 91a:	53                   	push   %ebx
 91b:	83 ec 0c             	sub    $0xc,%esp
 91e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 921:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 924:	e8 f7 00 00 00       	call   a20 <random>
 929:	89 c1                	mov    %eax,%ecx
 92b:	f7 ef                	imul   %edi
 92d:	89 c8                	mov    %ecx,%eax
 92f:	c1 f8 1f             	sar    $0x1f,%eax
 932:	c1 fa 06             	sar    $0x6,%edx
 935:	29 c2                	sub    %eax,%edx
 937:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 93d:	29 c1                	sub    %eax,%ecx
 93f:	83 f9 63             	cmp    $0x63,%ecx
 942:	89 ca                	mov    %ecx,%edx
 944:	8d 41 64             	lea    0x64(%ecx),%eax
 947:	0f 4e d0             	cmovle %eax,%edx
 94a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 94c:	e8 cf 00 00 00       	call   a20 <random>
 951:	89 c1                	mov    %eax,%ecx
 953:	f7 ef                	imul   %edi
 955:	89 c8                	mov    %ecx,%eax
 957:	c1 f8 1f             	sar    $0x1f,%eax
 95a:	c1 fa 07             	sar    $0x7,%edx
 95d:	29 c2                	sub    %eax,%edx
 95f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 965:	29 c1                	sub    %eax,%ecx
 967:	8d 41 32             	lea    0x32(%ecx),%eax
 96a:	89 ca                	mov    %ecx,%edx
 96c:	83 f9 31             	cmp    $0x31,%ecx
 96f:	0f 4e d0             	cmovle %eax,%edx
 972:	8b 45 10             	mov    0x10(%ebp),%eax
 975:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 977:	8b 13                	mov    (%ebx),%edx
 979:	85 d2                	test   %edx,%edx
 97b:	7e 38                	jle    9b5 <gen_random_digraph+0xa5>
 97d:	89 f1                	mov    %esi,%ecx
 97f:	31 ff                	xor    %edi,%edi
 981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 988:	31 c0                	xor    %eax,%eax
 98a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 990:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 997:	8b 13                	mov    (%ebx),%edx
 999:	83 c0 01             	add    $0x1,%eax
 99c:	39 c2                	cmp    %eax,%edx
 99e:	7f f0                	jg     990 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 9a0:	83 c7 01             	add    $0x1,%edi
 9a3:	81 c1 20 03 00 00    	add    $0x320,%ecx
 9a9:	39 fa                	cmp    %edi,%edx
 9ab:	7f db                	jg     988 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 9ad:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 9b3:	7f 22                	jg     9d7 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 9b5:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 9bb:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 9c2:	8d 04 86             	lea    (%esi,%eax,4),%eax
 9c5:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 9c8:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 9ce:	05 20 03 00 00       	add    $0x320,%eax
 9d3:	39 d0                	cmp    %edx,%eax
 9d5:	75 f1                	jne    9c8 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 9d7:	8b 45 10             	mov    0x10(%ebp),%eax
 9da:	31 c9                	xor    %ecx,%ecx
 9dc:	8b 00                	mov    (%eax),%eax
 9de:	85 c0                	test   %eax,%eax
 9e0:	7e 31                	jle    a13 <gen_random_digraph+0x103>
 9e2:	89 75 08             	mov    %esi,0x8(%ebp)
 9e5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 9e7:	e8 34 00 00 00       	call   a20 <random>
    for (int i = 0; i < *num_edges; i++) {
 9ec:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 9ef:	99                   	cltd   
 9f0:	f7 3b                	idivl  (%ebx)
 9f2:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 9f4:	e8 27 00 00 00       	call   a20 <random>
        graph[new_edge_u][new_edge_v] = 1;
 9f9:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 9ff:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 a02:	99                   	cltd   
 a03:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 a05:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 a08:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 a0f:	39 30                	cmp    %esi,(%eax)
 a11:	7f d4                	jg     9e7 <gen_random_digraph+0xd7>
    }
}
 a13:	83 c4 0c             	add    $0xc,%esp
 a16:	5b                   	pop    %ebx
 a17:	5e                   	pop    %esi
 a18:	5f                   	pop    %edi
 a19:	5d                   	pop    %ebp
 a1a:	c3                   	ret    
 a1b:	66 90                	xchg   %ax,%ax
 a1d:	66 90                	xchg   %ax,%ax
 a1f:	90                   	nop

00000a20 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 a20:	69 0d 30 0e 00 00 0d 	imul   $0x19660d,0xe30,%ecx
 a27:	66 19 00 
 a2a:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 a2f:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 a35:	89 c8                	mov    %ecx,%eax
 a37:	f7 ea                	imul   %edx
 a39:	89 d0                	mov    %edx,%eax
 a3b:	89 ca                	mov    %ecx,%edx
 a3d:	c1 fa 1f             	sar    $0x1f,%edx
 a40:	c1 f8 1d             	sar    $0x1d,%eax
 a43:	29 d0                	sub    %edx,%eax
 a45:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 a4b:	89 c8                	mov    %ecx,%eax
 a4d:	29 d0                	sub    %edx,%eax
 a4f:	a3 30 0e 00 00       	mov    %eax,0xe30
    return seed;
 a54:	c3                   	ret    
