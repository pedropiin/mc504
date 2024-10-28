
_cat: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
  }
}

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
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 67 03 00 00       	call   3a3 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 2f 03 00 00       	call   38b <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 fa 02 00 00       	call   363 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	push   (%ebx)
  6c:	68 1b 10 00 00       	push   $0x101b
  71:	6a 01                	push   $0x1
  73:	e8 48 04 00 00       	call   4c0 <printf>
      exit();
  78:	e8 e6 02 00 00       	call   363 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 d7 02 00 00       	call   363 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	8b 75 08             	mov    0x8(%ebp),%esi
  97:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 c0 16 00 00       	push   $0x16c0
  a9:	6a 01                	push   $0x1
  ab:	e8 d3 02 00 00       	call   383 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 c0 16 00 00       	push   $0x16c0
  c4:	56                   	push   %esi
  c5:	e8 b1 02 00 00       	call   37b <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 f8 0f 00 00       	push   $0xff8
  e4:	6a 01                	push   $0x1
  e6:	e8 d5 03 00 00       	call   4c0 <printf>
      exit();
  eb:	e8 73 02 00 00       	call   363 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 0a 10 00 00       	push   $0x100a
  f7:	6a 01                	push   $0x1
  f9:	e8 c2 03 00 00       	call   4c0 <printf>
    exit();
  fe:	e8 60 02 00 00       	call   363 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
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
 449:	0f b6 92 90 10 00 00 	movzbl 0x1090(%edx),%edx
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
 539:	ff 24 85 38 10 00 00 	jmp    *0x1038(,%eax,4)
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
 648:	ba 30 10 00 00       	mov    $0x1030,%edx
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
 661:	a1 c0 18 00 00       	mov    0x18c0,%eax
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
 6a2:	89 15 c0 18 00 00    	mov    %edx,0x18c0
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
 6dc:	89 15 c0 18 00 00    	mov    %edx,0x18c0
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
 6fc:	8b 3d c0 18 00 00    	mov    0x18c0,%edi
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
 741:	8b 3d c0 18 00 00    	mov    0x18c0,%edi
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
 76f:	8b 15 c0 18 00 00    	mov    0x18c0,%edx
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
 79f:	89 15 c0 18 00 00    	mov    %edx,0x18c0
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
 7b0:	c7 05 c0 18 00 00 c4 	movl   $0x18c4,0x18c0
 7b7:	18 00 00 
    base.s.size = 0;
 7ba:	bf c4 18 00 00       	mov    $0x18c4,%edi
    base.s.ptr = freep = prevp = &base;
 7bf:	c7 05 c4 18 00 00 c4 	movl   $0x18c4,0x18c4
 7c6:	18 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7cb:	c7 05 c8 18 00 00 00 	movl   $0x0,0x18c8
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

