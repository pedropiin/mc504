
_write-random-string: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
   c:	83 0c 24 00          	orl    $0x0,(%esp)
  10:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  16:	83 0c 24 00          	orl    $0x0,(%esp)
  1a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
  20:	6a 00                	push   $0x0
  22:	ff 75 08             	push   0x8(%ebp)
  25:	e8 59 04 00 00       	call   483 <open>
    if (fp < 0) {
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	85 c0                	test   %eax,%eax
  2f:	0f 88 b1 00 00 00    	js     e6 <add_line+0xe6>
  35:	89 c3                	mov    %eax,%ebx
  37:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
  3d:	31 f6                	xor    %esi,%esi
  3f:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
  45:	89 c7                	mov    %eax,%edi
  47:	eb 12                	jmp    5b <add_line+0x5b>
  49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
  50:	83 c7 66             	add    $0x66,%edi
  53:	83 fe 64             	cmp    $0x64,%esi
  56:	74 1c                	je     74 <add_line+0x74>
        line_idx++;
  58:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
  5b:	83 ec 04             	sub    $0x4,%esp
  5e:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
  64:	6a 66                	push   $0x66
  66:	57                   	push   %edi
  67:	53                   	push   %ebx
  68:	e8 ee 03 00 00       	call   45b <read>
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7f dc                	jg     50 <add_line+0x50>
    }
    close(fp); 
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	53                   	push   %ebx
  78:	e8 ee 03 00 00       	call   46b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
  7d:	58                   	pop    %eax
  7e:	5a                   	pop    %edx
  7f:	ff 75 0c             	push   0xc(%ebp)
  82:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
  88:	e8 63 01 00 00       	call   1f0 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
  8d:	59                   	pop    %ecx
  8e:	5b                   	pop    %ebx
  8f:	6a 01                	push   $0x1
  91:	ff 75 08             	push   0x8(%ebp)
  94:	e8 ea 03 00 00       	call   483 <open>
    if (fp < 0) {
  99:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
  9c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
  9e:	85 c0                	test   %eax,%eax
  a0:	78 5d                	js     ff <add_line+0xff>
  a2:	6b ce 66             	imul   $0x66,%esi,%ecx
  a5:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
  ab:	8d 78 66             	lea    0x66(%eax),%edi
  ae:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
  b1:	eb 08                	jmp    bb <add_line+0xbb>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
  b8:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
  bb:	83 ec 04             	sub    $0x4,%esp
  be:	6a 66                	push   $0x66
  c0:	50                   	push   %eax
  c1:	53                   	push   %ebx
  c2:	e8 9c 03 00 00       	call   463 <write>
    for (int i = 0; i < line_idx; i++) {
  c7:	89 f8                	mov    %edi,%eax
  c9:	83 c4 10             	add    $0x10,%esp
  cc:	39 f7                	cmp    %esi,%edi
  ce:	75 e8                	jne    b8 <add_line+0xb8>
    }

    close(fp);
  d0:	83 ec 0c             	sub    $0xc,%esp
  d3:	53                   	push   %ebx
  d4:	e8 92 03 00 00       	call   46b <close>
    return 0;
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	31 c0                	xor    %eax,%eax
}
  de:	8d 65 f4             	lea    -0xc(%ebp),%esp
  e1:	5b                   	pop    %ebx
  e2:	5e                   	pop    %esi
  e3:	5f                   	pop    %edi
  e4:	5d                   	pop    %ebp
  e5:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
  e6:	83 ec 08             	sub    $0x8,%esp
  e9:	68 e8 0e 00 00       	push   $0xee8
  ee:	6a 01                	push   $0x1
  f0:	e8 ab 04 00 00       	call   5a0 <printf>
        return -1;
  f5:	83 c4 10             	add    $0x10,%esp
  f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  fd:	eb df                	jmp    de <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
  ff:	83 ec 08             	sub    $0x8,%esp
 102:	68 0c 0f 00 00       	push   $0xf0c
 107:	6a 01                	push   $0x1
 109:	e8 92 04 00 00       	call   5a0 <printf>
        return -1;
 10e:	83 c4 10             	add    $0x10,%esp
 111:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 116:	eb c6                	jmp    de <add_line+0xde>
 118:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop

00000120 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	53                   	push   %ebx
 126:	83 ec 0c             	sub    $0xc,%esp
 129:	8b 5d 08             	mov    0x8(%ebp),%ebx
 12c:	8d 73 64             	lea    0x64(%ebx),%esi
 12f:	89 f7                	mov    %esi,%edi
 131:	8b 75 0c             	mov    0xc(%ebp),%esi
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
 138:	e8 63 0a 00 00       	call   ba0 <random>
 13d:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 13f:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
 142:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
 145:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 149:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 14c:	39 fb                	cmp    %edi,%ebx
 14e:	75 e8                	jne    138 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
 150:	8b 45 08             	mov    0x8(%ebp),%eax
 153:	ba 0a 00 00 00       	mov    $0xa,%edx
 158:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
 15c:	83 c4 0c             	add    $0xc,%esp
 15f:	5b                   	pop    %ebx
 160:	5e                   	pop    %esi
 161:	5f                   	pop    %edi
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <write_random_string>:

int write_random_string(char file_path[]) {
 170:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 171:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
 176:	89 e5                	mov    %esp,%ebp
 178:	57                   	push   %edi
 179:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 17a:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
 180:	be 30 0f 00 00       	mov    $0xf30,%esi
int write_random_string(char file_path[]) {
 185:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
 186:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
 18b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
 191:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 193:	0f b7 06             	movzwl (%esi),%eax
 196:	8d 75 e6             	lea    -0x1a(%ebp),%esi
 199:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 19c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
 19f:	90                   	nop
        int idx_new_char = random() % size_char_set;
 1a0:	e8 fb 09 00 00       	call   ba0 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 1a5:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
 1a8:	89 c1                	mov    %eax,%ecx
 1aa:	f7 e3                	mul    %ebx
 1ac:	c1 ea 06             	shr    $0x6,%edx
 1af:	6b d2 55             	imul   $0x55,%edx,%edx
 1b2:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
 1b4:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
 1bb:	ff 
 1bc:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
 1bf:	39 f7                	cmp    %esi,%edi
 1c1:	75 dd                	jne    1a0 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
 1c3:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
 1c8:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
 1cb:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
 1cf:	8d 45 82             	lea    -0x7e(%ebp),%eax
 1d2:	50                   	push   %eax
 1d3:	ff 75 08             	push   0x8(%ebp)
 1d6:	e8 25 fe ff ff       	call   0 <add_line>

    return 0;
}
 1db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1de:	31 c0                	xor    %eax,%eax
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    
 1e5:	66 90                	xchg   %ax,%ax
 1e7:	66 90                	xchg   %ax,%ax
 1e9:	66 90                	xchg   %ax,%ax
 1eb:	66 90                	xchg   %ax,%ax
 1ed:	66 90                	xchg   %ax,%ax
 1ef:	90                   	nop

000001f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f1:	31 c0                	xor    %eax,%eax
{
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	53                   	push   %ebx
 1f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 200:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 204:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 207:	83 c0 01             	add    $0x1,%eax
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strcpy+0x10>
    ;
  return os;
}
 20e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 211:	89 c8                	mov    %ecx,%eax
 213:	c9                   	leave  
 214:	c3                   	ret    
 215:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 55 08             	mov    0x8(%ebp),%edx
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 22a:	0f b6 02             	movzbl (%edx),%eax
 22d:	84 c0                	test   %al,%al
 22f:	75 17                	jne    248 <strcmp+0x28>
 231:	eb 3a                	jmp    26d <strcmp+0x4d>
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 23c:	83 c2 01             	add    $0x1,%edx
 23f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 242:	84 c0                	test   %al,%al
 244:	74 1a                	je     260 <strcmp+0x40>
    p++, q++;
 246:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 248:	0f b6 19             	movzbl (%ecx),%ebx
 24b:	38 c3                	cmp    %al,%bl
 24d:	74 e9                	je     238 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 24f:	29 d8                	sub    %ebx,%eax
}
 251:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 254:	c9                   	leave  
 255:	c3                   	ret    
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 260:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 264:	31 c0                	xor    %eax,%eax
 266:	29 d8                	sub    %ebx,%eax
}
 268:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 26b:	c9                   	leave  
 26c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 26d:	0f b6 19             	movzbl (%ecx),%ebx
 270:	31 c0                	xor    %eax,%eax
 272:	eb db                	jmp    24f <strcmp+0x2f>
 274:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <strlen>:

uint
strlen(const char *s)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 286:	80 3a 00             	cmpb   $0x0,(%edx)
 289:	74 15                	je     2a0 <strlen+0x20>
 28b:	31 c0                	xor    %eax,%eax
 28d:	8d 76 00             	lea    0x0(%esi),%esi
 290:	83 c0 01             	add    $0x1,%eax
 293:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 297:	89 c1                	mov    %eax,%ecx
 299:	75 f5                	jne    290 <strlen+0x10>
    ;
  return n;
}
 29b:	89 c8                	mov    %ecx,%eax
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    
 29f:	90                   	nop
  for(n = 0; s[n]; n++)
 2a0:	31 c9                	xor    %ecx,%ecx
}
 2a2:	5d                   	pop    %ebp
 2a3:	89 c8                	mov    %ecx,%eax
 2a5:	c3                   	ret    
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 d7                	mov    %edx,%edi
 2bf:	fc                   	cld    
 2c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2c5:	89 d0                	mov    %edx,%eax
 2c7:	c9                   	leave  
 2c8:	c3                   	ret    
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2da:	0f b6 10             	movzbl (%eax),%edx
 2dd:	84 d2                	test   %dl,%dl
 2df:	75 12                	jne    2f3 <strchr+0x23>
 2e1:	eb 1d                	jmp    300 <strchr+0x30>
 2e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e7:	90                   	nop
 2e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2ec:	83 c0 01             	add    $0x1,%eax
 2ef:	84 d2                	test   %dl,%dl
 2f1:	74 0d                	je     300 <strchr+0x30>
    if(*s == c)
 2f3:	38 d1                	cmp    %dl,%cl
 2f5:	75 f1                	jne    2e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 300:	31 c0                	xor    %eax,%eax
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
 304:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <gets>:

char*
gets(char *buf, int max)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 315:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 318:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 319:	31 db                	xor    %ebx,%ebx
{
 31b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 31e:	eb 27                	jmp    347 <gets+0x37>
    cc = read(0, &c, 1);
 320:	83 ec 04             	sub    $0x4,%esp
 323:	6a 01                	push   $0x1
 325:	57                   	push   %edi
 326:	6a 00                	push   $0x0
 328:	e8 2e 01 00 00       	call   45b <read>
    if(cc < 1)
 32d:	83 c4 10             	add    $0x10,%esp
 330:	85 c0                	test   %eax,%eax
 332:	7e 1d                	jle    351 <gets+0x41>
      break;
    buf[i++] = c;
 334:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 338:	8b 55 08             	mov    0x8(%ebp),%edx
 33b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 33f:	3c 0a                	cmp    $0xa,%al
 341:	74 1d                	je     360 <gets+0x50>
 343:	3c 0d                	cmp    $0xd,%al
 345:	74 19                	je     360 <gets+0x50>
  for(i=0; i+1 < max; ){
 347:	89 de                	mov    %ebx,%esi
 349:	83 c3 01             	add    $0x1,%ebx
 34c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 34f:	7c cf                	jl     320 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 351:	8b 45 08             	mov    0x8(%ebp),%eax
 354:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 358:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35b:	5b                   	pop    %ebx
 35c:	5e                   	pop    %esi
 35d:	5f                   	pop    %edi
 35e:	5d                   	pop    %ebp
 35f:	c3                   	ret    
  buf[i] = '\0';
 360:	8b 45 08             	mov    0x8(%ebp),%eax
 363:	89 de                	mov    %ebx,%esi
 365:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 369:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36c:	5b                   	pop    %ebx
 36d:	5e                   	pop    %esi
 36e:	5f                   	pop    %edi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <stat>:

int
stat(const char *n, struct stat *st)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	56                   	push   %esi
 384:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 385:	83 ec 08             	sub    $0x8,%esp
 388:	6a 00                	push   $0x0
 38a:	ff 75 08             	push   0x8(%ebp)
 38d:	e8 f1 00 00 00       	call   483 <open>
  if(fd < 0)
 392:	83 c4 10             	add    $0x10,%esp
 395:	85 c0                	test   %eax,%eax
 397:	78 27                	js     3c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 399:	83 ec 08             	sub    $0x8,%esp
 39c:	ff 75 0c             	push   0xc(%ebp)
 39f:	89 c3                	mov    %eax,%ebx
 3a1:	50                   	push   %eax
 3a2:	e8 f4 00 00 00       	call   49b <fstat>
  close(fd);
 3a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3aa:	89 c6                	mov    %eax,%esi
  close(fd);
 3ac:	e8 ba 00 00 00       	call   46b <close>
  return r;
 3b1:	83 c4 10             	add    $0x10,%esp
}
 3b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3c5:	eb ed                	jmp    3b4 <stat+0x34>
 3c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ce:	66 90                	xchg   %ax,%ax

000003d0 <atoi>:

int
atoi(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3d7:	0f be 02             	movsbl (%edx),%eax
 3da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3e5:	77 1e                	ja     405 <atoi+0x35>
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3f0:	83 c2 01             	add    $0x1,%edx
 3f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3fa:	0f be 02             	movsbl (%edx),%eax
 3fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 400:	80 fb 09             	cmp    $0x9,%bl
 403:	76 eb                	jbe    3f0 <atoi+0x20>
  return n;
}
 405:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 408:	89 c8                	mov    %ecx,%eax
 40a:	c9                   	leave  
 40b:	c3                   	ret    
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	8b 45 10             	mov    0x10(%ebp),%eax
 417:	8b 55 08             	mov    0x8(%ebp),%edx
 41a:	56                   	push   %esi
 41b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 41e:	85 c0                	test   %eax,%eax
 420:	7e 13                	jle    435 <memmove+0x25>
 422:	01 d0                	add    %edx,%eax
  dst = vdst;
 424:	89 d7                	mov    %edx,%edi
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 430:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 431:	39 f8                	cmp    %edi,%eax
 433:	75 fb                	jne    430 <memmove+0x20>
  return vdst;
}
 435:	5e                   	pop    %esi
 436:	89 d0                	mov    %edx,%eax
 438:	5f                   	pop    %edi
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    

