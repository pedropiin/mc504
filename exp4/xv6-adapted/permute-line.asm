
_permute-line: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
   c:	83 0c 24 00          	orl    $0x0,(%esp)
  10:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  16:	83 0c 24 00          	orl    $0x0,(%esp)
  1a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
  20:	6a 00                	push   $0x0
  22:	ff 75 08             	push   0x8(%ebp)
  25:	e8 79 04 00 00       	call   4a3 <open>
    if (fp < 0 ) {
  2a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
  2d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
  33:	85 c0                	test   %eax,%eax
  35:	0f 88 99 01 00 00    	js     1d4 <permute_line+0x1d4>
  3b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
  41:	31 db                	xor    %ebx,%ebx
  43:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
  49:	89 f7                	mov    %esi,%edi
  4b:	89 de                	mov    %ebx,%esi
  4d:	89 c3                	mov    %eax,%ebx
  4f:	eb 12                	jmp    63 <permute_line+0x63>
  51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
  58:	83 c7 66             	add    $0x66,%edi
  5b:	83 fe 64             	cmp    $0x64,%esi
  5e:	74 16                	je     76 <permute_line+0x76>
        line_idx++;
  60:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
  63:	83 ec 04             	sub    $0x4,%esp
  66:	6a 66                	push   $0x66
  68:	57                   	push   %edi
  69:	53                   	push   %ebx
  6a:	e8 0c 04 00 00       	call   47b <read>
  6f:	83 c4 10             	add    $0x10,%esp
  72:	85 c0                	test   %eax,%eax
  74:	7f e2                	jg     58 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
  76:	89 f3                	mov    %esi,%ebx
  78:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
  7e:	e8 3d 0b 00 00       	call   bc0 <random>
  83:	89 c1                	mov    %eax,%ecx
  85:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
  8a:	f7 e9                	imul   %ecx
  8c:	89 c8                	mov    %ecx,%eax
  8e:	c1 f8 1f             	sar    $0x1f,%eax
  91:	c1 fa 05             	sar    $0x5,%edx
  94:	29 c2                	sub    %eax,%edx
  96:	6b c2 64             	imul   $0x64,%edx,%eax
  99:	29 c1                	sub    %eax,%ecx
  9b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
  9d:	e8 1e 0b 00 00       	call   bc0 <random>
  a2:	89 c1                	mov    %eax,%ecx
  a4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
  a9:	f7 e9                	imul   %ecx
  ab:	89 c8                	mov    %ecx,%eax
  ad:	c1 f8 1f             	sar    $0x1f,%eax
  b0:	c1 fa 05             	sar    $0x5,%edx
  b3:	29 c2                	sub    %eax,%edx
  b5:	6b c2 64             	imul   $0x64,%edx,%eax
  b8:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
  ba:	39 cf                	cmp    %ecx,%edi
  bc:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
  c2:	74 5f                	je     123 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
  c4:	6b c7 66             	imul   $0x66,%edi,%eax
  c7:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	01 c1                	add    %eax,%ecx
  d2:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
  d8:	51                   	push   %ecx
  d9:	50                   	push   %eax
  da:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
  e0:	e8 2b 01 00 00       	call   210 <strcpy>
        strcpy(lines[line1], lines[line2]);
  e5:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
  eb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
  f1:	6b d2 66             	imul   $0x66,%edx,%edx
  f4:	01 c2                	add    %eax,%edx
  f6:	58                   	pop    %eax
  f7:	59                   	pop    %ecx
  f8:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
  fe:	52                   	push   %edx
  ff:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 105:	51                   	push   %ecx
 106:	e8 05 01 00 00       	call   210 <strcpy>
        strcpy(lines[line2], temp);
 10b:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 111:	5f                   	pop    %edi
 112:	58                   	pop    %eax
 113:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 119:	50                   	push   %eax
 11a:	52                   	push   %edx
 11b:	e8 f0 00 00 00       	call   210 <strcpy>
 120:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 12c:	e8 5a 03 00 00       	call   48b <close>
    fp = open(file_path, O_RDWR);
 131:	58                   	pop    %eax
 132:	5a                   	pop    %edx
 133:	6a 02                	push   $0x2
 135:	ff 75 08             	push   0x8(%ebp)
 138:	e8 66 03 00 00       	call   4a3 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 13d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 13e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 140:	58                   	pop    %eax
 141:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 147:	50                   	push   %eax
 148:	57                   	push   %edi
 149:	e8 6d 03 00 00       	call   4bb <fstat>
    char *buffer = malloc(0);
 14e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 155:	e8 96 06 00 00       	call   7f0 <malloc>
    memset(buffer, 0, 0);  
 15a:	83 c4 0c             	add    $0xc,%esp
 15d:	6a 00                	push   $0x0
 15f:	6a 00                	push   $0x0
 161:	50                   	push   %eax
 162:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 168:	e8 63 01 00 00       	call   2d0 <memset>
    write(fp, buffer, 0);
 16d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 173:	83 c4 0c             	add    $0xc,%esp
 176:	6a 00                	push   $0x0
 178:	52                   	push   %edx
 179:	57                   	push   %edi
 17a:	e8 04 03 00 00       	call   483 <write>
    free(buffer);
 17f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 185:	89 14 24             	mov    %edx,(%esp)
 188:	e8 d3 05 00 00       	call   760 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 18d:	83 c4 10             	add    $0x10,%esp
 190:	85 ff                	test   %edi,%edi
 192:	78 59                	js     1ed <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 194:	85 db                	test   %ebx,%ebx
 196:	74 26                	je     1be <permute_line+0x1be>
 198:	6b db 66             	imul   $0x66,%ebx,%ebx
 19b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 1a1:	01 c3                	add    %eax,%ebx
 1a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a7:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	6a 66                	push   $0x66
 1ad:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 1ae:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 1b1:	57                   	push   %edi
 1b2:	e8 cc 02 00 00       	call   483 <write>
    for (int i = 0; i < line_idx; i++) {
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	39 de                	cmp    %ebx,%esi
 1bc:	75 ea                	jne    1a8 <permute_line+0x1a8>
    }

    close(fp);
 1be:	83 ec 0c             	sub    $0xc,%esp
 1c1:	57                   	push   %edi
 1c2:	e8 c4 02 00 00       	call   48b <close>
    return 0;
 1c7:	83 c4 10             	add    $0x10,%esp
 1ca:	31 c0                	xor    %eax,%eax
 1cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cf:	5b                   	pop    %ebx
 1d0:	5e                   	pop    %esi
 1d1:	5f                   	pop    %edi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 1d4:	83 ec 08             	sub    $0x8,%esp
 1d7:	68 e8 0e 00 00       	push   $0xee8
 1dc:	6a 01                	push   $0x1
 1de:	e8 dd 03 00 00       	call   5c0 <printf>
        return -1;
 1e3:	83 c4 10             	add    $0x10,%esp
 1e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1eb:	eb df                	jmp    1cc <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 1ed:	83 ec 08             	sub    $0x8,%esp
 1f0:	68 30 0f 00 00       	push   $0xf30
 1f5:	6a 01                	push   $0x1
 1f7:	e8 c4 03 00 00       	call   5c0 <printf>
        return -1;
 1fc:	83 c4 10             	add    $0x10,%esp
 1ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 204:	eb c6                	jmp    1cc <permute_line+0x1cc>
 206:	66 90                	xchg   %ax,%ax
 208:	66 90                	xchg   %ax,%ax
 20a:	66 90                	xchg   %ax,%ax
 20c:	66 90                	xchg   %ax,%ax
 20e:	66 90                	xchg   %ax,%ax

00000210 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 210:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 211:	31 c0                	xor    %eax,%eax
{
 213:	89 e5                	mov    %esp,%ebp
 215:	53                   	push   %ebx
 216:	8b 4d 08             	mov    0x8(%ebp),%ecx
 219:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 220:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 224:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 227:	83 c0 01             	add    $0x1,%eax
 22a:	84 d2                	test   %dl,%dl
 22c:	75 f2                	jne    220 <strcpy+0x10>
    ;
  return os;
}
 22e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 231:	89 c8                	mov    %ecx,%eax
 233:	c9                   	leave  
 234:	c3                   	ret    
 235:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
 247:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 24a:	0f b6 02             	movzbl (%edx),%eax
 24d:	84 c0                	test   %al,%al
 24f:	75 17                	jne    268 <strcmp+0x28>
 251:	eb 3a                	jmp    28d <strcmp+0x4d>
 253:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 257:	90                   	nop
 258:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 25c:	83 c2 01             	add    $0x1,%edx
 25f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 262:	84 c0                	test   %al,%al
 264:	74 1a                	je     280 <strcmp+0x40>
    p++, q++;
 266:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 268:	0f b6 19             	movzbl (%ecx),%ebx
 26b:	38 c3                	cmp    %al,%bl
 26d:	74 e9                	je     258 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 26f:	29 d8                	sub    %ebx,%eax
}
 271:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 274:	c9                   	leave  
 275:	c3                   	ret    
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 280:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 284:	31 c0                	xor    %eax,%eax
 286:	29 d8                	sub    %ebx,%eax
}
 288:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28b:	c9                   	leave  
 28c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 28d:	0f b6 19             	movzbl (%ecx),%ebx
 290:	31 c0                	xor    %eax,%eax
 292:	eb db                	jmp    26f <strcmp+0x2f>
 294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <strlen>:

