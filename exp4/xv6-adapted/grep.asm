
_grep: formato do arquivo elf32-i386


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
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	83 ec 18             	sub    $0x18,%esp
      14:	8b 01                	mov    (%ecx),%eax
      16:	8b 59 04             	mov    0x4(%ecx),%ebx
      19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
      1c:	83 f8 01             	cmp    $0x1,%eax
      1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
      21:	8b 43 04             	mov    0x4(%ebx),%eax
      24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
      27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
      2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
      30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
      33:	75 2d                	jne    62 <main+0x62>
      35:	eb 6c                	jmp    a3 <main+0xa3>
      37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      3e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
      40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
      43:	83 c6 01             	add    $0x1,%esi
      46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
      49:	50                   	push   %eax
      4a:	ff 75 e0             	push   -0x20(%ebp)
      4d:	e8 7e 01 00 00       	call   1d0 <grep>
    close(fd);
      52:	89 3c 24             	mov    %edi,(%esp)
      55:	e8 91 05 00 00       	call   5eb <close>
  for(i = 2; i < argc; i++){
      5a:	83 c4 10             	add    $0x10,%esp
      5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
      60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
      62:	83 ec 08             	sub    $0x8,%esp
      65:	6a 00                	push   $0x0
      67:	ff 33                	push   (%ebx)
      69:	e8 95 05 00 00       	call   603 <open>
      6e:	83 c4 10             	add    $0x10,%esp
      71:	89 c7                	mov    %eax,%edi
      73:	85 c0                	test   %eax,%eax
      75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
      77:	50                   	push   %eax
      78:	ff 33                	push   (%ebx)
      7a:	68 78 12 00 00       	push   $0x1278
      7f:	6a 01                	push   $0x1
      81:	e8 9a 06 00 00       	call   720 <printf>
      exit();
      86:	e8 38 05 00 00       	call   5c3 <exit>
  }
  exit();
      8b:	e8 33 05 00 00       	call   5c3 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
      90:	51                   	push   %ecx
      91:	51                   	push   %ecx
      92:	68 58 12 00 00       	push   $0x1258
      97:	6a 02                	push   $0x2
      99:	e8 82 06 00 00       	call   720 <printf>
    exit();
      9e:	e8 20 05 00 00       	call   5c3 <exit>
    grep(pattern, 0);
      a3:	52                   	push   %edx
      a4:	52                   	push   %edx
      a5:	6a 00                	push   $0x0
      a7:	50                   	push   %eax
      a8:	e8 23 01 00 00       	call   1d0 <grep>
    exit();
      ad:	e8 11 05 00 00       	call   5c3 <exit>
      b2:	66 90                	xchg   %ax,%ax
      b4:	66 90                	xchg   %ax,%ax
      b6:	66 90                	xchg   %ax,%ax
      b8:	66 90                	xchg   %ax,%ax
      ba:	66 90                	xchg   %ax,%ax
      bc:	66 90                	xchg   %ax,%ax
      be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
      c0:	55                   	push   %ebp
      c1:	89 e5                	mov    %esp,%ebp
      c3:	57                   	push   %edi
      c4:	56                   	push   %esi
      c5:	53                   	push   %ebx
      c6:	83 ec 0c             	sub    $0xc,%esp
      c9:	8b 75 08             	mov    0x8(%ebp),%esi
      cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
      cf:	0f b6 06             	movzbl (%esi),%eax
      d2:	84 c0                	test   %al,%al
      d4:	75 2d                	jne    103 <matchhere+0x43>
      d6:	e9 7d 00 00 00       	jmp    158 <matchhere+0x98>
      db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      df:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
      e0:	0f b6 0f             	movzbl (%edi),%ecx
  if(re[0] == '$' && re[1] == '\0')
      e3:	80 fb 24             	cmp    $0x24,%bl
      e6:	75 04                	jne    ec <matchhere+0x2c>
      e8:	84 c0                	test   %al,%al
      ea:	74 79                	je     165 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
      ec:	84 c9                	test   %cl,%cl
      ee:	74 58                	je     148 <matchhere+0x88>
      f0:	38 d9                	cmp    %bl,%cl
      f2:	74 05                	je     f9 <matchhere+0x39>
      f4:	80 fb 2e             	cmp    $0x2e,%bl
      f7:	75 4f                	jne    148 <matchhere+0x88>
    return matchhere(re+1, text+1);
      f9:	83 c7 01             	add    $0x1,%edi
      fc:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
      ff:	84 c0                	test   %al,%al
     101:	74 55                	je     158 <matchhere+0x98>
  if(re[1] == '*')
     103:	0f be d8             	movsbl %al,%ebx
     106:	0f b6 46 01          	movzbl 0x1(%esi),%eax
     10a:	3c 2a                	cmp    $0x2a,%al
     10c:	75 d2                	jne    e0 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
     10e:	83 c6 02             	add    $0x2,%esi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
     111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     118:	83 ec 08             	sub    $0x8,%esp
     11b:	57                   	push   %edi
     11c:	56                   	push   %esi
     11d:	e8 9e ff ff ff       	call   c0 <matchhere>
     122:	83 c4 10             	add    $0x10,%esp
     125:	85 c0                	test   %eax,%eax
     127:	75 2f                	jne    158 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
     129:	0f be 17             	movsbl (%edi),%edx
     12c:	84 d2                	test   %dl,%dl
     12e:	74 0c                	je     13c <matchhere+0x7c>
     130:	83 c7 01             	add    $0x1,%edi
     133:	83 fb 2e             	cmp    $0x2e,%ebx
     136:	74 e0                	je     118 <matchhere+0x58>
     138:	39 da                	cmp    %ebx,%edx
     13a:	74 dc                	je     118 <matchhere+0x58>
}
     13c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     13f:	5b                   	pop    %ebx
     140:	5e                   	pop    %esi
     141:	5f                   	pop    %edi
     142:	5d                   	pop    %ebp
     143:	c3                   	ret    
     144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     148:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
     14b:	31 c0                	xor    %eax,%eax
}
     14d:	5b                   	pop    %ebx
     14e:	5e                   	pop    %esi
     14f:	5f                   	pop    %edi
     150:	5d                   	pop    %ebp
     151:	c3                   	ret    
     152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
     15b:	b8 01 00 00 00       	mov    $0x1,%eax
}
     160:	5b                   	pop    %ebx
     161:	5e                   	pop    %esi
     162:	5f                   	pop    %edi
     163:	5d                   	pop    %ebp
     164:	c3                   	ret    
    return *text == '\0';
     165:	31 c0                	xor    %eax,%eax
     167:	84 c9                	test   %cl,%cl
     169:	0f 94 c0             	sete   %al
     16c:	eb ce                	jmp    13c <matchhere+0x7c>
     16e:	66 90                	xchg   %ax,%ax

00000170 <match>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	56                   	push   %esi
     174:	53                   	push   %ebx
     175:	8b 5d 08             	mov    0x8(%ebp),%ebx
     178:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
     17b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
     17e:	75 11                	jne    191 <match+0x21>
     180:	eb 2e                	jmp    1b0 <match+0x40>
     182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
     188:	83 c6 01             	add    $0x1,%esi
     18b:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
     18f:	74 16                	je     1a7 <match+0x37>
    if(matchhere(re, text))
     191:	83 ec 08             	sub    $0x8,%esp
     194:	56                   	push   %esi
     195:	53                   	push   %ebx
     196:	e8 25 ff ff ff       	call   c0 <matchhere>
     19b:	83 c4 10             	add    $0x10,%esp
     19e:	85 c0                	test   %eax,%eax
     1a0:	74 e6                	je     188 <match+0x18>
      return 1;
     1a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
     1a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1aa:	5b                   	pop    %ebx
     1ab:	5e                   	pop    %esi
     1ac:	5d                   	pop    %ebp
     1ad:	c3                   	ret    
     1ae:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
     1b0:	83 c3 01             	add    $0x1,%ebx
     1b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1b9:	5b                   	pop    %ebx
     1ba:	5e                   	pop    %esi
     1bb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
     1bc:	e9 ff fe ff ff       	jmp    c0 <matchhere>
     1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1cf:	90                   	nop