0000043b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 43b:	b8 01 00 00 00       	mov    $0x1,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <exit>:
SYSCALL(exit)
 443:	b8 02 00 00 00       	mov    $0x2,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <wait>:
SYSCALL(wait)
 44b:	b8 03 00 00 00       	mov    $0x3,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <pipe>:
SYSCALL(pipe)
 453:	b8 04 00 00 00       	mov    $0x4,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <read>:
SYSCALL(read)
 45b:	b8 05 00 00 00       	mov    $0x5,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <write>:
SYSCALL(write)
 463:	b8 10 00 00 00       	mov    $0x10,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <close>:
SYSCALL(close)
 46b:	b8 15 00 00 00       	mov    $0x15,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <kill>:
SYSCALL(kill)
 473:	b8 06 00 00 00       	mov    $0x6,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <exec>:
SYSCALL(exec)
 47b:	b8 07 00 00 00       	mov    $0x7,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <open>:
SYSCALL(open)
 483:	b8 0f 00 00 00       	mov    $0xf,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <mknod>:
SYSCALL(mknod)
 48b:	b8 11 00 00 00       	mov    $0x11,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <unlink>:
SYSCALL(unlink)
 493:	b8 12 00 00 00       	mov    $0x12,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <fstat>:
SYSCALL(fstat)
 49b:	b8 08 00 00 00       	mov    $0x8,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <link>:
SYSCALL(link)
 4a3:	b8 13 00 00 00       	mov    $0x13,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <mkdir>:
SYSCALL(mkdir)
 4ab:	b8 14 00 00 00       	mov    $0x14,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <chdir>:
SYSCALL(chdir)
 4b3:	b8 09 00 00 00       	mov    $0x9,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <dup>:
SYSCALL(dup)
 4bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <getpid>:
SYSCALL(getpid)
 4c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <sbrk>:
SYSCALL(sbrk)
 4cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <sleep>:
SYSCALL(sleep)
 4d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <uptime>:
SYSCALL(uptime)
 4db:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    
 4e3:	66 90                	xchg   %ax,%ax
 4e5:	66 90                	xchg   %ax,%ax
 4e7:	66 90                	xchg   %ax,%ax
 4e9:	66 90                	xchg   %ax,%ax
 4eb:	66 90                	xchg   %ax,%ax
 4ed:	66 90                	xchg   %ax,%ax
 4ef:	90                   	nop

