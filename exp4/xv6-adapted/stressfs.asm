
_stressfs: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
       7:	b8 30 00 00 00       	mov    $0x30,%eax
{
       c:	ff 71 fc             	push   -0x4(%ecx)
       f:	55                   	push   %ebp
      10:	89 e5                	mov    %esp,%ebp
      12:	57                   	push   %edi
      13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
      14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
      1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
      1b:	31 db                	xor    %ebx,%ebx
{
      1d:	51                   	push   %ecx
      1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
      24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
      2b:	68 28 10 00 00       	push   $0x1028
      30:	6a 01                	push   $0x1
  char path[] = "stressfs0";
      32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
      39:	74 72 65 
      3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
      43:	73 66 73 
  printf(1, "stressfs starting\n");
      46:	e8 a5 04 00 00       	call   4f0 <printf>
  memset(data, 'a', sizeof(data));
      4b:	83 c4 0c             	add    $0xc,%esp
      4e:	68 00 02 00 00       	push   $0x200
      53:	6a 61                	push   $0x61
      55:	56                   	push   %esi
      56:	e8 a5 01 00 00       	call   200 <memset>
      5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
      5e:	e8 28 03 00 00       	call   38b <fork>
      63:	85 c0                	test   %eax,%eax
      65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
      6b:	83 c3 01             	add    $0x1,%ebx
      6e:	83 fb 04             	cmp    $0x4,%ebx
      71:	75 eb                	jne    5e <main+0x5e>
      73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
      78:	83 ec 04             	sub    $0x4,%esp
      7b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
      7c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
      81:	68 3b 10 00 00       	push   $0x103b
      86:	6a 01                	push   $0x1
      88:	e8 63 04 00 00       	call   4f0 <printf>
  path[8] += i;
      8d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
      8f:	5f                   	pop    %edi
  path[8] += i;
      90:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
      96:	58                   	pop    %eax
      97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
      9d:	68 02 02 00 00       	push   $0x202
      a2:	50                   	push   %eax
      a3:	e8 2b 03 00 00       	call   3d3 <open>
      a8:	83 c4 10             	add    $0x10,%esp
      ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
      ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
      b0:	83 ec 04             	sub    $0x4,%esp
      b3:	68 00 02 00 00       	push   $0x200
      b8:	56                   	push   %esi
      b9:	57                   	push   %edi
      ba:	e8 f4 02 00 00       	call   3b3 <write>
  for(i = 0; i < 20; i++)
      bf:	83 c4 10             	add    $0x10,%esp
      c2:	83 eb 01             	sub    $0x1,%ebx
      c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
      c7:	83 ec 0c             	sub    $0xc,%esp
      ca:	57                   	push   %edi
      cb:	e8 eb 02 00 00       	call   3bb <close>

  printf(1, "read\n");
      d0:	58                   	pop    %eax
      d1:	5a                   	pop    %edx
      d2:	68 45 10 00 00       	push   $0x1045
      d7:	6a 01                	push   $0x1
      d9:	e8 12 04 00 00       	call   4f0 <printf>

  fd = open(path, O_RDONLY);
      de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
      e4:	59                   	pop    %ecx
      e5:	5b                   	pop    %ebx
      e6:	6a 00                	push   $0x0
      e8:	bb 14 00 00 00       	mov    $0x14,%ebx
      ed:	50                   	push   %eax
      ee:	e8 e0 02 00 00       	call   3d3 <open>
      f3:	83 c4 10             	add    $0x10,%esp
      f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
      f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      ff:	90                   	nop
    read(fd, data, sizeof(data));
     100:	83 ec 04             	sub    $0x4,%esp
     103:	68 00 02 00 00       	push   $0x200
     108:	56                   	push   %esi
     109:	57                   	push   %edi
     10a:	e8 9c 02 00 00       	call   3ab <read>
  for (i = 0; i < 20; i++)
     10f:	83 c4 10             	add    $0x10,%esp
     112:	83 eb 01             	sub    $0x1,%ebx
     115:	75 e9                	jne    100 <main+0x100>
  close(fd);
     117:	83 ec 0c             	sub    $0xc,%esp
     11a:	57                   	push   %edi
     11b:	e8 9b 02 00 00       	call   3bb <close>

  wait();
     120:	e8 76 02 00 00       	call   39b <wait>

  exit();
     125:	e8 69 02 00 00       	call   393 <exit>
  path[8] += i;
     12a:	89 df                	mov    %ebx,%edi
     12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
     131:	66 90                	xchg   %ax,%ax
     133:	66 90                	xchg   %ax,%ax
     135:	66 90                	xchg   %ax,%ax
     137:	66 90                	xchg   %ax,%ax
     139:	66 90                	xchg   %ax,%ax
     13b:	66 90                	xchg   %ax,%ax
     13d:	66 90                	xchg   %ax,%ax
     13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     141:	31 c0                	xor    %eax,%eax
{
     143:	89 e5                	mov    %esp,%ebp
     145:	53                   	push   %ebx
     146:	8b 4d 08             	mov    0x8(%ebp),%ecx
     149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     157:	83 c0 01             	add    $0x1,%eax
     15a:	84 d2                	test   %dl,%dl
     15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
     15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     161:	89 c8                	mov    %ecx,%eax
     163:	c9                   	leave  
     164:	c3                   	ret    
     165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	53                   	push   %ebx
     174:	8b 55 08             	mov    0x8(%ebp),%edx
     177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     17a:	0f b6 02             	movzbl (%edx),%eax
     17d:	84 c0                	test   %al,%al
     17f:	75 17                	jne    198 <strcmp+0x28>
     181:	eb 3a                	jmp    1bd <strcmp+0x4d>
     183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     187:	90                   	nop
     188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     18c:	83 c2 01             	add    $0x1,%edx
     18f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     192:	84 c0                	test   %al,%al
     194:	74 1a                	je     1b0 <strcmp+0x40>
    p++, q++;
     196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     198:	0f b6 19             	movzbl (%ecx),%ebx
     19b:	38 c3                	cmp    %al,%bl
     19d:	74 e9                	je     188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     19f:	29 d8                	sub    %ebx,%eax
}
     1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1a4:	c9                   	leave  
     1a5:	c3                   	ret    
     1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     1b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     1b4:	31 c0                	xor    %eax,%eax
     1b6:	29 d8                	sub    %ebx,%eax
}
     1b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1bb:	c9                   	leave  
     1bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     1bd:	0f b6 19             	movzbl (%ecx),%ebx
     1c0:	31 c0                	xor    %eax,%eax
     1c2:	eb db                	jmp    19f <strcmp+0x2f>
     1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     1cf:	90                   	nop

000001d0 <strlen>:

uint
strlen(const char *s)
{
     1d0:	55                   	push   %ebp
     1d1:	89 e5                	mov    %esp,%ebp
     1d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     1d6:	80 3a 00             	cmpb   $0x0,(%edx)
     1d9:	74 15                	je     1f0 <strlen+0x20>
     1db:	31 c0                	xor    %eax,%eax
     1dd:	8d 76 00             	lea    0x0(%esi),%esi
     1e0:	83 c0 01             	add    $0x1,%eax
     1e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     1e7:	89 c1                	mov    %eax,%ecx
     1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
     1eb:	89 c8                	mov    %ecx,%eax
     1ed:	5d                   	pop    %ebp
     1ee:	c3                   	ret    
     1ef:	90                   	nop
  for(n = 0; s[n]; n++)
     1f0:	31 c9                	xor    %ecx,%ecx
}
     1f2:	5d                   	pop    %ebp
     1f3:	89 c8                	mov    %ecx,%eax
     1f5:	c3                   	ret    
     1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	57                   	push   %edi
     204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     207:	8b 4d 10             	mov    0x10(%ebp),%ecx
     20a:	8b 45 0c             	mov    0xc(%ebp),%eax
     20d:	89 d7                	mov    %edx,%edi
     20f:	fc                   	cld    
     210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     212:	8b 7d fc             	mov    -0x4(%ebp),%edi
     215:	89 d0                	mov    %edx,%eax
     217:	c9                   	leave  
     218:	c3                   	ret    
     219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
     220:	55                   	push   %ebp
     221:	89 e5                	mov    %esp,%ebp
     223:	8b 45 08             	mov    0x8(%ebp),%eax
     226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     22a:	0f b6 10             	movzbl (%eax),%edx
     22d:	84 d2                	test   %dl,%dl
     22f:	75 12                	jne    243 <strchr+0x23>
     231:	eb 1d                	jmp    250 <strchr+0x30>
     233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     237:	90                   	nop
     238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     23c:	83 c0 01             	add    $0x1,%eax
     23f:	84 d2                	test   %dl,%dl
     241:	74 0d                	je     250 <strchr+0x30>
    if(*s == c)
     243:	38 d1                	cmp    %dl,%cl
     245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
     247:	5d                   	pop    %ebp
     248:	c3                   	ret    
     249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     250:	31 c0                	xor    %eax,%eax
}
     252:	5d                   	pop    %ebp
     253:	c3                   	ret    
     254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     25f:	90                   	nop

