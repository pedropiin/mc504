
_wc: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
      27:	7e 56                	jle    7f <main+0x7f>
      29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      30:	83 ec 08             	sub    $0x8,%esp
      33:	6a 00                	push   $0x0
      35:	ff 33                	push   (%ebx)
      37:	e8 d7 03 00 00       	call   413 <open>
      3c:	83 c4 10             	add    $0x10,%esp
      3f:	89 c7                	mov    %eax,%edi
      41:	85 c0                	test   %eax,%eax
      43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
      45:	83 ec 08             	sub    $0x8,%esp
      48:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
      4a:	83 c6 01             	add    $0x1,%esi
      4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
      50:	50                   	push   %eax
      51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
      56:	89 3c 24             	mov    %edi,(%esp)
      59:	e8 9d 03 00 00       	call   3fb <close>
  for(i = 1; i < argc; i++){
      5e:	83 c4 10             	add    $0x10,%esp
      61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
      64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
      66:	e8 68 03 00 00       	call   3d3 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
      6b:	50                   	push   %eax
      6c:	ff 33                	push   (%ebx)
      6e:	68 8b 10 00 00       	push   $0x108b
      73:	6a 01                	push   $0x1
      75:	e8 b6 04 00 00       	call   530 <printf>
      exit();
      7a:	e8 54 03 00 00       	call   3d3 <exit>
    wc(0, "");
      7f:	52                   	push   %edx
      80:	52                   	push   %edx
      81:	68 7d 10 00 00       	push   $0x107d
      86:	6a 00                	push   $0x0
      88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
      8d:	e8 41 03 00 00       	call   3d3 <exit>
      92:	66 90                	xchg   %ax,%ax
      94:	66 90                	xchg   %ax,%ax
      96:	66 90                	xchg   %ax,%ax
      98:	66 90                	xchg   %ax,%ax
      9a:	66 90                	xchg   %ax,%ax
      9c:	66 90                	xchg   %ax,%ax
      9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
      a0:	55                   	push   %ebp
      a1:	89 e5                	mov    %esp,%ebp
      a3:	57                   	push   %edi
      a4:	56                   	push   %esi
      a5:	53                   	push   %ebx
  l = w = c = 0;
      a6:	31 db                	xor    %ebx,%ebx
{
      a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
      ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
      b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
      b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
      c0:	83 ec 04             	sub    $0x4,%esp
      c3:	68 00 02 00 00       	push   $0x200
      c8:	68 20 17 00 00       	push   $0x1720
      cd:	ff 75 08             	push   0x8(%ebp)
      d0:	e8 16 03 00 00       	call   3eb <read>
      d5:	83 c4 10             	add    $0x10,%esp
      d8:	89 c6                	mov    %eax,%esi
      da:	85 c0                	test   %eax,%eax
      dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
      de:	31 ff                	xor    %edi,%edi
      e0:	eb 14                	jmp    f6 <wc+0x56>
      e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
      e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
      ef:	83 c7 01             	add    $0x1,%edi
      f2:	39 fe                	cmp    %edi,%esi
      f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
      f6:	0f be 87 20 17 00 00 	movsbl 0x1720(%edi),%eax
        l++;
      fd:	31 c9                	xor    %ecx,%ecx
      ff:	3c 0a                	cmp    $0xa,%al
     101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
     104:	83 ec 08             	sub    $0x8,%esp
     107:	50                   	push   %eax
        l++;
     108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
     10a:	68 68 10 00 00       	push   $0x1068
     10f:	e8 4c 01 00 00       	call   260 <strchr>
     114:	83 c4 10             	add    $0x10,%esp
     117:	85 c0                	test   %eax,%eax
     119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
     11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     11e:	85 d2                	test   %edx,%edx
     120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
     122:	83 c7 01             	add    $0x1,%edi
        w++;
     125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
     129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
     130:	39 fe                	cmp    %edi,%esi
     132:	75 c2                	jne    f6 <wc+0x56>
     134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
     138:	01 75 dc             	add    %esi,-0x24(%ebp)
     13b:	eb 83                	jmp    c0 <wc+0x20>
     13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
     140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
     142:	83 ec 08             	sub    $0x8,%esp
     145:	ff 75 0c             	push   0xc(%ebp)
     148:	ff 75 dc             	push   -0x24(%ebp)
     14b:	ff 75 e0             	push   -0x20(%ebp)
     14e:	53                   	push   %ebx
     14f:	68 7e 10 00 00       	push   $0x107e
     154:	6a 01                	push   $0x1
     156:	e8 d5 03 00 00       	call   530 <printf>
}
     15b:	83 c4 20             	add    $0x20,%esp
     15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     161:	5b                   	pop    %ebx
     162:	5e                   	pop    %esi
     163:	5f                   	pop    %edi
     164:	5d                   	pop    %ebp
     165:	c3                   	ret    
    printf(1, "wc: read error\n");
     166:	50                   	push   %eax
     167:	50                   	push   %eax
     168:	68 6e 10 00 00       	push   $0x106e
     16d:	6a 01                	push   $0x1
     16f:	e8 bc 03 00 00       	call   530 <printf>
    exit();
     174:	e8 5a 02 00 00       	call   3d3 <exit>
     179:	66 90                	xchg   %ax,%ax
     17b:	66 90                	xchg   %ax,%ax
     17d:	66 90                	xchg   %ax,%ax
     17f:	90                   	nop

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     181:	31 c0                	xor    %eax,%eax
{
     183:	89 e5                	mov    %esp,%ebp
     185:	53                   	push   %ebx
     186:	8b 4d 08             	mov    0x8(%ebp),%ecx
     189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     197:	83 c0 01             	add    $0x1,%eax
     19a:	84 d2                	test   %dl,%dl
     19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
     19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1a1:	89 c8                	mov    %ecx,%eax
     1a3:	c9                   	leave  
     1a4:	c3                   	ret    
     1a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	8b 55 08             	mov    0x8(%ebp),%edx
     1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     1ba:	0f b6 02             	movzbl (%edx),%eax
     1bd:	84 c0                	test   %al,%al
     1bf:	75 17                	jne    1d8 <strcmp+0x28>
     1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
     1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     1c7:	90                   	nop
     1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     1cc:	83 c2 01             	add    $0x1,%edx
     1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     1d2:	84 c0                	test   %al,%al
     1d4:	74 1a                	je     1f0 <strcmp+0x40>
    p++, q++;
     1d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     1d8:	0f b6 19             	movzbl (%ecx),%ebx
     1db:	38 c3                	cmp    %al,%bl
     1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     1df:	29 d8                	sub    %ebx,%eax
}
     1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1e4:	c9                   	leave  
     1e5:	c3                   	ret    
     1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     1f4:	31 c0                	xor    %eax,%eax
     1f6:	29 d8                	sub    %ebx,%eax
}
     1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1fb:	c9                   	leave  
     1fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     1fd:	0f b6 19             	movzbl (%ecx),%ebx
     200:	31 c0                	xor    %eax,%eax
     202:	eb db                	jmp    1df <strcmp+0x2f>
     204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     20f:	90                   	nop

00000210 <strlen>:

uint
strlen(const char *s)
{
     210:	55                   	push   %ebp
     211:	89 e5                	mov    %esp,%ebp
     213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     216:	80 3a 00             	cmpb   $0x0,(%edx)
     219:	74 15                	je     230 <strlen+0x20>
     21b:	31 c0                	xor    %eax,%eax
     21d:	8d 76 00             	lea    0x0(%esi),%esi
     220:	83 c0 01             	add    $0x1,%eax
     223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     227:	89 c1                	mov    %eax,%ecx
     229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
     22b:	89 c8                	mov    %ecx,%eax
     22d:	5d                   	pop    %ebp
     22e:	c3                   	ret    
     22f:	90                   	nop
  for(n = 0; s[n]; n++)
     230:	31 c9                	xor    %ecx,%ecx
}
     232:	5d                   	pop    %ebp
     233:	89 c8                	mov    %ecx,%eax
     235:	c3                   	ret    
     236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	57                   	push   %edi
     244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     247:	8b 4d 10             	mov    0x10(%ebp),%ecx
     24a:	8b 45 0c             	mov    0xc(%ebp),%eax
     24d:	89 d7                	mov    %edx,%edi
     24f:	fc                   	cld    
     250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     252:	8b 7d fc             	mov    -0x4(%ebp),%edi
     255:	89 d0                	mov    %edx,%eax
     257:	c9                   	leave  
     258:	c3                   	ret    
     259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
     260:	55                   	push   %ebp
     261:	89 e5                	mov    %esp,%ebp
     263:	8b 45 08             	mov    0x8(%ebp),%eax
     266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     26a:	0f b6 10             	movzbl (%eax),%edx
     26d:	84 d2                	test   %dl,%dl
     26f:	75 12                	jne    283 <strchr+0x23>
     271:	eb 1d                	jmp    290 <strchr+0x30>
     273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     277:	90                   	nop
     278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     27c:	83 c0 01             	add    $0x1,%eax
     27f:	84 d2                	test   %dl,%dl
     281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
     283:	38 d1                	cmp    %dl,%cl
     285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
     287:	5d                   	pop    %ebp
     288:	c3                   	ret    
     289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     290:	31 c0                	xor    %eax,%eax
}
     292:	5d                   	pop    %ebp
     293:	c3                   	ret    
     294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     29f:	90                   	nop