000004f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 3c             	sub    $0x3c,%esp
 4f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4fc:	89 d1                	mov    %edx,%ecx
{
 4fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 501:	85 d2                	test   %edx,%edx
 503:	0f 89 7f 00 00 00    	jns    588 <printint+0x98>
 509:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 50d:	74 79                	je     588 <printint+0x98>
    neg = 1;
 50f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 516:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 518:	31 db                	xor    %ebx,%ebx
 51a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 520:	89 c8                	mov    %ecx,%eax
 522:	31 d2                	xor    %edx,%edx
 524:	89 cf                	mov    %ecx,%edi
 526:	f7 75 c4             	divl   -0x3c(%ebp)
 529:	0f b6 92 e8 0f 00 00 	movzbl 0xfe8(%edx),%edx
 530:	89 45 c0             	mov    %eax,-0x40(%ebp)
 533:	89 d8                	mov    %ebx,%eax
 535:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 538:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 53b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 53e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 541:	76 dd                	jbe    520 <printint+0x30>
  if(neg)
 543:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 546:	85 c9                	test   %ecx,%ecx
 548:	74 0c                	je     556 <printint+0x66>
    buf[i++] = '-';
 54a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 54f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 551:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 556:	8b 7d b8             	mov    -0x48(%ebp),%edi
 559:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 55d:	eb 07                	jmp    566 <printint+0x76>
 55f:	90                   	nop
    putc(fd, buf[i]);
 560:	0f b6 13             	movzbl (%ebx),%edx
 563:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 566:	83 ec 04             	sub    $0x4,%esp
 569:	88 55 d7             	mov    %dl,-0x29(%ebp)
 56c:	6a 01                	push   $0x1
 56e:	56                   	push   %esi
 56f:	57                   	push   %edi
 570:	e8 ee fe ff ff       	call   463 <write>
  while(--i >= 0)
 575:	83 c4 10             	add    $0x10,%esp
 578:	39 de                	cmp    %ebx,%esi
 57a:	75 e4                	jne    560 <printint+0x70>
}
 57c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 588:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 58f:	eb 87                	jmp    518 <printint+0x28>
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 13             	movzbl (%ebx),%edx
 5b2:	84 d2                	test   %dl,%dl
 5b4:	74 6a                	je     620 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5b6:	8d 45 10             	lea    0x10(%ebp),%eax
 5b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c4:	eb 36                	jmp    5fc <printf+0x5c>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
 5d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	74 15                	je     5f2 <printf+0x52>
  write(fd, &c, 1);
 5dd:	83 ec 04             	sub    $0x4,%esp
 5e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5e3:	6a 01                	push   $0x1
 5e5:	57                   	push   %edi
 5e6:	56                   	push   %esi
 5e7:	e8 77 fe ff ff       	call   463 <write>
 5ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5f2:	0f b6 13             	movzbl (%ebx),%edx
 5f5:	83 c3 01             	add    $0x1,%ebx
 5f8:	84 d2                	test   %dl,%dl
 5fa:	74 24                	je     620 <printf+0x80>
    c = fmt[i] & 0xff;
 5fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5ff:	85 c9                	test   %ecx,%ecx
 601:	74 cd                	je     5d0 <printf+0x30>
      }
    } else if(state == '%'){
 603:	83 f9 25             	cmp    $0x25,%ecx
 606:	75 ea                	jne    5f2 <printf+0x52>
      if(c == 'd'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	0f 84 07 01 00 00    	je     718 <printf+0x178>
 611:	83 e8 63             	sub    $0x63,%eax
 614:	83 f8 15             	cmp    $0x15,%eax
 617:	77 17                	ja     630 <printf+0x90>
 619:	ff 24 85 90 0f 00 00 	jmp    *0xf90(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 620:	8d 65 f4             	lea    -0xc(%ebp),%esp
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret    
 628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 636:	6a 01                	push   $0x1
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63e:	e8 20 fe ff ff       	call   463 <write>
        putc(fd, c);
 643:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 647:	83 c4 0c             	add    $0xc,%esp
 64a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 64d:	6a 01                	push   $0x1
 64f:	57                   	push   %edi
 650:	56                   	push   %esi
 651:	e8 0d fe ff ff       	call   463 <write>
        putc(fd, c);
 656:	83 c4 10             	add    $0x10,%esp
      state = 0;
 659:	31 c9                	xor    %ecx,%ecx
 65b:	eb 95                	jmp    5f2 <printf+0x52>
 65d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
 668:	6a 00                	push   $0x0
 66a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 66d:	8b 10                	mov    (%eax),%edx
 66f:	89 f0                	mov    %esi,%eax
 671:	e8 7a fe ff ff       	call   4f0 <printint>
        ap++;
 676:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 67a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67d:	31 c9                	xor    %ecx,%ecx
 67f:	e9 6e ff ff ff       	jmp    5f2 <printf+0x52>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 688:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68b:	8b 10                	mov    (%eax),%edx
        ap++;
 68d:	83 c0 04             	add    $0x4,%eax
 690:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 693:	85 d2                	test   %edx,%edx
 695:	0f 84 8d 00 00 00    	je     728 <printf+0x188>
        while(*s != 0){
 69b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 69e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6a0:	84 c0                	test   %al,%al
 6a2:	0f 84 4a ff ff ff    	je     5f2 <printf+0x52>
 6a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6ab:	89 d3                	mov    %edx,%ebx
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6b3:	83 c3 01             	add    $0x1,%ebx
 6b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	57                   	push   %edi
 6bc:	56                   	push   %esi
 6bd:	e8 a1 fd ff ff       	call   463 <write>
        while(*s != 0){
 6c2:	0f b6 03             	movzbl (%ebx),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x110>
      state = 0;
 6cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6cf:	31 c9                	xor    %ecx,%ecx
 6d1:	e9 1c ff ff ff       	jmp    5f2 <printf+0x52>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	e9 7b ff ff ff       	jmp    66a <printf+0xca>
 6ef:	90                   	nop
        putc(fd, *ap);
 6f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
 6fa:	57                   	push   %edi
 6fb:	56                   	push   %esi
        putc(fd, *ap);
 6fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6ff:	e8 5f fd ff ff       	call   463 <write>
        ap++;
 704:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 708:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70b:	31 c9                	xor    %ecx,%ecx
 70d:	e9 e0 fe ff ff       	jmp    5f2 <printf+0x52>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 718:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 71b:	83 ec 04             	sub    $0x4,%esp
 71e:	e9 2a ff ff ff       	jmp    64d <printf+0xad>
 723:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 727:	90                   	nop
          s = "(null)";
 728:	ba 86 0f 00 00       	mov    $0xf86,%edx
        while(*s != 0){
 72d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 730:	b8 28 00 00 00       	mov    $0x28,%eax
 735:	89 d3                	mov    %edx,%ebx
 737:	e9 74 ff ff ff       	jmp    6b0 <printf+0x110>
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 00 15 00 00       	mov    0x1500,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 758:	89 c2                	mov    %eax,%edx
 75a:	8b 00                	mov    (%eax),%eax
 75c:	39 ca                	cmp    %ecx,%edx
 75e:	73 30                	jae    790 <free+0x50>
 760:	39 c1                	cmp    %eax,%ecx
 762:	72 04                	jb     768 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 764:	39 c2                	cmp    %eax,%edx
 766:	72 f0                	jb     758 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76e:	39 f8                	cmp    %edi,%eax
 770:	74 30                	je     7a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 772:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 775:	8b 42 04             	mov    0x4(%edx),%eax
 778:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 77b:	39 f1                	cmp    %esi,%ecx
 77d:	74 3a                	je     7b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 77f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 781:	5b                   	pop    %ebx
  freep = p;
 782:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret    
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 c2                	cmp    %eax,%edx
 792:	72 c4                	jb     758 <free+0x18>
 794:	39 c1                	cmp    %eax,%ecx
 796:	73 c0                	jae    758 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 f8                	cmp    %edi,%eax
 7a0:	75 d0                	jne    772 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7a2:	03 70 04             	add    0x4(%eax),%esi
 7a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a8:	8b 02                	mov    (%edx),%eax
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7af:	8b 42 04             	mov    0x4(%edx),%eax
 7b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7b5:	39 f1                	cmp    %esi,%ecx
 7b7:	75 c6                	jne    77f <free+0x3f>
    p->s.size += bp->s.size;
 7b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7bc:	89 15 00 15 00 00    	mov    %edx,0x1500
    p->s.size += bp->s.size;
 7c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7c8:	89 0a                	mov    %ecx,(%edx)
}
 7ca:	5b                   	pop    %ebx
 7cb:	5e                   	pop    %esi
 7cc:	5f                   	pop    %edi
 7cd:	5d                   	pop    %ebp
 7ce:	c3                   	ret    
 7cf:	90                   	nop

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 3d 00 15 00 00    	mov    0x1500,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 70 07             	lea    0x7(%eax),%esi
 7e5:	c1 ee 03             	shr    $0x3,%esi
 7e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7eb:	85 ff                	test   %edi,%edi
 7ed:	0f 84 9d 00 00 00    	je     890 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7f8:	39 f1                	cmp    %esi,%ecx
 7fa:	73 6a                	jae    866 <malloc+0x96>
 7fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 801:	39 de                	cmp    %ebx,%esi
 803:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 806:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 80d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 810:	eb 17                	jmp    829 <malloc+0x59>
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 818:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 81a:	8b 48 04             	mov    0x4(%eax),%ecx
 81d:	39 f1                	cmp    %esi,%ecx
 81f:	73 4f                	jae    870 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 821:	8b 3d 00 15 00 00    	mov    0x1500,%edi
 827:	89 c2                	mov    %eax,%edx
 829:	39 d7                	cmp    %edx,%edi
 82b:	75 eb                	jne    818 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 82d:	83 ec 0c             	sub    $0xc,%esp
 830:	ff 75 e4             	push   -0x1c(%ebp)
 833:	e8 93 fc ff ff       	call   4cb <sbrk>
  if(p == (char*)-1)
 838:	83 c4 10             	add    $0x10,%esp
 83b:	83 f8 ff             	cmp    $0xffffffff,%eax
 83e:	74 1c                	je     85c <malloc+0x8c>
  hp->s.size = nu;
 840:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 843:	83 ec 0c             	sub    $0xc,%esp
 846:	83 c0 08             	add    $0x8,%eax
 849:	50                   	push   %eax
 84a:	e8 f1 fe ff ff       	call   740 <free>
  return freep;
 84f:	8b 15 00 15 00 00    	mov    0x1500,%edx
      if((p = morecore(nunits)) == 0)
 855:	83 c4 10             	add    $0x10,%esp
 858:	85 d2                	test   %edx,%edx
 85a:	75 bc                	jne    818 <malloc+0x48>
        return 0;
  }
}
 85c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 85f:	31 c0                	xor    %eax,%eax
}
 861:	5b                   	pop    %ebx
 862:	5e                   	pop    %esi
 863:	5f                   	pop    %edi
 864:	5d                   	pop    %ebp
 865:	c3                   	ret    
    if(p->s.size >= nunits){
 866:	89 d0                	mov    %edx,%eax
 868:	89 fa                	mov    %edi,%edx
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 870:	39 ce                	cmp    %ecx,%esi
 872:	74 4c                	je     8c0 <malloc+0xf0>
        p->s.size -= nunits;
 874:	29 f1                	sub    %esi,%ecx
 876:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 87c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 87f:	89 15 00 15 00 00    	mov    %edx,0x1500
}
 885:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 888:	83 c0 08             	add    $0x8,%eax
}
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 00 15 00 00 04 	movl   $0x1504,0x1500
 897:	15 00 00 
    base.s.size = 0;
 89a:	bf 04 15 00 00       	mov    $0x1504,%edi
    base.s.ptr = freep = prevp = &base;
 89f:	c7 05 04 15 00 00 04 	movl   $0x1504,0x1504
 8a6:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8ab:	c7 05 08 15 00 00 00 	movl   $0x0,0x1508
 8b2:	00 00 00 
    if(p->s.size >= nunits){
 8b5:	e9 42 ff ff ff       	jmp    7fc <malloc+0x2c>
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb b9                	jmp    87f <malloc+0xaf>
 8c6:	66 90                	xchg   %ax,%ax
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 04             	sub    $0x4,%esp
 8d9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8dc:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
 8df:	85 db                	test   %ebx,%ebx
 8e1:	7e 3d                	jle    920 <min_distance_vertex+0x50>
    int min_idx = 0;
 8e3:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
 8e5:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
 8e7:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
 8ec:	89 75 f0             	mov    %esi,-0x10(%ebp)
 8ef:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
 8f0:	8b 14 87             	mov    (%edi,%eax,4),%edx
 8f3:	39 ca                	cmp    %ecx,%edx
 8f5:	7d 14                	jge    90b <min_distance_vertex+0x3b>
 8f7:	8b 75 0c             	mov    0xc(%ebp),%esi
 8fa:	8b 34 86             	mov    (%esi,%eax,4),%esi
 8fd:	85 f6                	test   %esi,%esi
 8ff:	8b 75 f0             	mov    -0x10(%ebp),%esi
 902:	0f 44 ca             	cmove  %edx,%ecx
 905:	0f 44 f0             	cmove  %eax,%esi
 908:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
 90b:	83 c0 01             	add    $0x1,%eax
 90e:	39 c3                	cmp    %eax,%ebx
 910:	75 de                	jne    8f0 <min_distance_vertex+0x20>
 912:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
 915:	83 c4 04             	add    $0x4,%esp
 918:	5b                   	pop    %ebx
 919:	89 f0                	mov    %esi,%eax
 91b:	5e                   	pop    %esi
 91c:	5f                   	pop    %edi
 91d:	5d                   	pop    %ebp
 91e:	c3                   	ret    
 91f:	90                   	nop
 920:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
 923:	31 f6                	xor    %esi,%esi
}
 925:	5b                   	pop    %ebx
 926:	89 f0                	mov    %esi,%eax
 928:	5e                   	pop    %esi
 929:	5f                   	pop    %edi
 92a:	5d                   	pop    %ebp
 92b:	c3                   	ret    
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000930 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	57                   	push   %edi
 934:	56                   	push   %esi
 935:	53                   	push   %ebx
 936:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
 939:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
 93c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
 93f:	89 e6                	mov    %esp,%esi
 941:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 948:	8d 41 0f             	lea    0xf(%ecx),%eax
 94b:	89 c2                	mov    %eax,%edx
 94d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 952:	29 c6                	sub    %eax,%esi
 954:	83 e2 f0             	and    $0xfffffff0,%edx
 957:	39 f4                	cmp    %esi,%esp
 959:	74 12                	je     96d <dijkstra+0x3d>
 95b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 961:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 968:	00 
 969:	39 f4                	cmp    %esi,%esp
 96b:	75 ee                	jne    95b <dijkstra+0x2b>
 96d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 973:	29 d4                	sub    %edx,%esp
 975:	85 d2                	test   %edx,%edx
 977:	0f 85 ef 00 00 00    	jne    a6c <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
 97d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
 980:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
 982:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
 985:	8b 45 0c             	mov    0xc(%ebp),%eax
 988:	85 c0                	test   %eax,%eax
 98a:	0f 8e e6 00 00 00    	jle    a76 <dijkstra+0x146>
 990:	89 d8                	mov    %ebx,%eax
 992:	89 fa                	mov    %edi,%edx
 994:	01 d9                	add    %ebx,%ecx
 996:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
 9a0:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
 9a6:	83 c0 04             	add    $0x4,%eax
 9a9:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
 9ac:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
 9b3:	39 c8                	cmp    %ecx,%eax
 9b5:	75 e9                	jne    9a0 <dijkstra+0x70>
    dist[src] = 0;
 9b7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 9bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 9c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
 9c8:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
 9ca:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
 9cf:	31 c0                	xor    %eax,%eax
 9d1:	eb 07                	jmp    9da <dijkstra+0xaa>
 9d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9d7:	90                   	nop
 9d8:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
 9da:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 9dd:	39 ca                	cmp    %ecx,%edx
 9df:	7d 0a                	jge    9eb <dijkstra+0xbb>
 9e1:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 9e5:	0f 44 f0             	cmove  %eax,%esi
 9e8:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
 9eb:	8d 50 01             	lea    0x1(%eax),%edx
 9ee:	39 55 0c             	cmp    %edx,0xc(%ebp)
 9f1:	75 e5                	jne    9d8 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
 9f3:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
 9f6:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
 9fd:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
 a03:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 a06:	75 18                	jne    a20 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
 a08:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 a0b:	8d 56 01             	lea    0x1(%esi),%edx
 a0e:	39 c6                	cmp    %eax,%esi
 a10:	74 52                	je     a64 <dijkstra+0x134>
 a12:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 a15:	eb b1                	jmp    9c8 <dijkstra+0x98>
 a17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a1e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
 a20:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
 a26:	89 5d dc             	mov    %ebx,-0x24(%ebp)
 a29:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
 a2c:	31 d2                	xor    %edx,%edx
 a2e:	eb 02                	jmp    a32 <dijkstra+0x102>
 a30:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
 a32:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
 a35:	85 c9                	test   %ecx,%ecx
 a37:	74 17                	je     a50 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
 a39:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 a3c:	85 db                	test   %ebx,%ebx
 a3e:	75 10                	jne    a50 <dijkstra+0x120>
 a40:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 a43:	03 0b                	add    (%ebx),%ecx
 a45:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 a48:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
 a4b:	7e 03                	jle    a50 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
 a4d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
 a50:	8d 4a 01             	lea    0x1(%edx),%ecx
 a53:	39 c2                	cmp    %eax,%edx
 a55:	75 d9                	jne    a30 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
 a57:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 a5a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 a5d:	8d 56 01             	lea    0x1(%esi),%edx
 a60:	39 c6                	cmp    %eax,%esi
 a62:	75 ae                	jne    a12 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
 a64:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a67:	5b                   	pop    %ebx
 a68:	5e                   	pop    %esi
 a69:	5f                   	pop    %edi
 a6a:	5d                   	pop    %ebp
 a6b:	c3                   	ret    
    int visited[num_vertices];
 a6c:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 a71:	e9 07 ff ff ff       	jmp    97d <dijkstra+0x4d>
    dist[src] = 0;
 a76:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a7f:	5b                   	pop    %ebx
 a80:	5e                   	pop    %esi
 a81:	5f                   	pop    %edi
 a82:	5d                   	pop    %ebp
 a83:	c3                   	ret    
 a84:	66 90                	xchg   %ax,%ax
 a86:	66 90                	xchg   %ax,%ax
 a88:	66 90                	xchg   %ax,%ax
 a8a:	66 90                	xchg   %ax,%ax
 a8c:	66 90                	xchg   %ax,%ax
 a8e:	66 90                	xchg   %ax,%ax

00000a90 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
 a94:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
 a99:	56                   	push   %esi
 a9a:	53                   	push   %ebx
 a9b:	83 ec 0c             	sub    $0xc,%esp
 a9e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 aa1:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
 aa4:	e8 f7 00 00 00       	call   ba0 <random>
 aa9:	89 c1                	mov    %eax,%ecx
 aab:	f7 ef                	imul   %edi
 aad:	89 c8                	mov    %ecx,%eax
 aaf:	c1 f8 1f             	sar    $0x1f,%eax
 ab2:	c1 fa 06             	sar    $0x6,%edx
 ab5:	29 c2                	sub    %eax,%edx
 ab7:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
 abd:	29 c1                	sub    %eax,%ecx
 abf:	83 f9 63             	cmp    $0x63,%ecx
 ac2:	89 ca                	mov    %ecx,%edx
 ac4:	8d 41 64             	lea    0x64(%ecx),%eax
 ac7:	0f 4e d0             	cmovle %eax,%edx
 aca:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
 acc:	e8 cf 00 00 00       	call   ba0 <random>
 ad1:	89 c1                	mov    %eax,%ecx
 ad3:	f7 ef                	imul   %edi
 ad5:	89 c8                	mov    %ecx,%eax
 ad7:	c1 f8 1f             	sar    $0x1f,%eax
 ada:	c1 fa 07             	sar    $0x7,%edx
 add:	29 c2                	sub    %eax,%edx
 adf:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
 ae5:	29 c1                	sub    %eax,%ecx
 ae7:	8d 41 32             	lea    0x32(%ecx),%eax
 aea:	89 ca                	mov    %ecx,%edx
 aec:	83 f9 31             	cmp    $0x31,%ecx
 aef:	0f 4e d0             	cmovle %eax,%edx
 af2:	8b 45 10             	mov    0x10(%ebp),%eax
 af5:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
 af7:	8b 13                	mov    (%ebx),%edx
 af9:	85 d2                	test   %edx,%edx
 afb:	7e 38                	jle    b35 <gen_random_digraph+0xa5>
 afd:	89 f1                	mov    %esi,%ecx
 aff:	31 ff                	xor    %edi,%edi
 b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
 b08:	31 c0                	xor    %eax,%eax
 b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
 b10:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
 b17:	8b 13                	mov    (%ebx),%edx
 b19:	83 c0 01             	add    $0x1,%eax
 b1c:	39 c2                	cmp    %eax,%edx
 b1e:	7f f0                	jg     b10 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
 b20:	83 c7 01             	add    $0x1,%edi
 b23:	81 c1 20 03 00 00    	add    $0x320,%ecx
 b29:	39 fa                	cmp    %edi,%edx
 b2b:	7f db                	jg     b08 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
 b2d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
 b33:	7f 22                	jg     b57 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 b35:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
 b3b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
 b42:	8d 04 86             	lea    (%esi,%eax,4),%eax
 b45:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
 b48:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
 b4e:	05 20 03 00 00       	add    $0x320,%eax
 b53:	39 d0                	cmp    %edx,%eax
 b55:	75 f1                	jne    b48 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
 b57:	8b 45 10             	mov    0x10(%ebp),%eax
 b5a:	31 c9                	xor    %ecx,%ecx
 b5c:	8b 00                	mov    (%eax),%eax
 b5e:	85 c0                	test   %eax,%eax
 b60:	7e 31                	jle    b93 <gen_random_digraph+0x103>
 b62:	89 75 08             	mov    %esi,0x8(%ebp)
 b65:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
 b67:	e8 34 00 00 00       	call   ba0 <random>
    for (int i = 0; i < *num_edges; i++) {
 b6c:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
 b6f:	99                   	cltd   
 b70:	f7 3b                	idivl  (%ebx)
 b72:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
 b74:	e8 27 00 00 00       	call   ba0 <random>
        graph[new_edge_u][new_edge_v] = 1;
 b79:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
 b7f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
 b82:	99                   	cltd   
 b83:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
 b85:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
 b88:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
 b8f:	39 30                	cmp    %esi,(%eax)
 b91:	7f d4                	jg     b67 <gen_random_digraph+0xd7>
    }
}
 b93:	83 c4 0c             	add    $0xc,%esp
 b96:	5b                   	pop    %ebx
 b97:	5e                   	pop    %esi
 b98:	5f                   	pop    %edi
 b99:	5d                   	pop    %ebp
 b9a:	c3                   	ret    
 b9b:	66 90                	xchg   %ax,%ax
 b9d:	66 90                	xchg   %ax,%ax
 b9f:	90                   	nop