uint
strlen(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2a6:	80 3a 00             	cmpb   $0x0,(%edx)
 2a9:	74 15                	je     2c0 <strlen+0x20>
 2ab:	31 c0                	xor    %eax,%eax
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	83 c0 01             	add    $0x1,%eax
 2b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2b7:	89 c1                	mov    %eax,%ecx
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	89 c8                	mov    %ecx,%eax
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    
 2bf:	90                   	nop
  for(n = 0; s[n]; n++)
 2c0:	31 c9                	xor    %ecx,%ecx
}
 2c2:	5d                   	pop    %ebp
 2c3:	89 c8                	mov    %ecx,%eax
 2c5:	c3                   	ret    
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 d7                	mov    %edx,%edi
 2df:	fc                   	cld    
 2e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2e5:	89 d0                	mov    %edx,%eax
 2e7:	c9                   	leave  
 2e8:	c3                   	ret    
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2fa:	0f b6 10             	movzbl (%eax),%edx
 2fd:	84 d2                	test   %dl,%dl
 2ff:	75 12                	jne    313 <strchr+0x23>
 301:	eb 1d                	jmp    320 <strchr+0x30>
 303:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 307:	90                   	nop
 308:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 30c:	83 c0 01             	add    $0x1,%eax
 30f:	84 d2                	test   %dl,%dl
 311:	74 0d                	je     320 <strchr+0x30>
    if(*s == c)
 313:	38 d1                	cmp    %dl,%cl
 315:	75 f1                	jne    308 <strchr+0x18>
      return (char*)s;
  return 0;
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 320:	31 c0                	xor    %eax,%eax
}
 322:	5d                   	pop    %ebp
 323:	c3                   	ret    
 324:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 335:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 338:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 339:	31 db                	xor    %ebx,%ebx
{
 33b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 33e:	eb 27                	jmp    367 <gets+0x37>
    cc = read(0, &c, 1);
 340:	83 ec 04             	sub    $0x4,%esp
 343:	6a 01                	push   $0x1
 345:	57                   	push   %edi
 346:	6a 00                	push   $0x0
 348:	e8 2e 01 00 00       	call   47b <read>
    if(cc < 1)
 34d:	83 c4 10             	add    $0x10,%esp
 350:	85 c0                	test   %eax,%eax
 352:	7e 1d                	jle    371 <gets+0x41>
      break;
    buf[i++] = c;
 354:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 358:	8b 55 08             	mov    0x8(%ebp),%edx
 35b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 35f:	3c 0a                	cmp    $0xa,%al
 361:	74 1d                	je     380 <gets+0x50>
 363:	3c 0d                	cmp    $0xd,%al
 365:	74 19                	je     380 <gets+0x50>
  for(i=0; i+1 < max; ){
 367:	89 de                	mov    %ebx,%esi
 369:	83 c3 01             	add    $0x1,%ebx
 36c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 36f:	7c cf                	jl     340 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 378:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37b:	5b                   	pop    %ebx
 37c:	5e                   	pop    %esi
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    
  buf[i] = '\0';
 380:	8b 45 08             	mov    0x8(%ebp),%eax
 383:	89 de                	mov    %ebx,%esi
 385:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 389:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5f                   	pop    %edi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a5:	83 ec 08             	sub    $0x8,%esp
 3a8:	6a 00                	push   $0x0
 3aa:	ff 75 08             	push   0x8(%ebp)
 3ad:	e8 f1 00 00 00       	call   4a3 <open>
  if(fd < 0)
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	85 c0                	test   %eax,%eax
 3b7:	78 27                	js     3e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3b9:	83 ec 08             	sub    $0x8,%esp
 3bc:	ff 75 0c             	push   0xc(%ebp)
 3bf:	89 c3                	mov    %eax,%ebx
 3c1:	50                   	push   %eax
 3c2:	e8 f4 00 00 00       	call   4bb <fstat>
  close(fd);
 3c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3ca:	89 c6                	mov    %eax,%esi
  close(fd);
 3cc:	e8 ba 00 00 00       	call   48b <close>
  return r;
 3d1:	83 c4 10             	add    $0x10,%esp
}
 3d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d7:	89 f0                	mov    %esi,%eax
 3d9:	5b                   	pop    %ebx
 3da:	5e                   	pop    %esi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e5:	eb ed                	jmp    3d4 <stat+0x34>
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <atoi>:

int
atoi(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3f7:	0f be 02             	movsbl (%edx),%eax
 3fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 400:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 405:	77 1e                	ja     425 <atoi+0x35>
 407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 410:	83 c2 01             	add    $0x1,%edx
 413:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 416:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 41a:	0f be 02             	movsbl (%edx),%eax
 41d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 420:	80 fb 09             	cmp    $0x9,%bl
 423:	76 eb                	jbe    410 <atoi+0x20>
  return n;
}
 425:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 428:	89 c8                	mov    %ecx,%eax
 42a:	c9                   	leave  
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	8b 45 10             	mov    0x10(%ebp),%eax
 437:	8b 55 08             	mov    0x8(%ebp),%edx
 43a:	56                   	push   %esi
 43b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 43e:	85 c0                	test   %eax,%eax
 440:	7e 13                	jle    455 <memmove+0x25>
 442:	01 d0                	add    %edx,%eax
  dst = vdst;
 444:	89 d7                	mov    %edx,%edi
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 450:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 451:	39 f8                	cmp    %edi,%eax
 453:	75 fb                	jne    450 <memmove+0x20>
  return vdst;
}
 455:	5e                   	pop    %esi
 456:	89 d0                	mov    %edx,%eax
 458:	5f                   	pop    %edi
 459:	5d                   	pop    %ebp
 45a:	c3                   	ret    