000009b0 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 9b4:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 9b9:	56                   	push   %esi
 9ba:	53                   	push   %ebx
 9bb:	83 ec 0c             	sub    $0xc,%esp
 9be:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 9c1:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 9c4:	e8 f7 00 00 00       	call   ac0 <random>
 9c9:	89 c1                	mov    %eax,%ecx
 9cb:	f7 ef                	imul   %edi
 9cd:	89 c8                	mov    %ecx,%eax
 9cf:	c1 f8 1f             	sar    $0x1f,%eax
 9d2:	c1 fa 06             	sar    $0x6,%edx
 9d5:	29 c2                	sub    %eax,%edx
 9d7:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 9dd:	29 c1                	sub    %eax,%ecx
 9df:	83 f9 63             	cmp    $0x63,%ecx
 9e2:	89 ca                	mov    %ecx,%edx
 9e4:	8d 41 64             	lea    0x64(%ecx),%eax
 9e7:	0f 4e d0             	cmovle %eax,%edx
 9ea:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 9ec:	e8 cf 00 00 00       	call   ac0 <random>
 9f1:	89 c1                	mov    %eax,%ecx
 9f3:	f7 ef                	imul   %edi
 9f5:	89 c8                	mov    %ecx,%eax
 9f7:	c1 f8 1f             	sar    $0x1f,%eax
 9fa:	c1 fa 07             	sar    $0x7,%edx
 9fd:	29 c2                	sub    %eax,%edx
 9ff:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 a05:	29 c1                	sub    %eax,%ecx
 a07:	8d 41 32             	lea    0x32(%ecx),%eax
 a0a:	89 ca                	mov    %ecx,%edx
 a0c:	83 f9 31             	cmp    $0x31,%ecx
 a0f:	0f 4e d0             	cmovle %eax,%edx
 a12:	8b 45 10             	mov    0x10(%ebp),%eax
 a15:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 a17:	8b 13                	mov    (%ebx),%edx
 a19:	85 d2                	test   %edx,%edx
 a1b:	7e 38                	jle    a55 <gen_random_digraph+0xa5>
 a1d:	89 f1                	mov    %esi,%ecx
 a1f:	31 ff                	xor    %edi,%edi
 a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 a28:	31 c0                	xor    %eax,%eax
 a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 a30:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 a37:	8b 13                	mov    (%ebx),%edx
 a39:	83 c0 01             	add    $0x1,%eax
 a3c:	39 c2                	cmp    %eax,%edx
 a3e:	7f f0                	jg     a30 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 a40:	83 c7 01             	add    $0x1,%edi
 a43:	81 c1 20 03 00 00    	add    $0x320,%ecx
 a49:	39 fa                	cmp    %edi,%edx
 a4b:	7f db                	jg     a28 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 a4d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 a53:	7f 22                	jg     a77 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 a55:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 a5b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 a62:	8d 04 86             	lea    (%esi,%eax,4),%eax
 a65:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 a68:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 a6e:	05 20 03 00 00       	add    $0x320,%eax
 a73:	39 d0                	cmp    %edx,%eax
 a75:	75 f1                	jne    a68 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 a77:	8b 45 10             	mov    0x10(%ebp),%eax
 a7a:	31 c9                	xor    %ecx,%ecx
 a7c:	8b 00                	mov    (%eax),%eax
 a7e:	85 c0                	test   %eax,%eax
 a80:	7e 31                	jle    ab3 <gen_random_digraph+0x103>
 a82:	89 75 08             	mov    %esi,0x8(%ebp)
 a85:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 a87:	e8 34 00 00 00       	call   ac0 <random>
    for (int i = 0; i < *num_edges; i++) {
 a8c:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 a8f:	99                   	cltd   
 a90:	f7 3b                	idivl  (%ebx)
 a92:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 a94:	e8 27 00 00 00       	call   ac0 <random>
        graph[new_edge_u][new_edge_v] = 1;
 a99:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 a9f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 aa2:	99                   	cltd   
 aa3:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 aa5:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 aa8:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 aaf:	39 30                	cmp    %esi,(%eax)
 ab1:	7f d4                	jg     a87 <gen_random_digraph+0xd7>
    }
}
 ab3:	83 c4 0c             	add    $0xc,%esp
 ab6:	5b                   	pop    %ebx
 ab7:	5e                   	pop    %esi
 ab8:	5f                   	pop    %edi
 ab9:	5d                   	pop    %ebp
 aba:	c3                   	ret    
 abb:	66 90                	xchg   %ax,%ax
 abd:	66 90                	xchg   %ax,%ax
 abf:	90                   	nop

00000ac0 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 ac0:	69 0d a4 16 00 00 0d 	imul   $0x19660d,0x16a4,%ecx
 ac7:	66 19 00 
 aca:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 acf:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 ad5:	89 c8                	mov    %ecx,%eax
 ad7:	f7 ea                	imul   %edx
 ad9:	89 d0                	mov    %edx,%eax
 adb:	89 ca                	mov    %ecx,%edx
 add:	c1 fa 1f             	sar    $0x1f,%edx
 ae0:	c1 f8 1d             	sar    $0x1d,%eax
 ae3:	29 d0                	sub    %edx,%eax
 ae5:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 aeb:	89 c8                	mov    %ecx,%eax
 aed:	29 d0                	sub    %edx,%eax
 aef:	a3 a4 16 00 00       	mov    %eax,0x16a4
    return seed;
 af4:	c3                   	ret    
 af5:	66 90                	xchg   %ax,%ax
 af7:	66 90                	xchg   %ax,%ax
 af9:	66 90                	xchg   %ax,%ax
 afb:	66 90                	xchg   %ax,%ax
 afd:	66 90                	xchg   %ax,%ax
 aff:	90                   	nop