000002a0 <gets>:

char*
gets(char *buf, int max)
{
     2a0:	55                   	push   %ebp
     2a1:	89 e5                	mov    %esp,%ebp
     2a3:	57                   	push   %edi
     2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     2a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     2a9:	31 db                	xor    %ebx,%ebx
{
     2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
     2b0:	83 ec 04             	sub    $0x4,%esp
     2b3:	6a 01                	push   $0x1
     2b5:	57                   	push   %edi
     2b6:	6a 00                	push   $0x0
     2b8:	e8 2e 01 00 00       	call   3eb <read>
    if(cc < 1)
     2bd:	83 c4 10             	add    $0x10,%esp
     2c0:	85 c0                	test   %eax,%eax
     2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
     2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     2c8:	8b 55 08             	mov    0x8(%ebp),%edx
     2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     2cf:	3c 0a                	cmp    $0xa,%al
     2d1:	74 1d                	je     2f0 <gets+0x50>
     2d3:	3c 0d                	cmp    $0xd,%al
     2d5:	74 19                	je     2f0 <gets+0x50>
  for(i=0; i+1 < max; ){
     2d7:	89 de                	mov    %ebx,%esi
     2d9:	83 c3 01             	add    $0x1,%ebx
     2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     2df:	7c cf                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     2e1:	8b 45 08             	mov    0x8(%ebp),%eax
     2e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     2e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2eb:	5b                   	pop    %ebx
     2ec:	5e                   	pop    %esi
     2ed:	5f                   	pop    %edi
     2ee:	5d                   	pop    %ebp
     2ef:	c3                   	ret    
  buf[i] = '\0';
     2f0:	8b 45 08             	mov    0x8(%ebp),%eax
     2f3:	89 de                	mov    %ebx,%esi
     2f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     2f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2fc:	5b                   	pop    %ebx
     2fd:	5e                   	pop    %esi
     2fe:	5f                   	pop    %edi
     2ff:	5d                   	pop    %ebp
     300:	c3                   	ret    
     301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     30f:	90                   	nop

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	56                   	push   %esi
     314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     315:	83 ec 08             	sub    $0x8,%esp
     318:	6a 00                	push   $0x0
     31a:	ff 75 08             	push   0x8(%ebp)
     31d:	e8 f1 00 00 00       	call   413 <open>
  if(fd < 0)
     322:	83 c4 10             	add    $0x10,%esp
     325:	85 c0                	test   %eax,%eax
     327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     329:	83 ec 08             	sub    $0x8,%esp
     32c:	ff 75 0c             	push   0xc(%ebp)
     32f:	89 c3                	mov    %eax,%ebx
     331:	50                   	push   %eax
     332:	e8 f4 00 00 00       	call   42b <fstat>
  close(fd);
     337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     33a:	89 c6                	mov    %eax,%esi
  close(fd);
     33c:	e8 ba 00 00 00       	call   3fb <close>
  return r;
     341:	83 c4 10             	add    $0x10,%esp
}
     344:	8d 65 f8             	lea    -0x8(%ebp),%esp
     347:	89 f0                	mov    %esi,%eax
     349:	5b                   	pop    %ebx
     34a:	5e                   	pop    %esi
     34b:	5d                   	pop    %ebp
     34c:	c3                   	ret    
     34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     350:	be ff ff ff ff       	mov    $0xffffffff,%esi
     355:	eb ed                	jmp    344 <stat+0x34>
     357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     35e:	66 90                	xchg   %ax,%ax

00000360 <atoi>:

int
atoi(const char *s)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     367:	0f be 02             	movsbl (%edx),%eax
     36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     375:	77 1e                	ja     395 <atoi+0x35>
     377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     37e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     380:	83 c2 01             	add    $0x1,%edx
     383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     38a:	0f be 02             	movsbl (%edx),%eax
     38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     390:	80 fb 09             	cmp    $0x9,%bl
     393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
     395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     398:	89 c8                	mov    %ecx,%eax
     39a:	c9                   	leave  
     39b:	c3                   	ret    
     39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	57                   	push   %edi
     3a4:	8b 45 10             	mov    0x10(%ebp),%eax
     3a7:	8b 55 08             	mov    0x8(%ebp),%edx
     3aa:	56                   	push   %esi
     3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     3ae:	85 c0                	test   %eax,%eax
     3b0:	7e 13                	jle    3c5 <memmove+0x25>
     3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
     3b4:	89 d7                	mov    %edx,%edi
     3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     3c1:	39 f8                	cmp    %edi,%eax
     3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
     3c5:	5e                   	pop    %esi
     3c6:	89 d0                	mov    %edx,%eax
     3c8:	5f                   	pop    %edi
     3c9:	5d                   	pop    %ebp
     3ca:	c3                   	ret    

000003cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     3cb:	b8 01 00 00 00       	mov    $0x1,%eax
     3d0:	cd 40                	int    $0x40
     3d2:	c3                   	ret    

000003d3 <exit>:
SYSCALL(exit)
     3d3:	b8 02 00 00 00       	mov    $0x2,%eax
     3d8:	cd 40                	int    $0x40
     3da:	c3                   	ret    

000003db <wait>:
SYSCALL(wait)
     3db:	b8 03 00 00 00       	mov    $0x3,%eax
     3e0:	cd 40                	int    $0x40
     3e2:	c3                   	ret    

000003e3 <pipe>:
SYSCALL(pipe)
     3e3:	b8 04 00 00 00       	mov    $0x4,%eax
     3e8:	cd 40                	int    $0x40
     3ea:	c3                   	ret    

000003eb <read>:
SYSCALL(read)
     3eb:	b8 05 00 00 00       	mov    $0x5,%eax
     3f0:	cd 40                	int    $0x40
     3f2:	c3                   	ret    

000003f3 <write>:
SYSCALL(write)
     3f3:	b8 10 00 00 00       	mov    $0x10,%eax
     3f8:	cd 40                	int    $0x40
     3fa:	c3                   	ret    

000003fb <close>:
SYSCALL(close)
     3fb:	b8 15 00 00 00       	mov    $0x15,%eax
     400:	cd 40                	int    $0x40
     402:	c3                   	ret    

00000403 <kill>:
SYSCALL(kill)
     403:	b8 06 00 00 00       	mov    $0x6,%eax
     408:	cd 40                	int    $0x40
     40a:	c3                   	ret    

0000040b <exec>:
SYSCALL(exec)
     40b:	b8 07 00 00 00       	mov    $0x7,%eax
     410:	cd 40                	int    $0x40
     412:	c3                   	ret    

00000413 <open>:
SYSCALL(open)
     413:	b8 0f 00 00 00       	mov    $0xf,%eax
     418:	cd 40                	int    $0x40
     41a:	c3                   	ret    

0000041b <mknod>:
SYSCALL(mknod)
     41b:	b8 11 00 00 00       	mov    $0x11,%eax
     420:	cd 40                	int    $0x40
     422:	c3                   	ret    

00000423 <unlink>:
SYSCALL(unlink)
     423:	b8 12 00 00 00       	mov    $0x12,%eax
     428:	cd 40                	int    $0x40
     42a:	c3                   	ret    

0000042b <fstat>:
SYSCALL(fstat)
     42b:	b8 08 00 00 00       	mov    $0x8,%eax
     430:	cd 40                	int    $0x40
     432:	c3                   	ret    

00000433 <link>:
SYSCALL(link)
     433:	b8 13 00 00 00       	mov    $0x13,%eax
     438:	cd 40                	int    $0x40
     43a:	c3                   	ret    

0000043b <mkdir>:
SYSCALL(mkdir)
     43b:	b8 14 00 00 00       	mov    $0x14,%eax
     440:	cd 40                	int    $0x40
     442:	c3                   	ret    

00000443 <chdir>:
SYSCALL(chdir)
     443:	b8 09 00 00 00       	mov    $0x9,%eax
     448:	cd 40                	int    $0x40
     44a:	c3                   	ret    

0000044b <dup>:
SYSCALL(dup)
     44b:	b8 0a 00 00 00       	mov    $0xa,%eax
     450:	cd 40                	int    $0x40
     452:	c3                   	ret    

00000453 <getpid>:
SYSCALL(getpid)
     453:	b8 0b 00 00 00       	mov    $0xb,%eax
     458:	cd 40                	int    $0x40
     45a:	c3                   	ret    

0000045b <sbrk>:
SYSCALL(sbrk)
     45b:	b8 0c 00 00 00       	mov    $0xc,%eax
     460:	cd 40                	int    $0x40
     462:	c3                   	ret    

00000463 <sleep>:
SYSCALL(sleep)
     463:	b8 0d 00 00 00       	mov    $0xd,%eax
     468:	cd 40                	int    $0x40
     46a:	c3                   	ret    

0000046b <uptime>:
SYSCALL(uptime)
     46b:	b8 0e 00 00 00       	mov    $0xe,%eax
     470:	cd 40                	int    $0x40
     472:	c3                   	ret    
     473:	66 90                	xchg   %ax,%ax
     475:	66 90                	xchg   %ax,%ax
     477:	66 90                	xchg   %ax,%ax
     479:	66 90                	xchg   %ax,%ax
     47b:	66 90                	xchg   %ax,%ax
     47d:	66 90                	xchg   %ax,%ax
     47f:	90                   	nop

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	57                   	push   %edi
     484:	56                   	push   %esi
     485:	53                   	push   %ebx
     486:	83 ec 3c             	sub    $0x3c,%esp
     489:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     48c:	89 d1                	mov    %edx,%ecx
{
     48e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     491:	85 d2                	test   %edx,%edx
     493:	0f 89 7f 00 00 00    	jns    518 <printint+0x98>
     499:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     49d:	74 79                	je     518 <printint+0x98>
    neg = 1;
     49f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     4a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     4a8:	31 db                	xor    %ebx,%ebx
     4aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
     4ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     4b0:	89 c8                	mov    %ecx,%eax
     4b2:	31 d2                	xor    %edx,%edx
     4b4:	89 cf                	mov    %ecx,%edi
     4b6:	f7 75 c4             	divl   -0x3c(%ebp)
     4b9:	0f b6 92 00 11 00 00 	movzbl 0x1100(%edx),%edx
     4c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
     4c3:	89 d8                	mov    %ebx,%eax
     4c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     4c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     4cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     4ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     4d1:	76 dd                	jbe    4b0 <printint+0x30>
  if(neg)
     4d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     4d6:	85 c9                	test   %ecx,%ecx
     4d8:	74 0c                	je     4e6 <printint+0x66>
    buf[i++] = '-';
     4da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     4df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     4e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     4e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
     4e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     4ed:	eb 07                	jmp    4f6 <printint+0x76>
     4ef:	90                   	nop
    putc(fd, buf[i]);
     4f0:	0f b6 13             	movzbl (%ebx),%edx
     4f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     4f6:	83 ec 04             	sub    $0x4,%esp
     4f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
     4fc:	6a 01                	push   $0x1
     4fe:	56                   	push   %esi
     4ff:	57                   	push   %edi
     500:	e8 ee fe ff ff       	call   3f3 <write>
  while(--i >= 0)
     505:	83 c4 10             	add    $0x10,%esp
     508:	39 de                	cmp    %ebx,%esi
     50a:	75 e4                	jne    4f0 <printint+0x70>
}
     50c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     50f:	5b                   	pop    %ebx
     510:	5e                   	pop    %esi
     511:	5f                   	pop    %edi
     512:	5d                   	pop    %ebp
     513:	c3                   	ret    
     514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     518:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     51f:	eb 87                	jmp    4a8 <printint+0x28>
     521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     52f:	90                   	nop

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	57                   	push   %edi
     534:	56                   	push   %esi
     535:	53                   	push   %ebx
     536:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     539:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
     53c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
     53f:	0f b6 13             	movzbl (%ebx),%edx
     542:	84 d2                	test   %dl,%dl
     544:	74 6a                	je     5b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
     546:	8d 45 10             	lea    0x10(%ebp),%eax
     549:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     54c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
     54f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
     551:	89 45 d0             	mov    %eax,-0x30(%ebp)
     554:	eb 36                	jmp    58c <printf+0x5c>
     556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     55d:	8d 76 00             	lea    0x0(%esi),%esi
     560:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     563:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
     568:	83 f8 25             	cmp    $0x25,%eax
     56b:	74 15                	je     582 <printf+0x52>
  write(fd, &c, 1);
     56d:	83 ec 04             	sub    $0x4,%esp
     570:	88 55 e7             	mov    %dl,-0x19(%ebp)
     573:	6a 01                	push   $0x1
     575:	57                   	push   %edi
     576:	56                   	push   %esi
     577:	e8 77 fe ff ff       	call   3f3 <write>
     57c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
     57f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     582:	0f b6 13             	movzbl (%ebx),%edx
     585:	83 c3 01             	add    $0x1,%ebx
     588:	84 d2                	test   %dl,%dl
     58a:	74 24                	je     5b0 <printf+0x80>
    c = fmt[i] & 0xff;
     58c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
     58f:	85 c9                	test   %ecx,%ecx
     591:	74 cd                	je     560 <printf+0x30>
      }
    } else if(state == '%'){
     593:	83 f9 25             	cmp    $0x25,%ecx
     596:	75 ea                	jne    582 <printf+0x52>
      if(c == 'd'){
     598:	83 f8 25             	cmp    $0x25,%eax
     59b:	0f 84 07 01 00 00    	je     6a8 <printf+0x178>
     5a1:	83 e8 63             	sub    $0x63,%eax
     5a4:	83 f8 15             	cmp    $0x15,%eax
     5a7:	77 17                	ja     5c0 <printf+0x90>
     5a9:	ff 24 85 a8 10 00 00 	jmp    *0x10a8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     5b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5b3:	5b                   	pop    %ebx
     5b4:	5e                   	pop    %esi
     5b5:	5f                   	pop    %edi
     5b6:	5d                   	pop    %ebp
     5b7:	c3                   	ret    
     5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5bf:	90                   	nop
  write(fd, &c, 1);
     5c0:	83 ec 04             	sub    $0x4,%esp
     5c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
     5c6:	6a 01                	push   $0x1
     5c8:	57                   	push   %edi
     5c9:	56                   	push   %esi
     5ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     5ce:	e8 20 fe ff ff       	call   3f3 <write>
        putc(fd, c);
     5d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
     5d7:	83 c4 0c             	add    $0xc,%esp
     5da:	88 55 e7             	mov    %dl,-0x19(%ebp)
     5dd:	6a 01                	push   $0x1
     5df:	57                   	push   %edi
     5e0:	56                   	push   %esi
     5e1:	e8 0d fe ff ff       	call   3f3 <write>
        putc(fd, c);
     5e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
     5e9:	31 c9                	xor    %ecx,%ecx
     5eb:	eb 95                	jmp    582 <printf+0x52>
     5ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
     5f0:	83 ec 0c             	sub    $0xc,%esp
     5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
     5f8:	6a 00                	push   $0x0
     5fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
     5fd:	8b 10                	mov    (%eax),%edx
     5ff:	89 f0                	mov    %esi,%eax
     601:	e8 7a fe ff ff       	call   480 <printint>
        ap++;
     606:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
     60a:	83 c4 10             	add    $0x10,%esp
      state = 0;
     60d:	31 c9                	xor    %ecx,%ecx
     60f:	e9 6e ff ff ff       	jmp    582 <printf+0x52>
     614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     618:	8b 45 d0             	mov    -0x30(%ebp),%eax
     61b:	8b 10                	mov    (%eax),%edx
        ap++;
     61d:	83 c0 04             	add    $0x4,%eax
     620:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     623:	85 d2                	test   %edx,%edx
     625:	0f 84 8d 00 00 00    	je     6b8 <printf+0x188>
        while(*s != 0){
     62b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
     62e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
     630:	84 c0                	test   %al,%al
     632:	0f 84 4a ff ff ff    	je     582 <printf+0x52>
     638:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     63b:	89 d3                	mov    %edx,%ebx
     63d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     640:	83 ec 04             	sub    $0x4,%esp
          s++;
     643:	83 c3 01             	add    $0x1,%ebx
     646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     649:	6a 01                	push   $0x1
     64b:	57                   	push   %edi
     64c:	56                   	push   %esi
     64d:	e8 a1 fd ff ff       	call   3f3 <write>
        while(*s != 0){
     652:	0f b6 03             	movzbl (%ebx),%eax
     655:	83 c4 10             	add    $0x10,%esp
     658:	84 c0                	test   %al,%al
     65a:	75 e4                	jne    640 <printf+0x110>
      state = 0;
     65c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
     65f:	31 c9                	xor    %ecx,%ecx
     661:	e9 1c ff ff ff       	jmp    582 <printf+0x52>
     666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     66d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
     670:	83 ec 0c             	sub    $0xc,%esp
     673:	b9 0a 00 00 00       	mov    $0xa,%ecx
     678:	6a 01                	push   $0x1
     67a:	e9 7b ff ff ff       	jmp    5fa <printf+0xca>
     67f:	90                   	nop
        putc(fd, *ap);
     680:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
     683:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     686:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
     688:	6a 01                	push   $0x1
     68a:	57                   	push   %edi
     68b:	56                   	push   %esi
        putc(fd, *ap);
     68c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     68f:	e8 5f fd ff ff       	call   3f3 <write>
        ap++;
     694:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
     698:	83 c4 10             	add    $0x10,%esp
      state = 0;
     69b:	31 c9                	xor    %ecx,%ecx
     69d:	e9 e0 fe ff ff       	jmp    582 <printf+0x52>
     6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
     6a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
     6ab:	83 ec 04             	sub    $0x4,%esp
     6ae:	e9 2a ff ff ff       	jmp    5dd <printf+0xad>
     6b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     6b7:	90                   	nop
          s = "(null)";
     6b8:	ba 9f 10 00 00       	mov    $0x109f,%edx
        while(*s != 0){
     6bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     6c0:	b8 28 00 00 00       	mov    $0x28,%eax
     6c5:	89 d3                	mov    %edx,%ebx
     6c7:	e9 74 ff ff ff       	jmp    640 <printf+0x110>
     6cc:	66 90                	xchg   %ax,%ax
     6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     6d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6d1:	a1 20 19 00 00       	mov    0x1920,%eax
{
     6d6:	89 e5                	mov    %esp,%ebp
     6d8:	57                   	push   %edi
     6d9:	56                   	push   %esi
     6da:	53                   	push   %ebx
     6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     6de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6e8:	89 c2                	mov    %eax,%edx
     6ea:	8b 00                	mov    (%eax),%eax
     6ec:	39 ca                	cmp    %ecx,%edx
     6ee:	73 30                	jae    720 <free+0x50>
     6f0:	39 c1                	cmp    %eax,%ecx
     6f2:	72 04                	jb     6f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6f4:	39 c2                	cmp    %eax,%edx
     6f6:	72 f0                	jb     6e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
     6f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
     6fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     6fe:	39 f8                	cmp    %edi,%eax
     700:	74 30                	je     732 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
     702:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     705:	8b 42 04             	mov    0x4(%edx),%eax
     708:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     70b:	39 f1                	cmp    %esi,%ecx
     70d:	74 3a                	je     749 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
     70f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
     711:	5b                   	pop    %ebx
  freep = p;
     712:	89 15 20 19 00 00    	mov    %edx,0x1920
}
     718:	5e                   	pop    %esi
     719:	5f                   	pop    %edi
     71a:	5d                   	pop    %ebp
     71b:	c3                   	ret    
     71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     720:	39 c2                	cmp    %eax,%edx
     722:	72 c4                	jb     6e8 <free+0x18>
     724:	39 c1                	cmp    %eax,%ecx
     726:	73 c0                	jae    6e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
     728:	8b 73 fc             	mov    -0x4(%ebx),%esi
     72b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     72e:	39 f8                	cmp    %edi,%eax
     730:	75 d0                	jne    702 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
     732:	03 70 04             	add    0x4(%eax),%esi
     735:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     738:	8b 02                	mov    (%edx),%eax
     73a:	8b 00                	mov    (%eax),%eax
     73c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
     73f:	8b 42 04             	mov    0x4(%edx),%eax
     742:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     745:	39 f1                	cmp    %esi,%ecx
     747:	75 c6                	jne    70f <free+0x3f>
    p->s.size += bp->s.size;
     749:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
     74c:	89 15 20 19 00 00    	mov    %edx,0x1920
    p->s.size += bp->s.size;
     752:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
     755:	8b 4b f8             	mov    -0x8(%ebx),%ecx
     758:	89 0a                	mov    %ecx,(%edx)
}
     75a:	5b                   	pop    %ebx
     75b:	5e                   	pop    %esi
     75c:	5f                   	pop    %edi
     75d:	5d                   	pop    %ebp
     75e:	c3                   	ret    
     75f:	90                   	nop

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     760:	55                   	push   %ebp
     761:	89 e5                	mov    %esp,%ebp
     763:	57                   	push   %edi
     764:	56                   	push   %esi
     765:	53                   	push   %ebx
     766:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     769:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     76c:	8b 3d 20 19 00 00    	mov    0x1920,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     772:	8d 70 07             	lea    0x7(%eax),%esi
     775:	c1 ee 03             	shr    $0x3,%esi
     778:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
     77b:	85 ff                	test   %edi,%edi
     77d:	0f 84 9d 00 00 00    	je     820 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     783:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
     785:	8b 4a 04             	mov    0x4(%edx),%ecx
     788:	39 f1                	cmp    %esi,%ecx
     78a:	73 6a                	jae    7f6 <malloc+0x96>
     78c:	bb 00 10 00 00       	mov    $0x1000,%ebx
     791:	39 de                	cmp    %ebx,%esi
     793:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
     796:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
     79d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     7a0:	eb 17                	jmp    7b9 <malloc+0x59>
     7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     7a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     7aa:	8b 48 04             	mov    0x4(%eax),%ecx
     7ad:	39 f1                	cmp    %esi,%ecx
     7af:	73 4f                	jae    800 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     7b1:	8b 3d 20 19 00 00    	mov    0x1920,%edi
     7b7:	89 c2                	mov    %eax,%edx
     7b9:	39 d7                	cmp    %edx,%edi
     7bb:	75 eb                	jne    7a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
     7bd:	83 ec 0c             	sub    $0xc,%esp
     7c0:	ff 75 e4             	push   -0x1c(%ebp)
     7c3:	e8 93 fc ff ff       	call   45b <sbrk>
  if(p == (char*)-1)
     7c8:	83 c4 10             	add    $0x10,%esp
     7cb:	83 f8 ff             	cmp    $0xffffffff,%eax
     7ce:	74 1c                	je     7ec <malloc+0x8c>
  hp->s.size = nu;
     7d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
     7d3:	83 ec 0c             	sub    $0xc,%esp
     7d6:	83 c0 08             	add    $0x8,%eax
     7d9:	50                   	push   %eax
     7da:	e8 f1 fe ff ff       	call   6d0 <free>
  return freep;
     7df:	8b 15 20 19 00 00    	mov    0x1920,%edx
      if((p = morecore(nunits)) == 0)
     7e5:	83 c4 10             	add    $0x10,%esp
     7e8:	85 d2                	test   %edx,%edx
     7ea:	75 bc                	jne    7a8 <malloc+0x48>
        return 0;
  }
}
     7ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     7ef:	31 c0                	xor    %eax,%eax
}
     7f1:	5b                   	pop    %ebx
     7f2:	5e                   	pop    %esi
     7f3:	5f                   	pop    %edi
     7f4:	5d                   	pop    %ebp
     7f5:	c3                   	ret    
    if(p->s.size >= nunits){
     7f6:	89 d0                	mov    %edx,%eax
     7f8:	89 fa                	mov    %edi,%edx
     7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
     800:	39 ce                	cmp    %ecx,%esi
     802:	74 4c                	je     850 <malloc+0xf0>
        p->s.size -= nunits;
     804:	29 f1                	sub    %esi,%ecx
     806:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     809:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     80c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
     80f:	89 15 20 19 00 00    	mov    %edx,0x1920
}
     815:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
     818:	83 c0 08             	add    $0x8,%eax
}
     81b:	5b                   	pop    %ebx
     81c:	5e                   	pop    %esi
     81d:	5f                   	pop    %edi
     81e:	5d                   	pop    %ebp
     81f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
     820:	c7 05 20 19 00 00 24 	movl   $0x1924,0x1920
     827:	19 00 00 
    base.s.size = 0;
     82a:	bf 24 19 00 00       	mov    $0x1924,%edi
    base.s.ptr = freep = prevp = &base;
     82f:	c7 05 24 19 00 00 24 	movl   $0x1924,0x1924
     836:	19 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     839:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
     83b:	c7 05 28 19 00 00 00 	movl   $0x0,0x1928
     842:	00 00 00 
    if(p->s.size >= nunits){
     845:	e9 42 ff ff ff       	jmp    78c <malloc+0x2c>
     84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
     850:	8b 08                	mov    (%eax),%ecx
     852:	89 0a                	mov    %ecx,(%edx)
     854:	eb b9                	jmp    80f <malloc+0xaf>
     856:	66 90                	xchg   %ax,%ax
     858:	66 90                	xchg   %ax,%ax
     85a:	66 90                	xchg   %ax,%ax
     85c:	66 90                	xchg   %ax,%ax
     85e:	66 90                	xchg   %ax,%ax

00000860 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	83 ec 04             	sub    $0x4,%esp
     869:	8b 5d 10             	mov    0x10(%ebp),%ebx
     86c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
     86f:	85 db                	test   %ebx,%ebx
     871:	7e 3d                	jle    8b0 <min_distance_vertex+0x50>
    int min_idx = 0;
     873:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
     875:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
     877:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
     87c:	89 75 f0             	mov    %esi,-0x10(%ebp)
     87f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
     880:	8b 14 87             	mov    (%edi,%eax,4),%edx
     883:	39 ca                	cmp    %ecx,%edx
     885:	7d 14                	jge    89b <min_distance_vertex+0x3b>
     887:	8b 75 0c             	mov    0xc(%ebp),%esi
     88a:	8b 34 86             	mov    (%esi,%eax,4),%esi
     88d:	85 f6                	test   %esi,%esi
     88f:	8b 75 f0             	mov    -0x10(%ebp),%esi
     892:	0f 44 ca             	cmove  %edx,%ecx
     895:	0f 44 f0             	cmove  %eax,%esi
     898:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
     89b:	83 c0 01             	add    $0x1,%eax
     89e:	39 c3                	cmp    %eax,%ebx
     8a0:	75 de                	jne    880 <min_distance_vertex+0x20>
     8a2:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
     8a5:	83 c4 04             	add    $0x4,%esp
     8a8:	5b                   	pop    %ebx
     8a9:	89 f0                	mov    %esi,%eax
     8ab:	5e                   	pop    %esi
     8ac:	5f                   	pop    %edi
     8ad:	5d                   	pop    %ebp
     8ae:	c3                   	ret    
     8af:	90                   	nop
     8b0:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
     8b3:	31 f6                	xor    %esi,%esi
}
     8b5:	5b                   	pop    %ebx
     8b6:	89 f0                	mov    %esi,%eax
     8b8:	5e                   	pop    %esi
     8b9:	5f                   	pop    %edi
     8ba:	5d                   	pop    %ebp
     8bb:	c3                   	ret    
     8bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008c0 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	57                   	push   %edi
     8c4:	56                   	push   %esi
     8c5:	53                   	push   %ebx
     8c6:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
     8c9:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
     8cc:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
     8cf:	89 e6                	mov    %esp,%esi
     8d1:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
     8d8:	8d 41 0f             	lea    0xf(%ecx),%eax
     8db:	89 c2                	mov    %eax,%edx
     8dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     8e2:	29 c6                	sub    %eax,%esi
     8e4:	83 e2 f0             	and    $0xfffffff0,%edx
     8e7:	39 f4                	cmp    %esi,%esp
     8e9:	74 12                	je     8fd <dijkstra+0x3d>
     8eb:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     8f1:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
     8f8:	00 
     8f9:	39 f4                	cmp    %esi,%esp
     8fb:	75 ee                	jne    8eb <dijkstra+0x2b>
     8fd:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
     903:	29 d4                	sub    %edx,%esp
     905:	85 d2                	test   %edx,%edx
     907:	0f 85 ef 00 00 00    	jne    9fc <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
     90d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
     910:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
     912:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
     915:	8b 45 0c             	mov    0xc(%ebp),%eax
     918:	85 c0                	test   %eax,%eax
     91a:	0f 8e e6 00 00 00    	jle    a06 <dijkstra+0x146>
     920:	89 d8                	mov    %ebx,%eax
     922:	89 fa                	mov    %edi,%edx
     924:	01 d9                	add    %ebx,%ecx
     926:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     92d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
     930:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
     936:	83 c0 04             	add    $0x4,%eax
     939:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
     93c:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
     943:	39 c8                	cmp    %ecx,%eax
     945:	75 e9                	jne    930 <dijkstra+0x70>
    dist[src] = 0;
     947:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     94d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
     958:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
     95a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
     95f:	31 c0                	xor    %eax,%eax
     961:	eb 07                	jmp    96a <dijkstra+0xaa>
     963:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     967:	90                   	nop
     968:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
     96a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
     96d:	39 ca                	cmp    %ecx,%edx
     96f:	7d 0a                	jge    97b <dijkstra+0xbb>
     971:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
     975:	0f 44 f0             	cmove  %eax,%esi
     978:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
     97b:	8d 50 01             	lea    0x1(%eax),%edx
     97e:	39 55 0c             	cmp    %edx,0xc(%ebp)
     981:	75 e5                	jne    968 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
     983:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
     986:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
     98d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
     993:	89 4d e0             	mov    %ecx,-0x20(%ebp)
     996:	75 18                	jne    9b0 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
     998:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     99b:	8d 56 01             	lea    0x1(%esi),%edx
     99e:	39 c6                	cmp    %eax,%esi
     9a0:	74 52                	je     9f4 <dijkstra+0x134>
     9a2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
     9a5:	eb b1                	jmp    958 <dijkstra+0x98>
     9a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     9ae:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
     9b0:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
     9b6:	89 5d dc             	mov    %ebx,-0x24(%ebp)
     9b9:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
     9bc:	31 d2                	xor    %edx,%edx
     9be:	eb 02                	jmp    9c2 <dijkstra+0x102>
     9c0:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
     9c2:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
     9c5:	85 c9                	test   %ecx,%ecx
     9c7:	74 17                	je     9e0 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
     9c9:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
     9cc:	85 db                	test   %ebx,%ebx
     9ce:	75 10                	jne    9e0 <dijkstra+0x120>
     9d0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
     9d3:	03 0b                	add    (%ebx),%ecx
     9d5:	8b 5d dc             	mov    -0x24(%ebp),%ebx
     9d8:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
     9db:	7e 03                	jle    9e0 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
     9dd:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
     9e0:	8d 4a 01             	lea    0x1(%edx),%ecx
     9e3:	39 c2                	cmp    %eax,%edx
     9e5:	75 d9                	jne    9c0 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
     9e7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     9ea:	8b 5d dc             	mov    -0x24(%ebp),%ebx
     9ed:	8d 56 01             	lea    0x1(%esi),%edx
     9f0:	39 c6                	cmp    %eax,%esi
     9f2:	75 ae                	jne    9a2 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
     9f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9f7:	5b                   	pop    %ebx
     9f8:	5e                   	pop    %esi
     9f9:	5f                   	pop    %edi
     9fa:	5d                   	pop    %ebp
     9fb:	c3                   	ret    
    int visited[num_vertices];
     9fc:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
     a01:	e9 07 ff ff ff       	jmp    90d <dijkstra+0x4d>
    dist[src] = 0;
     a06:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     a0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a0f:	5b                   	pop    %ebx
     a10:	5e                   	pop    %esi
     a11:	5f                   	pop    %edi
     a12:	5d                   	pop    %ebp
     a13:	c3                   	ret    
     a14:	66 90                	xchg   %ax,%ax
     a16:	66 90                	xchg   %ax,%ax
     a18:	66 90                	xchg   %ax,%ax
     a1a:	66 90                	xchg   %ax,%ax
     a1c:	66 90                	xchg   %ax,%ax
     a1e:	66 90                	xchg   %ax,%ax