000001d0 <grep>:
{
     1d0:	55                   	push   %ebp
     1d1:	89 e5                	mov    %esp,%ebp
     1d3:	57                   	push   %edi
     1d4:	56                   	push   %esi
     1d5:	53                   	push   %ebx
     1d6:	83 ec 1c             	sub    $0x1c,%esp
     1d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
     1dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
     1e3:	8d 47 01             	lea    0x1(%edi),%eax
     1e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
     1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
     1f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
     1f3:	b8 ff 03 00 00       	mov    $0x3ff,%eax
     1f8:	83 ec 04             	sub    $0x4,%esp
     1fb:	29 c8                	sub    %ecx,%eax
     1fd:	50                   	push   %eax
     1fe:	8d 81 e0 19 00 00    	lea    0x19e0(%ecx),%eax
     204:	50                   	push   %eax
     205:	ff 75 0c             	push   0xc(%ebp)
     208:	e8 ce 03 00 00       	call   5db <read>
     20d:	83 c4 10             	add    $0x10,%esp
     210:	85 c0                	test   %eax,%eax
     212:	0f 8e e5 00 00 00    	jle    2fd <grep+0x12d>
    m += n;
     218:	01 45 dc             	add    %eax,-0x24(%ebp)
     21b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
     21e:	c7 45 e4 e0 19 00 00 	movl   $0x19e0,-0x1c(%ebp)
    buf[m] = '\0';
     225:	c6 81 e0 19 00 00 00 	movb   $0x0,0x19e0(%ecx)
    while((q = strchr(p, '\n')) != 0){
     22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     230:	83 ec 08             	sub    $0x8,%esp
     233:	6a 0a                	push   $0xa
     235:	ff 75 e4             	push   -0x1c(%ebp)
     238:	e8 13 02 00 00       	call   450 <strchr>
     23d:	83 c4 10             	add    $0x10,%esp
     240:	89 c3                	mov    %eax,%ebx
     242:	85 c0                	test   %eax,%eax
     244:	74 72                	je     2b8 <grep+0xe8>
      *q = 0;
     246:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
     249:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
     24c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
     24f:	89 45 e0             	mov    %eax,-0x20(%ebp)
     252:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
     255:	75 12                	jne    269 <grep+0x99>
     257:	eb 47                	jmp    2a0 <grep+0xd0>
     259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
     260:	83 c6 01             	add    $0x1,%esi
     263:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
     267:	74 2b                	je     294 <grep+0xc4>
    if(matchhere(re, text))
     269:	83 ec 08             	sub    $0x8,%esp
     26c:	56                   	push   %esi
     26d:	57                   	push   %edi
     26e:	e8 4d fe ff ff       	call   c0 <matchhere>
     273:	83 c4 10             	add    $0x10,%esp
     276:	85 c0                	test   %eax,%eax
     278:	74 e6                	je     260 <grep+0x90>
        write(1, p, q+1 - p);
     27a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     27d:	8b 45 e0             	mov    -0x20(%ebp),%eax
     280:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
     283:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
     286:	29 d0                	sub    %edx,%eax
     288:	50                   	push   %eax
     289:	52                   	push   %edx
     28a:	6a 01                	push   $0x1
     28c:	e8 52 03 00 00       	call   5e3 <write>
     291:	83 c4 10             	add    $0x10,%esp
      p = q+1;
     294:	8b 45 e0             	mov    -0x20(%ebp),%eax
     297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     29a:	eb 94                	jmp    230 <grep+0x60>
     29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
     2a0:	83 ec 08             	sub    $0x8,%esp
     2a3:	56                   	push   %esi
     2a4:	ff 75 d8             	push   -0x28(%ebp)
     2a7:	e8 14 fe ff ff       	call   c0 <matchhere>
     2ac:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
     2af:	85 c0                	test   %eax,%eax
     2b1:	74 e1                	je     294 <grep+0xc4>
     2b3:	eb c5                	jmp    27a <grep+0xaa>
     2b5:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
     2b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     2bb:	81 fa e0 19 00 00    	cmp    $0x19e0,%edx
     2c1:	74 2e                	je     2f1 <grep+0x121>
    if(m > 0){
     2c3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
     2c6:	85 c9                	test   %ecx,%ecx
     2c8:	0f 8e 22 ff ff ff    	jle    1f0 <grep+0x20>
      m -= p - buf;
     2ce:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
     2d0:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
     2d3:	2d e0 19 00 00       	sub    $0x19e0,%eax
     2d8:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
     2da:	51                   	push   %ecx
     2db:	52                   	push   %edx
     2dc:	68 e0 19 00 00       	push   $0x19e0
      m -= p - buf;
     2e1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
     2e4:	e8 a7 02 00 00       	call   590 <memmove>
     2e9:	83 c4 10             	add    $0x10,%esp
     2ec:	e9 ff fe ff ff       	jmp    1f0 <grep+0x20>
      m = 0;
     2f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
     2f8:	e9 f3 fe ff ff       	jmp    1f0 <grep+0x20>
}
     2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     300:	5b                   	pop    %ebx
     301:	5e                   	pop    %esi
     302:	5f                   	pop    %edi
     303:	5d                   	pop    %ebp
     304:	c3                   	ret    
     305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <matchstar>:
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	57                   	push   %edi
     314:	56                   	push   %esi
     315:	53                   	push   %ebx
     316:	83 ec 0c             	sub    $0xc,%esp
     319:	8b 5d 08             	mov    0x8(%ebp),%ebx
     31c:	8b 75 0c             	mov    0xc(%ebp),%esi
     31f:	8b 7d 10             	mov    0x10(%ebp),%edi
     322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
     328:	83 ec 08             	sub    $0x8,%esp
     32b:	57                   	push   %edi
     32c:	56                   	push   %esi
     32d:	e8 8e fd ff ff       	call   c0 <matchhere>
     332:	83 c4 10             	add    $0x10,%esp
     335:	85 c0                	test   %eax,%eax
     337:	75 1f                	jne    358 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
     339:	0f be 17             	movsbl (%edi),%edx
     33c:	84 d2                	test   %dl,%dl
     33e:	74 0c                	je     34c <matchstar+0x3c>
     340:	83 c7 01             	add    $0x1,%edi
     343:	39 da                	cmp    %ebx,%edx
     345:	74 e1                	je     328 <matchstar+0x18>
     347:	83 fb 2e             	cmp    $0x2e,%ebx
     34a:	74 dc                	je     328 <matchstar+0x18>
}
     34c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     34f:	5b                   	pop    %ebx
     350:	5e                   	pop    %esi
     351:	5f                   	pop    %edi
     352:	5d                   	pop    %ebp
     353:	c3                   	ret    
     354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     358:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
     35b:	b8 01 00 00 00       	mov    $0x1,%eax
}
     360:	5b                   	pop    %ebx
     361:	5e                   	pop    %esi
     362:	5f                   	pop    %edi
     363:	5d                   	pop    %ebp
     364:	c3                   	ret    
     365:	66 90                	xchg   %ax,%ax
     367:	66 90                	xchg   %ax,%ax
     369:	66 90                	xchg   %ax,%ax
     36b:	66 90                	xchg   %ax,%ax
     36d:	66 90                	xchg   %ax,%ax
     36f:	90                   	nop

00000370 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     370:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     371:	31 c0                	xor    %eax,%eax
{
     373:	89 e5                	mov    %esp,%ebp
     375:	53                   	push   %ebx
     376:	8b 4d 08             	mov    0x8(%ebp),%ecx
     379:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     380:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     384:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     387:	83 c0 01             	add    $0x1,%eax
     38a:	84 d2                	test   %dl,%dl
     38c:	75 f2                	jne    380 <strcpy+0x10>
    ;
  return os;
}
     38e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     391:	89 c8                	mov    %ecx,%eax
     393:	c9                   	leave  
     394:	c3                   	ret    
     395:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	8b 55 08             	mov    0x8(%ebp),%edx
     3a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     3aa:	0f b6 02             	movzbl (%edx),%eax
     3ad:	84 c0                	test   %al,%al
     3af:	75 17                	jne    3c8 <strcmp+0x28>
     3b1:	eb 3a                	jmp    3ed <strcmp+0x4d>
     3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     3b7:	90                   	nop
     3b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     3bc:	83 c2 01             	add    $0x1,%edx
     3bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     3c2:	84 c0                	test   %al,%al
     3c4:	74 1a                	je     3e0 <strcmp+0x40>
    p++, q++;
     3c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     3c8:	0f b6 19             	movzbl (%ecx),%ebx
     3cb:	38 c3                	cmp    %al,%bl
     3cd:	74 e9                	je     3b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     3cf:	29 d8                	sub    %ebx,%eax
}
     3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d4:	c9                   	leave  
     3d5:	c3                   	ret    
     3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     3e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     3e4:	31 c0                	xor    %eax,%eax
     3e6:	29 d8                	sub    %ebx,%eax
}
     3e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3eb:	c9                   	leave  
     3ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     3ed:	0f b6 19             	movzbl (%ecx),%ebx
     3f0:	31 c0                	xor    %eax,%eax
     3f2:	eb db                	jmp    3cf <strcmp+0x2f>
     3f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     3ff:	90                   	nop

00000400 <strlen>:

uint
strlen(const char *s)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     406:	80 3a 00             	cmpb   $0x0,(%edx)
     409:	74 15                	je     420 <strlen+0x20>
     40b:	31 c0                	xor    %eax,%eax
     40d:	8d 76 00             	lea    0x0(%esi),%esi
     410:	83 c0 01             	add    $0x1,%eax
     413:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     417:	89 c1                	mov    %eax,%ecx
     419:	75 f5                	jne    410 <strlen+0x10>
    ;
  return n;
}
     41b:	89 c8                	mov    %ecx,%eax
     41d:	5d                   	pop    %ebp
     41e:	c3                   	ret    
     41f:	90                   	nop
  for(n = 0; s[n]; n++)
     420:	31 c9                	xor    %ecx,%ecx
}
     422:	5d                   	pop    %ebp
     423:	89 c8                	mov    %ecx,%eax
     425:	c3                   	ret    
     426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <memset>:

void*
memset(void *dst, int c, uint n)
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	57                   	push   %edi
     434:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     437:	8b 4d 10             	mov    0x10(%ebp),%ecx
     43a:	8b 45 0c             	mov    0xc(%ebp),%eax
     43d:	89 d7                	mov    %edx,%edi
     43f:	fc                   	cld    
     440:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     442:	8b 7d fc             	mov    -0x4(%ebp),%edi
     445:	89 d0                	mov    %edx,%eax
     447:	c9                   	leave  
     448:	c3                   	ret    
     449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000450 <strchr>:

char*
strchr(const char *s, char c)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	8b 45 08             	mov    0x8(%ebp),%eax
     456:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     45a:	0f b6 10             	movzbl (%eax),%edx
     45d:	84 d2                	test   %dl,%dl
     45f:	75 12                	jne    473 <strchr+0x23>
     461:	eb 1d                	jmp    480 <strchr+0x30>
     463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     467:	90                   	nop
     468:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     46c:	83 c0 01             	add    $0x1,%eax
     46f:	84 d2                	test   %dl,%dl
     471:	74 0d                	je     480 <strchr+0x30>
    if(*s == c)
     473:	38 d1                	cmp    %dl,%cl
     475:	75 f1                	jne    468 <strchr+0x18>
      return (char*)s;
  return 0;
}
     477:	5d                   	pop    %ebp
     478:	c3                   	ret    
     479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     480:	31 c0                	xor    %eax,%eax
}
     482:	5d                   	pop    %ebp
     483:	c3                   	ret    
     484:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     48f:	90                   	nop

00000490 <gets>:

char*
gets(char *buf, int max)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	57                   	push   %edi
     494:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     495:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     498:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     499:	31 db                	xor    %ebx,%ebx
{
     49b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     49e:	eb 27                	jmp    4c7 <gets+0x37>
    cc = read(0, &c, 1);
     4a0:	83 ec 04             	sub    $0x4,%esp
     4a3:	6a 01                	push   $0x1
     4a5:	57                   	push   %edi
     4a6:	6a 00                	push   $0x0
     4a8:	e8 2e 01 00 00       	call   5db <read>
    if(cc < 1)
     4ad:	83 c4 10             	add    $0x10,%esp
     4b0:	85 c0                	test   %eax,%eax
     4b2:	7e 1d                	jle    4d1 <gets+0x41>
      break;
    buf[i++] = c;
     4b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     4b8:	8b 55 08             	mov    0x8(%ebp),%edx
     4bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     4bf:	3c 0a                	cmp    $0xa,%al
     4c1:	74 1d                	je     4e0 <gets+0x50>
     4c3:	3c 0d                	cmp    $0xd,%al
     4c5:	74 19                	je     4e0 <gets+0x50>
  for(i=0; i+1 < max; ){
     4c7:	89 de                	mov    %ebx,%esi
     4c9:	83 c3 01             	add    $0x1,%ebx
     4cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     4cf:	7c cf                	jl     4a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     4d1:	8b 45 08             	mov    0x8(%ebp),%eax
     4d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     4d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4db:	5b                   	pop    %ebx
     4dc:	5e                   	pop    %esi
     4dd:	5f                   	pop    %edi
     4de:	5d                   	pop    %ebp
     4df:	c3                   	ret    
  buf[i] = '\0';
     4e0:	8b 45 08             	mov    0x8(%ebp),%eax
     4e3:	89 de                	mov    %ebx,%esi
     4e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     4e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4ec:	5b                   	pop    %ebx
     4ed:	5e                   	pop    %esi
     4ee:	5f                   	pop    %edi
     4ef:	5d                   	pop    %ebp
     4f0:	c3                   	ret    
     4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4ff:	90                   	nop

00000500 <stat>:

int
stat(const char *n, struct stat *st)
{
     500:	55                   	push   %ebp
     501:	89 e5                	mov    %esp,%ebp
     503:	56                   	push   %esi
     504:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     505:	83 ec 08             	sub    $0x8,%esp
     508:	6a 00                	push   $0x0
     50a:	ff 75 08             	push   0x8(%ebp)
     50d:	e8 f1 00 00 00       	call   603 <open>
  if(fd < 0)
     512:	83 c4 10             	add    $0x10,%esp
     515:	85 c0                	test   %eax,%eax
     517:	78 27                	js     540 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     519:	83 ec 08             	sub    $0x8,%esp
     51c:	ff 75 0c             	push   0xc(%ebp)
     51f:	89 c3                	mov    %eax,%ebx
     521:	50                   	push   %eax
     522:	e8 f4 00 00 00       	call   61b <fstat>
  close(fd);
     527:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     52a:	89 c6                	mov    %eax,%esi
  close(fd);
     52c:	e8 ba 00 00 00       	call   5eb <close>
  return r;
     531:	83 c4 10             	add    $0x10,%esp
}
     534:	8d 65 f8             	lea    -0x8(%ebp),%esp
     537:	89 f0                	mov    %esi,%eax
     539:	5b                   	pop    %ebx
     53a:	5e                   	pop    %esi
     53b:	5d                   	pop    %ebp
     53c:	c3                   	ret    
     53d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     540:	be ff ff ff ff       	mov    $0xffffffff,%esi
     545:	eb ed                	jmp    534 <stat+0x34>
     547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     54e:	66 90                	xchg   %ax,%ax

00000550 <atoi>:

int
atoi(const char *s)
{
     550:	55                   	push   %ebp
     551:	89 e5                	mov    %esp,%ebp
     553:	53                   	push   %ebx
     554:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     557:	0f be 02             	movsbl (%edx),%eax
     55a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     55d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     560:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     565:	77 1e                	ja     585 <atoi+0x35>
     567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     56e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     570:	83 c2 01             	add    $0x1,%edx
     573:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     576:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     57a:	0f be 02             	movsbl (%edx),%eax
     57d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     580:	80 fb 09             	cmp    $0x9,%bl
     583:	76 eb                	jbe    570 <atoi+0x20>
  return n;
}
     585:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     588:	89 c8                	mov    %ecx,%eax
     58a:	c9                   	leave  
     58b:	c3                   	ret    
     58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	57                   	push   %edi
     594:	8b 45 10             	mov    0x10(%ebp),%eax
     597:	8b 55 08             	mov    0x8(%ebp),%edx
     59a:	56                   	push   %esi
     59b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     59e:	85 c0                	test   %eax,%eax
     5a0:	7e 13                	jle    5b5 <memmove+0x25>
     5a2:	01 d0                	add    %edx,%eax
  dst = vdst;
     5a4:	89 d7                	mov    %edx,%edi
     5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     5b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     5b1:	39 f8                	cmp    %edi,%eax
     5b3:	75 fb                	jne    5b0 <memmove+0x20>
  return vdst;
}
     5b5:	5e                   	pop    %esi
     5b6:	89 d0                	mov    %edx,%eax
     5b8:	5f                   	pop    %edi
     5b9:	5d                   	pop    %ebp
     5ba:	c3                   	ret    

000005bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     5bb:	b8 01 00 00 00       	mov    $0x1,%eax
     5c0:	cd 40                	int    $0x40
     5c2:	c3                   	ret    

000005c3 <exit>:
SYSCALL(exit)
     5c3:	b8 02 00 00 00       	mov    $0x2,%eax
     5c8:	cd 40                	int    $0x40
     5ca:	c3                   	ret    

000005cb <wait>:
SYSCALL(wait)
     5cb:	b8 03 00 00 00       	mov    $0x3,%eax
     5d0:	cd 40                	int    $0x40
     5d2:	c3                   	ret    

000005d3 <pipe>:
SYSCALL(pipe)
     5d3:	b8 04 00 00 00       	mov    $0x4,%eax
     5d8:	cd 40                	int    $0x40
     5da:	c3                   	ret    

000005db <read>:
SYSCALL(read)
     5db:	b8 05 00 00 00       	mov    $0x5,%eax
     5e0:	cd 40                	int    $0x40
     5e2:	c3                   	ret    

000005e3 <write>:
SYSCALL(write)
     5e3:	b8 10 00 00 00       	mov    $0x10,%eax
     5e8:	cd 40                	int    $0x40
     5ea:	c3                   	ret    

000005eb <close>:
SYSCALL(close)
     5eb:	b8 15 00 00 00       	mov    $0x15,%eax
     5f0:	cd 40                	int    $0x40
     5f2:	c3                   	ret    

000005f3 <kill>:
SYSCALL(kill)
     5f3:	b8 06 00 00 00       	mov    $0x6,%eax
     5f8:	cd 40                	int    $0x40
     5fa:	c3                   	ret    

000005fb <exec>:
SYSCALL(exec)
     5fb:	b8 07 00 00 00       	mov    $0x7,%eax
     600:	cd 40                	int    $0x40
     602:	c3                   	ret    

00000603 <open>:
SYSCALL(open)
     603:	b8 0f 00 00 00       	mov    $0xf,%eax
     608:	cd 40                	int    $0x40
     60a:	c3                   	ret    

0000060b <mknod>:
SYSCALL(mknod)
     60b:	b8 11 00 00 00       	mov    $0x11,%eax
     610:	cd 40                	int    $0x40
     612:	c3                   	ret    

00000613 <unlink>:
SYSCALL(unlink)
     613:	b8 12 00 00 00       	mov    $0x12,%eax
     618:	cd 40                	int    $0x40
     61a:	c3                   	ret    

0000061b <fstat>:
SYSCALL(fstat)
     61b:	b8 08 00 00 00       	mov    $0x8,%eax
     620:	cd 40                	int    $0x40
     622:	c3                   	ret    

00000623 <link>:
SYSCALL(link)
     623:	b8 13 00 00 00       	mov    $0x13,%eax
     628:	cd 40                	int    $0x40
     62a:	c3                   	ret    

0000062b <mkdir>:
SYSCALL(mkdir)
     62b:	b8 14 00 00 00       	mov    $0x14,%eax
     630:	cd 40                	int    $0x40
     632:	c3                   	ret    

00000633 <chdir>:
SYSCALL(chdir)
     633:	b8 09 00 00 00       	mov    $0x9,%eax
     638:	cd 40                	int    $0x40
     63a:	c3                   	ret    

0000063b <dup>:
SYSCALL(dup)
     63b:	b8 0a 00 00 00       	mov    $0xa,%eax
     640:	cd 40                	int    $0x40
     642:	c3                   	ret    

00000643 <getpid>:
SYSCALL(getpid)
     643:	b8 0b 00 00 00       	mov    $0xb,%eax
     648:	cd 40                	int    $0x40
     64a:	c3                   	ret    

0000064b <sbrk>:
SYSCALL(sbrk)
     64b:	b8 0c 00 00 00       	mov    $0xc,%eax
     650:	cd 40                	int    $0x40
     652:	c3                   	ret    

00000653 <sleep>:
SYSCALL(sleep)
     653:	b8 0d 00 00 00       	mov    $0xd,%eax
     658:	cd 40                	int    $0x40
     65a:	c3                   	ret    

0000065b <uptime>:
SYSCALL(uptime)
     65b:	b8 0e 00 00 00       	mov    $0xe,%eax
     660:	cd 40                	int    $0x40
     662:	c3                   	ret    
     663:	66 90                	xchg   %ax,%ax
     665:	66 90                	xchg   %ax,%ax
     667:	66 90                	xchg   %ax,%ax
     669:	66 90                	xchg   %ax,%ax
     66b:	66 90                	xchg   %ax,%ax
     66d:	66 90                	xchg   %ax,%ax
     66f:	90                   	nop

00000670 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	57                   	push   %edi
     674:	56                   	push   %esi
     675:	53                   	push   %ebx
     676:	83 ec 3c             	sub    $0x3c,%esp
     679:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     67c:	89 d1                	mov    %edx,%ecx
{
     67e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     681:	85 d2                	test   %edx,%edx
     683:	0f 89 7f 00 00 00    	jns    708 <printint+0x98>
     689:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     68d:	74 79                	je     708 <printint+0x98>
    neg = 1;
     68f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     696:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     698:	31 db                	xor    %ebx,%ebx
     69a:	8d 75 d7             	lea    -0x29(%ebp),%esi
     69d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     6a0:	89 c8                	mov    %ecx,%eax
     6a2:	31 d2                	xor    %edx,%edx
     6a4:	89 cf                	mov    %ecx,%edi
     6a6:	f7 75 c4             	divl   -0x3c(%ebp)
     6a9:	0f b6 92 f0 12 00 00 	movzbl 0x12f0(%edx),%edx
     6b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
     6b3:	89 d8                	mov    %ebx,%eax
     6b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     6b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     6bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     6be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     6c1:	76 dd                	jbe    6a0 <printint+0x30>
  if(neg)
     6c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     6c6:	85 c9                	test   %ecx,%ecx
     6c8:	74 0c                	je     6d6 <printint+0x66>
    buf[i++] = '-';
     6ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     6cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     6d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     6d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
     6d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     6dd:	eb 07                	jmp    6e6 <printint+0x76>
     6df:	90                   	nop
    putc(fd, buf[i]);
     6e0:	0f b6 13             	movzbl (%ebx),%edx
     6e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     6e6:	83 ec 04             	sub    $0x4,%esp
     6e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
     6ec:	6a 01                	push   $0x1
     6ee:	56                   	push   %esi
     6ef:	57                   	push   %edi
     6f0:	e8 ee fe ff ff       	call   5e3 <write>
  while(--i >= 0)
     6f5:	83 c4 10             	add    $0x10,%esp
     6f8:	39 de                	cmp    %ebx,%esi
     6fa:	75 e4                	jne    6e0 <printint+0x70>
}
     6fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6ff:	5b                   	pop    %ebx
     700:	5e                   	pop    %esi
     701:	5f                   	pop    %edi
     702:	5d                   	pop    %ebp
     703:	c3                   	ret    
     704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     708:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     70f:	eb 87                	jmp    698 <printint+0x28>
     711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     71f:	90                   	nop

00000720 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	57                   	push   %edi
     724:	56                   	push   %esi
     725:	53                   	push   %ebx
     726:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     729:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
     72c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
     72f:	0f b6 13             	movzbl (%ebx),%edx
     732:	84 d2                	test   %dl,%dl
     734:	74 6a                	je     7a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
     736:	8d 45 10             	lea    0x10(%ebp),%eax
     739:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     73c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
     73f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
     741:	89 45 d0             	mov    %eax,-0x30(%ebp)
     744:	eb 36                	jmp    77c <printf+0x5c>
     746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     74d:	8d 76 00             	lea    0x0(%esi),%esi
     750:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     753:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
     758:	83 f8 25             	cmp    $0x25,%eax
     75b:	74 15                	je     772 <printf+0x52>
  write(fd, &c, 1);
     75d:	83 ec 04             	sub    $0x4,%esp
     760:	88 55 e7             	mov    %dl,-0x19(%ebp)
     763:	6a 01                	push   $0x1
     765:	57                   	push   %edi
     766:	56                   	push   %esi
     767:	e8 77 fe ff ff       	call   5e3 <write>
     76c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
     76f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     772:	0f b6 13             	movzbl (%ebx),%edx
     775:	83 c3 01             	add    $0x1,%ebx
     778:	84 d2                	test   %dl,%dl
     77a:	74 24                	je     7a0 <printf+0x80>
    c = fmt[i] & 0xff;
     77c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
     77f:	85 c9                	test   %ecx,%ecx
     781:	74 cd                	je     750 <printf+0x30>
      }
    } else if(state == '%'){
     783:	83 f9 25             	cmp    $0x25,%ecx
     786:	75 ea                	jne    772 <printf+0x52>
      if(c == 'd'){
     788:	83 f8 25             	cmp    $0x25,%eax
     78b:	0f 84 07 01 00 00    	je     898 <printf+0x178>
     791:	83 e8 63             	sub    $0x63,%eax
     794:	83 f8 15             	cmp    $0x15,%eax
     797:	77 17                	ja     7b0 <printf+0x90>
     799:	ff 24 85 98 12 00 00 	jmp    *0x1298(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     7a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7a3:	5b                   	pop    %ebx
     7a4:	5e                   	pop    %esi
     7a5:	5f                   	pop    %edi
     7a6:	5d                   	pop    %ebp
     7a7:	c3                   	ret    
     7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7af:	90                   	nop
  write(fd, &c, 1);
     7b0:	83 ec 04             	sub    $0x4,%esp
     7b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
     7b6:	6a 01                	push   $0x1
     7b8:	57                   	push   %edi
     7b9:	56                   	push   %esi
     7ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     7be:	e8 20 fe ff ff       	call   5e3 <write>
        putc(fd, c);
     7c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
     7c7:	83 c4 0c             	add    $0xc,%esp
     7ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
     7cd:	6a 01                	push   $0x1
     7cf:	57                   	push   %edi
     7d0:	56                   	push   %esi
     7d1:	e8 0d fe ff ff       	call   5e3 <write>
        putc(fd, c);
     7d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
     7d9:	31 c9                	xor    %ecx,%ecx
     7db:	eb 95                	jmp    772 <printf+0x52>
     7dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
     7e0:	83 ec 0c             	sub    $0xc,%esp
     7e3:	b9 10 00 00 00       	mov    $0x10,%ecx
     7e8:	6a 00                	push   $0x0
     7ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7ed:	8b 10                	mov    (%eax),%edx
     7ef:	89 f0                	mov    %esi,%eax
     7f1:	e8 7a fe ff ff       	call   670 <printint>
        ap++;
     7f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
     7fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
     7fd:	31 c9                	xor    %ecx,%ecx
     7ff:	e9 6e ff ff ff       	jmp    772 <printf+0x52>
     804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     808:	8b 45 d0             	mov    -0x30(%ebp),%eax
     80b:	8b 10                	mov    (%eax),%edx
        ap++;
     80d:	83 c0 04             	add    $0x4,%eax
     810:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     813:	85 d2                	test   %edx,%edx
     815:	0f 84 8d 00 00 00    	je     8a8 <printf+0x188>
        while(*s != 0){
     81b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
     81e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
     820:	84 c0                	test   %al,%al
     822:	0f 84 4a ff ff ff    	je     772 <printf+0x52>
     828:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     82b:	89 d3                	mov    %edx,%ebx
     82d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     830:	83 ec 04             	sub    $0x4,%esp
          s++;
     833:	83 c3 01             	add    $0x1,%ebx
     836:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     839:	6a 01                	push   $0x1
     83b:	57                   	push   %edi
     83c:	56                   	push   %esi
     83d:	e8 a1 fd ff ff       	call   5e3 <write>
        while(*s != 0){
     842:	0f b6 03             	movzbl (%ebx),%eax
     845:	83 c4 10             	add    $0x10,%esp
     848:	84 c0                	test   %al,%al
     84a:	75 e4                	jne    830 <printf+0x110>
      state = 0;
     84c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
     84f:	31 c9                	xor    %ecx,%ecx
     851:	e9 1c ff ff ff       	jmp    772 <printf+0x52>
     856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     85d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
     860:	83 ec 0c             	sub    $0xc,%esp
     863:	b9 0a 00 00 00       	mov    $0xa,%ecx
     868:	6a 01                	push   $0x1
     86a:	e9 7b ff ff ff       	jmp    7ea <printf+0xca>
     86f:	90                   	nop
        putc(fd, *ap);
     870:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
     873:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     876:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
     878:	6a 01                	push   $0x1
     87a:	57                   	push   %edi
     87b:	56                   	push   %esi
        putc(fd, *ap);
     87c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     87f:	e8 5f fd ff ff       	call   5e3 <write>
        ap++;
     884:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
     888:	83 c4 10             	add    $0x10,%esp
      state = 0;
     88b:	31 c9                	xor    %ecx,%ecx
     88d:	e9 e0 fe ff ff       	jmp    772 <printf+0x52>
     892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
     898:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
     89b:	83 ec 04             	sub    $0x4,%esp
     89e:	e9 2a ff ff ff       	jmp    7cd <printf+0xad>
     8a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     8a7:	90                   	nop
          s = "(null)";
     8a8:	ba 8e 12 00 00       	mov    $0x128e,%edx
        while(*s != 0){
     8ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     8b0:	b8 28 00 00 00       	mov    $0x28,%eax
     8b5:	89 d3                	mov    %edx,%ebx
     8b7:	e9 74 ff ff ff       	jmp    830 <printf+0x110>
     8bc:	66 90                	xchg   %ax,%ax
     8be:	66 90                	xchg   %ax,%ax

000008c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     8c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     8c1:	a1 e0 1d 00 00       	mov    0x1de0,%eax
{
     8c6:	89 e5                	mov    %esp,%ebp
     8c8:	57                   	push   %edi
     8c9:	56                   	push   %esi
     8ca:	53                   	push   %ebx
     8cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     8ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8d8:	89 c2                	mov    %eax,%edx
     8da:	8b 00                	mov    (%eax),%eax
     8dc:	39 ca                	cmp    %ecx,%edx
     8de:	73 30                	jae    910 <free+0x50>
     8e0:	39 c1                	cmp    %eax,%ecx
     8e2:	72 04                	jb     8e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     8e4:	39 c2                	cmp    %eax,%edx
     8e6:	72 f0                	jb     8d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
     8e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
     8eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     8ee:	39 f8                	cmp    %edi,%eax
     8f0:	74 30                	je     922 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
     8f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     8f5:	8b 42 04             	mov    0x4(%edx),%eax
     8f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     8fb:	39 f1                	cmp    %esi,%ecx
     8fd:	74 3a                	je     939 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
     8ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
     901:	5b                   	pop    %ebx
  freep = p;
     902:	89 15 e0 1d 00 00    	mov    %edx,0x1de0
}
     908:	5e                   	pop    %esi
     909:	5f                   	pop    %edi
     90a:	5d                   	pop    %ebp
     90b:	c3                   	ret    
     90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     910:	39 c2                	cmp    %eax,%edx
     912:	72 c4                	jb     8d8 <free+0x18>
     914:	39 c1                	cmp    %eax,%ecx
     916:	73 c0                	jae    8d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
     918:	8b 73 fc             	mov    -0x4(%ebx),%esi
     91b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     91e:	39 f8                	cmp    %edi,%eax
     920:	75 d0                	jne    8f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
     922:	03 70 04             	add    0x4(%eax),%esi
     925:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     928:	8b 02                	mov    (%edx),%eax
     92a:	8b 00                	mov    (%eax),%eax
     92c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
     92f:	8b 42 04             	mov    0x4(%edx),%eax
     932:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     935:	39 f1                	cmp    %esi,%ecx
     937:	75 c6                	jne    8ff <free+0x3f>
    p->s.size += bp->s.size;
     939:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
     93c:	89 15 e0 1d 00 00    	mov    %edx,0x1de0
    p->s.size += bp->s.size;
     942:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
     945:	8b 4b f8             	mov    -0x8(%ebx),%ecx
     948:	89 0a                	mov    %ecx,(%edx)
}
     94a:	5b                   	pop    %ebx
     94b:	5e                   	pop    %esi
     94c:	5f                   	pop    %edi
     94d:	5d                   	pop    %ebp
     94e:	c3                   	ret    
     94f:	90                   	nop

00000950 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     950:	55                   	push   %ebp
     951:	89 e5                	mov    %esp,%ebp
     953:	57                   	push   %edi
     954:	56                   	push   %esi
     955:	53                   	push   %ebx
     956:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     959:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     95c:	8b 3d e0 1d 00 00    	mov    0x1de0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     962:	8d 70 07             	lea    0x7(%eax),%esi
     965:	c1 ee 03             	shr    $0x3,%esi
     968:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
     96b:	85 ff                	test   %edi,%edi
     96d:	0f 84 9d 00 00 00    	je     a10 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     973:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
     975:	8b 4a 04             	mov    0x4(%edx),%ecx
     978:	39 f1                	cmp    %esi,%ecx
     97a:	73 6a                	jae    9e6 <malloc+0x96>
     97c:	bb 00 10 00 00       	mov    $0x1000,%ebx
     981:	39 de                	cmp    %ebx,%esi
     983:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
     986:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
     98d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     990:	eb 17                	jmp    9a9 <malloc+0x59>
     992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     998:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     99a:	8b 48 04             	mov    0x4(%eax),%ecx
     99d:	39 f1                	cmp    %esi,%ecx
     99f:	73 4f                	jae    9f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     9a1:	8b 3d e0 1d 00 00    	mov    0x1de0,%edi
     9a7:	89 c2                	mov    %eax,%edx
     9a9:	39 d7                	cmp    %edx,%edi
     9ab:	75 eb                	jne    998 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
     9ad:	83 ec 0c             	sub    $0xc,%esp
     9b0:	ff 75 e4             	push   -0x1c(%ebp)
     9b3:	e8 93 fc ff ff       	call   64b <sbrk>
  if(p == (char*)-1)
     9b8:	83 c4 10             	add    $0x10,%esp
     9bb:	83 f8 ff             	cmp    $0xffffffff,%eax
     9be:	74 1c                	je     9dc <malloc+0x8c>
  hp->s.size = nu;
     9c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
     9c3:	83 ec 0c             	sub    $0xc,%esp
     9c6:	83 c0 08             	add    $0x8,%eax
     9c9:	50                   	push   %eax
     9ca:	e8 f1 fe ff ff       	call   8c0 <free>
  return freep;
     9cf:	8b 15 e0 1d 00 00    	mov    0x1de0,%edx
      if((p = morecore(nunits)) == 0)
     9d5:	83 c4 10             	add    $0x10,%esp
     9d8:	85 d2                	test   %edx,%edx
     9da:	75 bc                	jne    998 <malloc+0x48>
        return 0;
  }
}
     9dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     9df:	31 c0                	xor    %eax,%eax
}
     9e1:	5b                   	pop    %ebx
     9e2:	5e                   	pop    %esi
     9e3:	5f                   	pop    %edi
     9e4:	5d                   	pop    %ebp
     9e5:	c3                   	ret    
    if(p->s.size >= nunits){
     9e6:	89 d0                	mov    %edx,%eax
     9e8:	89 fa                	mov    %edi,%edx
     9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
     9f0:	39 ce                	cmp    %ecx,%esi
     9f2:	74 4c                	je     a40 <malloc+0xf0>
        p->s.size -= nunits;
     9f4:	29 f1                	sub    %esi,%ecx
     9f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     9f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     9fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
     9ff:	89 15 e0 1d 00 00    	mov    %edx,0x1de0
}
     a05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
     a08:	83 c0 08             	add    $0x8,%eax
}
     a0b:	5b                   	pop    %ebx
     a0c:	5e                   	pop    %esi
     a0d:	5f                   	pop    %edi
     a0e:	5d                   	pop    %ebp
     a0f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
     a10:	c7 05 e0 1d 00 00 e4 	movl   $0x1de4,0x1de0
     a17:	1d 00 00 
    base.s.size = 0;
     a1a:	bf e4 1d 00 00       	mov    $0x1de4,%edi
    base.s.ptr = freep = prevp = &base;
     a1f:	c7 05 e4 1d 00 00 e4 	movl   $0x1de4,0x1de4
     a26:	1d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     a29:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
     a2b:	c7 05 e8 1d 00 00 00 	movl   $0x0,0x1de8
     a32:	00 00 00 
    if(p->s.size >= nunits){
     a35:	e9 42 ff ff ff       	jmp    97c <malloc+0x2c>
     a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
     a40:	8b 08                	mov    (%eax),%ecx
     a42:	89 0a                	mov    %ecx,(%edx)
     a44:	eb b9                	jmp    9ff <malloc+0xaf>
     a46:	66 90                	xchg   %ax,%ax
     a48:	66 90                	xchg   %ax,%ax
     a4a:	66 90                	xchg   %ax,%ax
     a4c:	66 90                	xchg   %ax,%ax
     a4e:	66 90                	xchg   %ax,%ax

00000a50 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	57                   	push   %edi
     a54:	56                   	push   %esi
     a55:	53                   	push   %ebx
     a56:	83 ec 04             	sub    $0x4,%esp
     a59:	8b 5d 10             	mov    0x10(%ebp),%ebx
     a5c:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
     a5f:	85 db                	test   %ebx,%ebx
     a61:	7e 3d                	jle    aa0 <min_distance_vertex+0x50>
    int min_idx = 0;
     a63:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
     a65:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
     a67:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
     a6c:	89 75 f0             	mov    %esi,-0x10(%ebp)
     a6f:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
     a70:	8b 14 87             	mov    (%edi,%eax,4),%edx
     a73:	39 ca                	cmp    %ecx,%edx
     a75:	7d 14                	jge    a8b <min_distance_vertex+0x3b>
     a77:	8b 75 0c             	mov    0xc(%ebp),%esi
     a7a:	8b 34 86             	mov    (%esi,%eax,4),%esi
     a7d:	85 f6                	test   %esi,%esi
     a7f:	8b 75 f0             	mov    -0x10(%ebp),%esi
     a82:	0f 44 ca             	cmove  %edx,%ecx
     a85:	0f 44 f0             	cmove  %eax,%esi
     a88:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
     a8b:	83 c0 01             	add    $0x1,%eax
     a8e:	39 c3                	cmp    %eax,%ebx
     a90:	75 de                	jne    a70 <min_distance_vertex+0x20>
     a92:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
     a95:	83 c4 04             	add    $0x4,%esp
     a98:	5b                   	pop    %ebx
     a99:	89 f0                	mov    %esi,%eax
     a9b:	5e                   	pop    %esi
     a9c:	5f                   	pop    %edi
     a9d:	5d                   	pop    %ebp
     a9e:	c3                   	ret    
     a9f:	90                   	nop
     aa0:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
     aa3:	31 f6                	xor    %esi,%esi
}
     aa5:	5b                   	pop    %ebx
     aa6:	89 f0                	mov    %esi,%eax
     aa8:	5e                   	pop    %esi
     aa9:	5f                   	pop    %edi
     aaa:	5d                   	pop    %ebp
     aab:	c3                   	ret    
     aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	57                   	push   %edi
     ab4:	56                   	push   %esi
     ab5:	53                   	push   %ebx
     ab6:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
     ab9:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
     abc:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
     abf:	89 e6                	mov    %esp,%esi
     ac1:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
     ac8:	8d 41 0f             	lea    0xf(%ecx),%eax
     acb:	89 c2                	mov    %eax,%edx
     acd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     ad2:	29 c6                	sub    %eax,%esi
     ad4:	83 e2 f0             	and    $0xfffffff0,%edx
     ad7:	39 f4                	cmp    %esi,%esp
     ad9:	74 12                	je     aed <dijkstra+0x3d>
     adb:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     ae1:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
     ae8:	00 
     ae9:	39 f4                	cmp    %esi,%esp
     aeb:	75 ee                	jne    adb <dijkstra+0x2b>
     aed:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
     af3:	29 d4                	sub    %edx,%esp
     af5:	85 d2                	test   %edx,%edx
     af7:	0f 85 ef 00 00 00    	jne    bec <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
     afd:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
     b00:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
     b02:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
     b05:	8b 45 0c             	mov    0xc(%ebp),%eax
     b08:	85 c0                	test   %eax,%eax
     b0a:	0f 8e e6 00 00 00    	jle    bf6 <dijkstra+0x146>
     b10:	89 d8                	mov    %ebx,%eax
     b12:	89 fa                	mov    %edi,%edx
     b14:	01 d9                	add    %ebx,%ecx
     b16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b1d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
     b20:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
     b26:	83 c0 04             	add    $0x4,%eax
     b29:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
     b2c:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
     b33:	39 c8                	cmp    %ecx,%eax
     b35:	75 e9                	jne    b20 <dijkstra+0x70>
    dist[src] = 0;
     b37:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     b3d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
     b48:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
     b4a:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
     b4f:	31 c0                	xor    %eax,%eax
     b51:	eb 07                	jmp    b5a <dijkstra+0xaa>
     b53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b57:	90                   	nop
     b58:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
     b5a:	8b 14 83             	mov    (%ebx,%eax,4),%edx
     b5d:	39 ca                	cmp    %ecx,%edx
     b5f:	7d 0a                	jge    b6b <dijkstra+0xbb>
     b61:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
     b65:	0f 44 f0             	cmove  %eax,%esi
     b68:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
     b6b:	8d 50 01             	lea    0x1(%eax),%edx
     b6e:	39 55 0c             	cmp    %edx,0xc(%ebp)
     b71:	75 e5                	jne    b58 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
     b73:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
     b76:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
     b7d:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
     b83:	89 4d e0             	mov    %ecx,-0x20(%ebp)
     b86:	75 18                	jne    ba0 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
     b88:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     b8b:	8d 56 01             	lea    0x1(%esi),%edx
     b8e:	39 c6                	cmp    %eax,%esi
     b90:	74 52                	je     be4 <dijkstra+0x134>
     b92:	89 55 e4             	mov    %edx,-0x1c(%ebp)
     b95:	eb b1                	jmp    b48 <dijkstra+0x98>
     b97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b9e:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
     ba0:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
     ba6:	89 5d dc             	mov    %ebx,-0x24(%ebp)
     ba9:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
     bac:	31 d2                	xor    %edx,%edx
     bae:	eb 02                	jmp    bb2 <dijkstra+0x102>
     bb0:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
     bb2:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
     bb5:	85 c9                	test   %ecx,%ecx
     bb7:	74 17                	je     bd0 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
     bb9:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
     bbc:	85 db                	test   %ebx,%ebx
     bbe:	75 10                	jne    bd0 <dijkstra+0x120>
     bc0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
     bc3:	03 0b                	add    (%ebx),%ecx
     bc5:	8b 5d dc             	mov    -0x24(%ebp),%ebx
     bc8:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
     bcb:	7e 03                	jle    bd0 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
     bcd:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
     bd0:	8d 4a 01             	lea    0x1(%edx),%ecx
     bd3:	39 c2                	cmp    %eax,%edx
     bd5:	75 d9                	jne    bb0 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
     bd7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     bda:	8b 5d dc             	mov    -0x24(%ebp),%ebx
     bdd:	8d 56 01             	lea    0x1(%esi),%edx
     be0:	39 c6                	cmp    %eax,%esi
     be2:	75 ae                	jne    b92 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
     be4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     be7:	5b                   	pop    %ebx
     be8:	5e                   	pop    %esi
     be9:	5f                   	pop    %edi
     bea:	5d                   	pop    %ebp
     beb:	c3                   	ret    
    int visited[num_vertices];
     bec:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
     bf1:	e9 07 ff ff ff       	jmp    afd <dijkstra+0x4d>
    dist[src] = 0;
     bf6:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     bfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bff:	5b                   	pop    %ebx
     c00:	5e                   	pop    %esi
     c01:	5f                   	pop    %edi
     c02:	5d                   	pop    %ebp
     c03:	c3                   	ret    
     c04:	66 90                	xchg   %ax,%ax
     c06:	66 90                	xchg   %ax,%ax
     c08:	66 90                	xchg   %ax,%ax
     c0a:	66 90                	xchg   %ax,%ax
     c0c:	66 90                	xchg   %ax,%ax
     c0e:	66 90                	xchg   %ax,%ax

00000c10 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
     c14:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
     c19:	56                   	push   %esi
     c1a:	53                   	push   %ebx
     c1b:	83 ec 0c             	sub    $0xc,%esp
     c1e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c21:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
     c24:	e8 f7 00 00 00       	call   d20 <random>
     c29:	89 c1                	mov    %eax,%ecx
     c2b:	f7 ef                	imul   %edi
     c2d:	89 c8                	mov    %ecx,%eax
     c2f:	c1 f8 1f             	sar    $0x1f,%eax
     c32:	c1 fa 06             	sar    $0x6,%edx
     c35:	29 c2                	sub    %eax,%edx
     c37:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
     c3d:	29 c1                	sub    %eax,%ecx
     c3f:	83 f9 63             	cmp    $0x63,%ecx
     c42:	89 ca                	mov    %ecx,%edx
     c44:	8d 41 64             	lea    0x64(%ecx),%eax
     c47:	0f 4e d0             	cmovle %eax,%edx
     c4a:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
     c4c:	e8 cf 00 00 00       	call   d20 <random>
     c51:	89 c1                	mov    %eax,%ecx
     c53:	f7 ef                	imul   %edi
     c55:	89 c8                	mov    %ecx,%eax
     c57:	c1 f8 1f             	sar    $0x1f,%eax
     c5a:	c1 fa 07             	sar    $0x7,%edx
     c5d:	29 c2                	sub    %eax,%edx
     c5f:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
     c65:	29 c1                	sub    %eax,%ecx
     c67:	8d 41 32             	lea    0x32(%ecx),%eax
     c6a:	89 ca                	mov    %ecx,%edx
     c6c:	83 f9 31             	cmp    $0x31,%ecx
     c6f:	0f 4e d0             	cmovle %eax,%edx
     c72:	8b 45 10             	mov    0x10(%ebp),%eax
     c75:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
     c77:	8b 13                	mov    (%ebx),%edx
     c79:	85 d2                	test   %edx,%edx
     c7b:	7e 38                	jle    cb5 <gen_random_digraph+0xa5>
     c7d:	89 f1                	mov    %esi,%ecx
     c7f:	31 ff                	xor    %edi,%edi
     c81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
     c88:	31 c0                	xor    %eax,%eax
     c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
     c90:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
     c97:	8b 13                	mov    (%ebx),%edx
     c99:	83 c0 01             	add    $0x1,%eax
     c9c:	39 c2                	cmp    %eax,%edx
     c9e:	7f f0                	jg     c90 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
     ca0:	83 c7 01             	add    $0x1,%edi
     ca3:	81 c1 20 03 00 00    	add    $0x320,%ecx
     ca9:	39 fa                	cmp    %edi,%edx
     cab:	7f db                	jg     c88 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
     cad:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
     cb3:	7f 22                	jg     cd7 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
     cb5:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
     cbb:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
     cc2:	8d 04 86             	lea    (%esi,%eax,4),%eax
     cc5:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
     cc8:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
     cce:	05 20 03 00 00       	add    $0x320,%eax
     cd3:	39 d0                	cmp    %edx,%eax
     cd5:	75 f1                	jne    cc8 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
     cd7:	8b 45 10             	mov    0x10(%ebp),%eax
     cda:	31 c9                	xor    %ecx,%ecx
     cdc:	8b 00                	mov    (%eax),%eax
     cde:	85 c0                	test   %eax,%eax
     ce0:	7e 31                	jle    d13 <gen_random_digraph+0x103>
     ce2:	89 75 08             	mov    %esi,0x8(%ebp)
     ce5:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
     ce7:	e8 34 00 00 00       	call   d20 <random>
    for (int i = 0; i < *num_edges; i++) {
     cec:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
     cef:	99                   	cltd   
     cf0:	f7 3b                	idivl  (%ebx)
     cf2:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
     cf4:	e8 27 00 00 00       	call   d20 <random>
        graph[new_edge_u][new_edge_v] = 1;
     cf9:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
     cff:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
     d02:	99                   	cltd   
     d03:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
     d05:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
     d08:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
     d0f:	39 30                	cmp    %esi,(%eax)
     d11:	7f d4                	jg     ce7 <gen_random_digraph+0xd7>
    }
}
     d13:	83 c4 0c             	add    $0xc,%esp
     d16:	5b                   	pop    %ebx
     d17:	5e                   	pop    %esi
     d18:	5f                   	pop    %edi
     d19:	5d                   	pop    %ebp
     d1a:	c3                   	ret    
     d1b:	66 90                	xchg   %ax,%ax
     d1d:	66 90                	xchg   %ax,%ax
     d1f:	90                   	nop