0000045b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45b:	b8 01 00 00 00       	mov    $0x1,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <exit>:
SYSCALL(exit)
 463:	b8 02 00 00 00       	mov    $0x2,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <wait>:
SYSCALL(wait)
 46b:	b8 03 00 00 00       	mov    $0x3,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <pipe>:
SYSCALL(pipe)
 473:	b8 04 00 00 00       	mov    $0x4,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <read>:
SYSCALL(read)
 47b:	b8 05 00 00 00       	mov    $0x5,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <write>:
SYSCALL(write)
 483:	b8 10 00 00 00       	mov    $0x10,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <close>:
SYSCALL(close)
 48b:	b8 15 00 00 00       	mov    $0x15,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <kill>:
SYSCALL(kill)
 493:	b8 06 00 00 00       	mov    $0x6,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <exec>:
SYSCALL(exec)
 49b:	b8 07 00 00 00       	mov    $0x7,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <open>:
SYSCALL(open)
 4a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <mknod>:
SYSCALL(mknod)
 4ab:	b8 11 00 00 00       	mov    $0x11,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <unlink>:
SYSCALL(unlink)
 4b3:	b8 12 00 00 00       	mov    $0x12,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <fstat>:
SYSCALL(fstat)
 4bb:	b8 08 00 00 00       	mov    $0x8,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <link>:
SYSCALL(link)
 4c3:	b8 13 00 00 00       	mov    $0x13,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <mkdir>:
SYSCALL(mkdir)
 4cb:	b8 14 00 00 00       	mov    $0x14,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <chdir>:
SYSCALL(chdir)
 4d3:	b8 09 00 00 00       	mov    $0x9,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <dup>:
SYSCALL(dup)
 4db:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <getpid>:
SYSCALL(getpid)
 4e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <sbrk>:
SYSCALL(sbrk)
 4eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <sleep>:
SYSCALL(sleep)
 4f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <uptime>:
SYSCALL(uptime)
 4fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    
 503:	66 90                	xchg   %ax,%ax
 505:	66 90                	xchg   %ax,%ax
 507:	66 90                	xchg   %ax,%ax
 509:	66 90                	xchg   %ax,%ax
 50b:	66 90                	xchg   %ax,%ax
 50d:	66 90                	xchg   %ax,%ax
 50f:	90                   	nop

00000510 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 3c             	sub    $0x3c,%esp
 519:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 51c:	89 d1                	mov    %edx,%ecx
{
 51e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 521:	85 d2                	test   %edx,%edx
 523:	0f 89 7f 00 00 00    	jns    5a8 <printint+0x98>
 529:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 52d:	74 79                	je     5a8 <printint+0x98>
    neg = 1;
 52f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 536:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 538:	31 db                	xor    %ebx,%ebx
 53a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 540:	89 c8                	mov    %ecx,%eax
 542:	31 d2                	xor    %edx,%edx
 544:	89 cf                	mov    %ecx,%edi
 546:	f7 75 c4             	divl   -0x3c(%ebp)
 549:	0f b6 92 c8 0f 00 00 	movzbl 0xfc8(%edx),%edx
 550:	89 45 c0             	mov    %eax,-0x40(%ebp)
 553:	89 d8                	mov    %ebx,%eax
 555:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 558:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 55b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 55e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 561:	76 dd                	jbe    540 <printint+0x30>
  if(neg)
 563:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 566:	85 c9                	test   %ecx,%ecx
 568:	74 0c                	je     576 <printint+0x66>
    buf[i++] = '-';
 56a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 56f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 571:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 576:	8b 7d b8             	mov    -0x48(%ebp),%edi
 579:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 57d:	eb 07                	jmp    586 <printint+0x76>
 57f:	90                   	nop
    putc(fd, buf[i]);
 580:	0f b6 13             	movzbl (%ebx),%edx
 583:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 586:	83 ec 04             	sub    $0x4,%esp
 589:	88 55 d7             	mov    %dl,-0x29(%ebp)
 58c:	6a 01                	push   $0x1
 58e:	56                   	push   %esi
 58f:	57                   	push   %edi
 590:	e8 ee fe ff ff       	call   483 <write>
  while(--i >= 0)
 595:	83 c4 10             	add    $0x10,%esp
 598:	39 de                	cmp    %ebx,%esi
 59a:	75 e4                	jne    580 <printint+0x70>
}
 59c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5f                   	pop    %edi
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5af:	eb 87                	jmp    538 <printint+0x28>
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 13             	movzbl (%ebx),%edx
 5d2:	84 d2                	test   %dl,%dl
 5d4:	74 6a                	je     640 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5d6:	8d 45 10             	lea    0x10(%ebp),%eax
 5d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e4:	eb 36                	jmp    61c <printf+0x5c>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	74 15                	je     612 <printf+0x52>
  write(fd, &c, 1);
 5fd:	83 ec 04             	sub    $0x4,%esp
 600:	88 55 e7             	mov    %dl,-0x19(%ebp)
 603:	6a 01                	push   $0x1
 605:	57                   	push   %edi
 606:	56                   	push   %esi
 607:	e8 77 fe ff ff       	call   483 <write>
 60c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 60f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 612:	0f b6 13             	movzbl (%ebx),%edx
 615:	83 c3 01             	add    $0x1,%ebx
 618:	84 d2                	test   %dl,%dl
 61a:	74 24                	je     640 <printf+0x80>
    c = fmt[i] & 0xff;
 61c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 61f:	85 c9                	test   %ecx,%ecx
 621:	74 cd                	je     5f0 <printf+0x30>
      }
    } else if(state == '%'){
 623:	83 f9 25             	cmp    $0x25,%ecx
 626:	75 ea                	jne    612 <printf+0x52>
      if(c == 'd'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 07 01 00 00    	je     738 <printf+0x178>
 631:	83 e8 63             	sub    $0x63,%eax
 634:	83 f8 15             	cmp    $0x15,%eax
 637:	77 17                	ja     650 <printf+0x90>
 639:	ff 24 85 70 0f 00 00 	jmp    *0xf70(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 656:	6a 01                	push   $0x1
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65e:	e8 20 fe ff ff       	call   483 <write>
        putc(fd, c);
 663:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 667:	83 c4 0c             	add    $0xc,%esp
 66a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 66d:	6a 01                	push   $0x1
 66f:	57                   	push   %edi
 670:	56                   	push   %esi
 671:	e8 0d fe ff ff       	call   483 <write>
        putc(fd, c);
 676:	83 c4 10             	add    $0x10,%esp
      state = 0;
 679:	31 c9                	xor    %ecx,%ecx
 67b:	eb 95                	jmp    612 <printf+0x52>
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 10 00 00 00       	mov    $0x10,%ecx
 688:	6a 00                	push   $0x0
 68a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68d:	8b 10                	mov    (%eax),%edx
 68f:	89 f0                	mov    %esi,%eax
 691:	e8 7a fe ff ff       	call   510 <printint>
        ap++;
 696:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 69a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69d:	31 c9                	xor    %ecx,%ecx
 69f:	e9 6e ff ff ff       	jmp    612 <printf+0x52>
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ab:	8b 10                	mov    (%eax),%edx
        ap++;
 6ad:	83 c0 04             	add    $0x4,%eax
 6b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6b3:	85 d2                	test   %edx,%edx
 6b5:	0f 84 8d 00 00 00    	je     748 <printf+0x188>
        while(*s != 0){
 6bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6c0:	84 c0                	test   %al,%al
 6c2:	0f 84 4a ff ff ff    	je     612 <printf+0x52>
 6c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6cb:	89 d3                	mov    %edx,%ebx
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6d3:	83 c3 01             	add    $0x1,%ebx
 6d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	e8 a1 fd ff ff       	call   483 <write>
        while(*s != 0){
 6e2:	0f b6 03             	movzbl (%ebx),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x110>
      state = 0;
 6ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6ef:	31 c9                	xor    %ecx,%ecx
 6f1:	e9 1c ff ff ff       	jmp    612 <printf+0x52>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	e9 7b ff ff ff       	jmp    68a <printf+0xca>
 70f:	90                   	nop
        putc(fd, *ap);
 710:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
 71a:	57                   	push   %edi
 71b:	56                   	push   %esi
        putc(fd, *ap);
 71c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 71f:	e8 5f fd ff ff       	call   483 <write>
        ap++;
 724:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 728:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72b:	31 c9                	xor    %ecx,%ecx
 72d:	e9 e0 fe ff ff       	jmp    612 <printf+0x52>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 738:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 73b:	83 ec 04             	sub    $0x4,%esp
 73e:	e9 2a ff ff ff       	jmp    66d <printf+0xad>
 743:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 747:	90                   	nop
          s = "(null)";
 748:	ba 69 0f 00 00       	mov    $0xf69,%edx
        while(*s != 0){
 74d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 750:	b8 28 00 00 00       	mov    $0x28,%eax
 755:	89 d3                	mov    %edx,%ebx
 757:	e9 74 ff ff ff       	jmp    6d0 <printf+0x110>
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 fc 14 00 00       	mov    0x14fc,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 778:	89 c2                	mov    %eax,%edx
 77a:	8b 00                	mov    (%eax),%eax
 77c:	39 ca                	cmp    %ecx,%edx
 77e:	73 30                	jae    7b0 <free+0x50>
 780:	39 c1                	cmp    %eax,%ecx
 782:	72 04                	jb     788 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	39 c2                	cmp    %eax,%edx
 786:	72 f0                	jb     778 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 f8                	cmp    %edi,%eax
 790:	74 30                	je     7c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 792:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 795:	8b 42 04             	mov    0x4(%edx),%eax
 798:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	74 3a                	je     7d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 79f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7a1:	5b                   	pop    %ebx
  freep = p;
 7a2:	89 15 fc 14 00 00    	mov    %edx,0x14fc
}
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 c2                	cmp    %eax,%edx
 7b2:	72 c4                	jb     778 <free+0x18>
 7b4:	39 c1                	cmp    %eax,%ecx
 7b6:	73 c0                	jae    778 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7be:	39 f8                	cmp    %edi,%eax
 7c0:	75 d0                	jne    792 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7c2:	03 70 04             	add    0x4(%eax),%esi
 7c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c8:	8b 02                	mov    (%edx),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cf:	8b 42 04             	mov    0x4(%edx),%eax
 7d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7d5:	39 f1                	cmp    %esi,%ecx
 7d7:	75 c6                	jne    79f <free+0x3f>
    p->s.size += bp->s.size;
 7d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7dc:	89 15 fc 14 00 00    	mov    %edx,0x14fc
    p->s.size += bp->s.size;
 7e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7e8:	89 0a                	mov    %ecx,(%edx)
}
 7ea:	5b                   	pop    %ebx
 7eb:	5e                   	pop    %esi
 7ec:	5f                   	pop    %edi
 7ed:	5d                   	pop    %ebp
 7ee:	c3                   	ret    
 7ef:	90                   	nop

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 3d fc 14 00 00    	mov    0x14fc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 70 07             	lea    0x7(%eax),%esi
 805:	c1 ee 03             	shr    $0x3,%esi
 808:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 80b:	85 ff                	test   %edi,%edi
 80d:	0f 84 9d 00 00 00    	je     8b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 815:	8b 4a 04             	mov    0x4(%edx),%ecx
 818:	39 f1                	cmp    %esi,%ecx
 81a:	73 6a                	jae    886 <malloc+0x96>
 81c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 821:	39 de                	cmp    %ebx,%esi
 823:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 826:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 830:	eb 17                	jmp    849 <malloc+0x59>
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 83a:	8b 48 04             	mov    0x4(%eax),%ecx
 83d:	39 f1                	cmp    %esi,%ecx
 83f:	73 4f                	jae    890 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	8b 3d fc 14 00 00    	mov    0x14fc,%edi
 847:	89 c2                	mov    %eax,%edx
 849:	39 d7                	cmp    %edx,%edi
 84b:	75 eb                	jne    838 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 84d:	83 ec 0c             	sub    $0xc,%esp
 850:	ff 75 e4             	push   -0x1c(%ebp)
 853:	e8 93 fc ff ff       	call   4eb <sbrk>
  if(p == (char*)-1)
 858:	83 c4 10             	add    $0x10,%esp
 85b:	83 f8 ff             	cmp    $0xffffffff,%eax
 85e:	74 1c                	je     87c <malloc+0x8c>
  hp->s.size = nu;
 860:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	83 c0 08             	add    $0x8,%eax
 869:	50                   	push   %eax
 86a:	e8 f1 fe ff ff       	call   760 <free>
  return freep;
 86f:	8b 15 fc 14 00 00    	mov    0x14fc,%edx
      if((p = morecore(nunits)) == 0)
 875:	83 c4 10             	add    $0x10,%esp
 878:	85 d2                	test   %edx,%edx
 87a:	75 bc                	jne    838 <malloc+0x48>
        return 0;
  }
}
 87c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 87f:	31 c0                	xor    %eax,%eax
}
 881:	5b                   	pop    %ebx
 882:	5e                   	pop    %esi
 883:	5f                   	pop    %edi
 884:	5d                   	pop    %ebp
 885:	c3                   	ret    
    if(p->s.size >= nunits){
 886:	89 d0                	mov    %edx,%eax
 888:	89 fa                	mov    %edi,%edx
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 890:	39 ce                	cmp    %ecx,%esi
 892:	74 4c                	je     8e0 <malloc+0xf0>
        p->s.size -= nunits;
 894:	29 f1                	sub    %esi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 89f:	89 15 fc 14 00 00    	mov    %edx,0x14fc
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 fc 14 00 00 00 	movl   $0x1500,0x14fc
 8b7:	15 00 00 
    base.s.size = 0;
 8ba:	bf 00 15 00 00       	mov    $0x1500,%edi
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 00 15 00 00 00 	movl   $0x1500,0x1500
 8c6:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8cb:	c7 05 04 15 00 00 00 	movl   $0x0,0x1504
 8d2:	00 00 00 
    if(p->s.size >= nunits){
 8d5:	e9 42 ff ff ff       	jmp    81c <malloc+0x2c>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b9                	jmp    89f <malloc+0xaf>
 8e6:	66 90                	xchg   %ax,%ax
 8e8:	66 90                	xchg   %ax,%ax
 8ea:	66 90                	xchg   %ax,%ax
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	57                   	push   %edi
 8f4:	56                   	push   %esi
 8f5:	53                   	push   %ebx
 8f6:	83 ec 04             	sub    $0x4,%esp
 8f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8fc:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 8ff:	85 db                	test   %ebx,%ebx
 901:	7e 3d                	jle    940 <min_distance_vertex+0x50>
    int min_idx = 0;
 903:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 905:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 907:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 90c:	89 75 f0             	mov    %esi,-0x10(%ebp)
 90f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 910:	8b 14 87             	mov    (%edi,%eax,4),%edx
 913:	39 ca                	cmp    %ecx,%edx
 915:	7d 14                	jge    92b <min_distance_vertex+0x3b>
 917:	8b 75 0c             	mov    0xc(%ebp),%esi
 91a:	8b 34 86             	mov    (%esi,%eax,4),%esi
 91d:	85 f6                	test   %esi,%esi
 91f:	8b 75 f0             	mov    -0x10(%ebp),%esi
 922:	0f 44 ca             	cmove  %edx,%ecx
 925:	0f 44 f0             	cmove  %eax,%esi
 928:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 92b:	83 c0 01             	add    $0x1,%eax
 92e:	39 c3                	cmp    %eax,%ebx
 930:	75 de                	jne    910 <min_distance_vertex+0x20>
 932:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 935:	83 c4 04             	add    $0x4,%esp
 938:	5b                   	pop    %ebx
 939:	89 f0                	mov    %esi,%eax
 93b:	5e                   	pop    %esi
 93c:	5f                   	pop    %edi
 93d:	5d                   	pop    %ebp
 93e:	c3                   	ret    
 93f:	90                   	nop
 940:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 943:	31 f6                	xor    %esi,%esi
}
 945:	5b                   	pop    %ebx
 946:	89 f0                	mov    %esi,%eax
 948:	5e                   	pop    %esi
 949:	5f                   	pop    %edi
 94a:	5d                   	pop    %ebp
 94b:	c3                   	ret    
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000950 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 959:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 95c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 95f:	89 e6                	mov    %esp,%esi
 961:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 968:	8d 41 0f             	lea    0xf(%ecx),%eax
 96b:	89 c2                	mov    %eax,%edx
 96d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 972:	29 c6                	sub    %eax,%esi
 974:	83 e2 f0             	and    $0xfffffff0,%edx
 977:	39 f4                	cmp    %esi,%esp
 979:	74 12                	je     98d <dijkstra+0x3d>
 97b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 981:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 988:	00 
 989:	39 f4                	cmp    %esi,%esp
 98b:	75 ee                	jne    97b <dijkstra+0x2b>
 98d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 993:	29 d4                	sub    %edx,%esp
 995:	85 d2                	test   %edx,%edx
 997:	0f 85 ef 00 00 00    	jne    a8c <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 99d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 9a0:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 9a2:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 9a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 9a8:	85 c0                	test   %eax,%eax
 9aa:	0f 8e e6 00 00 00    	jle    a96 <dijkstra+0x146>
 9b0:	89 d8                	mov    %ebx,%eax
 9b2:	89 fa                	mov    %edi,%edx
 9b4:	01 d9                	add    %ebx,%ecx
 9b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9bd:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 9c0:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 9c6:	83 c0 04             	add    $0x4,%eax
 9c9:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 9cc:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 9d3:	39 c8                	cmp    %ecx,%eax
 9d5:	75 e9                	jne    9c0 <dijkstra+0x70>
    dist[src] = 0;
 9d7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 9dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 9e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 9e8:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 9ea:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 9ef:	31 c0                	xor    %eax,%eax
 9f1:	eb 07                	jmp    9fa <dijkstra+0xaa>
 9f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9f7:	90                   	nop
 9f8:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 9fa:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 9fd:	39 ca                	cmp    %ecx,%edx
 9ff:	7d 0a                	jge    a0b <dijkstra+0xbb>
 a01:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 a05:	0f 44 f0             	cmove  %eax,%esi
 a08:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 a0b:	8d 50 01             	lea    0x1(%eax),%edx
 a0e:	39 55 0c             	cmp    %edx,0xc(%ebp)
 a11:	75 e5                	jne    9f8 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 a13:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 a16:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 a1d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 a23:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 a26:	75 18                	jne    a40 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 a28:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 a2b:	8d 56 01             	lea    0x1(%esi),%edx
 a2e:	39 c6                	cmp    %eax,%esi
 a30:	74 52                	je     a84 <dijkstra+0x134>
 a32:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 a35:	eb b1                	jmp    9e8 <dijkstra+0x98>
 a37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 a40:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 a46:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 a49:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 a4c:	31 d2                	xor    %edx,%edx
 a4e:	eb 02                	jmp    a52 <dijkstra+0x102>
 a50:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 a52:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 a55:	85 c9                	test   %ecx,%ecx
 a57:	74 17                	je     a70 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 a59:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 a5c:	85 db                	test   %ebx,%ebx
 a5e:	75 10                	jne    a70 <dijkstra+0x120>
 a60:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 a63:	03 0b                	add    (%ebx),%ecx
 a65:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 a68:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 a6b:	7e 03                	jle    a70 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 a6d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 a70:	8d 4a 01             	lea    0x1(%edx),%ecx
 a73:	39 c2                	cmp    %eax,%edx
 a75:	75 d9                	jne    a50 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 a77:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 a7a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 a7d:	8d 56 01             	lea    0x1(%esi),%edx
 a80:	39 c6                	cmp    %eax,%esi
 a82:	75 ae                	jne    a32 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a87:	5b                   	pop    %ebx
 a88:	5e                   	pop    %esi
 a89:	5f                   	pop    %edi
 a8a:	5d                   	pop    %ebp
 a8b:	c3                   	ret    
    int visited[num_vertices];
 a8c:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 a91:	e9 07 ff ff ff       	jmp    99d <dijkstra+0x4d>
    dist[src] = 0;
 a96:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a9f:	5b                   	pop    %ebx
 aa0:	5e                   	pop    %esi
 aa1:	5f                   	pop    %edi
 aa2:	5d                   	pop    %ebp
 aa3:	c3                   	ret    
 aa4:	66 90                	xchg   %ax,%ax
 aa6:	66 90                	xchg   %ax,%ax
 aa8:	66 90                	xchg   %ax,%ax
 aaa:	66 90                	xchg   %ax,%ax
 aac:	66 90                	xchg   %ax,%ax
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 ab4:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 ab9:	56                   	push   %esi
 aba:	53                   	push   %ebx
 abb:	83 ec 0c             	sub    $0xc,%esp
 abe:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 ac1:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 ac4:	e8 f7 00 00 00       	call   bc0 <random>
 ac9:	89 c1                	mov    %eax,%ecx
 acb:	f7 ef                	imul   %edi
 acd:	89 c8                	mov    %ecx,%eax
 acf:	c1 f8 1f             	sar    $0x1f,%eax
 ad2:	c1 fa 06             	sar    $0x6,%edx
 ad5:	29 c2                	sub    %eax,%edx
 ad7:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 add:	29 c1                	sub    %eax,%ecx
 adf:	83 f9 63             	cmp    $0x63,%ecx
 ae2:	89 ca                	mov    %ecx,%edx
 ae4:	8d 41 64             	lea    0x64(%ecx),%eax
 ae7:	0f 4e d0             	cmovle %eax,%edx
 aea:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 aec:	e8 cf 00 00 00       	call   bc0 <random>
 af1:	89 c1                	mov    %eax,%ecx
 af3:	f7 ef                	imul   %edi
 af5:	89 c8                	mov    %ecx,%eax
 af7:	c1 f8 1f             	sar    $0x1f,%eax
 afa:	c1 fa 07             	sar    $0x7,%edx
 afd:	29 c2                	sub    %eax,%edx
 aff:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 b05:	29 c1                	sub    %eax,%ecx
 b07:	8d 41 32             	lea    0x32(%ecx),%eax
 b0a:	89 ca                	mov    %ecx,%edx
 b0c:	83 f9 31             	cmp    $0x31,%ecx
 b0f:	0f 4e d0             	cmovle %eax,%edx
 b12:	8b 45 10             	mov    0x10(%ebp),%eax
 b15:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 b17:	8b 13                	mov    (%ebx),%edx
 b19:	85 d2                	test   %edx,%edx
 b1b:	7e 38                	jle    b55 <gen_random_digraph+0xa5>
 b1d:	89 f1                	mov    %esi,%ecx
 b1f:	31 ff                	xor    %edi,%edi
 b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 b28:	31 c0                	xor    %eax,%eax
 b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 b30:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 b37:	8b 13                	mov    (%ebx),%edx
 b39:	83 c0 01             	add    $0x1,%eax
 b3c:	39 c2                	cmp    %eax,%edx
 b3e:	7f f0                	jg     b30 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 b40:	83 c7 01             	add    $0x1,%edi
 b43:	81 c1 20 03 00 00    	add    $0x320,%ecx
 b49:	39 fa                	cmp    %edi,%edx
 b4b:	7f db                	jg     b28 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 b4d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 b53:	7f 22                	jg     b77 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 b55:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 b5b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 b62:	8d 04 86             	lea    (%esi,%eax,4),%eax
 b65:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 b68:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 b6e:	05 20 03 00 00       	add    $0x320,%eax
 b73:	39 d0                	cmp    %edx,%eax
 b75:	75 f1                	jne    b68 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 b77:	8b 45 10             	mov    0x10(%ebp),%eax
 b7a:	31 c9                	xor    %ecx,%ecx
 b7c:	8b 00                	mov    (%eax),%eax
 b7e:	85 c0                	test   %eax,%eax
 b80:	7e 31                	jle    bb3 <gen_random_digraph+0x103>
 b82:	89 75 08             	mov    %esi,0x8(%ebp)
 b85:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 b87:	e8 34 00 00 00       	call   bc0 <random>
    for (int i = 0; i < *num_edges; i++) {
 b8c:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 b8f:	99                   	cltd   
 b90:	f7 3b                	idivl  (%ebx)
 b92:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 b94:	e8 27 00 00 00       	call   bc0 <random>
        graph[new_edge_u][new_edge_v] = 1;
 b99:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 b9f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 ba2:	99                   	cltd   
 ba3:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 ba5:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 ba8:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 baf:	39 30                	cmp    %esi,(%eax)
 bb1:	7f d4                	jg     b87 <gen_random_digraph+0xd7>
    }
}
 bb3:	83 c4 0c             	add    $0xc,%esp
 bb6:	5b                   	pop    %ebx
 bb7:	5e                   	pop    %esi
 bb8:	5f                   	pop    %edi
 bb9:	5d                   	pop    %ebp
 bba:	c3                   	ret    
 bbb:	66 90                	xchg   %ax,%ax
 bbd:	66 90                	xchg   %ax,%ax
 bbf:	90                   	nop

00000bc0 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 bc0:	69 0d f8 14 00 00 0d 	imul   $0x19660d,0x14f8,%ecx
 bc7:	66 19 00 
 bca:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 bcf:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 bd5:	89 c8                	mov    %ecx,%eax
 bd7:	f7 ea                	imul   %edx
 bd9:	89 d0                	mov    %edx,%eax
 bdb:	89 ca                	mov    %ecx,%edx
 bdd:	c1 fa 1f             	sar    $0x1f,%edx
 be0:	c1 f8 1d             	sar    $0x1d,%eax
 be3:	29 d0                	sub    %edx,%eax
 be5:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 beb:	89 c8                	mov    %ecx,%eax
 bed:	29 d0                	sub    %edx,%eax
 bef:	a3 f8 14 00 00       	mov    %eax,0x14f8
    return seed;
 bf4:	c3                   	ret    
 bf5:	66 90                	xchg   %ax,%ax
 bf7:	66 90                	xchg   %ax,%ax
 bf9:	66 90                	xchg   %ax,%ax
 bfb:	66 90                	xchg   %ax,%ax
 bfd:	66 90                	xchg   %ax,%ax
 bff:	90                   	nop

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
 c25:	e8 79 f8 ff ff       	call   4a3 <open>
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
 c68:	e8 0e f8 ff ff       	call   47b <read>
 c6d:	83 c4 10             	add    $0x10,%esp
 c70:	85 c0                	test   %eax,%eax
 c72:	7f dc                	jg     c50 <add_line+0x50>
    }
    close(fp); 
 c74:	83 ec 0c             	sub    $0xc,%esp
 c77:	53                   	push   %ebx
 c78:	e8 0e f8 ff ff       	call   48b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
 c7d:	58                   	pop    %eax
 c7e:	5a                   	pop    %edx
 c7f:	ff 75 0c             	push   0xc(%ebp)
 c82:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
 c88:	e8 83 f5 ff ff       	call   210 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
 c8d:	59                   	pop    %ecx
 c8e:	5b                   	pop    %ebx
 c8f:	6a 01                	push   $0x1
 c91:	ff 75 08             	push   0x8(%ebp)
 c94:	e8 0a f8 ff ff       	call   4a3 <open>
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
 cc2:	e8 bc f7 ff ff       	call   483 <write>
    for (int i = 0; i < line_idx; i++) {
 cc7:	89 f8                	mov    %edi,%eax
 cc9:	83 c4 10             	add    $0x10,%esp
 ccc:	39 f7                	cmp    %esi,%edi
 cce:	75 e8                	jne    cb8 <add_line+0xb8>
    }

    close(fp);
 cd0:	83 ec 0c             	sub    $0xc,%esp
 cd3:	53                   	push   %ebx
 cd4:	e8 b2 f7 ff ff       	call   48b <close>
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
 ce9:	68 dc 0f 00 00       	push   $0xfdc
 cee:	6a 01                	push   $0x1
 cf0:	e8 cb f8 ff ff       	call   5c0 <printf>
        return -1;
 cf5:	83 c4 10             	add    $0x10,%esp
 cf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 cfd:	eb df                	jmp    cde <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
 cff:	83 ec 08             	sub    $0x8,%esp
 d02:	68 00 10 00 00       	push   $0x1000
 d07:	6a 01                	push   $0x1
 d09:	e8 b2 f8 ff ff       	call   5c0 <printf>
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
 d38:	e8 83 fe ff ff       	call   bc0 <random>
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
 d80:	be 24 10 00 00       	mov    $0x1024,%esi
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
 da0:	e8 1b fe ff ff       	call   bc0 <random>
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
 e24:	e8 d7 f1 ff ff       	call   0 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
 e29:	83 c4 10             	add    $0x10,%esp
 e2c:	83 eb 01             	sub    $0x1,%ebx
 e2f:	75 ef                	jne    e20 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
 e31:	83 ec 0c             	sub    $0xc,%esp
 e34:	56                   	push   %esi
 e35:	e8 79 f6 ff ff       	call   4b3 <unlink>
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
 e4b:	68 7c 10 00 00       	push   $0x107c
 e50:	6a 01                	push   $0x1
 e52:	e8 69 f7 ff ff       	call   5c0 <printf>
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
 eb4:	e8 f7 fb ff ff       	call   ab0 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 eb9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 ebf:	89 04 24             	mov    %eax,(%esp)
 ec2:	6a 00                	push   $0x0
 ec4:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 eca:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 ed0:	53                   	push   %ebx
 ed1:	e8 7a fa ff ff       	call   950 <dijkstra>
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