00000a20 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
     a24:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
     a29:	56                   	push   %esi
     a2a:	53                   	push   %ebx
     a2b:	83 ec 0c             	sub    $0xc,%esp
     a2e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     a31:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
     a34:	e8 f7 00 00 00       	call   b30 <random>
     a39:	89 c1                	mov    %eax,%ecx
     a3b:	f7 ef                	imul   %edi
     a3d:	89 c8                	mov    %ecx,%eax
     a3f:	c1 f8 1f             	sar    $0x1f,%eax
     a42:	c1 fa 06             	sar    $0x6,%edx
     a45:	29 c2                	sub    %eax,%edx
     a47:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
     a4d:	29 c1                	sub    %eax,%ecx
     a4f:	83 f9 63             	cmp    $0x63,%ecx
     a52:	89 ca                	mov    %ecx,%edx
     a54:	8d 41 64             	lea    0x64(%ecx),%eax
     a57:	0f 4e d0             	cmovle %eax,%edx
     a5a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
     a5c:	e8 cf 00 00 00       	call   b30 <random>
     a61:	89 c1                	mov    %eax,%ecx
     a63:	f7 ef                	imul   %edi
     a65:	89 c8                	mov    %ecx,%eax
     a67:	c1 f8 1f             	sar    $0x1f,%eax
     a6a:	c1 fa 07             	sar    $0x7,%edx
     a6d:	29 c2                	sub    %eax,%edx
     a6f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
     a75:	29 c1                	sub    %eax,%ecx
     a77:	8d 41 32             	lea    0x32(%ecx),%eax
     a7a:	89 ca                	mov    %ecx,%edx
     a7c:	83 f9 31             	cmp    $0x31,%ecx
     a7f:	0f 4e d0             	cmovle %eax,%edx
     a82:	8b 45 10             	mov    0x10(%ebp),%eax
     a85:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
     a87:	8b 13                	mov    (%ebx),%edx
     a89:	85 d2                	test   %edx,%edx
     a8b:	7e 38                	jle    ac5 <gen_random_digraph+0xa5>
     a8d:	89 f1                	mov    %esi,%ecx
     a8f:	31 ff                	xor    %edi,%edi
     a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
     a98:	31 c0                	xor    %eax,%eax
     a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
     aa0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
     aa7:	8b 13                	mov    (%ebx),%edx
     aa9:	83 c0 01             	add    $0x1,%eax
     aac:	39 c2                	cmp    %eax,%edx
     aae:	7f f0                	jg     aa0 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
     ab0:	83 c7 01             	add    $0x1,%edi
     ab3:	81 c1 20 03 00 00    	add    $0x320,%ecx
     ab9:	39 fa                	cmp    %edi,%edx
     abb:	7f db                	jg     a98 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
     abd:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
     ac3:	7f 22                	jg     ae7 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
     ac5:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
     acb:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
     ad2:	8d 04 86             	lea    (%esi,%eax,4),%eax
     ad5:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
     ad8:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
     ade:	05 20 03 00 00       	add    $0x320,%eax
     ae3:	39 d0                	cmp    %edx,%eax
     ae5:	75 f1                	jne    ad8 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
     ae7:	8b 45 10             	mov    0x10(%ebp),%eax
     aea:	31 c9                	xor    %ecx,%ecx
     aec:	8b 00                	mov    (%eax),%eax
     aee:	85 c0                	test   %eax,%eax
     af0:	7e 31                	jle    b23 <gen_random_digraph+0x103>
     af2:	89 75 08             	mov    %esi,0x8(%ebp)
     af5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
     af7:	e8 34 00 00 00       	call   b30 <random>
    for (int i = 0; i < *num_edges; i++) {
     afc:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
     aff:	99                   	cltd   
     b00:	f7 3b                	idivl  (%ebx)
     b02:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
     b04:	e8 27 00 00 00       	call   b30 <random>
        graph[new_edge_u][new_edge_v] = 1;
     b09:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
     b0f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
     b12:	99                   	cltd   
     b13:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
     b15:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
     b18:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
     b1f:	39 30                	cmp    %esi,(%eax)
     b21:	7f d4                	jg     af7 <gen_random_digraph+0xd7>
    }
}
     b23:	83 c4 0c             	add    $0xc,%esp
     b26:	5b                   	pop    %ebx
     b27:	5e                   	pop    %esi
     b28:	5f                   	pop    %edi
     b29:	5d                   	pop    %ebp
     b2a:	c3                   	ret    
     b2b:	66 90                	xchg   %ax,%ax
     b2d:	66 90                	xchg   %ax,%ax
     b2f:	90                   	nop