00000260 <gets>:

char*
gets(char *buf, int max)
{
     260:	55                   	push   %ebp
     261:	89 e5                	mov    %esp,%ebp
     263:	57                   	push   %edi
     264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     269:	31 db                	xor    %ebx,%ebx
{
     26b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     26e:	eb 27                	jmp    297 <gets+0x37>
    cc = read(0, &c, 1);
     270:	83 ec 04             	sub    $0x4,%esp
     273:	6a 01                	push   $0x1
     275:	57                   	push   %edi
     276:	6a 00                	push   $0x0
     278:	e8 2e 01 00 00       	call   3ab <read>
    if(cc < 1)
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
     284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     288:	8b 55 08             	mov    0x8(%ebp),%edx
     28b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     28f:	3c 0a                	cmp    $0xa,%al
     291:	74 1d                	je     2b0 <gets+0x50>
     293:	3c 0d                	cmp    $0xd,%al
     295:	74 19                	je     2b0 <gets+0x50>
  for(i=0; i+1 < max; ){
     297:	89 de                	mov    %ebx,%esi
     299:	83 c3 01             	add    $0x1,%ebx
     29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     29f:	7c cf                	jl     270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     2a1:	8b 45 08             	mov    0x8(%ebp),%eax
     2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2ab:	5b                   	pop    %ebx
     2ac:	5e                   	pop    %esi
     2ad:	5f                   	pop    %edi
     2ae:	5d                   	pop    %ebp
     2af:	c3                   	ret    
  buf[i] = '\0';
     2b0:	8b 45 08             	mov    0x8(%ebp),%eax
     2b3:	89 de                	mov    %ebx,%esi
     2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2bc:	5b                   	pop    %ebx
     2bd:	5e                   	pop    %esi
     2be:	5f                   	pop    %edi
     2bf:	5d                   	pop    %ebp
     2c0:	c3                   	ret    
     2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     2cf:	90                   	nop

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
     2d0:	55                   	push   %ebp
     2d1:	89 e5                	mov    %esp,%ebp
     2d3:	56                   	push   %esi
     2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2d5:	83 ec 08             	sub    $0x8,%esp
     2d8:	6a 00                	push   $0x0
     2da:	ff 75 08             	push   0x8(%ebp)
     2dd:	e8 f1 00 00 00       	call   3d3 <open>
  if(fd < 0)
     2e2:	83 c4 10             	add    $0x10,%esp
     2e5:	85 c0                	test   %eax,%eax
     2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     2e9:	83 ec 08             	sub    $0x8,%esp
     2ec:	ff 75 0c             	push   0xc(%ebp)
     2ef:	89 c3                	mov    %eax,%ebx
     2f1:	50                   	push   %eax
     2f2:	e8 f4 00 00 00       	call   3eb <fstat>
  close(fd);
     2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     2fa:	89 c6                	mov    %eax,%esi
  close(fd);
     2fc:	e8 ba 00 00 00       	call   3bb <close>
  return r;
     301:	83 c4 10             	add    $0x10,%esp
}
     304:	8d 65 f8             	lea    -0x8(%ebp),%esp
     307:	89 f0                	mov    %esi,%eax
     309:	5b                   	pop    %ebx
     30a:	5e                   	pop    %esi
     30b:	5d                   	pop    %ebp
     30c:	c3                   	ret    
     30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     310:	be ff ff ff ff       	mov    $0xffffffff,%esi
     315:	eb ed                	jmp    304 <stat+0x34>
     317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     31e:	66 90                	xchg   %ax,%ax

00000320 <atoi>:

int
atoi(const char *s)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     327:	0f be 02             	movsbl (%edx),%eax
     32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     32d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     335:	77 1e                	ja     355 <atoi+0x35>
     337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     340:	83 c2 01             	add    $0x1,%edx
     343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     34a:	0f be 02             	movsbl (%edx),%eax
     34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     350:	80 fb 09             	cmp    $0x9,%bl
     353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
     355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     358:	89 c8                	mov    %ecx,%eax
     35a:	c9                   	leave  
     35b:	c3                   	ret    
     35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	57                   	push   %edi
     364:	8b 45 10             	mov    0x10(%ebp),%eax
     367:	8b 55 08             	mov    0x8(%ebp),%edx
     36a:	56                   	push   %esi
     36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     36e:	85 c0                	test   %eax,%eax
     370:	7e 13                	jle    385 <memmove+0x25>
     372:	01 d0                	add    %edx,%eax
  dst = vdst;
     374:	89 d7                	mov    %edx,%edi
     376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     37d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     381:	39 f8                	cmp    %edi,%eax
     383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
     385:	5e                   	pop    %esi
     386:	89 d0                	mov    %edx,%eax
     388:	5f                   	pop    %edi
     389:	5d                   	pop    %ebp
     38a:	c3                   	ret    

0000038b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     38b:	b8 01 00 00 00       	mov    $0x1,%eax
     390:	cd 40                	int    $0x40
     392:	c3                   	ret    

00000393 <exit>:
SYSCALL(exit)
     393:	b8 02 00 00 00       	mov    $0x2,%eax
     398:	cd 40                	int    $0x40
     39a:	c3                   	ret    

0000039b <wait>:
SYSCALL(wait)
     39b:	b8 03 00 00 00       	mov    $0x3,%eax
     3a0:	cd 40                	int    $0x40
     3a2:	c3                   	ret    

000003a3 <pipe>:
SYSCALL(pipe)
     3a3:	b8 04 00 00 00       	mov    $0x4,%eax
     3a8:	cd 40                	int    $0x40
     3aa:	c3                   	ret    

000003ab <read>:
SYSCALL(read)
     3ab:	b8 05 00 00 00       	mov    $0x5,%eax
     3b0:	cd 40                	int    $0x40
     3b2:	c3                   	ret    

000003b3 <write>:
SYSCALL(write)
     3b3:	b8 10 00 00 00       	mov    $0x10,%eax
     3b8:	cd 40                	int    $0x40
     3ba:	c3                   	ret    

000003bb <close>:
SYSCALL(close)
     3bb:	b8 15 00 00 00       	mov    $0x15,%eax
     3c0:	cd 40                	int    $0x40
     3c2:	c3                   	ret    

000003c3 <kill>:
SYSCALL(kill)
     3c3:	b8 06 00 00 00       	mov    $0x6,%eax
     3c8:	cd 40                	int    $0x40
     3ca:	c3                   	ret    

000003cb <exec>:
SYSCALL(exec)
     3cb:	b8 07 00 00 00       	mov    $0x7,%eax
     3d0:	cd 40                	int    $0x40
     3d2:	c3                   	ret    

000003d3 <open>:
SYSCALL(open)
     3d3:	b8 0f 00 00 00       	mov    $0xf,%eax
     3d8:	cd 40                	int    $0x40
     3da:	c3                   	ret    

000003db <mknod>:
SYSCALL(mknod)
     3db:	b8 11 00 00 00       	mov    $0x11,%eax
     3e0:	cd 40                	int    $0x40
     3e2:	c3                   	ret    

000003e3 <unlink>:
SYSCALL(unlink)
     3e3:	b8 12 00 00 00       	mov    $0x12,%eax
     3e8:	cd 40                	int    $0x40
     3ea:	c3                   	ret    

000003eb <fstat>:
SYSCALL(fstat)
     3eb:	b8 08 00 00 00       	mov    $0x8,%eax
     3f0:	cd 40                	int    $0x40
     3f2:	c3                   	ret    

000003f3 <link>:
SYSCALL(link)
     3f3:	b8 13 00 00 00       	mov    $0x13,%eax
     3f8:	cd 40                	int    $0x40
     3fa:	c3                   	ret    

000003fb <mkdir>:
SYSCALL(mkdir)
     3fb:	b8 14 00 00 00       	mov    $0x14,%eax
     400:	cd 40                	int    $0x40
     402:	c3                   	ret    

00000403 <chdir>:
SYSCALL(chdir)
     403:	b8 09 00 00 00       	mov    $0x9,%eax
     408:	cd 40                	int    $0x40
     40a:	c3                   	ret    

0000040b <dup>:
SYSCALL(dup)
     40b:	b8 0a 00 00 00       	mov    $0xa,%eax
     410:	cd 40                	int    $0x40
     412:	c3                   	ret    

00000413 <getpid>:
SYSCALL(getpid)
     413:	b8 0b 00 00 00       	mov    $0xb,%eax
     418:	cd 40                	int    $0x40
     41a:	c3                   	ret    

0000041b <sbrk>:
SYSCALL(sbrk)
     41b:	b8 0c 00 00 00       	mov    $0xc,%eax
     420:	cd 40                	int    $0x40
     422:	c3                   	ret    

00000423 <sleep>:
SYSCALL(sleep)
     423:	b8 0d 00 00 00       	mov    $0xd,%eax
     428:	cd 40                	int    $0x40
     42a:	c3                   	ret    

0000042b <uptime>:
SYSCALL(uptime)
     42b:	b8 0e 00 00 00       	mov    $0xe,%eax
     430:	cd 40                	int    $0x40
     432:	c3                   	ret    
     433:	66 90                	xchg   %ax,%ax
     435:	66 90                	xchg   %ax,%ax
     437:	66 90                	xchg   %ax,%ax
     439:	66 90                	xchg   %ax,%ax
     43b:	66 90                	xchg   %ax,%ax
     43d:	66 90                	xchg   %ax,%ax
     43f:	90                   	nop

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	57                   	push   %edi
     444:	56                   	push   %esi
     445:	53                   	push   %ebx
     446:	83 ec 3c             	sub    $0x3c,%esp
     449:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     44c:	89 d1                	mov    %edx,%ecx
{
     44e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     451:	85 d2                	test   %edx,%edx
     453:	0f 89 7f 00 00 00    	jns    4d8 <printint+0x98>
     459:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     45d:	74 79                	je     4d8 <printint+0x98>
    neg = 1;
     45f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     466:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     468:	31 db                	xor    %ebx,%ebx
     46a:	8d 75 d7             	lea    -0x29(%ebp),%esi
     46d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     470:	89 c8                	mov    %ecx,%eax
     472:	31 d2                	xor    %edx,%edx
     474:	89 cf                	mov    %ecx,%edi
     476:	f7 75 c4             	divl   -0x3c(%ebp)
     479:	0f b6 92 ac 10 00 00 	movzbl 0x10ac(%edx),%edx
     480:	89 45 c0             	mov    %eax,-0x40(%ebp)
     483:	89 d8                	mov    %ebx,%eax
     485:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     488:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     48b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     48e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     491:	76 dd                	jbe    470 <printint+0x30>
  if(neg)
     493:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     496:	85 c9                	test   %ecx,%ecx
     498:	74 0c                	je     4a6 <printint+0x66>
    buf[i++] = '-';
     49a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     49f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     4a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     4a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
     4a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     4ad:	eb 07                	jmp    4b6 <printint+0x76>
     4af:	90                   	nop
    putc(fd, buf[i]);
     4b0:	0f b6 13             	movzbl (%ebx),%edx
     4b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     4b6:	83 ec 04             	sub    $0x4,%esp
     4b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
     4bc:	6a 01                	push   $0x1
     4be:	56                   	push   %esi
     4bf:	57                   	push   %edi
     4c0:	e8 ee fe ff ff       	call   3b3 <write>
  while(--i >= 0)
     4c5:	83 c4 10             	add    $0x10,%esp
     4c8:	39 de                	cmp    %ebx,%esi
     4ca:	75 e4                	jne    4b0 <printint+0x70>
}
     4cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4cf:	5b                   	pop    %ebx
     4d0:	5e                   	pop    %esi
     4d1:	5f                   	pop    %edi
     4d2:	5d                   	pop    %ebp
     4d3:	c3                   	ret    
     4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     4d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     4df:	eb 87                	jmp    468 <printint+0x28>
     4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4ef:	90                   	nop

000004f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	57                   	push   %edi
     4f4:	56                   	push   %esi
     4f5:	53                   	push   %ebx
     4f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
     4fc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
     4ff:	0f b6 13             	movzbl (%ebx),%edx
     502:	84 d2                	test   %dl,%dl
     504:	74 6a                	je     570 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
     506:	8d 45 10             	lea    0x10(%ebp),%eax
     509:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     50c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
     50f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
     511:	89 45 d0             	mov    %eax,-0x30(%ebp)
     514:	eb 36                	jmp    54c <printf+0x5c>
     516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     51d:	8d 76 00             	lea    0x0(%esi),%esi
     520:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     523:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
     528:	83 f8 25             	cmp    $0x25,%eax
     52b:	74 15                	je     542 <printf+0x52>
  write(fd, &c, 1);
     52d:	83 ec 04             	sub    $0x4,%esp
     530:	88 55 e7             	mov    %dl,-0x19(%ebp)
     533:	6a 01                	push   $0x1
     535:	57                   	push   %edi
     536:	56                   	push   %esi
     537:	e8 77 fe ff ff       	call   3b3 <write>
     53c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
     53f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     542:	0f b6 13             	movzbl (%ebx),%edx
     545:	83 c3 01             	add    $0x1,%ebx
     548:	84 d2                	test   %dl,%dl
     54a:	74 24                	je     570 <printf+0x80>
    c = fmt[i] & 0xff;
     54c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
     54f:	85 c9                	test   %ecx,%ecx
     551:	74 cd                	je     520 <printf+0x30>
      }
    } else if(state == '%'){
     553:	83 f9 25             	cmp    $0x25,%ecx
     556:	75 ea                	jne    542 <printf+0x52>
      if(c == 'd'){
     558:	83 f8 25             	cmp    $0x25,%eax
     55b:	0f 84 07 01 00 00    	je     668 <printf+0x178>
     561:	83 e8 63             	sub    $0x63,%eax
     564:	83 f8 15             	cmp    $0x15,%eax
     567:	77 17                	ja     580 <printf+0x90>
     569:	ff 24 85 54 10 00 00 	jmp    *0x1054(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     570:	8d 65 f4             	lea    -0xc(%ebp),%esp
     573:	5b                   	pop    %ebx
     574:	5e                   	pop    %esi
     575:	5f                   	pop    %edi
     576:	5d                   	pop    %ebp
     577:	c3                   	ret    
     578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     57f:	90                   	nop
  write(fd, &c, 1);
     580:	83 ec 04             	sub    $0x4,%esp
     583:	88 55 d4             	mov    %dl,-0x2c(%ebp)
     586:	6a 01                	push   $0x1
     588:	57                   	push   %edi
     589:	56                   	push   %esi
     58a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     58e:	e8 20 fe ff ff       	call   3b3 <write>
        putc(fd, c);
     593:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
     597:	83 c4 0c             	add    $0xc,%esp
     59a:	88 55 e7             	mov    %dl,-0x19(%ebp)
     59d:	6a 01                	push   $0x1
     59f:	57                   	push   %edi
     5a0:	56                   	push   %esi
     5a1:	e8 0d fe ff ff       	call   3b3 <write>
        putc(fd, c);
     5a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
     5a9:	31 c9                	xor    %ecx,%ecx
     5ab:	eb 95                	jmp    542 <printf+0x52>
     5ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
     5b0:	83 ec 0c             	sub    $0xc,%esp
     5b3:	b9 10 00 00 00       	mov    $0x10,%ecx
     5b8:	6a 00                	push   $0x0
     5ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
     5bd:	8b 10                	mov    (%eax),%edx
     5bf:	89 f0                	mov    %esi,%eax
     5c1:	e8 7a fe ff ff       	call   440 <printint>
        ap++;
     5c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
     5ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
     5cd:	31 c9                	xor    %ecx,%ecx
     5cf:	e9 6e ff ff ff       	jmp    542 <printf+0x52>
     5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     5d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     5db:	8b 10                	mov    (%eax),%edx
        ap++;
     5dd:	83 c0 04             	add    $0x4,%eax
     5e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     5e3:	85 d2                	test   %edx,%edx
     5e5:	0f 84 8d 00 00 00    	je     678 <printf+0x188>
        while(*s != 0){
     5eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
     5ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
     5f0:	84 c0                	test   %al,%al
     5f2:	0f 84 4a ff ff ff    	je     542 <printf+0x52>
     5f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     5fb:	89 d3                	mov    %edx,%ebx
     5fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     600:	83 ec 04             	sub    $0x4,%esp
          s++;
     603:	83 c3 01             	add    $0x1,%ebx
     606:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     609:	6a 01                	push   $0x1
     60b:	57                   	push   %edi
     60c:	56                   	push   %esi
     60d:	e8 a1 fd ff ff       	call   3b3 <write>
        while(*s != 0){
     612:	0f b6 03             	movzbl (%ebx),%eax
     615:	83 c4 10             	add    $0x10,%esp
     618:	84 c0                	test   %al,%al
     61a:	75 e4                	jne    600 <printf+0x110>
      state = 0;
     61c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
     61f:	31 c9                	xor    %ecx,%ecx
     621:	e9 1c ff ff ff       	jmp    542 <printf+0x52>
     626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     62d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
     630:	83 ec 0c             	sub    $0xc,%esp
     633:	b9 0a 00 00 00       	mov    $0xa,%ecx
     638:	6a 01                	push   $0x1
     63a:	e9 7b ff ff ff       	jmp    5ba <printf+0xca>
     63f:	90                   	nop
        putc(fd, *ap);
     640:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
     643:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     646:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
     648:	6a 01                	push   $0x1
     64a:	57                   	push   %edi
     64b:	56                   	push   %esi
        putc(fd, *ap);
     64c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     64f:	e8 5f fd ff ff       	call   3b3 <write>
        ap++;
     654:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
     658:	83 c4 10             	add    $0x10,%esp
      state = 0;
     65b:	31 c9                	xor    %ecx,%ecx
     65d:	e9 e0 fe ff ff       	jmp    542 <printf+0x52>
     662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
     668:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
     66b:	83 ec 04             	sub    $0x4,%esp
     66e:	e9 2a ff ff ff       	jmp    59d <printf+0xad>
     673:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     677:	90                   	nop
          s = "(null)";
     678:	ba 4b 10 00 00       	mov    $0x104b,%edx
        while(*s != 0){
     67d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     680:	b8 28 00 00 00       	mov    $0x28,%eax
     685:	89 d3                	mov    %edx,%ebx
     687:	e9 74 ff ff ff       	jmp    600 <printf+0x110>
     68c:	66 90                	xchg   %ax,%ax
     68e:	66 90                	xchg   %ax,%ax

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     691:	a1 98 16 00 00       	mov    0x1698,%eax
{
     696:	89 e5                	mov    %esp,%ebp
     698:	57                   	push   %edi
     699:	56                   	push   %esi
     69a:	53                   	push   %ebx
     69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     69e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6a8:	89 c2                	mov    %eax,%edx
     6aa:	8b 00                	mov    (%eax),%eax
     6ac:	39 ca                	cmp    %ecx,%edx
     6ae:	73 30                	jae    6e0 <free+0x50>
     6b0:	39 c1                	cmp    %eax,%ecx
     6b2:	72 04                	jb     6b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6b4:	39 c2                	cmp    %eax,%edx
     6b6:	72 f0                	jb     6a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
     6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
     6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     6be:	39 f8                	cmp    %edi,%eax
     6c0:	74 30                	je     6f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
     6c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     6c5:	8b 42 04             	mov    0x4(%edx),%eax
     6c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     6cb:	39 f1                	cmp    %esi,%ecx
     6cd:	74 3a                	je     709 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
     6cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
     6d1:	5b                   	pop    %ebx
  freep = p;
     6d2:	89 15 98 16 00 00    	mov    %edx,0x1698
}
     6d8:	5e                   	pop    %esi
     6d9:	5f                   	pop    %edi
     6da:	5d                   	pop    %ebp
     6db:	c3                   	ret    
     6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6e0:	39 c2                	cmp    %eax,%edx
     6e2:	72 c4                	jb     6a8 <free+0x18>
     6e4:	39 c1                	cmp    %eax,%ecx
     6e6:	73 c0                	jae    6a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
     6e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
     6eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     6ee:	39 f8                	cmp    %edi,%eax
     6f0:	75 d0                	jne    6c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
     6f2:	03 70 04             	add    0x4(%eax),%esi
     6f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     6f8:	8b 02                	mov    (%edx),%eax
     6fa:	8b 00                	mov    (%eax),%eax
     6fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
     6ff:	8b 42 04             	mov    0x4(%edx),%eax
     702:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     705:	39 f1                	cmp    %esi,%ecx
     707:	75 c6                	jne    6cf <free+0x3f>
    p->s.size += bp->s.size;
     709:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
     70c:	89 15 98 16 00 00    	mov    %edx,0x1698
    p->s.size += bp->s.size;
     712:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
     715:	8b 4b f8             	mov    -0x8(%ebx),%ecx
     718:	89 0a                	mov    %ecx,(%edx)
}
     71a:	5b                   	pop    %ebx
     71b:	5e                   	pop    %esi
     71c:	5f                   	pop    %edi
     71d:	5d                   	pop    %ebp
     71e:	c3                   	ret    
     71f:	90                   	nop

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	57                   	push   %edi
     724:	56                   	push   %esi
     725:	53                   	push   %ebx
     726:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     72c:	8b 3d 98 16 00 00    	mov    0x1698,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     732:	8d 70 07             	lea    0x7(%eax),%esi
     735:	c1 ee 03             	shr    $0x3,%esi
     738:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
     73b:	85 ff                	test   %edi,%edi
     73d:	0f 84 9d 00 00 00    	je     7e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     743:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
     745:	8b 4a 04             	mov    0x4(%edx),%ecx
     748:	39 f1                	cmp    %esi,%ecx
     74a:	73 6a                	jae    7b6 <malloc+0x96>
     74c:	bb 00 10 00 00       	mov    $0x1000,%ebx
     751:	39 de                	cmp    %ebx,%esi
     753:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
     756:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
     75d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     760:	eb 17                	jmp    779 <malloc+0x59>
     762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     768:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     76a:	8b 48 04             	mov    0x4(%eax),%ecx
     76d:	39 f1                	cmp    %esi,%ecx
     76f:	73 4f                	jae    7c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     771:	8b 3d 98 16 00 00    	mov    0x1698,%edi
     777:	89 c2                	mov    %eax,%edx
     779:	39 d7                	cmp    %edx,%edi
     77b:	75 eb                	jne    768 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
     77d:	83 ec 0c             	sub    $0xc,%esp
     780:	ff 75 e4             	push   -0x1c(%ebp)
     783:	e8 93 fc ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
     788:	83 c4 10             	add    $0x10,%esp
     78b:	83 f8 ff             	cmp    $0xffffffff,%eax
     78e:	74 1c                	je     7ac <malloc+0x8c>
  hp->s.size = nu;
     790:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
     793:	83 ec 0c             	sub    $0xc,%esp
     796:	83 c0 08             	add    $0x8,%eax
     799:	50                   	push   %eax
     79a:	e8 f1 fe ff ff       	call   690 <free>
  return freep;
     79f:	8b 15 98 16 00 00    	mov    0x1698,%edx
      if((p = morecore(nunits)) == 0)
     7a5:	83 c4 10             	add    $0x10,%esp
     7a8:	85 d2                	test   %edx,%edx
     7aa:	75 bc                	jne    768 <malloc+0x48>
        return 0;
  }
}
     7ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     7af:	31 c0                	xor    %eax,%eax
}
     7b1:	5b                   	pop    %ebx
     7b2:	5e                   	pop    %esi
     7b3:	5f                   	pop    %edi
     7b4:	5d                   	pop    %ebp
     7b5:	c3                   	ret    
    if(p->s.size >= nunits){
     7b6:	89 d0                	mov    %edx,%eax
     7b8:	89 fa                	mov    %edi,%edx
     7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
     7c0:	39 ce                	cmp    %ecx,%esi
     7c2:	74 4c                	je     810 <malloc+0xf0>
        p->s.size -= nunits;
     7c4:	29 f1                	sub    %esi,%ecx
     7c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     7cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
     7cf:	89 15 98 16 00 00    	mov    %edx,0x1698
}
     7d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
     7d8:	83 c0 08             	add    $0x8,%eax
}
     7db:	5b                   	pop    %ebx
     7dc:	5e                   	pop    %esi
     7dd:	5f                   	pop    %edi
     7de:	5d                   	pop    %ebp
     7df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
     7e0:	c7 05 98 16 00 00 9c 	movl   $0x169c,0x1698
     7e7:	16 00 00 
    base.s.size = 0;
     7ea:	bf 9c 16 00 00       	mov    $0x169c,%edi
    base.s.ptr = freep = prevp = &base;
     7ef:	c7 05 9c 16 00 00 9c 	movl   $0x169c,0x169c
     7f6:	16 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     7f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
     7fb:	c7 05 a0 16 00 00 00 	movl   $0x0,0x16a0
     802:	00 00 00 
    if(p->s.size >= nunits){
     805:	e9 42 ff ff ff       	jmp    74c <malloc+0x2c>
     80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
     810:	8b 08                	mov    (%eax),%ecx
     812:	89 0a                	mov    %ecx,(%edx)
     814:	eb b9                	jmp    7cf <malloc+0xaf>
     816:	66 90                	xchg   %ax,%ax
     818:	66 90                	xchg   %ax,%ax
     81a:	66 90                	xchg   %ax,%ax
     81c:	66 90                	xchg   %ax,%ax
     81e:	66 90                	xchg   %ax,%ax

00000820 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	57                   	push   %edi
     824:	56                   	push   %esi
     825:	53                   	push   %ebx
     826:	83 ec 04             	sub    $0x4,%esp
     829:	8b 5d 10             	mov    0x10(%ebp),%ebx
     82c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
     82f:	85 db                	test   %ebx,%ebx
     831:	7e 3d                	jle    870 <min_distance_vertex+0x50>
    int min_idx = 0;
     833:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
     835:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
     837:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
     83c:	89 75 f0             	mov    %esi,-0x10(%ebp)
     83f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
     840:	8b 14 87             	mov    (%edi,%eax,4),%edx
     843:	39 ca                	cmp    %ecx,%edx
     845:	7d 14                	jge    85b <min_distance_vertex+0x3b>
     847:	8b 75 0c             	mov    0xc(%ebp),%esi
     84a:	8b 34 86             	mov    (%esi,%eax,4),%esi
     84d:	85 f6                	test   %esi,%esi
     84f:	8b 75 f0             	mov    -0x10(%ebp),%esi
     852:	0f 44 ca             	cmove  %edx,%ecx
     855:	0f 44 f0             	cmove  %eax,%esi
     858:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
     85b:	83 c0 01             	add    $0x1,%eax
     85e:	39 c3                	cmp    %eax,%ebx
     860:	75 de                	jne    840 <min_distance_vertex+0x20>
     862:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
     865:	83 c4 04             	add    $0x4,%esp
     868:	5b                   	pop    %ebx
     869:	89 f0                	mov    %esi,%eax
     86b:	5e                   	pop    %esi
     86c:	5f                   	pop    %edi
     86d:	5d                   	pop    %ebp
     86e:	c3                   	ret    
     86f:	90                   	nop
     870:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
     873:	31 f6                	xor    %esi,%esi
}
     875:	5b                   	pop    %ebx
     876:	89 f0                	mov    %esi,%eax
     878:	5e                   	pop    %esi
     879:	5f                   	pop    %edi
     87a:	5d                   	pop    %ebp
     87b:	c3                   	ret    
     87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000880 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	57                   	push   %edi
     884:	56                   	push   %esi
     885:	53                   	push   %ebx
     886:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
     889:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
     88c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
     88f:	89 e6                	mov    %esp,%esi
     891:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
     898:	8d 41 0f             	lea    0xf(%ecx),%eax
     89b:	89 c2                	mov    %eax,%edx
     89d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     8a2:	29 c6                	sub    %eax,%esi
     8a4:	83 e2 f0             	and    $0xfffffff0,%edx
     8a7:	39 f4                	cmp    %esi,%esp
     8a9:	74 12                	je     8bd <dijkstra+0x3d>
     8ab:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     8b1:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
     8b8:	00 
     8b9:	39 f4                	cmp    %esi,%esp
     8bb:	75 ee                	jne    8ab <dijkstra+0x2b>
     8bd:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
     8c3:	29 d4                	sub    %edx,%esp
     8c5:	85 d2                	test   %edx,%edx
     8c7:	0f 85 ef 00 00 00    	jne    9bc <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
     8cd:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
     8d0:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
     8d2:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
     8d5:	8b 45 0c             	mov    0xc(%ebp),%eax
     8d8:	85 c0                	test   %eax,%eax
     8da:	0f 8e e6 00 00 00    	jle    9c6 <dijkstra+0x146>
     8e0:	89 d8                	mov    %ebx,%eax
     8e2:	89 fa                	mov    %edi,%edx
     8e4:	01 d9                	add    %ebx,%ecx
     8e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ed:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
     8f0:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
     8f6:	83 c0 04             	add    $0x4,%eax
     8f9:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
     8fc:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
     903:	39 c8                	cmp    %ecx,%eax
     905:	75 e9                	jne    8f0 <dijkstra+0x70>
    dist[src] = 0;
     907:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     90d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
     918:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
     91a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
     91f:	31 c0                	xor    %eax,%eax
     921:	eb 07                	jmp    92a <dijkstra+0xaa>
     923:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     927:	90                   	nop
     928:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
     92a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
     92d:	39 ca                	cmp    %ecx,%edx
     92f:	7d 0a                	jge    93b <dijkstra+0xbb>
     931:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
     935:	0f 44 f0             	cmove  %eax,%esi
     938:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
     93b:	8d 50 01             	lea    0x1(%eax),%edx
     93e:	39 55 0c             	cmp    %edx,0xc(%ebp)
     941:	75 e5                	jne    928 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
     943:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
     946:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
     94d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
     953:	89 4d e0             	mov    %ecx,-0x20(%ebp)
     956:	75 18                	jne    970 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
     958:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     95b:	8d 56 01             	lea    0x1(%esi),%edx
     95e:	39 c6                	cmp    %eax,%esi
     960:	74 52                	je     9b4 <dijkstra+0x134>
     962:	89 55 e4             	mov    %edx,-0x1c(%ebp)
     965:	eb b1                	jmp    918 <dijkstra+0x98>
     967:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     96e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
     970:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
     976:	89 5d dc             	mov    %ebx,-0x24(%ebp)
     979:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
     97c:	31 d2                	xor    %edx,%edx
     97e:	eb 02                	jmp    982 <dijkstra+0x102>
     980:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
     982:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
     985:	85 c9                	test   %ecx,%ecx
     987:	74 17                	je     9a0 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
     989:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
     98c:	85 db                	test   %ebx,%ebx
     98e:	75 10                	jne    9a0 <dijkstra+0x120>
     990:	8b 5d e0             	mov    -0x20(%ebp),%ebx
     993:	03 0b                	add    (%ebx),%ecx
     995:	8b 5d dc             	mov    -0x24(%ebp),%ebx
     998:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
     99b:	7e 03                	jle    9a0 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
     99d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
     9a0:	8d 4a 01             	lea    0x1(%edx),%ecx
     9a3:	39 c2                	cmp    %eax,%edx
     9a5:	75 d9                	jne    980 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
     9a7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     9aa:	8b 5d dc             	mov    -0x24(%ebp),%ebx
     9ad:	8d 56 01             	lea    0x1(%esi),%edx
     9b0:	39 c6                	cmp    %eax,%esi
     9b2:	75 ae                	jne    962 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
     9b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9b7:	5b                   	pop    %ebx
     9b8:	5e                   	pop    %esi
     9b9:	5f                   	pop    %edi
     9ba:	5d                   	pop    %ebp
     9bb:	c3                   	ret    
    int visited[num_vertices];
     9bc:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
     9c1:	e9 07 ff ff ff       	jmp    8cd <dijkstra+0x4d>
    dist[src] = 0;
     9c6:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     9cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9cf:	5b                   	pop    %ebx
     9d0:	5e                   	pop    %esi
     9d1:	5f                   	pop    %edi
     9d2:	5d                   	pop    %ebp
     9d3:	c3                   	ret    
     9d4:	66 90                	xchg   %ax,%ax
     9d6:	66 90                	xchg   %ax,%ax
     9d8:	66 90                	xchg   %ax,%ax
     9da:	66 90                	xchg   %ax,%ax
     9dc:	66 90                	xchg   %ax,%ax
     9de:	66 90                	xchg   %ax,%ax

000009e0 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
     9e0:	55                   	push   %ebp
     9e1:	89 e5                	mov    %esp,%ebp
     9e3:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
     9e4:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
     9e9:	56                   	push   %esi
     9ea:	53                   	push   %ebx
     9eb:	83 ec 0c             	sub    $0xc,%esp
     9ee:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     9f1:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
     9f4:	e8 f7 00 00 00       	call   af0 <random>
     9f9:	89 c1                	mov    %eax,%ecx
     9fb:	f7 ef                	imul   %edi
     9fd:	89 c8                	mov    %ecx,%eax
     9ff:	c1 f8 1f             	sar    $0x1f,%eax
     a02:	c1 fa 06             	sar    $0x6,%edx
     a05:	29 c2                	sub    %eax,%edx
     a07:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
     a0d:	29 c1                	sub    %eax,%ecx
     a0f:	83 f9 63             	cmp    $0x63,%ecx
     a12:	89 ca                	mov    %ecx,%edx
     a14:	8d 41 64             	lea    0x64(%ecx),%eax
     a17:	0f 4e d0             	cmovle %eax,%edx
     a1a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
     a1c:	e8 cf 00 00 00       	call   af0 <random>
     a21:	89 c1                	mov    %eax,%ecx
     a23:	f7 ef                	imul   %edi
     a25:	89 c8                	mov    %ecx,%eax
     a27:	c1 f8 1f             	sar    $0x1f,%eax
     a2a:	c1 fa 07             	sar    $0x7,%edx
     a2d:	29 c2                	sub    %eax,%edx
     a2f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
     a35:	29 c1                	sub    %eax,%ecx
     a37:	8d 41 32             	lea    0x32(%ecx),%eax
     a3a:	89 ca                	mov    %ecx,%edx
     a3c:	83 f9 31             	cmp    $0x31,%ecx
     a3f:	0f 4e d0             	cmovle %eax,%edx
     a42:	8b 45 10             	mov    0x10(%ebp),%eax
     a45:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
     a47:	8b 13                	mov    (%ebx),%edx
     a49:	85 d2                	test   %edx,%edx
     a4b:	7e 38                	jle    a85 <gen_random_digraph+0xa5>
     a4d:	89 f1                	mov    %esi,%ecx
     a4f:	31 ff                	xor    %edi,%edi
     a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
     a58:	31 c0                	xor    %eax,%eax
     a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
     a60:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
     a67:	8b 13                	mov    (%ebx),%edx
     a69:	83 c0 01             	add    $0x1,%eax
     a6c:	39 c2                	cmp    %eax,%edx
     a6e:	7f f0                	jg     a60 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
     a70:	83 c7 01             	add    $0x1,%edi
     a73:	81 c1 20 03 00 00    	add    $0x320,%ecx
     a79:	39 fa                	cmp    %edi,%edx
     a7b:	7f db                	jg     a58 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
     a7d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
     a83:	7f 22                	jg     aa7 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
     a85:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
     a8b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
     a92:	8d 04 86             	lea    (%esi,%eax,4),%eax
     a95:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
     a98:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
     a9e:	05 20 03 00 00       	add    $0x320,%eax
     aa3:	39 d0                	cmp    %edx,%eax
     aa5:	75 f1                	jne    a98 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
     aa7:	8b 45 10             	mov    0x10(%ebp),%eax
     aaa:	31 c9                	xor    %ecx,%ecx
     aac:	8b 00                	mov    (%eax),%eax
     aae:	85 c0                	test   %eax,%eax
     ab0:	7e 31                	jle    ae3 <gen_random_digraph+0x103>
     ab2:	89 75 08             	mov    %esi,0x8(%ebp)
     ab5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
     ab7:	e8 34 00 00 00       	call   af0 <random>
    for (int i = 0; i < *num_edges; i++) {
     abc:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
     abf:	99                   	cltd   
     ac0:	f7 3b                	idivl  (%ebx)
     ac2:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
     ac4:	e8 27 00 00 00       	call   af0 <random>
        graph[new_edge_u][new_edge_v] = 1;
     ac9:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
     acf:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
     ad2:	99                   	cltd   
     ad3:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
     ad5:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
     ad8:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
     adf:	39 30                	cmp    %esi,(%eax)
     ae1:	7f d4                	jg     ab7 <gen_random_digraph+0xd7>
    }
}
     ae3:	83 c4 0c             	add    $0xc,%esp
     ae6:	5b                   	pop    %ebx
     ae7:	5e                   	pop    %esi
     ae8:	5f                   	pop    %edi
     ae9:	5d                   	pop    %ebp
     aea:	c3                   	ret    
     aeb:	66 90                	xchg   %ax,%ax
     aed:	66 90                	xchg   %ax,%ax
     aef:	90                   	nop

