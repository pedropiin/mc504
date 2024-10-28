
_init: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 d8 0f 00 00       	push   $0xfd8
  19:	e8 65 03 00 00       	call   383 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 88 03 00 00       	call   3bb <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 7c 03 00 00       	call   3bb <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 e0 0f 00 00       	push   $0xfe0
  50:	6a 01                	push   $0x1
  52:	e8 49 04 00 00       	call   4a0 <printf>
    pid = fork();
  57:	e8 df 02 00 00       	call   33b <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 d6 02 00 00       	call   34b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 1f 10 00 00       	push   $0x101f
  85:	6a 01                	push   $0x1
  87:	e8 14 04 00 00       	call   4a0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 f3 0f 00 00       	push   $0xff3
  98:	6a 01                	push   $0x1
  9a:	e8 01 04 00 00       	call   4a0 <printf>
      exit();
  9f:	e8 9f 02 00 00       	call   343 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 64 16 00 00       	push   $0x1664
  ab:	68 06 10 00 00       	push   $0x1006
  b0:	e8 c6 02 00 00       	call   37b <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 09 10 00 00       	push   $0x1009
  bc:	6a 01                	push   $0x1
  be:	e8 dd 03 00 00       	call   4a0 <printf>
      exit();
  c3:	e8 7b 02 00 00       	call   343 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 d8 0f 00 00       	push   $0xfd8
  d2:	e8 b4 02 00 00       	call   38b <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 d8 0f 00 00       	push   $0xfd8
  e0:	e8 9e 02 00 00       	call   383 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
    p++, q++;
 146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave  
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave  
 16c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 2e 01 00 00       	call   35b <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 1d                	je     260 <gets+0x50>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 19                	je     260 <gets+0x50>
  for(i=0; i+1 < max; ){
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
  buf[i] = '\0';
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	89 de                	mov    %ebx,%esi
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	push   0x8(%ebp)
 28d:	e8 f1 00 00 00       	call   383 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f4 00 00 00       	call   39b <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 ba 00 00 00       	call   36b <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <pipe>:
SYSCALL(pipe)
 353:	b8 04 00 00 00       	mov    $0x4,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <read>:
SYSCALL(read)
 35b:	b8 05 00 00 00       	mov    $0x5,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <write>:
SYSCALL(write)
 363:	b8 10 00 00 00       	mov    $0x10,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <close>:
SYSCALL(close)
 36b:	b8 15 00 00 00       	mov    $0x15,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <kill>:
SYSCALL(kill)
 373:	b8 06 00 00 00       	mov    $0x6,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <exec>:
SYSCALL(exec)
 37b:	b8 07 00 00 00       	mov    $0x7,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <open>:
SYSCALL(open)
 383:	b8 0f 00 00 00       	mov    $0xf,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <mknod>:
SYSCALL(mknod)
 38b:	b8 11 00 00 00       	mov    $0x11,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <unlink>:
SYSCALL(unlink)
 393:	b8 12 00 00 00       	mov    $0x12,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <fstat>:
SYSCALL(fstat)
 39b:	b8 08 00 00 00       	mov    $0x8,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <link>:
SYSCALL(link)
 3a3:	b8 13 00 00 00       	mov    $0x13,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mkdir>:
SYSCALL(mkdir)
 3ab:	b8 14 00 00 00       	mov    $0x14,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <chdir>:
SYSCALL(chdir)
 3b3:	b8 09 00 00 00       	mov    $0x9,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <dup>:
SYSCALL(dup)
 3bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <getpid>:
SYSCALL(getpid)
 3c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <sbrk>:
SYSCALL(sbrk)
 3cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <sleep>:
SYSCALL(sleep)
 3d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <uptime>:
SYSCALL(uptime)
 3db:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    
 3e3:	66 90                	xchg   %ax,%ax
 3e5:	66 90                	xchg   %ax,%ax
 3e7:	66 90                	xchg   %ax,%ax
 3e9:	66 90                	xchg   %ax,%ax
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
 3f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3fc:	89 d1                	mov    %edx,%ecx
{
 3fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 401:	85 d2                	test   %edx,%edx
 403:	0f 89 7f 00 00 00    	jns    488 <printint+0x98>
 409:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 40d:	74 79                	je     488 <printint+0x98>
    neg = 1;
 40f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 416:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 418:	31 db                	xor    %ebx,%ebx
 41a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 420:	89 c8                	mov    %ecx,%eax
 422:	31 d2                	xor    %edx,%edx
 424:	89 cf                	mov    %ecx,%edi
 426:	f7 75 c4             	divl   -0x3c(%ebp)
 429:	0f b6 92 88 10 00 00 	movzbl 0x1088(%edx),%edx
 430:	89 45 c0             	mov    %eax,-0x40(%ebp)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 438:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 43b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 43e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 441:	76 dd                	jbe    420 <printint+0x30>
  if(neg)
 443:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 446:	85 c9                	test   %ecx,%ecx
 448:	74 0c                	je     456 <printint+0x66>
    buf[i++] = '-';
 44a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 44f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 451:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 456:	8b 7d b8             	mov    -0x48(%ebp),%edi
 459:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 45d:	eb 07                	jmp    466 <printint+0x76>
 45f:	90                   	nop
    putc(fd, buf[i]);
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	57                   	push   %edi
 470:	e8 ee fe ff ff       	call   363 <write>
  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 de                	cmp    %ebx,%esi
 47a:	75 e4                	jne    460 <printint+0x70>
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 488:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 48f:	eb 87                	jmp    418 <printint+0x28>
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4af:	0f b6 13             	movzbl (%ebx),%edx
 4b2:	84 d2                	test   %dl,%dl
 4b4:	74 6a                	je     520 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4b6:	8d 45 10             	lea    0x10(%ebp),%eax
 4b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c4:	eb 36                	jmp    4fc <printf+0x5c>
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
 4d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 15                	je     4f2 <printf+0x52>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e3:	6a 01                	push   $0x1
 4e5:	57                   	push   %edi
 4e6:	56                   	push   %esi
 4e7:	e8 77 fe ff ff       	call   363 <write>
 4ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4f2:	0f b6 13             	movzbl (%ebx),%edx
 4f5:	83 c3 01             	add    $0x1,%ebx
 4f8:	84 d2                	test   %dl,%dl
 4fa:	74 24                	je     520 <printf+0x80>
    c = fmt[i] & 0xff;
 4fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4ff:	85 c9                	test   %ecx,%ecx
 501:	74 cd                	je     4d0 <printf+0x30>
      }
    } else if(state == '%'){
 503:	83 f9 25             	cmp    $0x25,%ecx
 506:	75 ea                	jne    4f2 <printf+0x52>
      if(c == 'd'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 07 01 00 00    	je     618 <printf+0x178>
 511:	83 e8 63             	sub    $0x63,%eax
 514:	83 f8 15             	cmp    $0x15,%eax
 517:	77 17                	ja     530 <printf+0x90>
 519:	ff 24 85 30 10 00 00 	jmp    *0x1030(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 520:	8d 65 f4             	lea    -0xc(%ebp),%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 536:	6a 01                	push   $0x1
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 53e:	e8 20 fe ff ff       	call   363 <write>
        putc(fd, c);
 543:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 547:	83 c4 0c             	add    $0xc,%esp
 54a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 54d:	6a 01                	push   $0x1
 54f:	57                   	push   %edi
 550:	56                   	push   %esi
 551:	e8 0d fe ff ff       	call   363 <write>
        putc(fd, c);
 556:	83 c4 10             	add    $0x10,%esp
      state = 0;
 559:	31 c9                	xor    %ecx,%ecx
 55b:	eb 95                	jmp    4f2 <printf+0x52>
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 10 00 00 00       	mov    $0x10,%ecx
 568:	6a 00                	push   $0x0
 56a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 56d:	8b 10                	mov    (%eax),%edx
 56f:	89 f0                	mov    %esi,%eax
 571:	e8 7a fe ff ff       	call   3f0 <printint>
        ap++;
 576:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 57a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57d:	31 c9                	xor    %ecx,%ecx
 57f:	e9 6e ff ff ff       	jmp    4f2 <printf+0x52>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 588:	8b 45 d0             	mov    -0x30(%ebp),%eax
 58b:	8b 10                	mov    (%eax),%edx
        ap++;
 58d:	83 c0 04             	add    $0x4,%eax
 590:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 593:	85 d2                	test   %edx,%edx
 595:	0f 84 8d 00 00 00    	je     628 <printf+0x188>
        while(*s != 0){
 59b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 59e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5a0:	84 c0                	test   %al,%al
 5a2:	0f 84 4a ff ff ff    	je     4f2 <printf+0x52>
 5a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5ab:	89 d3                	mov    %edx,%ebx
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b9:	6a 01                	push   $0x1
 5bb:	57                   	push   %edi
 5bc:	56                   	push   %esi
 5bd:	e8 a1 fd ff ff       	call   363 <write>
        while(*s != 0){
 5c2:	0f b6 03             	movzbl (%ebx),%eax
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	84 c0                	test   %al,%al
 5ca:	75 e4                	jne    5b0 <printf+0x110>
      state = 0;
 5cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5cf:	31 c9                	xor    %ecx,%ecx
 5d1:	e9 1c ff ff ff       	jmp    4f2 <printf+0x52>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e8:	6a 01                	push   $0x1
 5ea:	e9 7b ff ff ff       	jmp    56a <printf+0xca>
 5ef:	90                   	nop
        putc(fd, *ap);
 5f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
 5fa:	57                   	push   %edi
 5fb:	56                   	push   %esi
        putc(fd, *ap);
 5fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5ff:	e8 5f fd ff ff       	call   363 <write>
        ap++;
 604:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 608:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60b:	31 c9                	xor    %ecx,%ecx
 60d:	e9 e0 fe ff ff       	jmp    4f2 <printf+0x52>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 618:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 61b:	83 ec 04             	sub    $0x4,%esp
 61e:	e9 2a ff ff ff       	jmp    54d <printf+0xad>
 623:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 627:	90                   	nop
          s = "(null)";
 628:	ba 28 10 00 00       	mov    $0x1028,%edx
        while(*s != 0){
 62d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 630:	b8 28 00 00 00       	mov    $0x28,%eax
 635:	89 d3                	mov    %edx,%ebx
 637:	e9 74 ff ff ff       	jmp    5b0 <printf+0x110>
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 70 16 00 00       	mov    0x1670,%eax
{
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 64e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 658:	89 c2                	mov    %eax,%edx
 65a:	8b 00                	mov    (%eax),%eax
 65c:	39 ca                	cmp    %ecx,%edx
 65e:	73 30                	jae    690 <free+0x50>
 660:	39 c1                	cmp    %eax,%ecx
 662:	72 04                	jb     668 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 664:	39 c2                	cmp    %eax,%edx
 666:	72 f0                	jb     658 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	39 f8                	cmp    %edi,%eax
 670:	74 30                	je     6a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 672:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 675:	8b 42 04             	mov    0x4(%edx),%eax
 678:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 67b:	39 f1                	cmp    %esi,%ecx
 67d:	74 3a                	je     6b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 67f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 681:	5b                   	pop    %ebx
  freep = p;
 682:	89 15 70 16 00 00    	mov    %edx,0x1670
}
 688:	5e                   	pop    %esi
 689:	5f                   	pop    %edi
 68a:	5d                   	pop    %ebp
 68b:	c3                   	ret    
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 690:	39 c2                	cmp    %eax,%edx
 692:	72 c4                	jb     658 <free+0x18>
 694:	39 c1                	cmp    %eax,%ecx
 696:	73 c0                	jae    658 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 698:	8b 73 fc             	mov    -0x4(%ebx),%esi
 69b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69e:	39 f8                	cmp    %edi,%eax
 6a0:	75 d0                	jne    672 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6a2:	03 70 04             	add    0x4(%eax),%esi
 6a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a8:	8b 02                	mov    (%edx),%eax
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6af:	8b 42 04             	mov    0x4(%edx),%eax
 6b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6b5:	39 f1                	cmp    %esi,%ecx
 6b7:	75 c6                	jne    67f <free+0x3f>
    p->s.size += bp->s.size;
 6b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6bc:	89 15 70 16 00 00    	mov    %edx,0x1670
    p->s.size += bp->s.size;
 6c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6c8:	89 0a                	mov    %ecx,(%edx)
}
 6ca:	5b                   	pop    %ebx
 6cb:	5e                   	pop    %esi
 6cc:	5f                   	pop    %edi
 6cd:	5d                   	pop    %ebp
 6ce:	c3                   	ret    
 6cf:	90                   	nop

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6dc:	8b 3d 70 16 00 00    	mov    0x1670,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e2:	8d 70 07             	lea    0x7(%eax),%esi
 6e5:	c1 ee 03             	shr    $0x3,%esi
 6e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6eb:	85 ff                	test   %edi,%edi
 6ed:	0f 84 9d 00 00 00    	je     790 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6f8:	39 f1                	cmp    %esi,%ecx
 6fa:	73 6a                	jae    766 <malloc+0x96>
 6fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 701:	39 de                	cmp    %ebx,%esi
 703:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 706:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 70d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 710:	eb 17                	jmp    729 <malloc+0x59>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 718:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 71a:	8b 48 04             	mov    0x4(%eax),%ecx
 71d:	39 f1                	cmp    %esi,%ecx
 71f:	73 4f                	jae    770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 721:	8b 3d 70 16 00 00    	mov    0x1670,%edi
 727:	89 c2                	mov    %eax,%edx
 729:	39 d7                	cmp    %edx,%edi
 72b:	75 eb                	jne    718 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 72d:	83 ec 0c             	sub    $0xc,%esp
 730:	ff 75 e4             	push   -0x1c(%ebp)
 733:	e8 93 fc ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 738:	83 c4 10             	add    $0x10,%esp
 73b:	83 f8 ff             	cmp    $0xffffffff,%eax
 73e:	74 1c                	je     75c <malloc+0x8c>
  hp->s.size = nu;
 740:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 743:	83 ec 0c             	sub    $0xc,%esp
 746:	83 c0 08             	add    $0x8,%eax
 749:	50                   	push   %eax
 74a:	e8 f1 fe ff ff       	call   640 <free>
  return freep;
 74f:	8b 15 70 16 00 00    	mov    0x1670,%edx
      if((p = morecore(nunits)) == 0)
 755:	83 c4 10             	add    $0x10,%esp
 758:	85 d2                	test   %edx,%edx
 75a:	75 bc                	jne    718 <malloc+0x48>
        return 0;
  }
}
 75c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 75f:	31 c0                	xor    %eax,%eax
}
 761:	5b                   	pop    %ebx
 762:	5e                   	pop    %esi
 763:	5f                   	pop    %edi
 764:	5d                   	pop    %ebp
 765:	c3                   	ret    
    if(p->s.size >= nunits){
 766:	89 d0                	mov    %edx,%eax
 768:	89 fa                	mov    %edi,%edx
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 770:	39 ce                	cmp    %ecx,%esi
 772:	74 4c                	je     7c0 <malloc+0xf0>
        p->s.size -= nunits;
 774:	29 f1                	sub    %esi,%ecx
 776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 77c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 77f:	89 15 70 16 00 00    	mov    %edx,0x1670
}
 785:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 788:	83 c0 08             	add    $0x8,%eax
}
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 790:	c7 05 70 16 00 00 74 	movl   $0x1674,0x1670
 797:	16 00 00 
    base.s.size = 0;
 79a:	bf 74 16 00 00       	mov    $0x1674,%edi
    base.s.ptr = freep = prevp = &base;
 79f:	c7 05 74 16 00 00 74 	movl   $0x1674,0x1674
 7a6:	16 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7ab:	c7 05 78 16 00 00 00 	movl   $0x0,0x1678
 7b2:	00 00 00 
    if(p->s.size >= nunits){
 7b5:	e9 42 ff ff ff       	jmp    6fc <malloc+0x2c>
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7c0:	8b 08                	mov    (%eax),%ecx
 7c2:	89 0a                	mov    %ecx,(%edx)
 7c4:	eb b9                	jmp    77f <malloc+0xaf>
 7c6:	66 90                	xchg   %ax,%ax
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 04             	sub    $0x4,%esp
 7d9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7dc:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 7df:	85 db                	test   %ebx,%ebx
 7e1:	7e 3d                	jle    820 <min_distance_vertex+0x50>
    int min_idx = 0;
 7e3:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 7e5:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 7e7:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 7ec:	89 75 f0             	mov    %esi,-0x10(%ebp)
 7ef:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 7f0:	8b 14 87             	mov    (%edi,%eax,4),%edx
 7f3:	39 ca                	cmp    %ecx,%edx
 7f5:	7d 14                	jge    80b <min_distance_vertex+0x3b>
 7f7:	8b 75 0c             	mov    0xc(%ebp),%esi
 7fa:	8b 34 86             	mov    (%esi,%eax,4),%esi
 7fd:	85 f6                	test   %esi,%esi
 7ff:	8b 75 f0             	mov    -0x10(%ebp),%esi
 802:	0f 44 ca             	cmove  %edx,%ecx
 805:	0f 44 f0             	cmove  %eax,%esi
 808:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 80b:	83 c0 01             	add    $0x1,%eax
 80e:	39 c3                	cmp    %eax,%ebx
 810:	75 de                	jne    7f0 <min_distance_vertex+0x20>
 812:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 815:	83 c4 04             	add    $0x4,%esp
 818:	5b                   	pop    %ebx
 819:	89 f0                	mov    %esi,%eax
 81b:	5e                   	pop    %esi
 81c:	5f                   	pop    %edi
 81d:	5d                   	pop    %ebp
 81e:	c3                   	ret    
 81f:	90                   	nop
 820:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 823:	31 f6                	xor    %esi,%esi
}
 825:	5b                   	pop    %ebx
 826:	89 f0                	mov    %esi,%eax
 828:	5e                   	pop    %esi
 829:	5f                   	pop    %edi
 82a:	5d                   	pop    %ebp
 82b:	c3                   	ret    
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000830 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 839:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 83c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 83f:	89 e6                	mov    %esp,%esi
 841:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 848:	8d 41 0f             	lea    0xf(%ecx),%eax
 84b:	89 c2                	mov    %eax,%edx
 84d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 852:	29 c6                	sub    %eax,%esi
 854:	83 e2 f0             	and    $0xfffffff0,%edx
 857:	39 f4                	cmp    %esi,%esp
 859:	74 12                	je     86d <dijkstra+0x3d>
 85b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 861:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 868:	00 
 869:	39 f4                	cmp    %esi,%esp
 86b:	75 ee                	jne    85b <dijkstra+0x2b>
 86d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 873:	29 d4                	sub    %edx,%esp
 875:	85 d2                	test   %edx,%edx
 877:	0f 85 ef 00 00 00    	jne    96c <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 87d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 880:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 882:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 885:	8b 45 0c             	mov    0xc(%ebp),%eax
 888:	85 c0                	test   %eax,%eax
 88a:	0f 8e e6 00 00 00    	jle    976 <dijkstra+0x146>
 890:	89 d8                	mov    %ebx,%eax
 892:	89 fa                	mov    %edi,%edx
 894:	01 d9                	add    %ebx,%ecx
 896:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 8a0:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 8a6:	83 c0 04             	add    $0x4,%eax
 8a9:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 8ac:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 8b3:	39 c8                	cmp    %ecx,%eax
 8b5:	75 e9                	jne    8a0 <dijkstra+0x70>
    dist[src] = 0;
 8b7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 8c8:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 8ca:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 8cf:	31 c0                	xor    %eax,%eax
 8d1:	eb 07                	jmp    8da <dijkstra+0xaa>
 8d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8d7:	90                   	nop
 8d8:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 8da:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 8dd:	39 ca                	cmp    %ecx,%edx
 8df:	7d 0a                	jge    8eb <dijkstra+0xbb>
 8e1:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 8e5:	0f 44 f0             	cmove  %eax,%esi
 8e8:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 8eb:	8d 50 01             	lea    0x1(%eax),%edx
 8ee:	39 55 0c             	cmp    %edx,0xc(%ebp)
 8f1:	75 e5                	jne    8d8 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 8f3:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 8f6:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 8fd:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 903:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 906:	75 18                	jne    920 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 908:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 90b:	8d 56 01             	lea    0x1(%esi),%edx
 90e:	39 c6                	cmp    %eax,%esi
 910:	74 52                	je     964 <dijkstra+0x134>
 912:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 915:	eb b1                	jmp    8c8 <dijkstra+0x98>
 917:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 920:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 926:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 929:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 92c:	31 d2                	xor    %edx,%edx
 92e:	eb 02                	jmp    932 <dijkstra+0x102>
 930:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 932:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 935:	85 c9                	test   %ecx,%ecx
 937:	74 17                	je     950 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 939:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 93c:	85 db                	test   %ebx,%ebx
 93e:	75 10                	jne    950 <dijkstra+0x120>
 940:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 943:	03 0b                	add    (%ebx),%ecx
 945:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 948:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 94b:	7e 03                	jle    950 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 94d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 950:	8d 4a 01             	lea    0x1(%edx),%ecx
 953:	39 c2                	cmp    %eax,%edx
 955:	75 d9                	jne    930 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 957:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 95a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 95d:	8d 56 01             	lea    0x1(%esi),%edx
 960:	39 c6                	cmp    %eax,%esi
 962:	75 ae                	jne    912 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 964:	8d 65 f4             	lea    -0xc(%ebp),%esp
 967:	5b                   	pop    %ebx
 968:	5e                   	pop    %esi
 969:	5f                   	pop    %edi
 96a:	5d                   	pop    %ebp
 96b:	c3                   	ret    
    int visited[num_vertices];
 96c:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 971:	e9 07 ff ff ff       	jmp    87d <dijkstra+0x4d>
    dist[src] = 0;
 976:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 97c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 97f:	5b                   	pop    %ebx
 980:	5e                   	pop    %esi
 981:	5f                   	pop    %edi
 982:	5d                   	pop    %ebp
 983:	c3                   	ret    
 984:	66 90                	xchg   %ax,%ax
 986:	66 90                	xchg   %ax,%ax
 988:	66 90                	xchg   %ax,%ax
 98a:	66 90                	xchg   %ax,%ax
 98c:	66 90                	xchg   %ax,%ax
 98e:	66 90                	xchg   %ax,%ax

00000990 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 994:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 999:	56                   	push   %esi
 99a:	53                   	push   %ebx
 99b:	83 ec 0c             	sub    $0xc,%esp
 99e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 9a1:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 9a4:	e8 f7 00 00 00       	call   aa0 <random>
 9a9:	89 c1                	mov    %eax,%ecx
 9ab:	f7 ef                	imul   %edi
 9ad:	89 c8                	mov    %ecx,%eax
 9af:	c1 f8 1f             	sar    $0x1f,%eax
 9b2:	c1 fa 06             	sar    $0x6,%edx
 9b5:	29 c2                	sub    %eax,%edx
 9b7:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 9bd:	29 c1                	sub    %eax,%ecx
 9bf:	83 f9 63             	cmp    $0x63,%ecx
 9c2:	89 ca                	mov    %ecx,%edx
 9c4:	8d 41 64             	lea    0x64(%ecx),%eax
 9c7:	0f 4e d0             	cmovle %eax,%edx
 9ca:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 9cc:	e8 cf 00 00 00       	call   aa0 <random>
 9d1:	89 c1                	mov    %eax,%ecx
 9d3:	f7 ef                	imul   %edi
 9d5:	89 c8                	mov    %ecx,%eax
 9d7:	c1 f8 1f             	sar    $0x1f,%eax
 9da:	c1 fa 07             	sar    $0x7,%edx
 9dd:	29 c2                	sub    %eax,%edx
 9df:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 9e5:	29 c1                	sub    %eax,%ecx
 9e7:	8d 41 32             	lea    0x32(%ecx),%eax
 9ea:	89 ca                	mov    %ecx,%edx
 9ec:	83 f9 31             	cmp    $0x31,%ecx
 9ef:	0f 4e d0             	cmovle %eax,%edx
 9f2:	8b 45 10             	mov    0x10(%ebp),%eax
 9f5:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 9f7:	8b 13                	mov    (%ebx),%edx
 9f9:	85 d2                	test   %edx,%edx
 9fb:	7e 38                	jle    a35 <gen_random_digraph+0xa5>
 9fd:	89 f1                	mov    %esi,%ecx
 9ff:	31 ff                	xor    %edi,%edi
 a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 a08:	31 c0                	xor    %eax,%eax
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 a10:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 a17:	8b 13                	mov    (%ebx),%edx
 a19:	83 c0 01             	add    $0x1,%eax
 a1c:	39 c2                	cmp    %eax,%edx
 a1e:	7f f0                	jg     a10 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 a20:	83 c7 01             	add    $0x1,%edi
 a23:	81 c1 20 03 00 00    	add    $0x320,%ecx
 a29:	39 fa                	cmp    %edi,%edx
 a2b:	7f db                	jg     a08 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 a2d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 a33:	7f 22                	jg     a57 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 a35:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 a3b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 a42:	8d 04 86             	lea    (%esi,%eax,4),%eax
 a45:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 a48:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 a4e:	05 20 03 00 00       	add    $0x320,%eax
 a53:	39 d0                	cmp    %edx,%eax
 a55:	75 f1                	jne    a48 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 a57:	8b 45 10             	mov    0x10(%ebp),%eax
 a5a:	31 c9                	xor    %ecx,%ecx
 a5c:	8b 00                	mov    (%eax),%eax
 a5e:	85 c0                	test   %eax,%eax
 a60:	7e 31                	jle    a93 <gen_random_digraph+0x103>
 a62:	89 75 08             	mov    %esi,0x8(%ebp)
 a65:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 a67:	e8 34 00 00 00       	call   aa0 <random>
    for (int i = 0; i < *num_edges; i++) {
 a6c:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 a6f:	99                   	cltd   
 a70:	f7 3b                	idivl  (%ebx)
 a72:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 a74:	e8 27 00 00 00       	call   aa0 <random>
        graph[new_edge_u][new_edge_v] = 1;
 a79:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 a7f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 a82:	99                   	cltd   
 a83:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 a85:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 a88:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 a8f:	39 30                	cmp    %esi,(%eax)
 a91:	7f d4                	jg     a67 <gen_random_digraph+0xd7>
    }
}
 a93:	83 c4 0c             	add    $0xc,%esp
 a96:	5b                   	pop    %ebx
 a97:	5e                   	pop    %esi
 a98:	5f                   	pop    %edi
 a99:	5d                   	pop    %ebp
 a9a:	c3                   	ret    
 a9b:	66 90                	xchg   %ax,%ax
 a9d:	66 90                	xchg   %ax,%ax
 a9f:	90                   	nop