00000b30 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
     b30:	69 0d 18 17 00 00 0d 	imul   $0x19660d,0x1718,%ecx
     b37:	66 19 00 
     b3a:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
     b3f:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
     b45:	89 c8                	mov    %ecx,%eax
     b47:	f7 ea                	imul   %edx
     b49:	89 d0                	mov    %edx,%eax
     b4b:	89 ca                	mov    %ecx,%edx
     b4d:	c1 fa 1f             	sar    $0x1f,%edx
     b50:	c1 f8 1d             	sar    $0x1d,%eax
     b53:	29 d0                	sub    %edx,%eax
     b55:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
     b5b:	89 c8                	mov    %ecx,%eax
     b5d:	29 d0                	sub    %edx,%eax
     b5f:	a3 18 17 00 00       	mov    %eax,0x1718
    return seed;
     b64:	c3                   	ret    
     b65:	66 90                	xchg   %ax,%ax
     b67:	66 90                	xchg   %ax,%ax
     b69:	66 90                	xchg   %ax,%ax
     b6b:	66 90                	xchg   %ax,%ax
     b6d:	66 90                	xchg   %ax,%ax
     b6f:	90                   	nop

00000b70 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	57                   	push   %edi
     b74:	56                   	push   %esi
     b75:	53                   	push   %ebx
     b76:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     b7c:	83 0c 24 00          	orl    $0x0,(%esp)
     b80:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     b86:	83 0c 24 00          	orl    $0x0,(%esp)
     b8a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
     b90:	6a 00                	push   $0x0
     b92:	ff 75 08             	push   0x8(%ebp)
     b95:	e8 79 f8 ff ff       	call   413 <open>
    if (fp < 0 ) {
     b9a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
     b9d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
     ba3:	85 c0                	test   %eax,%eax
     ba5:	0f 88 99 01 00 00    	js     d44 <permute_line+0x1d4>
     bab:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
     bb1:	31 db                	xor    %ebx,%ebx
     bb3:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
     bb9:	89 f7                	mov    %esi,%edi
     bbb:	89 de                	mov    %ebx,%esi
     bbd:	89 c3                	mov    %eax,%ebx
     bbf:	eb 12                	jmp    bd3 <permute_line+0x63>
     bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     bc8:	83 c7 66             	add    $0x66,%edi
     bcb:	83 fe 64             	cmp    $0x64,%esi
     bce:	74 16                	je     be6 <permute_line+0x76>
        line_idx++;
     bd0:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     bd3:	83 ec 04             	sub    $0x4,%esp
     bd6:	6a 66                	push   $0x66
     bd8:	57                   	push   %edi
     bd9:	53                   	push   %ebx
     bda:	e8 0c f8 ff ff       	call   3eb <read>
     bdf:	83 c4 10             	add    $0x10,%esp
     be2:	85 c0                	test   %eax,%eax
     be4:	7f e2                	jg     bc8 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
     be6:	89 f3                	mov    %esi,%ebx
     be8:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
     bee:	e8 3d ff ff ff       	call   b30 <random>
     bf3:	89 c1                	mov    %eax,%ecx
     bf5:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     bfa:	f7 e9                	imul   %ecx
     bfc:	89 c8                	mov    %ecx,%eax
     bfe:	c1 f8 1f             	sar    $0x1f,%eax
     c01:	c1 fa 05             	sar    $0x5,%edx
     c04:	29 c2                	sub    %eax,%edx
     c06:	6b c2 64             	imul   $0x64,%edx,%eax
     c09:	29 c1                	sub    %eax,%ecx
     c0b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
     c0d:	e8 1e ff ff ff       	call   b30 <random>
     c12:	89 c1                	mov    %eax,%ecx
     c14:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     c19:	f7 e9                	imul   %ecx
     c1b:	89 c8                	mov    %ecx,%eax
     c1d:	c1 f8 1f             	sar    $0x1f,%eax
     c20:	c1 fa 05             	sar    $0x5,%edx
     c23:	29 c2                	sub    %eax,%edx
     c25:	6b c2 64             	imul   $0x64,%edx,%eax
     c28:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
     c2a:	39 cf                	cmp    %ecx,%edi
     c2c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
     c32:	74 5f                	je     c93 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
     c34:	6b c7 66             	imul   $0x66,%edi,%eax
     c37:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
     c3d:	83 ec 08             	sub    $0x8,%esp
     c40:	01 c1                	add    %eax,%ecx
     c42:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     c48:	51                   	push   %ecx
     c49:	50                   	push   %eax
     c4a:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
     c50:	e8 2b f5 ff ff       	call   180 <strcpy>
        strcpy(lines[line1], lines[line2]);
     c55:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
     c5b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
     c61:	6b d2 66             	imul   $0x66,%edx,%edx
     c64:	01 c2                	add    %eax,%edx
     c66:	58                   	pop    %eax
     c67:	59                   	pop    %ecx
     c68:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
     c6e:	52                   	push   %edx
     c6f:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
     c75:	51                   	push   %ecx
     c76:	e8 05 f5 ff ff       	call   180 <strcpy>
        strcpy(lines[line2], temp);
     c7b:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
     c81:	5f                   	pop    %edi
     c82:	58                   	pop    %eax
     c83:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     c89:	50                   	push   %eax
     c8a:	52                   	push   %edx
     c8b:	e8 f0 f4 ff ff       	call   180 <strcpy>
     c90:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
     c93:	83 ec 0c             	sub    $0xc,%esp
     c96:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
     c9c:	e8 5a f7 ff ff       	call   3fb <close>
    fp = open(file_path, O_RDWR);
     ca1:	58                   	pop    %eax
     ca2:	5a                   	pop    %edx
     ca3:	6a 02                	push   $0x2
     ca5:	ff 75 08             	push   0x8(%ebp)
     ca8:	e8 66 f7 ff ff       	call   413 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
     cad:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
     cae:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
     cb0:	58                   	pop    %eax
     cb1:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     cb7:	50                   	push   %eax
     cb8:	57                   	push   %edi
     cb9:	e8 6d f7 ff ff       	call   42b <fstat>
    char *buffer = malloc(0);
     cbe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cc5:	e8 96 fa ff ff       	call   760 <malloc>
    memset(buffer, 0, 0);  
     cca:	83 c4 0c             	add    $0xc,%esp
     ccd:	6a 00                	push   $0x0
     ccf:	6a 00                	push   $0x0
     cd1:	50                   	push   %eax
     cd2:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
     cd8:	e8 63 f5 ff ff       	call   240 <memset>
    write(fp, buffer, 0);
     cdd:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
     ce3:	83 c4 0c             	add    $0xc,%esp
     ce6:	6a 00                	push   $0x0
     ce8:	52                   	push   %edx
     ce9:	57                   	push   %edi
     cea:	e8 04 f7 ff ff       	call   3f3 <write>
    free(buffer);
     cef:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
     cf5:	89 14 24             	mov    %edx,(%esp)
     cf8:	e8 d3 f9 ff ff       	call   6d0 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
     cfd:	83 c4 10             	add    $0x10,%esp
     d00:	85 ff                	test   %edi,%edi
     d02:	78 59                	js     d5d <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
     d04:	85 db                	test   %ebx,%ebx
     d06:	74 26                	je     d2e <permute_line+0x1be>
     d08:	6b db 66             	imul   $0x66,%ebx,%ebx
     d0b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
     d11:	01 c3                	add    %eax,%ebx
     d13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d17:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
     d18:	83 ec 04             	sub    $0x4,%esp
     d1b:	6a 66                	push   $0x66
     d1d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
     d1e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
     d21:	57                   	push   %edi
     d22:	e8 cc f6 ff ff       	call   3f3 <write>
    for (int i = 0; i < line_idx; i++) {
     d27:	83 c4 10             	add    $0x10,%esp
     d2a:	39 de                	cmp    %ebx,%esi
     d2c:	75 ea                	jne    d18 <permute_line+0x1a8>
    }

    close(fp);
     d2e:	83 ec 0c             	sub    $0xc,%esp
     d31:	57                   	push   %edi
     d32:	e8 c4 f6 ff ff       	call   3fb <close>
    return 0;
     d37:	83 c4 10             	add    $0x10,%esp
     d3a:	31 c0                	xor    %eax,%eax
     d3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d3f:	5b                   	pop    %ebx
     d40:	5e                   	pop    %esi
     d41:	5f                   	pop    %edi
     d42:	5d                   	pop    %ebp
     d43:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
     d44:	83 ec 08             	sub    $0x8,%esp
     d47:	68 14 11 00 00       	push   $0x1114
     d4c:	6a 01                	push   $0x1
     d4e:	e8 dd f7 ff ff       	call   530 <printf>
        return -1;
     d53:	83 c4 10             	add    $0x10,%esp
     d56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     d5b:	eb df                	jmp    d3c <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
     d5d:	83 ec 08             	sub    $0x8,%esp
     d60:	68 5c 11 00 00       	push   $0x115c
     d65:	6a 01                	push   $0x1
     d67:	e8 c4 f7 ff ff       	call   530 <printf>
        return -1;
     d6c:	83 c4 10             	add    $0x10,%esp
     d6f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     d74:	eb c6                	jmp    d3c <permute_line+0x1cc>
     d76:	66 90                	xchg   %ax,%ax
     d78:	66 90                	xchg   %ax,%ax
     d7a:	66 90                	xchg   %ax,%ax
     d7c:	66 90                	xchg   %ax,%ax
     d7e:	66 90                	xchg   %ax,%ax

00000d80 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	56                   	push   %esi
     d85:	53                   	push   %ebx
     d86:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     d8c:	83 0c 24 00          	orl    $0x0,(%esp)
     d90:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     d96:	83 0c 24 00          	orl    $0x0,(%esp)
     d9a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
     da0:	6a 00                	push   $0x0
     da2:	ff 75 08             	push   0x8(%ebp)
     da5:	e8 69 f6 ff ff       	call   413 <open>
    if (fp < 0) {
     daa:	83 c4 10             	add    $0x10,%esp
     dad:	85 c0                	test   %eax,%eax
     daf:	0f 88 b1 00 00 00    	js     e66 <add_line+0xe6>
     db5:	89 c3                	mov    %eax,%ebx
     db7:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
     dbd:	31 f6                	xor    %esi,%esi
     dbf:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
     dc5:	89 c7                	mov    %eax,%edi
     dc7:	eb 12                	jmp    ddb <add_line+0x5b>
     dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     dd0:	83 c7 66             	add    $0x66,%edi
     dd3:	83 fe 64             	cmp    $0x64,%esi
     dd6:	74 1c                	je     df4 <add_line+0x74>
        line_idx++;
     dd8:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     ddb:	83 ec 04             	sub    $0x4,%esp
     dde:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
     de4:	6a 66                	push   $0x66
     de6:	57                   	push   %edi
     de7:	53                   	push   %ebx
     de8:	e8 fe f5 ff ff       	call   3eb <read>
     ded:	83 c4 10             	add    $0x10,%esp
     df0:	85 c0                	test   %eax,%eax
     df2:	7f dc                	jg     dd0 <add_line+0x50>
    }
    close(fp); 
     df4:	83 ec 0c             	sub    $0xc,%esp
     df7:	53                   	push   %ebx
     df8:	e8 fe f5 ff ff       	call   3fb <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
     dfd:	58                   	pop    %eax
     dfe:	5a                   	pop    %edx
     dff:	ff 75 0c             	push   0xc(%ebp)
     e02:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
     e08:	e8 73 f3 ff ff       	call   180 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
     e0d:	59                   	pop    %ecx
     e0e:	5b                   	pop    %ebx
     e0f:	6a 01                	push   $0x1
     e11:	ff 75 08             	push   0x8(%ebp)
     e14:	e8 fa f5 ff ff       	call   413 <open>
    if (fp < 0) {
     e19:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
     e1c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
     e1e:	85 c0                	test   %eax,%eax
     e20:	78 5d                	js     e7f <add_line+0xff>
     e22:	6b ce 66             	imul   $0x66,%esi,%ecx
     e25:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
     e2b:	8d 78 66             	lea    0x66(%eax),%edi
     e2e:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
     e31:	eb 08                	jmp    e3b <add_line+0xbb>
     e33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e37:	90                   	nop
     e38:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
     e3b:	83 ec 04             	sub    $0x4,%esp
     e3e:	6a 66                	push   $0x66
     e40:	50                   	push   %eax
     e41:	53                   	push   %ebx
     e42:	e8 ac f5 ff ff       	call   3f3 <write>
    for (int i = 0; i < line_idx; i++) {
     e47:	89 f8                	mov    %edi,%eax
     e49:	83 c4 10             	add    $0x10,%esp
     e4c:	39 f7                	cmp    %esi,%edi
     e4e:	75 e8                	jne    e38 <add_line+0xb8>
    }

    close(fp);
     e50:	83 ec 0c             	sub    $0xc,%esp
     e53:	53                   	push   %ebx
     e54:	e8 a2 f5 ff ff       	call   3fb <close>
    return 0;
     e59:	83 c4 10             	add    $0x10,%esp
     e5c:	31 c0                	xor    %eax,%eax
}
     e5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e61:	5b                   	pop    %ebx
     e62:	5e                   	pop    %esi
     e63:	5f                   	pop    %edi
     e64:	5d                   	pop    %ebp
     e65:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
     e66:	83 ec 08             	sub    $0x8,%esp
     e69:	68 98 11 00 00       	push   $0x1198
     e6e:	6a 01                	push   $0x1
     e70:	e8 bb f6 ff ff       	call   530 <printf>
        return -1;
     e75:	83 c4 10             	add    $0x10,%esp
     e78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e7d:	eb df                	jmp    e5e <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
     e7f:	83 ec 08             	sub    $0x8,%esp
     e82:	68 bc 11 00 00       	push   $0x11bc
     e87:	6a 01                	push   $0x1
     e89:	e8 a2 f6 ff ff       	call   530 <printf>
        return -1;
     e8e:	83 c4 10             	add    $0x10,%esp
     e91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e96:	eb c6                	jmp    e5e <add_line+0xde>
     e98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e9f:	90                   	nop

00000ea0 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	57                   	push   %edi
     ea4:	56                   	push   %esi
     ea5:	53                   	push   %ebx
     ea6:	83 ec 0c             	sub    $0xc,%esp
     ea9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     eac:	8d 73 64             	lea    0x64(%ebx),%esi
     eaf:	89 f7                	mov    %esi,%edi
     eb1:	8b 75 0c             	mov    0xc(%ebp),%esi
     eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
     eb8:	e8 73 fc ff ff       	call   b30 <random>
     ebd:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     ebf:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
     ec2:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
     ec5:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
     ec9:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     ecc:	39 fb                	cmp    %edi,%ebx
     ece:	75 e8                	jne    eb8 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
     ed0:	8b 45 08             	mov    0x8(%ebp),%eax
     ed3:	ba 0a 00 00 00       	mov    $0xa,%edx
     ed8:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
     edc:	83 c4 0c             	add    $0xc,%esp
     edf:	5b                   	pop    %ebx
     ee0:	5e                   	pop    %esi
     ee1:	5f                   	pop    %edi
     ee2:	5d                   	pop    %ebp
     ee3:	c3                   	ret    
     ee4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eeb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     eef:	90                   	nop

00000ef0 <write_random_string>:

int write_random_string(char file_path[]) {
     ef0:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
     ef1:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
     ef6:	89 e5                	mov    %esp,%ebp
     ef8:	57                   	push   %edi
     ef9:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
     efa:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
     f00:	be e0 11 00 00       	mov    $0x11e0,%esi
int write_random_string(char file_path[]) {
     f05:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
     f06:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
     f0b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
     f11:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     f13:	0f b7 06             	movzwl (%esi),%eax
     f16:	8d 75 e6             	lea    -0x1a(%ebp),%esi
     f19:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     f1c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
     f1f:	90                   	nop
        int idx_new_char = random() % size_char_set;
     f20:	e8 0b fc ff ff       	call   b30 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     f25:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
     f28:	89 c1                	mov    %eax,%ecx
     f2a:	f7 e3                	mul    %ebx
     f2c:	c1 ea 06             	shr    $0x6,%edx
     f2f:	6b d2 55             	imul   $0x55,%edx,%edx
     f32:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
     f34:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
     f3b:	ff 
     f3c:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
     f3f:	39 f7                	cmp    %esi,%edi
     f41:	75 dd                	jne    f20 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
     f43:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
     f48:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
     f4b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
     f4f:	8d 45 82             	lea    -0x7e(%ebp),%eax
     f52:	50                   	push   %eax
     f53:	ff 75 08             	push   0x8(%ebp)
     f56:	e8 25 fe ff ff       	call   d80 <add_line>

    return 0;
}
     f5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f5e:	31 c0                	xor    %eax,%eax
     f60:	5b                   	pop    %ebx
     f61:	5e                   	pop    %esi
     f62:	5f                   	pop    %edi
     f63:	5d                   	pop    %ebp
     f64:	c3                   	ret    
     f65:	66 90                	xchg   %ax,%ax
     f67:	66 90                	xchg   %ax,%ax
     f69:	66 90                	xchg   %ax,%ax
     f6b:	66 90                	xchg   %ax,%ax
     f6d:	66 90                	xchg   %ax,%ax
     f6f:	90                   	nop

00000f70 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	56                   	push   %esi
     f74:	8b 75 08             	mov    0x8(%ebp),%esi
     f77:	53                   	push   %ebx
     f78:	bb 64 00 00 00       	mov    $0x64,%ebx
     f7d:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
     f80:	83 ec 0c             	sub    $0xc,%esp
     f83:	56                   	push   %esi
     f84:	e8 67 ff ff ff       	call   ef0 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
     f89:	83 c4 10             	add    $0x10,%esp
     f8c:	83 eb 01             	sub    $0x1,%ebx
     f8f:	75 ef                	jne    f80 <io_bound+0x10>
     f91:	bb 32 00 00 00       	mov    $0x32,%ebx
     f96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f9d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
     fa0:	83 ec 0c             	sub    $0xc,%esp
     fa3:	56                   	push   %esi
     fa4:	e8 c7 fb ff ff       	call   b70 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
     fa9:	83 c4 10             	add    $0x10,%esp
     fac:	83 eb 01             	sub    $0x1,%ebx
     faf:	75 ef                	jne    fa0 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
     fb1:	83 ec 0c             	sub    $0xc,%esp
     fb4:	56                   	push   %esi
     fb5:	e8 69 f4 ff ff       	call   423 <unlink>
     fba:	83 c4 10             	add    $0x10,%esp
     fbd:	85 c0                	test   %eax,%eax
     fbf:	75 07                	jne    fc8 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
     fc1:	8d 65 f8             	lea    -0x8(%ebp),%esp
     fc4:	5b                   	pop    %ebx
     fc5:	5e                   	pop    %esi
     fc6:	5d                   	pop    %ebp
     fc7:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
     fc8:	83 ec 08             	sub    $0x8,%esp
     fcb:	68 38 12 00 00       	push   $0x1238
     fd0:	6a 01                	push   $0x1
     fd2:	e8 59 f5 ff ff       	call   530 <printf>
     fd7:	83 c4 10             	add    $0x10,%esp
     fda:	8d 65 f8             	lea    -0x8(%ebp),%esp
     fdd:	5b                   	pop    %ebx
     fde:	5e                   	pop    %esi
     fdf:	5d                   	pop    %ebp
     fe0:	c3                   	ret    
     fe1:	66 90                	xchg   %ax,%ax
     fe3:	66 90                	xchg   %ax,%ax
     fe5:	66 90                	xchg   %ax,%ax
     fe7:	66 90                	xchg   %ax,%ax
     fe9:	66 90                	xchg   %ax,%ax
     feb:	66 90                	xchg   %ax,%ax
     fed:	66 90                	xchg   %ax,%ax
     fef:	90                   	nop

00000ff0 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	57                   	push   %edi
     ff4:	56                   	push   %esi
     ff5:	53                   	push   %ebx
     ff6:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
     ffd:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    1003:	83 0c 24 00          	orl    $0x0,(%esp)
    1007:	39 c4                	cmp    %eax,%esp
    1009:	75 f2                	jne    ffd <cpu_bound+0xd>
    100b:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
    1011:	be e8 03 00 00       	mov    $0x3e8,%esi
    1016:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
    101c:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
    1022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
    1028:	83 ec 04             	sub    $0x4,%esp
    102b:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
    1031:	57                   	push   %edi
    1032:	50                   	push   %eax
    1033:	53                   	push   %ebx
    1034:	e8 e7 f9 ff ff       	call   a20 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
    1039:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
    103f:	89 04 24             	mov    %eax,(%esp)
    1042:	6a 00                	push   $0x0
    1044:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
    104a:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
    1050:	53                   	push   %ebx
    1051:	e8 6a f8 ff ff       	call   8c0 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
    1056:	83 c4 20             	add    $0x20,%esp
    1059:	83 ee 01             	sub    $0x1,%esi
    105c:	75 ca                	jne    1028 <cpu_bound+0x38>
    }
    105e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1061:	5b                   	pop    %ebx
    1062:	5e                   	pop    %esi
    1063:	5f                   	pop    %edi
    1064:	5d                   	pop    %ebp
    1065:	c3                   	ret    