00000ba0 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
 ba0:	69 0d fc 14 00 00 0d 	imul   $0x19660d,0x14fc,%ecx
 ba7:	66 19 00 
 baa:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
 baf:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
 bb5:	89 c8                	mov    %ecx,%eax
 bb7:	f7 ea                	imul   %edx
 bb9:	89 d0                	mov    %edx,%eax
 bbb:	89 ca                	mov    %ecx,%edx
 bbd:	c1 fa 1f             	sar    $0x1f,%edx
 bc0:	c1 f8 1d             	sar    $0x1d,%eax
 bc3:	29 d0                	sub    %edx,%eax
 bc5:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
 bcb:	89 c8                	mov    %ecx,%eax
 bcd:	29 d0                	sub    %edx,%eax
 bcf:	a3 fc 14 00 00       	mov    %eax,0x14fc
    return seed;
 bd4:	c3                   	ret    
 bd5:	66 90                	xchg   %ax,%ax
 bd7:	66 90                	xchg   %ax,%ax
 bd9:	66 90                	xchg   %ax,%ax
 bdb:	66 90                	xchg   %ax,%ax
 bdd:	66 90                	xchg   %ax,%ax
 bdf:	90                   	nop

00000be0 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
 be0:	55                   	push   %ebp
 be1:	89 e5                	mov    %esp,%ebp
 be3:	57                   	push   %edi
 be4:	56                   	push   %esi
 be5:	53                   	push   %ebx
 be6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 bec:	83 0c 24 00          	orl    $0x0,(%esp)
 bf0:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 bf6:	83 0c 24 00          	orl    $0x0,(%esp)
 bfa:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
 c00:	6a 00                	push   $0x0
 c02:	ff 75 08             	push   0x8(%ebp)
 c05:	e8 79 f8 ff ff       	call   483 <open>
    if (fp < 0 ) {
 c0a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
 c0d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
 c13:	85 c0                	test   %eax,%eax
 c15:	0f 88 99 01 00 00    	js     db4 <permute_line+0x1d4>
 c1b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
 c21:	31 db                	xor    %ebx,%ebx
 c23:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
 c29:	89 f7                	mov    %esi,%edi
 c2b:	89 de                	mov    %ebx,%esi
 c2d:	89 c3                	mov    %eax,%ebx
 c2f:	eb 12                	jmp    c43 <permute_line+0x63>
 c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 c38:	83 c7 66             	add    $0x66,%edi
 c3b:	83 fe 64             	cmp    $0x64,%esi
 c3e:	74 16                	je     c56 <permute_line+0x76>
        line_idx++;
 c40:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
 c43:	83 ec 04             	sub    $0x4,%esp
 c46:	6a 66                	push   $0x66
 c48:	57                   	push   %edi
 c49:	53                   	push   %ebx
 c4a:	e8 0c f8 ff ff       	call   45b <read>
 c4f:	83 c4 10             	add    $0x10,%esp
 c52:	85 c0                	test   %eax,%eax
 c54:	7f e2                	jg     c38 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
 c56:	89 f3                	mov    %esi,%ebx
 c58:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
 c5e:	e8 3d ff ff ff       	call   ba0 <random>
 c63:	89 c1                	mov    %eax,%ecx
 c65:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 c6a:	f7 e9                	imul   %ecx
 c6c:	89 c8                	mov    %ecx,%eax
 c6e:	c1 f8 1f             	sar    $0x1f,%eax
 c71:	c1 fa 05             	sar    $0x5,%edx
 c74:	29 c2                	sub    %eax,%edx
 c76:	6b c2 64             	imul   $0x64,%edx,%eax
 c79:	29 c1                	sub    %eax,%ecx
 c7b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
 c7d:	e8 1e ff ff ff       	call   ba0 <random>
 c82:	89 c1                	mov    %eax,%ecx
 c84:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 c89:	f7 e9                	imul   %ecx
 c8b:	89 c8                	mov    %ecx,%eax
 c8d:	c1 f8 1f             	sar    $0x1f,%eax
 c90:	c1 fa 05             	sar    $0x5,%edx
 c93:	29 c2                	sub    %eax,%edx
 c95:	6b c2 64             	imul   $0x64,%edx,%eax
 c98:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
 c9a:	39 cf                	cmp    %ecx,%edi
 c9c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
 ca2:	74 5f                	je     d03 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
 ca4:	6b c7 66             	imul   $0x66,%edi,%eax
 ca7:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
 cad:	83 ec 08             	sub    $0x8,%esp
 cb0:	01 c1                	add    %eax,%ecx
 cb2:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 cb8:	51                   	push   %ecx
 cb9:	50                   	push   %eax
 cba:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
 cc0:	e8 2b f5 ff ff       	call   1f0 <strcpy>
        strcpy(lines[line1], lines[line2]);
 cc5:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 ccb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 cd1:	6b d2 66             	imul   $0x66,%edx,%edx
 cd4:	01 c2                	add    %eax,%edx
 cd6:	58                   	pop    %eax
 cd7:	59                   	pop    %ecx
 cd8:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
 cde:	52                   	push   %edx
 cdf:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
 ce5:	51                   	push   %ecx
 ce6:	e8 05 f5 ff ff       	call   1f0 <strcpy>
        strcpy(lines[line2], temp);
 ceb:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
 cf1:	5f                   	pop    %edi
 cf2:	58                   	pop    %eax
 cf3:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 cf9:	50                   	push   %eax
 cfa:	52                   	push   %edx
 cfb:	e8 f0 f4 ff ff       	call   1f0 <strcpy>
 d00:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
 d03:	83 ec 0c             	sub    $0xc,%esp
 d06:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
 d0c:	e8 5a f7 ff ff       	call   46b <close>
    fp = open(file_path, O_RDWR);
 d11:	58                   	pop    %eax
 d12:	5a                   	pop    %edx
 d13:	6a 02                	push   $0x2
 d15:	ff 75 08             	push   0x8(%ebp)
 d18:	e8 66 f7 ff ff       	call   483 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
 d1d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
 d1e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
 d20:	58                   	pop    %eax
 d21:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
 d27:	50                   	push   %eax
 d28:	57                   	push   %edi
 d29:	e8 6d f7 ff ff       	call   49b <fstat>
    char *buffer = malloc(0);
 d2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 d35:	e8 96 fa ff ff       	call   7d0 <malloc>
    memset(buffer, 0, 0);  
 d3a:	83 c4 0c             	add    $0xc,%esp
 d3d:	6a 00                	push   $0x0
 d3f:	6a 00                	push   $0x0
 d41:	50                   	push   %eax
 d42:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
 d48:	e8 63 f5 ff ff       	call   2b0 <memset>
    write(fp, buffer, 0);
 d4d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 d53:	83 c4 0c             	add    $0xc,%esp
 d56:	6a 00                	push   $0x0
 d58:	52                   	push   %edx
 d59:	57                   	push   %edi
 d5a:	e8 04 f7 ff ff       	call   463 <write>
    free(buffer);
 d5f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
 d65:	89 14 24             	mov    %edx,(%esp)
 d68:	e8 d3 f9 ff ff       	call   740 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
 d6d:	83 c4 10             	add    $0x10,%esp
 d70:	85 ff                	test   %edi,%edi
 d72:	78 59                	js     dcd <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
 d74:	85 db                	test   %ebx,%ebx
 d76:	74 26                	je     d9e <permute_line+0x1be>
 d78:	6b db 66             	imul   $0x66,%ebx,%ebx
 d7b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
 d81:	01 c3                	add    %eax,%ebx
 d83:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d87:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
 d88:	83 ec 04             	sub    $0x4,%esp
 d8b:	6a 66                	push   $0x66
 d8d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
 d8e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
 d91:	57                   	push   %edi
 d92:	e8 cc f6 ff ff       	call   463 <write>
    for (int i = 0; i < line_idx; i++) {
 d97:	83 c4 10             	add    $0x10,%esp
 d9a:	39 de                	cmp    %ebx,%esi
 d9c:	75 ea                	jne    d88 <permute_line+0x1a8>
    }

    close(fp);
 d9e:	83 ec 0c             	sub    $0xc,%esp
 da1:	57                   	push   %edi
 da2:	e8 c4 f6 ff ff       	call   46b <close>
    return 0;
 da7:	83 c4 10             	add    $0x10,%esp
 daa:	31 c0                	xor    %eax,%eax
 dac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 daf:	5b                   	pop    %ebx
 db0:	5e                   	pop    %esi
 db1:	5f                   	pop    %edi
 db2:	5d                   	pop    %ebp
 db3:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
 db4:	83 ec 08             	sub    $0x8,%esp
 db7:	68 fc 0f 00 00       	push   $0xffc
 dbc:	6a 01                	push   $0x1
 dbe:	e8 dd f7 ff ff       	call   5a0 <printf>
        return -1;
 dc3:	83 c4 10             	add    $0x10,%esp
 dc6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 dcb:	eb df                	jmp    dac <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
 dcd:	83 ec 08             	sub    $0x8,%esp
 dd0:	68 44 10 00 00       	push   $0x1044
 dd5:	6a 01                	push   $0x1
 dd7:	e8 c4 f7 ff ff       	call   5a0 <printf>
        return -1;
 ddc:	83 c4 10             	add    $0x10,%esp
 ddf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 de4:	eb c6                	jmp    dac <permute_line+0x1cc>
 de6:	66 90                	xchg   %ax,%ax
 de8:	66 90                	xchg   %ax,%ax
 dea:	66 90                	xchg   %ax,%ax
 dec:	66 90                	xchg   %ax,%ax
 dee:	66 90                	xchg   %ax,%ax

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
 e04:	e8 67 f3 ff ff       	call   170 <write_random_string>
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
 e24:	e8 b7 fd ff ff       	call   be0 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
 e29:	83 c4 10             	add    $0x10,%esp
 e2c:	83 eb 01             	sub    $0x1,%ebx
 e2f:	75 ef                	jne    e20 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
 e31:	83 ec 0c             	sub    $0xc,%esp
 e34:	56                   	push   %esi
 e35:	e8 59 f6 ff ff       	call   493 <unlink>
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
 e4b:	68 80 10 00 00       	push   $0x1080
 e50:	6a 01                	push   $0x1
 e52:	e8 49 f7 ff ff       	call   5a0 <printf>
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
 eb4:	e8 d7 fb ff ff       	call   a90 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
 eb9:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
 ebf:	89 04 24             	mov    %eax,(%esp)
 ec2:	6a 00                	push   $0x0
 ec4:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
 eca:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
 ed0:	53                   	push   %ebx
 ed1:	e8 5a fa ff ff       	call   930 <dijkstra>
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