00000b00 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	57                   	push   %edi
 b04:	56                   	push   %esi
 b05:	53                   	push   %ebx
 b06:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 b0c:	83 0c 24 00          	orl    $0x0,(%esp)
 b10:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 b16:	83 0c 24 00          	orl    $0x0,(%esp)
 b1a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
 b20:	6a 00                	push   $0x0
 b22:	ff 75 08             	push   0x8(%ebp)
 b25:	e8 79 f8 ff ff       	call   3a3 <open>
    if (fp < 0 ) {
 b2a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
 b2d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
 b33:	85 c0                	test   %eax,%eax
 b35:	0f 88 99 01 00 00    	js     cd4 <permute_line+0x1d4>
 b3b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 b41:	31 db                	xor    %ebx,%ebx
 b43:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
 b49:	89 f7                	mov    %esi,%edi
 b4b:	89 de                	mov    %ebx,%esi
 b4d:	89 c3                	mov    %eax,%ebx
 b4f:	eb 12                	jmp    b63 <permute_line+0x63>
 b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 b58:	83 c7 66             	add    $0x66,%edi
 b5b:	83 fe 64             	cmp    $0x64,%esi
 b5e:	74 16                	je     b76 <permute_line+0x76>
        line_idx++;
 b60:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 b63:	83 ec 04             	sub    $0x4,%esp
 b66:	6a 66                	push   $0x66
 b68:	57                   	push   %edi
 b69:	53                   	push   %ebx
 b6a:	e8 0c f8 ff ff       	call   37b <read>
 b6f:	83 c4 10             	add    $0x10,%esp
 b72:	85 c0                	test   %eax,%eax
 b74:	7f e2                	jg     b58 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
 b76:	89 f3                	mov    %esi,%ebx
 b78:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
 b7e:	e8 3d ff ff ff       	call   ac0 <random>
 b83:	89 c1                	mov    %eax,%ecx
 b85:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 b8a:	f7 e9                	imul   %ecx
 b8c:	89 c8                	mov    %ecx,%eax
 b8e:	c1 f8 1f             	sar    $0x1f,%eax
 b91:	c1 fa 05             	sar    $0x5,%edx
 b94:	29 c2                	sub    %eax,%edx
 b96:	6b c2 64             	imul   $0x64,%edx,%eax
 b99:	29 c1                	sub    %eax,%ecx
 b9b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
 b9d:	e8 1e ff ff ff       	call   ac0 <random>
 ba2:	89 c1                	mov    %eax,%ecx
 ba4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 ba9:	f7 e9                	imul   %ecx
 bab:	89 c8                	mov    %ecx,%eax
 bad:	c1 f8 1f             	sar    $0x1f,%eax
 bb0:	c1 fa 05             	sar    $0x5,%edx
 bb3:	29 c2                	sub    %eax,%edx
 bb5:	6b c2 64             	imul   $0x64,%edx,%eax
 bb8:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
 bba:	39 cf                	cmp    %ecx,%edi
 bbc:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
 bc2:	74 5f                	je     c23 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
 bc4:	6b c7 66             	imul   $0x66,%edi,%eax
 bc7:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
 bcd:	83 ec 08             	sub    $0x8,%esp
 bd0:	01 c1                	add    %eax,%ecx
 bd2:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 bd8:	51                   	push   %ecx
 bd9:	50                   	push   %eax
 bda:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
 be0:	e8 2b f5 ff ff       	call   110 <strcpy>
        strcpy(lines[line1], lines[line2]);
 be5:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 beb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 bf1:	6b d2 66             	imul   $0x66,%edx,%edx
 bf4:	01 c2                	add    %eax,%edx
 bf6:	58                   	pop    %eax
 bf7:	59                   	pop    %ecx
 bf8:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
 bfe:	52                   	push   %edx
 bff:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 c05:	51                   	push   %ecx
 c06:	e8 05 f5 ff ff       	call   110 <strcpy>
        strcpy(lines[line2], temp);
 c0b:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 c11:	5f                   	pop    %edi
 c12:	58                   	pop    %eax
 c13:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 c19:	50                   	push   %eax
 c1a:	52                   	push   %edx
 c1b:	e8 f0 f4 ff ff       	call   110 <strcpy>
 c20:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 c23:	83 ec 0c             	sub    $0xc,%esp
 c26:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 c2c:	e8 5a f7 ff ff       	call   38b <close>
    fp = open(file_path, O_RDWR);
 c31:	58                   	pop    %eax
 c32:	5a                   	pop    %edx
 c33:	6a 02                	push   $0x2
 c35:	ff 75 08             	push   0x8(%ebp)
 c38:	e8 66 f7 ff ff       	call   3a3 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 c3d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 c3e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 c40:	58                   	pop    %eax
 c41:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 c47:	50                   	push   %eax
 c48:	57                   	push   %edi
 c49:	e8 6d f7 ff ff       	call   3bb <fstat>
    char *buffer = malloc(0);
 c4e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 c55:	e8 96 fa ff ff       	call   6f0 <malloc>
    memset(buffer, 0, 0);  
 c5a:	83 c4 0c             	add    $0xc,%esp
 c5d:	6a 00                	push   $0x0
 c5f:	6a 00                	push   $0x0
 c61:	50                   	push   %eax
 c62:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 c68:	e8 63 f5 ff ff       	call   1d0 <memset>
    write(fp, buffer, 0);
 c6d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 c73:	83 c4 0c             	add    $0xc,%esp
 c76:	6a 00                	push   $0x0
 c78:	52                   	push   %edx
 c79:	57                   	push   %edi
 c7a:	e8 04 f7 ff ff       	call   383 <write>
    free(buffer);
 c7f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 c85:	89 14 24             	mov    %edx,(%esp)
 c88:	e8 d3 f9 ff ff       	call   660 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 c8d:	83 c4 10             	add    $0x10,%esp
 c90:	85 ff                	test   %edi,%edi
 c92:	78 59                	js     ced <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 c94:	85 db                	test   %ebx,%ebx
 c96:	74 26                	je     cbe <permute_line+0x1be>
 c98:	6b db 66             	imul   $0x66,%ebx,%ebx
 c9b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 ca1:	01 c3                	add    %eax,%ebx
 ca3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ca7:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 ca8:	83 ec 04             	sub    $0x4,%esp
 cab:	6a 66                	push   $0x66
 cad:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 cae:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 cb1:	57                   	push   %edi
 cb2:	e8 cc f6 ff ff       	call   383 <write>
    for (int i = 0; i < line_idx; i++) {
 cb7:	83 c4 10             	add    $0x10,%esp
 cba:	39 de                	cmp    %ebx,%esi
 cbc:	75 ea                	jne    ca8 <permute_line+0x1a8>
    }

    close(fp);
 cbe:	83 ec 0c             	sub    $0xc,%esp
 cc1:	57                   	push   %edi
 cc2:	e8 c4 f6 ff ff       	call   38b <close>
    return 0;
 cc7:	83 c4 10             	add    $0x10,%esp
 cca:	31 c0                	xor    %eax,%eax
 ccc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ccf:	5b                   	pop    %ebx
 cd0:	5e                   	pop    %esi
 cd1:	5f                   	pop    %edi
 cd2:	5d                   	pop    %ebp
 cd3:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 cd4:	83 ec 08             	sub    $0x8,%esp
 cd7:	68 a4 10 00 00       	push   $0x10a4
 cdc:	6a 01                	push   $0x1
 cde:	e8 dd f7 ff ff       	call   4c0 <printf>
        return -1;
 ce3:	83 c4 10             	add    $0x10,%esp
 ce6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ceb:	eb df                	jmp    ccc <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 ced:	83 ec 08             	sub    $0x8,%esp
 cf0:	68 ec 10 00 00       	push   $0x10ec
 cf5:	6a 01                	push   $0x1
 cf7:	e8 c4 f7 ff ff       	call   4c0 <printf>
        return -1;
 cfc:	83 c4 10             	add    $0x10,%esp
 cff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d04:	eb c6                	jmp    ccc <permute_line+0x1cc>
 d06:	66 90                	xchg   %ax,%ax
 d08:	66 90                	xchg   %ax,%ax
 d0a:	66 90                	xchg   %ax,%ax
 d0c:	66 90                	xchg   %ax,%ax
 d0e:	66 90                	xchg   %ax,%ax

00000d10 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
 d10:	55                   	push   %ebp
 d11:	89 e5                	mov    %esp,%ebp
 d13:	57                   	push   %edi
 d14:	56                   	push   %esi
 d15:	53                   	push   %ebx
 d16:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 d1c:	83 0c 24 00          	orl    $0x0,(%esp)
 d20:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 d26:	83 0c 24 00          	orl    $0x0,(%esp)
 d2a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
 d30:	6a 00                	push   $0x0
 d32:	ff 75 08             	push   0x8(%ebp)
 d35:	e8 69 f6 ff ff       	call   3a3 <open>
    if (fp < 0) {
 d3a:	83 c4 10             	add    $0x10,%esp
 d3d:	85 c0                	test   %eax,%eax
 d3f:	0f 88 b1 00 00 00    	js     df6 <add_line+0xe6>
 d45:	89 c3                	mov    %eax,%ebx
 d47:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 d4d:	31 f6                	xor    %esi,%esi
 d4f:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
 d55:	89 c7                	mov    %eax,%edi
 d57:	eb 12                	jmp    d6b <add_line+0x5b>
 d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 d60:	83 c7 66             	add    $0x66,%edi
 d63:	83 fe 64             	cmp    $0x64,%esi
 d66:	74 1c                	je     d84 <add_line+0x74>
        line_idx++;
 d68:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 d6b:	83 ec 04             	sub    $0x4,%esp
 d6e:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
 d74:	6a 66                	push   $0x66
 d76:	57                   	push   %edi
 d77:	53                   	push   %ebx
 d78:	e8 fe f5 ff ff       	call   37b <read>
 d7d:	83 c4 10             	add    $0x10,%esp
 d80:	85 c0                	test   %eax,%eax
 d82:	7f dc                	jg     d60 <add_line+0x50>
    }
    close(fp); 
 d84:	83 ec 0c             	sub    $0xc,%esp
 d87:	53                   	push   %ebx
 d88:	e8 fe f5 ff ff       	call   38b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 d8d:	58                   	pop    %eax
 d8e:	5a                   	pop    %edx
 d8f:	ff 75 0c             	push   0xc(%ebp)
 d92:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 d98:	e8 73 f3 ff ff       	call   110 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 d9d:	59                   	pop    %ecx
 d9e:	5b                   	pop    %ebx
 d9f:	6a 01                	push   $0x1
 da1:	ff 75 08             	push   0x8(%ebp)
 da4:	e8 fa f5 ff ff       	call   3a3 <open>
    if (fp < 0) {
 da9:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
 dac:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
 dae:	85 c0                	test   %eax,%eax
 db0:	78 5d                	js     e0f <add_line+0xff>
 db2:	6b ce 66             	imul   $0x66,%esi,%ecx
 db5:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
 dbb:	8d 78 66             	lea    0x66(%eax),%edi
 dbe:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
 dc1:	eb 08                	jmp    dcb <add_line+0xbb>
 dc3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 dc7:	90                   	nop
 dc8:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
 dcb:	83 ec 04             	sub    $0x4,%esp
 dce:	6a 66                	push   $0x66
 dd0:	50                   	push   %eax
 dd1:	53                   	push   %ebx
 dd2:	e8 ac f5 ff ff       	call   383 <write>
    for (int i = 0; i < line_idx; i++) {
 dd7:	89 f8                	mov    %edi,%eax
 dd9:	83 c4 10             	add    $0x10,%esp
 ddc:	39 f7                	cmp    %esi,%edi
 dde:	75 e8                	jne    dc8 <add_line+0xb8>
    }

    close(fp);
 de0:	83 ec 0c             	sub    $0xc,%esp
 de3:	53                   	push   %ebx
 de4:	e8 a2 f5 ff ff       	call   38b <close>
    return 0;
 de9:	83 c4 10             	add    $0x10,%esp
 dec:	31 c0                	xor    %eax,%eax
}
 dee:	8d 65 f4             	lea    -0xc(%ebp),%esp
 df1:	5b                   	pop    %ebx
 df2:	5e                   	pop    %esi
 df3:	5f                   	pop    %edi
 df4:	5d                   	pop    %ebp
 df5:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
 df6:	83 ec 08             	sub    $0x8,%esp
 df9:	68 28 11 00 00       	push   $0x1128
 dfe:	6a 01                	push   $0x1
 e00:	e8 bb f6 ff ff       	call   4c0 <printf>
        return -1;
 e05:	83 c4 10             	add    $0x10,%esp
 e08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 e0d:	eb df                	jmp    dee <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 e0f:	83 ec 08             	sub    $0x8,%esp
 e12:	68 4c 11 00 00       	push   $0x114c
 e17:	6a 01                	push   $0x1
 e19:	e8 a2 f6 ff ff       	call   4c0 <printf>
        return -1;
 e1e:	83 c4 10             	add    $0x10,%esp
 e21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 e26:	eb c6                	jmp    dee <add_line+0xde>
 e28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e2f:	90                   	nop

00000e30 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
 e30:	55                   	push   %ebp
 e31:	89 e5                	mov    %esp,%ebp
 e33:	57                   	push   %edi
 e34:	56                   	push   %esi
 e35:	53                   	push   %ebx
 e36:	83 ec 0c             	sub    $0xc,%esp
 e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
 e3c:	8d 73 64             	lea    0x64(%ebx),%esi
 e3f:	89 f7                	mov    %esi,%edi
 e41:	8b 75 0c             	mov    0xc(%ebp),%esi
 e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
 e48:	e8 73 fc ff ff       	call   ac0 <random>
 e4d:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e4f:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
 e52:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
 e55:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 e59:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 e5c:	39 fb                	cmp    %edi,%ebx
 e5e:	75 e8                	jne    e48 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
 e60:	8b 45 08             	mov    0x8(%ebp),%eax
 e63:	ba 0a 00 00 00       	mov    $0xa,%edx
 e68:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
 e6c:	83 c4 0c             	add    $0xc,%esp
 e6f:	5b                   	pop    %ebx
 e70:	5e                   	pop    %esi
 e71:	5f                   	pop    %edi
 e72:	5d                   	pop    %ebp
 e73:	c3                   	ret    
 e74:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 e7f:	90                   	nop

00000e80 <write_random_string>:

int write_random_string(char file_path[]) {
 e80:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e81:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
 e86:	89 e5                	mov    %esp,%ebp
 e88:	57                   	push   %edi
 e89:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 e8a:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
 e90:	be 70 11 00 00       	mov    $0x1170,%esi
int write_random_string(char file_path[]) {
 e95:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
 e96:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
 e9b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 ea1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 ea3:	0f b7 06             	movzwl (%esi),%eax
 ea6:	8d 75 e6             	lea    -0x1a(%ebp),%esi
 ea9:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 eac:	8d 7d 82             	lea    -0x7e(%ebp),%edi
 eaf:	90                   	nop
        int idx_new_char = random() % size_char_set;
 eb0:	e8 0b fc ff ff       	call   ac0 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 eb5:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
 eb8:	89 c1                	mov    %eax,%ecx
 eba:	f7 e3                	mul    %ebx
 ebc:	c1 ea 06             	shr    $0x6,%edx
 ebf:	6b d2 55             	imul   $0x55,%edx,%edx
 ec2:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
 ec4:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
 ecb:	ff 
 ecc:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 ecf:	39 f7                	cmp    %esi,%edi
 ed1:	75 dd                	jne    eb0 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
 ed3:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
 ed8:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
 edb:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
 edf:	8d 45 82             	lea    -0x7e(%ebp),%eax
 ee2:	50                   	push   %eax
 ee3:	ff 75 08             	push   0x8(%ebp)
 ee6:	e8 25 fe ff ff       	call   d10 <add_line>

    return 0;
}
 eeb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 eee:	31 c0                	xor    %eax,%eax
 ef0:	5b                   	pop    %ebx
 ef1:	5e                   	pop    %esi
 ef2:	5f                   	pop    %edi
 ef3:	5d                   	pop    %ebp
 ef4:	c3                   	ret    
 ef5:	66 90                	xchg   %ax,%ax
 ef7:	66 90                	xchg   %ax,%ax
 ef9:	66 90                	xchg   %ax,%ax
 efb:	66 90                	xchg   %ax,%ax
 efd:	66 90                	xchg   %ax,%ax
 eff:	90                   	nop

00000f00 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
 f00:	55                   	push   %ebp
 f01:	89 e5                	mov    %esp,%ebp
 f03:	56                   	push   %esi
 f04:	8b 75 08             	mov    0x8(%ebp),%esi
 f07:	53                   	push   %ebx
 f08:	bb 64 00 00 00       	mov    $0x64,%ebx
 f0d:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
 f10:	83 ec 0c             	sub    $0xc,%esp
 f13:	56                   	push   %esi
 f14:	e8 67 ff ff ff       	call   e80 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
 f19:	83 c4 10             	add    $0x10,%esp
 f1c:	83 eb 01             	sub    $0x1,%ebx
 f1f:	75 ef                	jne    f10 <io_bound+0x10>
 f21:	bb 32 00 00 00       	mov    $0x32,%ebx
 f26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 f2d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
 f30:	83 ec 0c             	sub    $0xc,%esp
 f33:	56                   	push   %esi
 f34:	e8 c7 fb ff ff       	call   b00 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
 f39:	83 c4 10             	add    $0x10,%esp
 f3c:	83 eb 01             	sub    $0x1,%ebx
 f3f:	75 ef                	jne    f30 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
 f41:	83 ec 0c             	sub    $0xc,%esp
 f44:	56                   	push   %esi
 f45:	e8 69 f4 ff ff       	call   3b3 <unlink>
 f4a:	83 c4 10             	add    $0x10,%esp
 f4d:	85 c0                	test   %eax,%eax
 f4f:	75 07                	jne    f58 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
 f51:	8d 65 f8             	lea    -0x8(%ebp),%esp
 f54:	5b                   	pop    %ebx
 f55:	5e                   	pop    %esi
 f56:	5d                   	pop    %ebp
 f57:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
 f58:	83 ec 08             	sub    $0x8,%esp
 f5b:	68 c8 11 00 00       	push   $0x11c8
 f60:	6a 01                	push   $0x1
 f62:	e8 59 f5 ff ff       	call   4c0 <printf>
 f67:	83 c4 10             	add    $0x10,%esp
 f6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 f6d:	5b                   	pop    %ebx
 f6e:	5e                   	pop    %esi
 f6f:	5d                   	pop    %ebp
 f70:	c3                   	ret    
 f71:	66 90                	xchg   %ax,%ax
 f73:	66 90                	xchg   %ax,%ax
 f75:	66 90                	xchg   %ax,%ax
 f77:	66 90                	xchg   %ax,%ax
 f79:	66 90                	xchg   %ax,%ax
 f7b:	66 90                	xchg   %ax,%ax
 f7d:	66 90                	xchg   %ax,%ax
 f7f:	90                   	nop

00000f80 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
 f80:	55                   	push   %ebp
 f81:	89 e5                	mov    %esp,%ebp
 f83:	57                   	push   %edi
 f84:	56                   	push   %esi
 f85:	53                   	push   %ebx
 f86:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
 f8d:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 f93:	83 0c 24 00          	orl    $0x0,(%esp)
 f97:	39 c4                	cmp    %eax,%esp
 f99:	75 f2                	jne    f8d <cpu_bound+0xd>
 f9b:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
 fa1:	be e8 03 00 00       	mov    $0x3e8,%esi
 fa6:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
 fac:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
 fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
 fb8:	83 ec 04             	sub    $0x4,%esp
 fbb:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
 fc1:	57                   	push   %edi
 fc2:	50                   	push   %eax
 fc3:	53                   	push   %ebx
 fc4:	e8 e7 f9 ff ff       	call   9b0 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 fc9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 fcf:	89 04 24             	mov    %eax,(%esp)
 fd2:	6a 00                	push   $0x0
 fd4:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 fda:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 fe0:	53                   	push   %ebx
 fe1:	e8 6a f8 ff ff       	call   850 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
 fe6:	83 c4 20             	add    $0x20,%esp
 fe9:	83 ee 01             	sub    $0x1,%esi
 fec:	75 ca                	jne    fb8 <cpu_bound+0x38>
    }
 fee:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ff1:	5b                   	pop    %ebx
 ff2:	5e                   	pop    %esi
 ff3:	5f                   	pop    %edi
 ff4:	5d                   	pop    %ebp
 ff5:	c3                   	ret    