00000af0 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
     af0:	69 0d 94 16 00 00 0d 	imul   $0x19660d,0x1694,%ecx
     af7:	66 19 00 
     afa:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
     aff:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
     b05:	89 c8                	mov    %ecx,%eax
     b07:	f7 ea                	imul   %edx
     b09:	89 d0                	mov    %edx,%eax
     b0b:	89 ca                	mov    %ecx,%edx
     b0d:	c1 fa 1f             	sar    $0x1f,%edx
     b10:	c1 f8 1d             	sar    $0x1d,%eax
     b13:	29 d0                	sub    %edx,%eax
     b15:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
     b1b:	89 c8                	mov    %ecx,%eax
     b1d:	29 d0                	sub    %edx,%eax
     b1f:	a3 94 16 00 00       	mov    %eax,0x1694
    return seed;
     b24:	c3                   	ret    
     b25:	66 90                	xchg   %ax,%ax
     b27:	66 90                	xchg   %ax,%ax
     b29:	66 90                	xchg   %ax,%ax
     b2b:	66 90                	xchg   %ax,%ax
     b2d:	66 90                	xchg   %ax,%ax
     b2f:	90                   	nop

00000b30 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     b3c:	83 0c 24 00          	orl    $0x0,(%esp)
     b40:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     b46:	83 0c 24 00          	orl    $0x0,(%esp)
     b4a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
     b50:	6a 00                	push   $0x0
     b52:	ff 75 08             	push   0x8(%ebp)
     b55:	e8 79 f8 ff ff       	call   3d3 <open>
    if (fp < 0 ) {
     b5a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
     b5d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
     b63:	85 c0                	test   %eax,%eax
     b65:	0f 88 99 01 00 00    	js     d04 <permute_line+0x1d4>
     b6b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
     b71:	31 db                	xor    %ebx,%ebx
     b73:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
     b79:	89 f7                	mov    %esi,%edi
     b7b:	89 de                	mov    %ebx,%esi
     b7d:	89 c3                	mov    %eax,%ebx
     b7f:	eb 12                	jmp    b93 <permute_line+0x63>
     b81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     b88:	83 c7 66             	add    $0x66,%edi
     b8b:	83 fe 64             	cmp    $0x64,%esi
     b8e:	74 16                	je     ba6 <permute_line+0x76>
        line_idx++;
     b90:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     b93:	83 ec 04             	sub    $0x4,%esp
     b96:	6a 66                	push   $0x66
     b98:	57                   	push   %edi
     b99:	53                   	push   %ebx
     b9a:	e8 0c f8 ff ff       	call   3ab <read>
     b9f:	83 c4 10             	add    $0x10,%esp
     ba2:	85 c0                	test   %eax,%eax
     ba4:	7f e2                	jg     b88 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
     ba6:	89 f3                	mov    %esi,%ebx
     ba8:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
     bae:	e8 3d ff ff ff       	call   af0 <random>
     bb3:	89 c1                	mov    %eax,%ecx
     bb5:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     bba:	f7 e9                	imul   %ecx
     bbc:	89 c8                	mov    %ecx,%eax
     bbe:	c1 f8 1f             	sar    $0x1f,%eax
     bc1:	c1 fa 05             	sar    $0x5,%edx
     bc4:	29 c2                	sub    %eax,%edx
     bc6:	6b c2 64             	imul   $0x64,%edx,%eax
     bc9:	29 c1                	sub    %eax,%ecx
     bcb:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
     bcd:	e8 1e ff ff ff       	call   af0 <random>
     bd2:	89 c1                	mov    %eax,%ecx
     bd4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     bd9:	f7 e9                	imul   %ecx
     bdb:	89 c8                	mov    %ecx,%eax
     bdd:	c1 f8 1f             	sar    $0x1f,%eax
     be0:	c1 fa 05             	sar    $0x5,%edx
     be3:	29 c2                	sub    %eax,%edx
     be5:	6b c2 64             	imul   $0x64,%edx,%eax
     be8:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
     bea:	39 cf                	cmp    %ecx,%edi
     bec:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
     bf2:	74 5f                	je     c53 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
     bf4:	6b c7 66             	imul   $0x66,%edi,%eax
     bf7:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
     bfd:	83 ec 08             	sub    $0x8,%esp
     c00:	01 c1                	add    %eax,%ecx
     c02:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     c08:	51                   	push   %ecx
     c09:	50                   	push   %eax
     c0a:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
     c10:	e8 2b f5 ff ff       	call   140 <strcpy>
        strcpy(lines[line1], lines[line2]);
     c15:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
     c1b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
     c21:	6b d2 66             	imul   $0x66,%edx,%edx
     c24:	01 c2                	add    %eax,%edx
     c26:	58                   	pop    %eax
     c27:	59                   	pop    %ecx
     c28:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
     c2e:	52                   	push   %edx
     c2f:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
     c35:	51                   	push   %ecx
     c36:	e8 05 f5 ff ff       	call   140 <strcpy>
        strcpy(lines[line2], temp);
     c3b:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
     c41:	5f                   	pop    %edi
     c42:	58                   	pop    %eax
     c43:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     c49:	50                   	push   %eax
     c4a:	52                   	push   %edx
     c4b:	e8 f0 f4 ff ff       	call   140 <strcpy>
     c50:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
     c53:	83 ec 0c             	sub    $0xc,%esp
     c56:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
     c5c:	e8 5a f7 ff ff       	call   3bb <close>
    fp = open(file_path, O_RDWR);
     c61:	58                   	pop    %eax
     c62:	5a                   	pop    %edx
     c63:	6a 02                	push   $0x2
     c65:	ff 75 08             	push   0x8(%ebp)
     c68:	e8 66 f7 ff ff       	call   3d3 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
     c6d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
     c6e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
     c70:	58                   	pop    %eax
     c71:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     c77:	50                   	push   %eax
     c78:	57                   	push   %edi
     c79:	e8 6d f7 ff ff       	call   3eb <fstat>
    char *buffer = malloc(0);
     c7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c85:	e8 96 fa ff ff       	call   720 <malloc>
    memset(buffer, 0, 0);  
     c8a:	83 c4 0c             	add    $0xc,%esp
     c8d:	6a 00                	push   $0x0
     c8f:	6a 00                	push   $0x0
     c91:	50                   	push   %eax
     c92:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
     c98:	e8 63 f5 ff ff       	call   200 <memset>
    write(fp, buffer, 0);
     c9d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
     ca3:	83 c4 0c             	add    $0xc,%esp
     ca6:	6a 00                	push   $0x0
     ca8:	52                   	push   %edx
     ca9:	57                   	push   %edi
     caa:	e8 04 f7 ff ff       	call   3b3 <write>
    free(buffer);
     caf:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
     cb5:	89 14 24             	mov    %edx,(%esp)
     cb8:	e8 d3 f9 ff ff       	call   690 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
     cbd:	83 c4 10             	add    $0x10,%esp
     cc0:	85 ff                	test   %edi,%edi
     cc2:	78 59                	js     d1d <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
     cc4:	85 db                	test   %ebx,%ebx
     cc6:	74 26                	je     cee <permute_line+0x1be>
     cc8:	6b db 66             	imul   $0x66,%ebx,%ebx
     ccb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
     cd1:	01 c3                	add    %eax,%ebx
     cd3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cd7:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
     cd8:	83 ec 04             	sub    $0x4,%esp
     cdb:	6a 66                	push   $0x66
     cdd:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
     cde:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
     ce1:	57                   	push   %edi
     ce2:	e8 cc f6 ff ff       	call   3b3 <write>
    for (int i = 0; i < line_idx; i++) {
     ce7:	83 c4 10             	add    $0x10,%esp
     cea:	39 de                	cmp    %ebx,%esi
     cec:	75 ea                	jne    cd8 <permute_line+0x1a8>
    }

    close(fp);
     cee:	83 ec 0c             	sub    $0xc,%esp
     cf1:	57                   	push   %edi
     cf2:	e8 c4 f6 ff ff       	call   3bb <close>
    return 0;
     cf7:	83 c4 10             	add    $0x10,%esp
     cfa:	31 c0                	xor    %eax,%eax
     cfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cff:	5b                   	pop    %ebx
     d00:	5e                   	pop    %esi
     d01:	5f                   	pop    %edi
     d02:	5d                   	pop    %ebp
     d03:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
     d04:	83 ec 08             	sub    $0x8,%esp
     d07:	68 c0 10 00 00       	push   $0x10c0
     d0c:	6a 01                	push   $0x1
     d0e:	e8 dd f7 ff ff       	call   4f0 <printf>
        return -1;
     d13:	83 c4 10             	add    $0x10,%esp
     d16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     d1b:	eb df                	jmp    cfc <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
     d1d:	83 ec 08             	sub    $0x8,%esp
     d20:	68 08 11 00 00       	push   $0x1108
     d25:	6a 01                	push   $0x1
     d27:	e8 c4 f7 ff ff       	call   4f0 <printf>
        return -1;
     d2c:	83 c4 10             	add    $0x10,%esp
     d2f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     d34:	eb c6                	jmp    cfc <permute_line+0x1cc>
     d36:	66 90                	xchg   %ax,%ax
     d38:	66 90                	xchg   %ax,%ax
     d3a:	66 90                	xchg   %ax,%ax
     d3c:	66 90                	xchg   %ax,%ax
     d3e:	66 90                	xchg   %ax,%ax

00000d40 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	57                   	push   %edi
     d44:	56                   	push   %esi
     d45:	53                   	push   %ebx
     d46:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     d4c:	83 0c 24 00          	orl    $0x0,(%esp)
     d50:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     d56:	83 0c 24 00          	orl    $0x0,(%esp)
     d5a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
     d60:	6a 00                	push   $0x0
     d62:	ff 75 08             	push   0x8(%ebp)
     d65:	e8 69 f6 ff ff       	call   3d3 <open>
    if (fp < 0) {
     d6a:	83 c4 10             	add    $0x10,%esp
     d6d:	85 c0                	test   %eax,%eax
     d6f:	0f 88 b1 00 00 00    	js     e26 <add_line+0xe6>
     d75:	89 c3                	mov    %eax,%ebx
     d77:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
     d7d:	31 f6                	xor    %esi,%esi
     d7f:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
     d85:	89 c7                	mov    %eax,%edi
     d87:	eb 12                	jmp    d9b <add_line+0x5b>
     d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     d90:	83 c7 66             	add    $0x66,%edi
     d93:	83 fe 64             	cmp    $0x64,%esi
     d96:	74 1c                	je     db4 <add_line+0x74>
        line_idx++;
     d98:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     d9b:	83 ec 04             	sub    $0x4,%esp
     d9e:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
     da4:	6a 66                	push   $0x66
     da6:	57                   	push   %edi
     da7:	53                   	push   %ebx
     da8:	e8 fe f5 ff ff       	call   3ab <read>
     dad:	83 c4 10             	add    $0x10,%esp
     db0:	85 c0                	test   %eax,%eax
     db2:	7f dc                	jg     d90 <add_line+0x50>
    }
    close(fp); 
     db4:	83 ec 0c             	sub    $0xc,%esp
     db7:	53                   	push   %ebx
     db8:	e8 fe f5 ff ff       	call   3bb <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
     dbd:	58                   	pop    %eax
     dbe:	5a                   	pop    %edx
     dbf:	ff 75 0c             	push   0xc(%ebp)
     dc2:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
     dc8:	e8 73 f3 ff ff       	call   140 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
     dcd:	59                   	pop    %ecx
     dce:	5b                   	pop    %ebx
     dcf:	6a 01                	push   $0x1
     dd1:	ff 75 08             	push   0x8(%ebp)
     dd4:	e8 fa f5 ff ff       	call   3d3 <open>
    if (fp < 0) {
     dd9:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
     ddc:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
     dde:	85 c0                	test   %eax,%eax
     de0:	78 5d                	js     e3f <add_line+0xff>
     de2:	6b ce 66             	imul   $0x66,%esi,%ecx
     de5:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
     deb:	8d 78 66             	lea    0x66(%eax),%edi
     dee:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
     df1:	eb 08                	jmp    dfb <add_line+0xbb>
     df3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     df7:	90                   	nop
     df8:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
     dfb:	83 ec 04             	sub    $0x4,%esp
     dfe:	6a 66                	push   $0x66
     e00:	50                   	push   %eax
     e01:	53                   	push   %ebx
     e02:	e8 ac f5 ff ff       	call   3b3 <write>
    for (int i = 0; i < line_idx; i++) {
     e07:	89 f8                	mov    %edi,%eax
     e09:	83 c4 10             	add    $0x10,%esp
     e0c:	39 f7                	cmp    %esi,%edi
     e0e:	75 e8                	jne    df8 <add_line+0xb8>
    }

    close(fp);
     e10:	83 ec 0c             	sub    $0xc,%esp
     e13:	53                   	push   %ebx
     e14:	e8 a2 f5 ff ff       	call   3bb <close>
    return 0;
     e19:	83 c4 10             	add    $0x10,%esp
     e1c:	31 c0                	xor    %eax,%eax
}
     e1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e21:	5b                   	pop    %ebx
     e22:	5e                   	pop    %esi
     e23:	5f                   	pop    %edi
     e24:	5d                   	pop    %ebp
     e25:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
     e26:	83 ec 08             	sub    $0x8,%esp
     e29:	68 44 11 00 00       	push   $0x1144
     e2e:	6a 01                	push   $0x1
     e30:	e8 bb f6 ff ff       	call   4f0 <printf>
        return -1;
     e35:	83 c4 10             	add    $0x10,%esp
     e38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e3d:	eb df                	jmp    e1e <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
     e3f:	83 ec 08             	sub    $0x8,%esp
     e42:	68 68 11 00 00       	push   $0x1168
     e47:	6a 01                	push   $0x1
     e49:	e8 a2 f6 ff ff       	call   4f0 <printf>
        return -1;
     e4e:	83 c4 10             	add    $0x10,%esp
     e51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e56:	eb c6                	jmp    e1e <add_line+0xde>
     e58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e5f:	90                   	nop

00000e60 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
     e60:	55                   	push   %ebp
     e61:	89 e5                	mov    %esp,%ebp
     e63:	57                   	push   %edi
     e64:	56                   	push   %esi
     e65:	53                   	push   %ebx
     e66:	83 ec 0c             	sub    $0xc,%esp
     e69:	8b 5d 08             	mov    0x8(%ebp),%ebx
     e6c:	8d 73 64             	lea    0x64(%ebx),%esi
     e6f:	89 f7                	mov    %esi,%edi
     e71:	8b 75 0c             	mov    0xc(%ebp),%esi
     e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
     e78:	e8 73 fc ff ff       	call   af0 <random>
     e7d:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     e7f:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
     e82:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
     e85:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
     e89:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     e8c:	39 fb                	cmp    %edi,%ebx
     e8e:	75 e8                	jne    e78 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
     e90:	8b 45 08             	mov    0x8(%ebp),%eax
     e93:	ba 0a 00 00 00       	mov    $0xa,%edx
     e98:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
     e9c:	83 c4 0c             	add    $0xc,%esp
     e9f:	5b                   	pop    %ebx
     ea0:	5e                   	pop    %esi
     ea1:	5f                   	pop    %edi
     ea2:	5d                   	pop    %ebp
     ea3:	c3                   	ret    
     ea4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     eaf:	90                   	nop

00000eb0 <write_random_string>:

int write_random_string(char file_path[]) {
     eb0:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
     eb1:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
     eb6:	89 e5                	mov    %esp,%ebp
     eb8:	57                   	push   %edi
     eb9:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
     eba:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
     ec0:	be 8c 11 00 00       	mov    $0x118c,%esi
int write_random_string(char file_path[]) {
     ec5:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
     ec6:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
     ecb:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
     ed1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     ed3:	0f b7 06             	movzwl (%esi),%eax
     ed6:	8d 75 e6             	lea    -0x1a(%ebp),%esi
     ed9:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     edc:	8d 7d 82             	lea    -0x7e(%ebp),%edi
     edf:	90                   	nop
        int idx_new_char = random() % size_char_set;
     ee0:	e8 0b fc ff ff       	call   af0 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     ee5:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
     ee8:	89 c1                	mov    %eax,%ecx
     eea:	f7 e3                	mul    %ebx
     eec:	c1 ea 06             	shr    $0x6,%edx
     eef:	6b d2 55             	imul   $0x55,%edx,%edx
     ef2:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
     ef4:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
     efb:	ff 
     efc:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     eff:	39 f7                	cmp    %esi,%edi
     f01:	75 dd                	jne    ee0 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
     f03:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
     f08:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
     f0b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
     f0f:	8d 45 82             	lea    -0x7e(%ebp),%eax
     f12:	50                   	push   %eax
     f13:	ff 75 08             	push   0x8(%ebp)
     f16:	e8 25 fe ff ff       	call   d40 <add_line>

    return 0;
}
     f1b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f1e:	31 c0                	xor    %eax,%eax
     f20:	5b                   	pop    %ebx
     f21:	5e                   	pop    %esi
     f22:	5f                   	pop    %edi
     f23:	5d                   	pop    %ebp
     f24:	c3                   	ret    
     f25:	66 90                	xchg   %ax,%ax
     f27:	66 90                	xchg   %ax,%ax
     f29:	66 90                	xchg   %ax,%ax
     f2b:	66 90                	xchg   %ax,%ax
     f2d:	66 90                	xchg   %ax,%ax
     f2f:	90                   	nop

00000f30 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	56                   	push   %esi
     f34:	8b 75 08             	mov    0x8(%ebp),%esi
     f37:	53                   	push   %ebx
     f38:	bb 64 00 00 00       	mov    $0x64,%ebx
     f3d:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
     f40:	83 ec 0c             	sub    $0xc,%esp
     f43:	56                   	push   %esi
     f44:	e8 67 ff ff ff       	call   eb0 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
     f49:	83 c4 10             	add    $0x10,%esp
     f4c:	83 eb 01             	sub    $0x1,%ebx
     f4f:	75 ef                	jne    f40 <io_bound+0x10>
     f51:	bb 32 00 00 00       	mov    $0x32,%ebx
     f56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f5d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
     f60:	83 ec 0c             	sub    $0xc,%esp
     f63:	56                   	push   %esi
     f64:	e8 c7 fb ff ff       	call   b30 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
     f69:	83 c4 10             	add    $0x10,%esp
     f6c:	83 eb 01             	sub    $0x1,%ebx
     f6f:	75 ef                	jne    f60 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
     f71:	83 ec 0c             	sub    $0xc,%esp
     f74:	56                   	push   %esi
     f75:	e8 69 f4 ff ff       	call   3e3 <unlink>
     f7a:	83 c4 10             	add    $0x10,%esp
     f7d:	85 c0                	test   %eax,%eax
     f7f:	75 07                	jne    f88 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
     f81:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f84:	5b                   	pop    %ebx
     f85:	5e                   	pop    %esi
     f86:	5d                   	pop    %ebp
     f87:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
     f88:	83 ec 08             	sub    $0x8,%esp
     f8b:	68 e4 11 00 00       	push   $0x11e4
     f90:	6a 01                	push   $0x1
     f92:	e8 59 f5 ff ff       	call   4f0 <printf>
     f97:	83 c4 10             	add    $0x10,%esp
     f9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f9d:	5b                   	pop    %ebx
     f9e:	5e                   	pop    %esi
     f9f:	5d                   	pop    %ebp
     fa0:	c3                   	ret    
     fa1:	66 90                	xchg   %ax,%ax
     fa3:	66 90                	xchg   %ax,%ax
     fa5:	66 90                	xchg   %ax,%ax
     fa7:	66 90                	xchg   %ax,%ax
     fa9:	66 90                	xchg   %ax,%ax
     fab:	66 90                	xchg   %ax,%ax
     fad:	66 90                	xchg   %ax,%ax
     faf:	90                   	nop

00000fb0 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	57                   	push   %edi
     fb4:	56                   	push   %esi
     fb5:	53                   	push   %ebx
     fb6:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
     fbd:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     fc3:	83 0c 24 00          	orl    $0x0,(%esp)
     fc7:	39 c4                	cmp    %eax,%esp
     fc9:	75 f2                	jne    fbd <cpu_bound+0xd>
     fcb:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
     fd1:	be e8 03 00 00       	mov    $0x3e8,%esi
     fd6:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
     fdc:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
     fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
     fe8:	83 ec 04             	sub    $0x4,%esp
     feb:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
     ff1:	57                   	push   %edi
     ff2:	50                   	push   %eax
     ff3:	53                   	push   %ebx
     ff4:	e8 e7 f9 ff ff       	call   9e0 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
     ff9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
     fff:	89 04 24             	mov    %eax,(%esp)
    1002:	6a 00                	push   $0x0
    1004:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
    100a:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
    1010:	53                   	push   %ebx
    1011:	e8 6a f8 ff ff       	call   880 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
    1016:	83 c4 20             	add    $0x20,%esp
    1019:	83 ee 01             	sub    $0x1,%esi
    101c:	75 ca                	jne    fe8 <cpu_bound+0x38>
    }
    101e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1021:	5b                   	pop    %ebx
    1022:	5e                   	pop    %esi
    1023:	5f                   	pop    %edi
    1024:	5d                   	pop    %ebp
    1025:	c3                   	ret    