00000d20 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
     d20:	69 0d c0 19 00 00 0d 	imul   $0x19660d,0x19c0,%ecx
     d27:	66 19 00 
     d2a:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
     d2f:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
     d35:	89 c8                	mov    %ecx,%eax
     d37:	f7 ea                	imul   %edx
     d39:	89 d0                	mov    %edx,%eax
     d3b:	89 ca                	mov    %ecx,%edx
     d3d:	c1 fa 1f             	sar    $0x1f,%edx
     d40:	c1 f8 1d             	sar    $0x1d,%eax
     d43:	29 d0                	sub    %edx,%eax
     d45:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
     d4b:	89 c8                	mov    %ecx,%eax
     d4d:	29 d0                	sub    %edx,%eax
     d4f:	a3 c0 19 00 00       	mov    %eax,0x19c0
    return seed;
     d54:	c3                   	ret    
     d55:	66 90                	xchg   %ax,%ax
     d57:	66 90                	xchg   %ax,%ax
     d59:	66 90                	xchg   %ax,%ax
     d5b:	66 90                	xchg   %ax,%ax
     d5d:	66 90                	xchg   %ax,%ax
     d5f:	90                   	nop

00000d60 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	57                   	push   %edi
     d64:	56                   	push   %esi
     d65:	53                   	push   %ebx
     d66:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     d6c:	83 0c 24 00          	orl    $0x0,(%esp)
     d70:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     d76:	83 0c 24 00          	orl    $0x0,(%esp)
     d7a:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
     d80:	6a 00                	push   $0x0
     d82:	ff 75 08             	push   0x8(%ebp)
     d85:	e8 79 f8 ff ff       	call   603 <open>
    if (fp < 0 ) {
     d8a:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
     d8d:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
     d93:	85 c0                	test   %eax,%eax
     d95:	0f 88 99 01 00 00    	js     f34 <permute_line+0x1d4>
     d9b:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
     da1:	31 db                	xor    %ebx,%ebx
     da3:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
     da9:	89 f7                	mov    %esi,%edi
     dab:	89 de                	mov    %ebx,%esi
     dad:	89 c3                	mov    %eax,%ebx
     daf:	eb 12                	jmp    dc3 <permute_line+0x63>
     db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     db8:	83 c7 66             	add    $0x66,%edi
     dbb:	83 fe 64             	cmp    $0x64,%esi
     dbe:	74 16                	je     dd6 <permute_line+0x76>
        line_idx++;
     dc0:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     dc3:	83 ec 04             	sub    $0x4,%esp
     dc6:	6a 66                	push   $0x66
     dc8:	57                   	push   %edi
     dc9:	53                   	push   %ebx
     dca:	e8 0c f8 ff ff       	call   5db <read>
     dcf:	83 c4 10             	add    $0x10,%esp
     dd2:	85 c0                	test   %eax,%eax
     dd4:	7f e2                	jg     db8 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
     dd6:	89 f3                	mov    %esi,%ebx
     dd8:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
     dde:	e8 3d ff ff ff       	call   d20 <random>
     de3:	89 c1                	mov    %eax,%ecx
     de5:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     dea:	f7 e9                	imul   %ecx
     dec:	89 c8                	mov    %ecx,%eax
     dee:	c1 f8 1f             	sar    $0x1f,%eax
     df1:	c1 fa 05             	sar    $0x5,%edx
     df4:	29 c2                	sub    %eax,%edx
     df6:	6b c2 64             	imul   $0x64,%edx,%eax
     df9:	29 c1                	sub    %eax,%ecx
     dfb:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
     dfd:	e8 1e ff ff ff       	call   d20 <random>
     e02:	89 c1                	mov    %eax,%ecx
     e04:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     e09:	f7 e9                	imul   %ecx
     e0b:	89 c8                	mov    %ecx,%eax
     e0d:	c1 f8 1f             	sar    $0x1f,%eax
     e10:	c1 fa 05             	sar    $0x5,%edx
     e13:	29 c2                	sub    %eax,%edx
     e15:	6b c2 64             	imul   $0x64,%edx,%eax
     e18:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
     e1a:	39 cf                	cmp    %ecx,%edi
     e1c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
     e22:	74 5f                	je     e83 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
     e24:	6b c7 66             	imul   $0x66,%edi,%eax
     e27:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
     e2d:	83 ec 08             	sub    $0x8,%esp
     e30:	01 c1                	add    %eax,%ecx
     e32:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     e38:	51                   	push   %ecx
     e39:	50                   	push   %eax
     e3a:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
     e40:	e8 2b f5 ff ff       	call   370 <strcpy>
        strcpy(lines[line1], lines[line2]);
     e45:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
     e4b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
     e51:	6b d2 66             	imul   $0x66,%edx,%edx
     e54:	01 c2                	add    %eax,%edx
     e56:	58                   	pop    %eax
     e57:	59                   	pop    %ecx
     e58:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
     e5e:	52                   	push   %edx
     e5f:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
     e65:	51                   	push   %ecx
     e66:	e8 05 f5 ff ff       	call   370 <strcpy>
        strcpy(lines[line2], temp);
     e6b:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
     e71:	5f                   	pop    %edi
     e72:	58                   	pop    %eax
     e73:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     e79:	50                   	push   %eax
     e7a:	52                   	push   %edx
     e7b:	e8 f0 f4 ff ff       	call   370 <strcpy>
     e80:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
     e83:	83 ec 0c             	sub    $0xc,%esp
     e86:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
     e8c:	e8 5a f7 ff ff       	call   5eb <close>
    fp = open(file_path, O_RDWR);
     e91:	58                   	pop    %eax
     e92:	5a                   	pop    %edx
     e93:	6a 02                	push   $0x2
     e95:	ff 75 08             	push   0x8(%ebp)
     e98:	e8 66 f7 ff ff       	call   603 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
     e9d:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
     e9e:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
     ea0:	58                   	pop    %eax
     ea1:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
     ea7:	50                   	push   %eax
     ea8:	57                   	push   %edi
     ea9:	e8 6d f7 ff ff       	call   61b <fstat>
    char *buffer = malloc(0);
     eae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     eb5:	e8 96 fa ff ff       	call   950 <malloc>
    memset(buffer, 0, 0);  
     eba:	83 c4 0c             	add    $0xc,%esp
     ebd:	6a 00                	push   $0x0
     ebf:	6a 00                	push   $0x0
     ec1:	50                   	push   %eax
     ec2:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
     ec8:	e8 63 f5 ff ff       	call   430 <memset>
    write(fp, buffer, 0);
     ecd:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
     ed3:	83 c4 0c             	add    $0xc,%esp
     ed6:	6a 00                	push   $0x0
     ed8:	52                   	push   %edx
     ed9:	57                   	push   %edi
     eda:	e8 04 f7 ff ff       	call   5e3 <write>
    free(buffer);
     edf:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
     ee5:	89 14 24             	mov    %edx,(%esp)
     ee8:	e8 d3 f9 ff ff       	call   8c0 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
     eed:	83 c4 10             	add    $0x10,%esp
     ef0:	85 ff                	test   %edi,%edi
     ef2:	78 59                	js     f4d <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
     ef4:	85 db                	test   %ebx,%ebx
     ef6:	74 26                	je     f1e <permute_line+0x1be>
     ef8:	6b db 66             	imul   $0x66,%ebx,%ebx
     efb:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
     f01:	01 c3                	add    %eax,%ebx
     f03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f07:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
     f08:	83 ec 04             	sub    $0x4,%esp
     f0b:	6a 66                	push   $0x66
     f0d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
     f0e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
     f11:	57                   	push   %edi
     f12:	e8 cc f6 ff ff       	call   5e3 <write>
    for (int i = 0; i < line_idx; i++) {
     f17:	83 c4 10             	add    $0x10,%esp
     f1a:	39 de                	cmp    %ebx,%esi
     f1c:	75 ea                	jne    f08 <permute_line+0x1a8>
    }

    close(fp);
     f1e:	83 ec 0c             	sub    $0xc,%esp
     f21:	57                   	push   %edi
     f22:	e8 c4 f6 ff ff       	call   5eb <close>
    return 0;
     f27:	83 c4 10             	add    $0x10,%esp
     f2a:	31 c0                	xor    %eax,%eax
     f2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f2f:	5b                   	pop    %ebx
     f30:	5e                   	pop    %esi
     f31:	5f                   	pop    %edi
     f32:	5d                   	pop    %ebp
     f33:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
     f34:	83 ec 08             	sub    $0x8,%esp
     f37:	68 04 13 00 00       	push   $0x1304
     f3c:	6a 01                	push   $0x1
     f3e:	e8 dd f7 ff ff       	call   720 <printf>
        return -1;
     f43:	83 c4 10             	add    $0x10,%esp
     f46:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     f4b:	eb df                	jmp    f2c <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
     f4d:	83 ec 08             	sub    $0x8,%esp
     f50:	68 4c 13 00 00       	push   $0x134c
     f55:	6a 01                	push   $0x1
     f57:	e8 c4 f7 ff ff       	call   720 <printf>
        return -1;
     f5c:	83 c4 10             	add    $0x10,%esp
     f5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     f64:	eb c6                	jmp    f2c <permute_line+0x1cc>
     f66:	66 90                	xchg   %ax,%ax
     f68:	66 90                	xchg   %ax,%ax
     f6a:	66 90                	xchg   %ax,%ax
     f6c:	66 90                	xchg   %ax,%ax
     f6e:	66 90                	xchg   %ax,%ax

00000f70 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	57                   	push   %edi
     f74:	56                   	push   %esi
     f75:	53                   	push   %ebx
     f76:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     f7c:	83 0c 24 00          	orl    $0x0,(%esp)
     f80:	81 ec 00 10 00 00    	sub    $0x1000,%esp
     f86:	83 0c 24 00          	orl    $0x0,(%esp)
     f8a:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
     f90:	6a 00                	push   $0x0
     f92:	ff 75 08             	push   0x8(%ebp)
     f95:	e8 69 f6 ff ff       	call   603 <open>
    if (fp < 0) {
     f9a:	83 c4 10             	add    $0x10,%esp
     f9d:	85 c0                	test   %eax,%eax
     f9f:	0f 88 b1 00 00 00    	js     1056 <add_line+0xe6>
     fa5:	89 c3                	mov    %eax,%ebx
     fa7:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
     fad:	31 f6                	xor    %esi,%esi
     faf:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
     fb5:	89 c7                	mov    %eax,%edi
     fb7:	eb 12                	jmp    fcb <add_line+0x5b>
     fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     fc0:	83 c7 66             	add    $0x66,%edi
     fc3:	83 fe 64             	cmp    $0x64,%esi
     fc6:	74 1c                	je     fe4 <add_line+0x74>
        line_idx++;
     fc8:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
     fcb:	83 ec 04             	sub    $0x4,%esp
     fce:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
     fd4:	6a 66                	push   $0x66
     fd6:	57                   	push   %edi
     fd7:	53                   	push   %ebx
     fd8:	e8 fe f5 ff ff       	call   5db <read>
     fdd:	83 c4 10             	add    $0x10,%esp
     fe0:	85 c0                	test   %eax,%eax
     fe2:	7f dc                	jg     fc0 <add_line+0x50>
    }
    close(fp); 
     fe4:	83 ec 0c             	sub    $0xc,%esp
     fe7:	53                   	push   %ebx
     fe8:	e8 fe f5 ff ff       	call   5eb <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
     fed:	58                   	pop    %eax
     fee:	5a                   	pop    %edx
     fef:	ff 75 0c             	push   0xc(%ebp)
     ff2:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
     ff8:	e8 73 f3 ff ff       	call   370 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
     ffd:	59                   	pop    %ecx
     ffe:	5b                   	pop    %ebx
     fff:	6a 01                	push   $0x1
    1001:	ff 75 08             	push   0x8(%ebp)
    1004:	e8 fa f5 ff ff       	call   603 <open>
    if (fp < 0) {
    1009:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
    100c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
    100e:	85 c0                	test   %eax,%eax
    1010:	78 5d                	js     106f <add_line+0xff>
    1012:	6b ce 66             	imul   $0x66,%esi,%ecx
    1015:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
    101b:	8d 78 66             	lea    0x66(%eax),%edi
    101e:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
    1021:	eb 08                	jmp    102b <add_line+0xbb>
    1023:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1027:	90                   	nop
    1028:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
    102b:	83 ec 04             	sub    $0x4,%esp
    102e:	6a 66                	push   $0x66
    1030:	50                   	push   %eax
    1031:	53                   	push   %ebx
    1032:	e8 ac f5 ff ff       	call   5e3 <write>
    for (int i = 0; i < line_idx; i++) {
    1037:	89 f8                	mov    %edi,%eax
    1039:	83 c4 10             	add    $0x10,%esp
    103c:	39 f7                	cmp    %esi,%edi
    103e:	75 e8                	jne    1028 <add_line+0xb8>
    }

    close(fp);
    1040:	83 ec 0c             	sub    $0xc,%esp
    1043:	53                   	push   %ebx
    1044:	e8 a2 f5 ff ff       	call   5eb <close>
    return 0;
    1049:	83 c4 10             	add    $0x10,%esp
    104c:	31 c0                	xor    %eax,%eax
}
    104e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1051:	5b                   	pop    %ebx
    1052:	5e                   	pop    %esi
    1053:	5f                   	pop    %edi
    1054:	5d                   	pop    %ebp
    1055:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
    1056:	83 ec 08             	sub    $0x8,%esp
    1059:	68 88 13 00 00       	push   $0x1388
    105e:	6a 01                	push   $0x1
    1060:	e8 bb f6 ff ff       	call   720 <printf>
        return -1;
    1065:	83 c4 10             	add    $0x10,%esp
    1068:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    106d:	eb df                	jmp    104e <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
    106f:	83 ec 08             	sub    $0x8,%esp
    1072:	68 ac 13 00 00       	push   $0x13ac
    1077:	6a 01                	push   $0x1
    1079:	e8 a2 f6 ff ff       	call   720 <printf>
        return -1;
    107e:	83 c4 10             	add    $0x10,%esp
    1081:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1086:	eb c6                	jmp    104e <add_line+0xde>
    1088:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108f:	90                   	nop

00001090 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	57                   	push   %edi
    1094:	56                   	push   %esi
    1095:	53                   	push   %ebx
    1096:	83 ec 0c             	sub    $0xc,%esp
    1099:	8b 5d 08             	mov    0x8(%ebp),%ebx
    109c:	8d 73 64             	lea    0x64(%ebx),%esi
    109f:	89 f7                	mov    %esi,%edi
    10a1:	8b 75 0c             	mov    0xc(%ebp),%esi
    10a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
    10a8:	e8 73 fc ff ff       	call   d20 <random>
    10ad:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    10af:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
    10b2:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
    10b5:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
    10b9:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    10bc:	39 fb                	cmp    %edi,%ebx
    10be:	75 e8                	jne    10a8 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
    10c0:	8b 45 08             	mov    0x8(%ebp),%eax
    10c3:	ba 0a 00 00 00       	mov    $0xa,%edx
    10c8:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
    10cc:	83 c4 0c             	add    $0xc,%esp
    10cf:	5b                   	pop    %ebx
    10d0:	5e                   	pop    %esi
    10d1:	5f                   	pop    %edi
    10d2:	5d                   	pop    %ebp
    10d3:	c3                   	ret    
    10d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10df:	90                   	nop

000010e0 <write_random_string>:

int write_random_string(char file_path[]) {
    10e0:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    10e1:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
    10e6:	89 e5                	mov    %esp,%ebp
    10e8:	57                   	push   %edi
    10e9:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    10ea:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
    10f0:	be d0 13 00 00       	mov    $0x13d0,%esi
int write_random_string(char file_path[]) {
    10f5:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
    10f6:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
    10fb:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    1101:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    1103:	0f b7 06             	movzwl (%esi),%eax
    1106:	8d 75 e6             	lea    -0x1a(%ebp),%esi
    1109:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    110c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
    110f:	90                   	nop
        int idx_new_char = random() % size_char_set;
    1110:	e8 0b fc ff ff       	call   d20 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    1115:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
    1118:	89 c1                	mov    %eax,%ecx
    111a:	f7 e3                	mul    %ebx
    111c:	c1 ea 06             	shr    $0x6,%edx
    111f:	6b d2 55             	imul   $0x55,%edx,%edx
    1122:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
    1124:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
    112b:	ff 
    112c:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    112f:	39 f7                	cmp    %esi,%edi
    1131:	75 dd                	jne    1110 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
    1133:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
    1138:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
    113b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
    113f:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1142:	50                   	push   %eax
    1143:	ff 75 08             	push   0x8(%ebp)
    1146:	e8 25 fe ff ff       	call   f70 <add_line>

    return 0;
}
    114b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    114e:	31 c0                	xor    %eax,%eax
    1150:	5b                   	pop    %ebx
    1151:	5e                   	pop    %esi
    1152:	5f                   	pop    %edi
    1153:	5d                   	pop    %ebp
    1154:	c3                   	ret    
    1155:	66 90                	xchg   %ax,%ax
    1157:	66 90                	xchg   %ax,%ax
    1159:	66 90                	xchg   %ax,%ax
    115b:	66 90                	xchg   %ax,%ax
    115d:	66 90                	xchg   %ax,%ax
    115f:	90                   	nop

00001160 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	56                   	push   %esi
    1164:	8b 75 08             	mov    0x8(%ebp),%esi
    1167:	53                   	push   %ebx
    1168:	bb 64 00 00 00       	mov    $0x64,%ebx
    116d:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
    1170:	83 ec 0c             	sub    $0xc,%esp
    1173:	56                   	push   %esi
    1174:	e8 67 ff ff ff       	call   10e0 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
    1179:	83 c4 10             	add    $0x10,%esp
    117c:	83 eb 01             	sub    $0x1,%ebx
    117f:	75 ef                	jne    1170 <io_bound+0x10>
    1181:	bb 32 00 00 00       	mov    $0x32,%ebx
    1186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    118d:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
    1190:	83 ec 0c             	sub    $0xc,%esp
    1193:	56                   	push   %esi
    1194:	e8 c7 fb ff ff       	call   d60 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
    1199:	83 c4 10             	add    $0x10,%esp
    119c:	83 eb 01             	sub    $0x1,%ebx
    119f:	75 ef                	jne    1190 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
    11a1:	83 ec 0c             	sub    $0xc,%esp
    11a4:	56                   	push   %esi
    11a5:	e8 69 f4 ff ff       	call   613 <unlink>
    11aa:	83 c4 10             	add    $0x10,%esp
    11ad:	85 c0                	test   %eax,%eax
    11af:	75 07                	jne    11b8 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
    11b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11b4:	5b                   	pop    %ebx
    11b5:	5e                   	pop    %esi
    11b6:	5d                   	pop    %ebp
    11b7:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
    11b8:	83 ec 08             	sub    $0x8,%esp
    11bb:	68 28 14 00 00       	push   $0x1428
    11c0:	6a 01                	push   $0x1
    11c2:	e8 59 f5 ff ff       	call   720 <printf>
    11c7:	83 c4 10             	add    $0x10,%esp
    11ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11cd:	5b                   	pop    %ebx
    11ce:	5e                   	pop    %esi
    11cf:	5d                   	pop    %ebp
    11d0:	c3                   	ret    
    11d1:	66 90                	xchg   %ax,%ax
    11d3:	66 90                	xchg   %ax,%ax
    11d5:	66 90                	xchg   %ax,%ax
    11d7:	66 90                	xchg   %ax,%ax
    11d9:	66 90                	xchg   %ax,%ax
    11db:	66 90                	xchg   %ax,%ax
    11dd:	66 90                	xchg   %ax,%ax
    11df:	90                   	nop

000011e0 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	56                   	push   %esi
    11e5:	53                   	push   %ebx
    11e6:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
    11ed:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    11f3:	83 0c 24 00          	orl    $0x0,(%esp)
    11f7:	39 c4                	cmp    %eax,%esp
    11f9:	75 f2                	jne    11ed <cpu_bound+0xd>
    11fb:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
    1201:	be e8 03 00 00       	mov    $0x3e8,%esi
    1206:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
    120c:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
    1212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
    1218:	83 ec 04             	sub    $0x4,%esp
    121b:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
    1221:	57                   	push   %edi
    1222:	50                   	push   %eax
    1223:	53                   	push   %ebx
    1224:	e8 e7 f9 ff ff       	call   c10 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
    1229:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
    122f:	89 04 24             	mov    %eax,(%esp)
    1232:	6a 00                	push   $0x0
    1234:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
    123a:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
    1240:	53                   	push   %ebx
    1241:	e8 6a f8 ff ff       	call   ab0 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
    1246:	83 c4 20             	add    $0x20,%esp
    1249:	83 ee 01             	sub    $0x1,%esi
    124c:	75 ca                	jne    1218 <cpu_bound+0x38>
    }
    124e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1251:	5b                   	pop    %ebx
    1252:	5e                   	pop    %esi
    1253:	5f                   	pop    %edi
    1254:	5d                   	pop    %ebp
    1255:	c3                   	ret    