00000aa0 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 aa0:	69 0d 6c 16 00 00 0d 	imul   $0x19660d,0x166c,%ecx
 aa7:	66 19 00 
 aaa:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 aaf:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 ab5:	89 c8                	mov    %ecx,%eax
 ab7:	f7 ea                	imul   %edx
 ab9:	89 d0                	mov    %edx,%eax
 abb:	89 ca                	mov    %ecx,%edx
 abd:	c1 fa 1f             	sar    $0x1f,%edx
 ac0:	c1 f8 1d             	sar    $0x1d,%eax
 ac3:	29 d0                	sub    %edx,%eax
 ac5:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 acb:	89 c8                	mov    %ecx,%eax
 acd:	29 d0                	sub    %edx,%eax
 acf:	a3 6c 16 00 00       	mov    %eax,0x166c
    return seed;
 ad4:	c3                   	ret    
 ad5:	66 90                	xchg   %ax,%ax
 ad7:	66 90                	xchg   %ax,%ax
 ad9:	66 90                	xchg   %ax,%ax
 adb:	66 90                	xchg   %ax,%ax
 add:	66 90                	xchg   %ax,%ax
 adf:	90                   	nop

00000ae0 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	57                   	push   %edi
 ae4:	56                   	push   %esi
 ae5:	53                   	push   %ebx
 ae6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 aec:	83 0c 24 00          	orl    $0x0,(%esp)
 af0:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 af6:	83 0c 24 00          	orl    $0x0,(%esp)
 afa:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
 b00:	6a 00                	push   $0x0
 b02:	ff 75 08             	push   0x8(%ebp)
 b05:	e8 79 f8 ff ff       	call   383 <open>
    if (fp < 0 ) {
 b0a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
 b0d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
 b13:	85 c0                	test   %eax,%eax
 b15:	0f 88 99 01 00 00    	js     cb4 <permute_line+0x1d4>
 b1b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 b21:	31 db                	xor    %ebx,%ebx
 b23:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
 b29:	89 f7                	mov    %esi,%edi
 b2b:	89 de                	mov    %ebx,%esi
 b2d:	89 c3                	mov    %eax,%ebx
 b2f:	eb 12                	jmp    b43 <permute_line+0x63>
 b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 b38:	83 c7 66             	add    $0x66,%edi
 b3b:	83 fe 64             	cmp    $0x64,%esi
 b3e:	74 16                	je     b56 <permute_line+0x76>
        line_idx++;
 b40:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 b43:	83 ec 04             	sub    $0x4,%esp
 b46:	6a 66                	push   $0x66
 b48:	57                   	push   %edi
 b49:	53                   	push   %ebx
 b4a:	e8 0c f8 ff ff       	call   35b <read>
 b4f:	83 c4 10             	add    $0x10,%esp
 b52:	85 c0                	test   %eax,%eax
 b54:	7f e2                	jg     b38 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
 b56:	89 f3                	mov    %esi,%ebx
 b58:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
 b5e:	e8 3d ff ff ff       	call   aa0 <random>
 b63:	89 c1                	mov    %eax,%ecx
 b65:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 b6a:	f7 e9                	imul   %ecx
 b6c:	89 c8                	mov    %ecx,%eax
 b6e:	c1 f8 1f             	sar    $0x1f,%eax
 b71:	c1 fa 05             	sar    $0x5,%edx
 b74:	29 c2                	sub    %eax,%edx
 b76:	6b c2 64             	imul   $0x64,%edx,%eax
 b79:	29 c1                	sub    %eax,%ecx
 b7b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
 b7d:	e8 1e ff ff ff       	call   aa0 <random>
 b82:	89 c1                	mov    %eax,%ecx
 b84:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 b89:	f7 e9                	imul   %ecx
 b8b:	89 c8                	mov    %ecx,%eax
 b8d:	c1 f8 1f             	sar    $0x1f,%eax
 b90:	c1 fa 05             	sar    $0x5,%edx
 b93:	29 c2                	sub    %eax,%edx
 b95:	6b c2 64             	imul   $0x64,%edx,%eax
 b98:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
 b9a:	39 cf                	cmp    %ecx,%edi
 b9c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
 ba2:	74 5f                	je     c03 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
 ba4:	6b c7 66             	imul   $0x66,%edi,%eax
 ba7:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
 bad:	83 ec 08             	sub    $0x8,%esp
 bb0:	01 c1                	add    %eax,%ecx
 bb2:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 bb8:	51                   	push   %ecx
 bb9:	50                   	push   %eax
 bba:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
 bc0:	e8 2b f5 ff ff       	call   f0 <strcpy>
        strcpy(lines[line1], lines[line2]);
 bc5:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 bcb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 bd1:	6b d2 66             	imul   $0x66,%edx,%edx
 bd4:	01 c2                	add    %eax,%edx
 bd6:	58                   	pop    %eax
 bd7:	59                   	pop    %ecx
 bd8:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
 bde:	52                   	push   %edx
 bdf:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 be5:	51                   	push   %ecx
 be6:	e8 05 f5 ff ff       	call   f0 <strcpy>
        strcpy(lines[line2], temp);
 beb:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 bf1:	5f                   	pop    %edi
 bf2:	58                   	pop    %eax
 bf3:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 bf9:	50                   	push   %eax
 bfa:	52                   	push   %edx
 bfb:	e8 f0 f4 ff ff       	call   f0 <strcpy>
 c00:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 c03:	83 ec 0c             	sub    $0xc,%esp
 c06:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 c0c:	e8 5a f7 ff ff       	call   36b <close>
    fp = open(file_path, O_RDWR);
 c11:	58                   	pop    %eax
 c12:	5a                   	pop    %edx
 c13:	6a 02                	push   $0x2
 c15:	ff 75 08             	push   0x8(%ebp)
 c18:	e8 66 f7 ff ff       	call   383 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 c1d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 c1e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 c20:	58                   	pop    %eax
 c21:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 c27:	50                   	push   %eax
 c28:	57                   	push   %edi
 c29:	e8 6d f7 ff ff       	call   39b <fstat>
    char *buffer = malloc(0);
 c2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 c35:	e8 96 fa ff ff       	call   6d0 <malloc>
    memset(buffer, 0, 0);  
 c3a:	83 c4 0c             	add    $0xc,%esp
 c3d:	6a 00                	push   $0x0
 c3f:	6a 00                	push   $0x0
 c41:	50                   	push   %eax
 c42:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 c48:	e8 63 f5 ff ff       	call   1b0 <memset>
    write(fp, buffer, 0);
 c4d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 c53:	83 c4 0c             	add    $0xc,%esp
 c56:	6a 00                	push   $0x0
 c58:	52                   	push   %edx
 c59:	57                   	push   %edi
 c5a:	e8 04 f7 ff ff       	call   363 <write>
    free(buffer);
 c5f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 c65:	89 14 24             	mov    %edx,(%esp)
 c68:	e8 d3 f9 ff ff       	call   640 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 c6d:	83 c4 10             	add    $0x10,%esp
 c70:	85 ff                	test   %edi,%edi
 c72:	78 59                	js     ccd <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 c74:	85 db                	test   %ebx,%ebx
 c76:	74 26                	je     c9e <permute_line+0x1be>
 c78:	6b db 66             	imul   $0x66,%ebx,%ebx
 c7b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 c81:	01 c3                	add    %eax,%ebx
 c83:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c87:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 c88:	83 ec 04             	sub    $0x4,%esp
 c8b:	6a 66                	push   $0x66
 c8d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 c8e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 c91:	57                   	push   %edi
 c92:	e8 cc f6 ff ff       	call   363 <write>
    for (int i = 0; i < line_idx; i++) {
 c97:	83 c4 10             	add    $0x10,%esp
 c9a:	39 de                	cmp    %ebx,%esi
 c9c:	75 ea                	jne    c88 <permute_line+0x1a8>
    }

    close(fp);
 c9e:	83 ec 0c             	sub    $0xc,%esp
 ca1:	57                   	push   %edi
 ca2:	e8 c4 f6 ff ff       	call   36b <close>
    return 0;
 ca7:	83 c4 10             	add    $0x10,%esp
 caa:	31 c0                	xor    %eax,%eax
 cac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 caf:	5b                   	pop    %ebx
 cb0:	5e                   	pop    %esi
 cb1:	5f                   	pop    %edi
 cb2:	5d                   	pop    %ebp
 cb3:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 cb4:	83 ec 08             	sub    $0x8,%esp
 cb7:	68 9c 10 00 00       	push   $0x109c
 cbc:	6a 01                	push   $0x1
 cbe:	e8 dd f7 ff ff       	call   4a0 <printf>
        return -1;
 cc3:	83 c4 10             	add    $0x10,%esp
 cc6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ccb:	eb df                	jmp    cac <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 ccd:	83 ec 08             	sub    $0x8,%esp
 cd0:	68 e4 10 00 00       	push   $0x10e4
 cd5:	6a 01                	push   $0x1
 cd7:	e8 c4 f7 ff ff       	call   4a0 <printf>
        return -1;
 cdc:	83 c4 10             	add    $0x10,%esp
 cdf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ce4:	eb c6                	jmp    cac <permute_line+0x1cc>
 ce6:	66 90                	xchg   %ax,%ax
 ce8:	66 90                	xchg   %ax,%ax
 cea:	66 90                	xchg   %ax,%ax
 cec:	66 90                	xchg   %ax,%ax
 cee:	66 90                	xchg   %ax,%ax

00000cf0 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
 cf0:	55                   	push   %ebp
 cf1:	89 e5                	mov    %esp,%ebp
 cf3:	57                   	push   %edi
 cf4:	56                   	push   %esi
 cf5:	53                   	push   %ebx
 cf6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 cfc:	83 0c 24 00          	orl    $0x0,(%esp)
 d00:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 d06:	83 0c 24 00          	orl    $0x0,(%esp)
 d0a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
 d10:	6a 00                	push   $0x0
 d12:	ff 75 08             	push   0x8(%ebp)
 d15:	e8 69 f6 ff ff       	call   383 <open>
    if (fp < 0) {
 d1a:	83 c4 10             	add    $0x10,%esp
 d1d:	85 c0                	test   %eax,%eax
 d1f:	0f 88 b1 00 00 00    	js     dd6 <add_line+0xe6>
 d25:	89 c3                	mov    %eax,%ebx
 d27:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 d2d:	31 f6                	xor    %esi,%esi
 d2f:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
 d35:	89 c7                	mov    %eax,%edi
 d37:	eb 12                	jmp    d4b <add_line+0x5b>
 d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 d40:	83 c7 66             	add    $0x66,%edi
 d43:	83 fe 64             	cmp    $0x64,%esi
 d46:	74 1c                	je     d64 <add_line+0x74>
        line_idx++;
 d48:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 d4b:	83 ec 04             	sub    $0x4,%esp
 d4e:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
 d54:	6a 66                	push   $0x66
 d56:	57                   	push   %edi
 d57:	53                   	push   %ebx
 d58:	e8 fe f5 ff ff       	call   35b <read>
 d5d:	83 c4 10             	add    $0x10,%esp
 d60:	85 c0                	test   %eax,%eax
 d62:	7f dc                	jg     d40 <add_line+0x50>
    }
    close(fp); 
 d64:	83 ec 0c             	sub    $0xc,%esp
 d67:	53                   	push   %ebx
 d68:	e8 fe f5 ff ff       	call   36b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 d6d:	58                   	pop    %eax
 d6e:	5a                   	pop    %edx
 d6f:	ff 75 0c             	push   0xc(%ebp)
 d72:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 d78:	e8 73 f3 ff ff       	call   f0 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 d7d:	59                   	pop    %ecx
 d7e:	5b                   	pop    %ebx
 d7f:	6a 01                	push   $0x1
 d81:	ff 75 08             	push   0x8(%ebp)
 d84:	e8 fa f5 ff ff       	call   383 <open>
    if (fp < 0) {
 d89:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
 d8c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
 d8e:	85 c0                	test   %eax,%eax
 d90:	78 5d                	js     def <add_line+0xff>
 d92:	6b ce 66             	imul   $0x66,%esi,%ecx
 d95:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
 d9b:	8d 78 66             	lea    0x66(%eax),%edi
 d9e:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
 da1:	eb 08                	jmp    dab <add_line+0xbb>
 da3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 da7:	90                   	nop
 da8:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
 dab:	83 ec 04             	sub    $0x4,%esp
 dae:	6a 66                	push   $0x66
 db0:	50                   	push   %eax
 db1:	53                   	push   %ebx
 db2:	e8 ac f5 ff ff       	call   363 <write>
    for (int i = 0; i < line_idx; i++) {
 db7:	89 f8                	mov    %edi,%eax
 db9:	83 c4 10             	add    $0x10,%esp
 dbc:	39 f7                	cmp    %esi,%edi
 dbe:	75 e8                	jne    da8 <add_line+0xb8>
    }

    close(fp);
 dc0:	83 ec 0c             	sub    $0xc,%esp
 dc3:	53                   	push   %ebx
 dc4:	e8 a2 f5 ff ff       	call   36b <close>
    return 0;
 dc9:	83 c4 10             	add    $0x10,%esp
 dcc:	31 c0                	xor    %eax,%eax
}
 dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
 dd1:	5b                   	pop    %ebx
 dd2:	5e                   	pop    %esi
 dd3:	5f                   	pop    %edi
 dd4:	5d                   	pop    %ebp
 dd5:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
 dd6:	83 ec 08             	sub    $0x8,%esp
 dd9:	68 20 11 00 00       	push   $0x1120
 dde:	6a 01                	push   $0x1
 de0:	e8 bb f6 ff ff       	call   4a0 <printf>
        return -1;
 de5:	83 c4 10             	add    $0x10,%esp
 de8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ded:	eb df                	jmp    dce <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 def:	83 ec 08             	sub    $0x8,%esp
 df2:	68 44 11 00 00       	push   $0x1144
 df7:	6a 01                	push   $0x1
 df9:	e8 a2 f6 ff ff       	call   4a0 <printf>
        return -1;
 dfe:	83 c4 10             	add    $0x10,%esp
 e01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 e06:	eb c6                	jmp    dce <add_line+0xde>
 e08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e0f:	90                   	nop

00000e10 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
 e10:	55                   	push   %ebp
 e11:	89 e5                	mov    %esp,%ebp
 e13:	57                   	push   %edi
 e14:	56                   	push   %esi
 e15:	53                   	push   %ebx
 e16:	83 ec 0c             	sub    $0xc,%esp
 e19:	8b 5d 08             	mov    0x8(%ebp),%ebx
 e1c:	8d 73 64             	lea    0x64(%ebx),%esi
 e1f:	89 f7                	mov    %esi,%edi
 e21:	8b 75 0c             	mov    0xc(%ebp),%esi
 e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
 e28:	e8 73 fc ff ff       	call   aa0 <random>
 e2d:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e2f:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
 e32:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
 e35:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 e39:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e3c:	39 fb                	cmp    %edi,%ebx
 e3e:	75 e8                	jne    e28 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
 e40:	8b 45 08             	mov    0x8(%ebp),%eax
 e43:	ba 0a 00 00 00       	mov    $0xa,%edx
 e48:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
 e4c:	83 c4 0c             	add    $0xc,%esp
 e4f:	5b                   	pop    %ebx
 e50:	5e                   	pop    %esi
 e51:	5f                   	pop    %edi
 e52:	5d                   	pop    %ebp
 e53:	c3                   	ret    
 e54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 e5f:	90                   	nop

00000e60 <write_random_string>:

int write_random_string(char file_path[]) {
 e60:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e61:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
 e66:	89 e5                	mov    %esp,%ebp
 e68:	57                   	push   %edi
 e69:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e6a:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
 e70:	be 68 11 00 00       	mov    $0x1168,%esi
int write_random_string(char file_path[]) {
 e75:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
 e76:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
 e7b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e81:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 e83:	0f b7 06             	movzwl (%esi),%eax
 e86:	8d 75 e6             	lea    -0x1a(%ebp),%esi
 e89:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e8c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
 e8f:	90                   	nop
        int idx_new_char = random() % size_char_set;
 e90:	e8 0b fc ff ff       	call   aa0 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e95:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
 e98:	89 c1                	mov    %eax,%ecx
 e9a:	f7 e3                	mul    %ebx
 e9c:	c1 ea 06             	shr    $0x6,%edx
 e9f:	6b d2 55             	imul   $0x55,%edx,%edx
 ea2:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
 ea4:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
 eab:	ff 
 eac:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 eaf:	39 f7                	cmp    %esi,%edi
 eb1:	75 dd                	jne    e90 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
 eb3:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
 eb8:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
 ebb:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
 ebf:	8d 45 82             	lea    -0x7e(%ebp),%eax
 ec2:	50                   	push   %eax
 ec3:	ff 75 08             	push   0x8(%ebp)
 ec6:	e8 25 fe ff ff       	call   cf0 <add_line>

    return 0;
}
 ecb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ece:	31 c0                	xor    %eax,%eax
 ed0:	5b                   	pop    %ebx
 ed1:	5e                   	pop    %esi
 ed2:	5f                   	pop    %edi
 ed3:	5d                   	pop    %ebp
 ed4:	c3                   	ret    
 ed5:	66 90                	xchg   %ax,%ax
 ed7:	66 90                	xchg   %ax,%ax
 ed9:	66 90                	xchg   %ax,%ax
 edb:	66 90                	xchg   %ax,%ax
 edd:	66 90                	xchg   %ax,%ax
 edf:	90                   	nop

00000ee0 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
 ee0:	55                   	push   %ebp
 ee1:	89 e5                	mov    %esp,%ebp
 ee3:	56                   	push   %esi
 ee4:	8b 75 08             	mov    0x8(%ebp),%esi
 ee7:	53                   	push   %ebx
 ee8:	bb 64 00 00 00       	mov    $0x64,%ebx
 eed:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
 ef0:	83 ec 0c             	sub    $0xc,%esp
 ef3:	56                   	push   %esi
 ef4:	e8 67 ff ff ff       	call   e60 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
 ef9:	83 c4 10             	add    $0x10,%esp
 efc:	83 eb 01             	sub    $0x1,%ebx
 eff:	75 ef                	jne    ef0 <io_bound+0x10>
 f01:	bb 32 00 00 00       	mov    $0x32,%ebx
 f06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 f0d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
 f10:	83 ec 0c             	sub    $0xc,%esp
 f13:	56                   	push   %esi
 f14:	e8 c7 fb ff ff       	call   ae0 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
 f19:	83 c4 10             	add    $0x10,%esp
 f1c:	83 eb 01             	sub    $0x1,%ebx
 f1f:	75 ef                	jne    f10 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
 f21:	83 ec 0c             	sub    $0xc,%esp
 f24:	56                   	push   %esi
 f25:	e8 69 f4 ff ff       	call   393 <unlink>
 f2a:	83 c4 10             	add    $0x10,%esp
 f2d:	85 c0                	test   %eax,%eax
 f2f:	75 07                	jne    f38 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
 f31:	8d 65 f8             	lea    -0x8(%ebp),%esp
 f34:	5b                   	pop    %ebx
 f35:	5e                   	pop    %esi
 f36:	5d                   	pop    %ebp
 f37:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
 f38:	83 ec 08             	sub    $0x8,%esp
 f3b:	68 c0 11 00 00       	push   $0x11c0
 f40:	6a 01                	push   $0x1
 f42:	e8 59 f5 ff ff       	call   4a0 <printf>
 f47:	83 c4 10             	add    $0x10,%esp
 f4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 f4d:	5b                   	pop    %ebx
 f4e:	5e                   	pop    %esi
 f4f:	5d                   	pop    %ebp
 f50:	c3                   	ret    
 f51:	66 90                	xchg   %ax,%ax
 f53:	66 90                	xchg   %ax,%ax
 f55:	66 90                	xchg   %ax,%ax
 f57:	66 90                	xchg   %ax,%ax
 f59:	66 90                	xchg   %ax,%ax
 f5b:	66 90                	xchg   %ax,%ax
 f5d:	66 90                	xchg   %ax,%ax
 f5f:	90                   	nop

00000f60 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
 f60:	55                   	push   %ebp
 f61:	89 e5                	mov    %esp,%ebp
 f63:	57                   	push   %edi
 f64:	56                   	push   %esi
 f65:	53                   	push   %ebx
 f66:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
 f6d:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 f73:	83 0c 24 00          	orl    $0x0,(%esp)
 f77:	39 c4                	cmp    %eax,%esp
 f79:	75 f2                	jne    f6d <cpu_bound+0xd>
 f7b:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
 f81:	be e8 03 00 00       	mov    $0x3e8,%esi
 f86:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
 f8c:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
 f92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
 f98:	83 ec 04             	sub    $0x4,%esp
 f9b:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
 fa1:	57                   	push   %edi
 fa2:	50                   	push   %eax
 fa3:	53                   	push   %ebx
 fa4:	e8 e7 f9 ff ff       	call   990 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 fa9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 faf:	89 04 24             	mov    %eax,(%esp)
 fb2:	6a 00                	push   $0x0
 fb4:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 fba:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 fc0:	53                   	push   %ebx
 fc1:	e8 6a f8 ff ff       	call   830 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
 fc6:	83 c4 20             	add    $0x20,%esp
 fc9:	83 ee 01             	sub    $0x1,%esi
 fcc:	75 ca                	jne    f98 <cpu_bound+0x38>
    }
 fce:	8d 65 f4             	lea    -0xc(%ebp),%esp
 fd1:	5b                   	pop    %ebx
 fd2:	5e                   	pop    %esi
 fd3:	5f                   	pop    %edi
 fd4:	5d                   	pop    %ebp
 fd5:	c3                   	ret    
