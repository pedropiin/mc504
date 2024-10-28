
_sh: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
  return 0;
}

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
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 91 00 00 00    	jg     b2 <main+0xb2>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 59 1b 00 00       	push   $0x1b59
      2b:	e8 33 0e 00 00       	call   e63 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 22 25 00 00 20 	cmpb   $0x20,0x2522
      47:	0f 84 88 00 00 00    	je     d5 <main+0xd5>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 c6 0d 00 00       	call   e1b <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 5e                	je     c0 <main+0xc0>
    wait();
      62:	e8 c4 0d 00 00       	call   e2b <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 b8 1a 00 00       	push   $0x1ab8
      6f:	6a 02                	push   $0x2
      71:	e8 0a 0f 00 00       	call   f80 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 20 25 00 00       	push   $0x2520
      82:	e8 09 0c 00 00       	call   c90 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 20 25 00 00       	push   $0x2520
      90:	e8 5b 0c 00 00       	call   cf0 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 20 25 00 00 	movzbl 0x2520,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 77                	je     11a <main+0x11a>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d 21 25 00 00 64 	cmpb   $0x64,0x2521
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
      close(fd);
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	50                   	push   %eax
      b6:	e8 90 0d 00 00       	call   e4b <close>
      break;
      bb:	83 c4 10             	add    $0x10,%esp
      be:	eb a7                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c0:	83 ec 0c             	sub    $0xc,%esp
      c3:	68 20 25 00 00       	push   $0x2520
      c8:	e8 93 0a 00 00       	call   b60 <parsecmd>
      cd:	89 04 24             	mov    %eax,(%esp)
      d0:	e8 db 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      d5:	83 ec 0c             	sub    $0xc,%esp
      d8:	68 20 25 00 00       	push   $0x2520
      dd:	e8 7e 0b 00 00       	call   c60 <strlen>
      if(chdir(buf+3) < 0)
      e2:	c7 04 24 23 25 00 00 	movl   $0x2523,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      e9:	c6 80 1f 25 00 00 00 	movb   $0x0,0x251f(%eax)
      if(chdir(buf+3) < 0)
      f0:	e8 9e 0d 00 00       	call   e93 <chdir>
      f5:	83 c4 10             	add    $0x10,%esp
      f8:	85 c0                	test   %eax,%eax
      fa:	0f 89 67 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     100:	51                   	push   %ecx
     101:	68 23 25 00 00       	push   $0x2523
     106:	68 61 1b 00 00       	push   $0x1b61
     10b:	6a 02                	push   $0x2
     10d:	e8 6e 0e 00 00       	call   f80 <printf>
     112:	83 c4 10             	add    $0x10,%esp
     115:	e9 4d ff ff ff       	jmp    67 <main+0x67>
  exit();
     11a:	e8 04 0d 00 00       	call   e23 <exit>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 bb 1a 00 00       	push   $0x1abb
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 75 0c             	mov    0xc(%ebp),%esi
     138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 b8 1a 00 00       	push   $0x1ab8
     143:	6a 02                	push   $0x2
     145:	e8 36 0e 00 00       	call   f80 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 3a 0b 00 00       	call   c90 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 91 0b 00 00       	call   cf0 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret    
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 55 1b 00 00       	push   $0x1b55
     17e:	6a 02                	push   $0x2
     180:	e8 fb 0d 00 00       	call   f80 <printf>
  exit();
     185:	e8 99 0c 00 00       	call   e23 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 80 0c 00 00       	call   e1b <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 bb 1a 00 00       	push   $0x1abb
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 42                	je     200 <runcmd+0x50>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e3 00 00 00    	ja     2aa <runcmd+0xfa>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 70 1b 00 00 	jmp    *0x1b70(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 29                	je     200 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 78 0c 00 00       	call   e5b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	push   0x4(%ebx)
     1e9:	68 c7 1a 00 00       	push   $0x1ac7
     1ee:	6a 02                	push   $0x2
     1f0:	e8 8b 0d 00 00       	call   f80 <printf>
    break;
     1f5:	83 c4 10             	add    $0x10,%esp
     1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ff:	90                   	nop
    exit();
     200:	e8 1e 0c 00 00       	call   e23 <exit>
    if(fork1() == 0)
     205:	e8 86 ff ff ff       	call   190 <fork1>
     20a:	85 c0                	test   %eax,%eax
     20c:	75 f2                	jne    200 <runcmd+0x50>
     20e:	e9 8c 00 00 00       	jmp    29f <runcmd+0xef>
    if(pipe(p) < 0)
     213:	83 ec 0c             	sub    $0xc,%esp
     216:	8d 45 f0             	lea    -0x10(%ebp),%eax
     219:	50                   	push   %eax
     21a:	e8 14 0c 00 00       	call   e33 <pipe>
     21f:	83 c4 10             	add    $0x10,%esp
     222:	85 c0                	test   %eax,%eax
     224:	0f 88 a2 00 00 00    	js     2cc <runcmd+0x11c>
    if(fork1() == 0){
     22a:	e8 61 ff ff ff       	call   190 <fork1>
     22f:	85 c0                	test   %eax,%eax
     231:	0f 84 a2 00 00 00    	je     2d9 <runcmd+0x129>
    if(fork1() == 0){
     237:	e8 54 ff ff ff       	call   190 <fork1>
     23c:	85 c0                	test   %eax,%eax
     23e:	0f 84 c3 00 00 00    	je     307 <runcmd+0x157>
    close(p[0]);
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	ff 75 f0             	push   -0x10(%ebp)
     24a:	e8 fc 0b 00 00       	call   e4b <close>
    close(p[1]);
     24f:	58                   	pop    %eax
     250:	ff 75 f4             	push   -0xc(%ebp)
     253:	e8 f3 0b 00 00       	call   e4b <close>
    wait();
     258:	e8 ce 0b 00 00       	call   e2b <wait>
    wait();
     25d:	e8 c9 0b 00 00       	call   e2b <wait>
    break;
     262:	83 c4 10             	add    $0x10,%esp
     265:	eb 99                	jmp    200 <runcmd+0x50>
    if(fork1() == 0)
     267:	e8 24 ff ff ff       	call   190 <fork1>
     26c:	85 c0                	test   %eax,%eax
     26e:	74 2f                	je     29f <runcmd+0xef>
    wait();
     270:	e8 b6 0b 00 00       	call   e2b <wait>
    runcmd(lcmd->right);
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	ff 73 08             	push   0x8(%ebx)
     27b:	e8 30 ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     280:	83 ec 0c             	sub    $0xc,%esp
     283:	ff 73 14             	push   0x14(%ebx)
     286:	e8 c0 0b 00 00       	call   e4b <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     28b:	58                   	pop    %eax
     28c:	5a                   	pop    %edx
     28d:	ff 73 10             	push   0x10(%ebx)
     290:	ff 73 08             	push   0x8(%ebx)
     293:	e8 cb 0b 00 00       	call   e63 <open>
     298:	83 c4 10             	add    $0x10,%esp
     29b:	85 c0                	test   %eax,%eax
     29d:	78 18                	js     2b7 <runcmd+0x107>
      runcmd(bcmd->cmd);
     29f:	83 ec 0c             	sub    $0xc,%esp
     2a2:	ff 73 04             	push   0x4(%ebx)
     2a5:	e8 06 ff ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2aa:	83 ec 0c             	sub    $0xc,%esp
     2ad:	68 c0 1a 00 00       	push   $0x1ac0
     2b2:	e8 b9 fe ff ff       	call   170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2b7:	51                   	push   %ecx
     2b8:	ff 73 08             	push   0x8(%ebx)
     2bb:	68 d7 1a 00 00       	push   $0x1ad7
     2c0:	6a 02                	push   $0x2
     2c2:	e8 b9 0c 00 00       	call   f80 <printf>
      exit();
     2c7:	e8 57 0b 00 00       	call   e23 <exit>
      panic("pipe");
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	68 e7 1a 00 00       	push   $0x1ae7
     2d4:	e8 97 fe ff ff       	call   170 <panic>
      close(1);
     2d9:	83 ec 0c             	sub    $0xc,%esp
     2dc:	6a 01                	push   $0x1
     2de:	e8 68 0b 00 00       	call   e4b <close>
      dup(p[1]);
     2e3:	58                   	pop    %eax
     2e4:	ff 75 f4             	push   -0xc(%ebp)
     2e7:	e8 af 0b 00 00       	call   e9b <dup>
      close(p[0]);
     2ec:	58                   	pop    %eax
     2ed:	ff 75 f0             	push   -0x10(%ebp)
     2f0:	e8 56 0b 00 00       	call   e4b <close>
      close(p[1]);
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f4             	push   -0xc(%ebp)
     2f9:	e8 4d 0b 00 00       	call   e4b <close>
      runcmd(pcmd->left);
     2fe:	5a                   	pop    %edx
     2ff:	ff 73 04             	push   0x4(%ebx)
     302:	e8 a9 fe ff ff       	call   1b0 <runcmd>
      close(0);
     307:	83 ec 0c             	sub    $0xc,%esp
     30a:	6a 00                	push   $0x0
     30c:	e8 3a 0b 00 00       	call   e4b <close>
      dup(p[0]);
     311:	5a                   	pop    %edx
     312:	ff 75 f0             	push   -0x10(%ebp)
     315:	e8 81 0b 00 00       	call   e9b <dup>
      close(p[0]);
     31a:	59                   	pop    %ecx
     31b:	ff 75 f0             	push   -0x10(%ebp)
     31e:	e8 28 0b 00 00       	call   e4b <close>
      close(p[1]);
     323:	58                   	pop    %eax
     324:	ff 75 f4             	push   -0xc(%ebp)
     327:	e8 1f 0b 00 00       	call   e4b <close>
      runcmd(pcmd->right);
     32c:	58                   	pop    %eax
     32d:	ff 73 08             	push   0x8(%ebx)
     330:	e8 7b fe ff ff       	call   1b0 <runcmd>
     335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 54                	push   $0x54
     349:	e8 62 0e 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 33 09 00 00       	call   c90 <memset>
  cmd->type = EXEC;
     35d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     363:	89 d8                	mov    %ebx,%eax
     365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     368:	c9                   	leave  
     369:	c3                   	ret    
     36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     377:	6a 18                	push   $0x18
     379:	e8 32 0e 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     37e:	83 c4 0c             	add    $0xc,%esp
     381:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	6a 00                	push   $0x0
     387:	50                   	push   %eax
     388:	e8 03 09 00 00       	call   c90 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     390:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     396:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     39f:	8b 45 10             	mov    0x10(%ebp),%eax
     3a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3a5:	8b 45 14             	mov    0x14(%ebp),%eax
     3a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3ab:	8b 45 18             	mov    0x18(%ebp),%eax
     3ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3b1:	89 d8                	mov    %ebx,%eax
     3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b6:	c9                   	leave  
     3b7:	c3                   	ret    
     3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bf:	90                   	nop

000003c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 0c                	push   $0xc
     3c9:	e8 e2 0d 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 b3 08 00 00       	call   c90 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ef:	89 d8                	mov    %ebx,%eax
     3f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f4:	c9                   	leave  
     3f5:	c3                   	ret    
     3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 a2 0d 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
     411:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     413:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 73 08 00 00       	call   c90 <memset>
  cmd->type = LIST;
  cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     420:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 08                	push   $0x8
     449:	e8 62 0d 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
     451:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     453:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 33 08 00 00       	call   c90 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     460:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     469:	89 d8                	mov    %ebx,%eax
     46b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     46e:	c9                   	leave  
     46f:	c3                   	ret    

00000470 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	57                   	push   %edi
     474:	56                   	push   %esi
     475:	53                   	push   %ebx
     476:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     479:	8b 45 08             	mov    0x8(%ebp),%eax
{
     47c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     47f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     482:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     484:	39 df                	cmp    %ebx,%edi
     486:	72 0f                	jb     497 <gettoken+0x27>
     488:	eb 25                	jmp    4af <gettoken+0x3f>
     48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     490:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     493:	39 fb                	cmp    %edi,%ebx
     495:	74 18                	je     4af <gettoken+0x3f>
     497:	0f be 07             	movsbl (%edi),%eax
     49a:	83 ec 08             	sub    $0x8,%esp
     49d:	50                   	push   %eax
     49e:	68 0c 25 00 00       	push   $0x250c
     4a3:	e8 08 08 00 00       	call   cb0 <strchr>
     4a8:	83 c4 10             	add    $0x10,%esp
     4ab:	85 c0                	test   %eax,%eax
     4ad:	75 e1                	jne    490 <gettoken+0x20>
  if(q)
     4af:	85 f6                	test   %esi,%esi
     4b1:	74 02                	je     4b5 <gettoken+0x45>
    *q = s;
     4b3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4b5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     4b8:	3c 3c                	cmp    $0x3c,%al
     4ba:	0f 8f d0 00 00 00    	jg     590 <gettoken+0x120>
     4c0:	3c 3a                	cmp    $0x3a,%al
     4c2:	0f 8f b4 00 00 00    	jg     57c <gettoken+0x10c>
     4c8:	84 c0                	test   %al,%al
     4ca:	75 44                	jne    510 <gettoken+0xa0>
     4cc:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ce:	8b 55 14             	mov    0x14(%ebp),%edx
     4d1:	85 d2                	test   %edx,%edx
     4d3:	74 05                	je     4da <gettoken+0x6a>
    *eq = s;
     4d5:	8b 45 14             	mov    0x14(%ebp),%eax
     4d8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4da:	39 df                	cmp    %ebx,%edi
     4dc:	72 09                	jb     4e7 <gettoken+0x77>
     4de:	eb 1f                	jmp    4ff <gettoken+0x8f>
    s++;
     4e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4e3:	39 fb                	cmp    %edi,%ebx
     4e5:	74 18                	je     4ff <gettoken+0x8f>
     4e7:	0f be 07             	movsbl (%edi),%eax
     4ea:	83 ec 08             	sub    $0x8,%esp
     4ed:	50                   	push   %eax
     4ee:	68 0c 25 00 00       	push   $0x250c
     4f3:	e8 b8 07 00 00       	call   cb0 <strchr>
     4f8:	83 c4 10             	add    $0x10,%esp
     4fb:	85 c0                	test   %eax,%eax
     4fd:	75 e1                	jne    4e0 <gettoken+0x70>
  *ps = s;
     4ff:	8b 45 08             	mov    0x8(%ebp),%eax
     502:	89 38                	mov    %edi,(%eax)
  return ret;
}
     504:	8d 65 f4             	lea    -0xc(%ebp),%esp
     507:	89 f0                	mov    %esi,%eax
     509:	5b                   	pop    %ebx
     50a:	5e                   	pop    %esi
     50b:	5f                   	pop    %edi
     50c:	5d                   	pop    %ebp
     50d:	c3                   	ret    
     50e:	66 90                	xchg   %ax,%ax
  switch(*s){
     510:	79 5e                	jns    570 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     512:	39 fb                	cmp    %edi,%ebx
     514:	77 34                	ja     54a <gettoken+0xda>
  if(eq)
     516:	8b 45 14             	mov    0x14(%ebp),%eax
     519:	be 61 00 00 00       	mov    $0x61,%esi
     51e:	85 c0                	test   %eax,%eax
     520:	75 b3                	jne    4d5 <gettoken+0x65>
     522:	eb db                	jmp    4ff <gettoken+0x8f>
     524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     528:	0f be 07             	movsbl (%edi),%eax
     52b:	83 ec 08             	sub    $0x8,%esp
     52e:	50                   	push   %eax
     52f:	68 04 25 00 00       	push   $0x2504
     534:	e8 77 07 00 00       	call   cb0 <strchr>
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	75 22                	jne    562 <gettoken+0xf2>
      s++;
     540:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     543:	39 fb                	cmp    %edi,%ebx
     545:	74 cf                	je     516 <gettoken+0xa6>
     547:	0f b6 07             	movzbl (%edi),%eax
     54a:	83 ec 08             	sub    $0x8,%esp
     54d:	0f be f0             	movsbl %al,%esi
     550:	56                   	push   %esi
     551:	68 0c 25 00 00       	push   $0x250c
     556:	e8 55 07 00 00       	call   cb0 <strchr>
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	85 c0                	test   %eax,%eax
     560:	74 c6                	je     528 <gettoken+0xb8>
    ret = 'a';
     562:	be 61 00 00 00       	mov    $0x61,%esi
     567:	e9 62 ff ff ff       	jmp    4ce <gettoken+0x5e>
     56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     570:	3c 26                	cmp    $0x26,%al
     572:	74 08                	je     57c <gettoken+0x10c>
     574:	8d 48 d8             	lea    -0x28(%eax),%ecx
     577:	80 f9 01             	cmp    $0x1,%cl
     57a:	77 96                	ja     512 <gettoken+0xa2>
  ret = *s;
     57c:	0f be f0             	movsbl %al,%esi
    s++;
     57f:	83 c7 01             	add    $0x1,%edi
    break;
     582:	e9 47 ff ff ff       	jmp    4ce <gettoken+0x5e>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
  switch(*s){
     590:	3c 3e                	cmp    $0x3e,%al
     592:	75 1c                	jne    5b0 <gettoken+0x140>
    if(*s == '>'){
     594:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
     598:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
     59b:	74 1c                	je     5b9 <gettoken+0x149>
    s++;
     59d:	89 c7                	mov    %eax,%edi
     59f:	be 3e 00 00 00       	mov    $0x3e,%esi
     5a4:	e9 25 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5b0:	3c 7c                	cmp    $0x7c,%al
     5b2:	74 c8                	je     57c <gettoken+0x10c>
     5b4:	e9 59 ff ff ff       	jmp    512 <gettoken+0xa2>
      s++;
     5b9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     5bc:	be 2b 00 00 00       	mov    $0x2b,%esi
     5c1:	e9 08 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	83 ec 0c             	sub    $0xc,%esp
     5d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5e1:	39 f3                	cmp    %esi,%ebx
     5e3:	72 12                	jb     5f7 <peek+0x27>
     5e5:	eb 28                	jmp    60f <peek+0x3f>
     5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ee:	66 90                	xchg   %ax,%ax
    s++;
     5f0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5f3:	39 de                	cmp    %ebx,%esi
     5f5:	74 18                	je     60f <peek+0x3f>
     5f7:	0f be 03             	movsbl (%ebx),%eax
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	50                   	push   %eax
     5fe:	68 0c 25 00 00       	push   $0x250c
     603:	e8 a8 06 00 00       	call   cb0 <strchr>
     608:	83 c4 10             	add    $0x10,%esp
     60b:	85 c0                	test   %eax,%eax
     60d:	75 e1                	jne    5f0 <peek+0x20>
  *ps = s;
     60f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     611:	0f be 03             	movsbl (%ebx),%eax
     614:	31 d2                	xor    %edx,%edx
     616:	84 c0                	test   %al,%al
     618:	75 0e                	jne    628 <peek+0x58>
}
     61a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61d:	89 d0                	mov    %edx,%eax
     61f:	5b                   	pop    %ebx
     620:	5e                   	pop    %esi
     621:	5f                   	pop    %edi
     622:	5d                   	pop    %ebp
     623:	c3                   	ret    
     624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     628:	83 ec 08             	sub    $0x8,%esp
     62b:	50                   	push   %eax
     62c:	ff 75 10             	push   0x10(%ebp)
     62f:	e8 7c 06 00 00       	call   cb0 <strchr>
     634:	83 c4 10             	add    $0x10,%esp
     637:	31 d2                	xor    %edx,%edx
     639:	85 c0                	test   %eax,%eax
     63b:	0f 95 c2             	setne  %dl
}
     63e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     641:	5b                   	pop    %ebx
     642:	89 d0                	mov    %edx,%eax
     644:	5e                   	pop    %esi
     645:	5f                   	pop    %edi
     646:	5d                   	pop    %ebp
     647:	c3                   	ret    
     648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     64f:	90                   	nop

00000650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 2c             	sub    $0x2c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     65f:	90                   	nop
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 09 1b 00 00       	push   $0x1b09
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 61 ff ff ff       	call   5d0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	0f 84 f6 00 00 00    	je     770 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     67a:	6a 00                	push   $0x0
     67c:	6a 00                	push   $0x0
     67e:	53                   	push   %ebx
     67f:	56                   	push   %esi
     680:	e8 eb fd ff ff       	call   470 <gettoken>
     685:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68e:	50                   	push   %eax
     68f:	53                   	push   %ebx
     690:	56                   	push   %esi
     691:	e8 da fd ff ff       	call   470 <gettoken>
     696:	83 c4 20             	add    $0x20,%esp
     699:	83 f8 61             	cmp    $0x61,%eax
     69c:	0f 85 d9 00 00 00    	jne    77b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6a2:	83 ff 3c             	cmp    $0x3c,%edi
     6a5:	74 69                	je     710 <parseredirs+0xc0>
     6a7:	83 ff 3e             	cmp    $0x3e,%edi
     6aa:	74 05                	je     6b1 <parseredirs+0x61>
     6ac:	83 ff 2b             	cmp    $0x2b,%edi
     6af:	75 af                	jne    660 <parseredirs+0x10>
  cmd = malloc(sizeof(*cmd));
     6b1:	83 ec 0c             	sub    $0xc,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6ba:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6bc:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bf:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6c2:	e8 e9 0a 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6c7:	83 c4 0c             	add    $0xc,%esp
     6ca:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6cc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6ce:	6a 00                	push   $0x0
     6d0:	50                   	push   %eax
     6d1:	e8 ba 05 00 00       	call   c90 <memset>
  cmd->type = REDIR;
     6d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6df:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6e2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6e8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6f5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6ff:	89 7d 08             	mov    %edi,0x8(%ebp)
     702:	e9 59 ff ff ff       	jmp    660 <parseredirs+0x10>
     707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70e:	66 90                	xchg   %ax,%ax
  cmd = malloc(sizeof(*cmd));
     710:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     713:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     716:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     719:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     71b:	89 55 d0             	mov    %edx,-0x30(%ebp)
     71e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     721:	e8 8a 0a 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     726:	83 c4 0c             	add    $0xc,%esp
     729:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     72b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     72d:	6a 00                	push   $0x0
     72f:	50                   	push   %eax
     730:	e8 5b 05 00 00       	call   c90 <memset>
  cmd->cmd = subcmd;
     735:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     73b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     73e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     747:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     74a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     74d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     750:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     753:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     75a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     761:	e9 fa fe ff ff       	jmp    660 <parseredirs+0x10>
     766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     770:	8b 45 08             	mov    0x8(%ebp),%eax
     773:	8d 65 f4             	lea    -0xc(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5f                   	pop    %edi
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret    
      panic("missing file for redirection");
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	68 ec 1a 00 00       	push   $0x1aec
     783:	e8 e8 f9 ff ff       	call   170 <panic>
     788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     78f:	90                   	nop

00000790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 30             	sub    $0x30,%esp
     799:	8b 75 08             	mov    0x8(%ebp),%esi
     79c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     79f:	68 0c 1b 00 00       	push   $0x1b0c
     7a4:	57                   	push   %edi
     7a5:	56                   	push   %esi
     7a6:	e8 25 fe ff ff       	call   5d0 <peek>
     7ab:	83 c4 10             	add    $0x10,%esp
     7ae:	85 c0                	test   %eax,%eax
     7b0:	0f 85 aa 00 00 00    	jne    860 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7b6:	83 ec 0c             	sub    $0xc,%esp
     7b9:	89 c3                	mov    %eax,%ebx
     7bb:	6a 54                	push   $0x54
     7bd:	e8 ee 09 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7c2:	83 c4 0c             	add    $0xc,%esp
     7c5:	6a 54                	push   $0x54
     7c7:	6a 00                	push   $0x0
     7c9:	50                   	push   %eax
     7ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7cd:	e8 be 04 00 00       	call   c90 <memset>
  cmd->type = EXEC;
     7d2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7d5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7de:	57                   	push   %edi
     7df:	56                   	push   %esi
     7e0:	50                   	push   %eax
     7e1:	e8 6a fe ff ff       	call   650 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7e6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7ec:	eb 15                	jmp    803 <parseexec+0x73>
     7ee:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7f0:	83 ec 04             	sub    $0x4,%esp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	ff 75 d4             	push   -0x2c(%ebp)
     7f8:	e8 53 fe ff ff       	call   650 <parseredirs>
     7fd:	83 c4 10             	add    $0x10,%esp
     800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     803:	83 ec 04             	sub    $0x4,%esp
     806:	68 23 1b 00 00       	push   $0x1b23
     80b:	57                   	push   %edi
     80c:	56                   	push   %esi
     80d:	e8 be fd ff ff       	call   5d0 <peek>
     812:	83 c4 10             	add    $0x10,%esp
     815:	85 c0                	test   %eax,%eax
     817:	75 5f                	jne    878 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     819:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     81c:	50                   	push   %eax
     81d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     820:	50                   	push   %eax
     821:	57                   	push   %edi
     822:	56                   	push   %esi
     823:	e8 48 fc ff ff       	call   470 <gettoken>
     828:	83 c4 10             	add    $0x10,%esp
     82b:	85 c0                	test   %eax,%eax
     82d:	74 49                	je     878 <parseexec+0xe8>
    if(tok != 'a')
     82f:	83 f8 61             	cmp    $0x61,%eax
     832:	75 62                	jne    896 <parseexec+0x106>
    cmd->argv[argc] = q;
     834:	8b 45 e0             	mov    -0x20(%ebp),%eax
     837:	8b 55 d0             	mov    -0x30(%ebp),%edx
     83a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     841:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     845:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     848:	83 fb 0a             	cmp    $0xa,%ebx
     84b:	75 a3                	jne    7f0 <parseexec+0x60>
      panic("too many args");
     84d:	83 ec 0c             	sub    $0xc,%esp
     850:	68 15 1b 00 00       	push   $0x1b15
     855:	e8 16 f9 ff ff       	call   170 <panic>
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     860:	89 7d 0c             	mov    %edi,0xc(%ebp)
     863:	89 75 08             	mov    %esi,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     866:	8d 65 f4             	lea    -0xc(%ebp),%esp
     869:	5b                   	pop    %ebx
     86a:	5e                   	pop    %esi
     86b:	5f                   	pop    %edi
     86c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     86d:	e9 ae 01 00 00       	jmp    a20 <parseblock>
     872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     878:	8b 45 d0             	mov    -0x30(%ebp),%eax
     87b:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     882:	00 
  cmd->eargv[argc] = 0;
     883:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     88a:	00 
}
     88b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	5b                   	pop    %ebx
     892:	5e                   	pop    %esi
     893:	5f                   	pop    %edi
     894:	5d                   	pop    %ebp
     895:	c3                   	ret    
      panic("syntax");
     896:	83 ec 0c             	sub    $0xc,%esp
     899:	68 0e 1b 00 00       	push   $0x1b0e
     89e:	e8 cd f8 ff ff       	call   170 <panic>
     8a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008b0 <parsepipe>:
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 14             	sub    $0x14,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
     8bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8bf:	57                   	push   %edi
     8c0:	56                   	push   %esi
     8c1:	e8 ca fe ff ff       	call   790 <parseexec>
  if(peek(ps, es, "|")){
     8c6:	83 c4 0c             	add    $0xc,%esp
     8c9:	68 28 1b 00 00       	push   $0x1b28
  cmd = parseexec(ps, es);
     8ce:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8d0:	57                   	push   %edi
     8d1:	56                   	push   %esi
     8d2:	e8 f9 fc ff ff       	call   5d0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 12                	jne    8f0 <parsepipe+0x40>
}
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	89 d8                	mov    %ebx,%eax
     8e3:	5b                   	pop    %ebx
     8e4:	5e                   	pop    %esi
     8e5:	5f                   	pop    %edi
     8e6:	5d                   	pop    %ebp
     8e7:	c3                   	ret    
     8e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ef:	90                   	nop
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 75 fb ff ff       	call   470 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	57                   	push   %edi
     8fe:	56                   	push   %esi
     8ff:	e8 ac ff ff ff       	call   8b0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     90d:	e8 9e 08 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     912:	83 c4 0c             	add    $0xc,%esp
     915:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     917:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     919:	6a 00                	push   $0x0
     91b:	50                   	push   %eax
     91c:	e8 6f 03 00 00       	call   c90 <memset>
  cmd->left = left;
     921:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     924:	83 c4 10             	add    $0x10,%esp
     927:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     92f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     931:	89 7e 08             	mov    %edi,0x8(%esi)
}
     934:	8d 65 f4             	lea    -0xc(%ebp),%esp
     937:	5b                   	pop    %ebx
     938:	5e                   	pop    %esi
     939:	5f                   	pop    %edi
     93a:	5d                   	pop    %ebp
     93b:	c3                   	ret    
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseline>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 24             	sub    $0x24,%esp
     949:	8b 75 08             	mov    0x8(%ebp),%esi
     94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     94f:	57                   	push   %edi
     950:	56                   	push   %esi
     951:	e8 5a ff ff ff       	call   8b0 <parsepipe>
  while(peek(ps, es, "&")){
     956:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     959:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     95b:	eb 3b                	jmp    998 <parseline+0x58>
     95d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 05 fb ff ff       	call   470 <gettoken>
  cmd = malloc(sizeof(*cmd));
     96b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     972:	e8 39 08 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     977:	83 c4 0c             	add    $0xc,%esp
     97a:	6a 08                	push   $0x8
     97c:	6a 00                	push   $0x0
     97e:	50                   	push   %eax
     97f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     982:	e8 09 03 00 00       	call   c90 <memset>
  cmd->type = BACK;
     987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     98a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     98d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     993:	89 5a 04             	mov    %ebx,0x4(%edx)
     996:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     998:	83 ec 04             	sub    $0x4,%esp
     99b:	68 2a 1b 00 00       	push   $0x1b2a
     9a0:	57                   	push   %edi
     9a1:	56                   	push   %esi
     9a2:	e8 29 fc ff ff       	call   5d0 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 b2                	jne    960 <parseline+0x20>
  if(peek(ps, es, ";")){
     9ae:	83 ec 04             	sub    $0x4,%esp
     9b1:	68 26 1b 00 00       	push   $0x1b26
     9b6:	57                   	push   %edi
     9b7:	56                   	push   %esi
     9b8:	e8 13 fc ff ff       	call   5d0 <peek>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	85 c0                	test   %eax,%eax
     9c2:	75 0c                	jne    9d0 <parseline+0x90>
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	89 d8                	mov    %ebx,%eax
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
     9cd:	c3                   	ret    
     9ce:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9d0:	6a 00                	push   $0x0
     9d2:	6a 00                	push   $0x0
     9d4:	57                   	push   %edi
     9d5:	56                   	push   %esi
     9d6:	e8 95 fa ff ff       	call   470 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	58                   	pop    %eax
     9dc:	5a                   	pop    %edx
     9dd:	57                   	push   %edi
     9de:	56                   	push   %esi
     9df:	e8 5c ff ff ff       	call   940 <parseline>
  cmd = malloc(sizeof(*cmd));
     9e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9ed:	e8 be 07 00 00       	call   11b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9f2:	83 c4 0c             	add    $0xc,%esp
     9f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9f9:	6a 00                	push   $0x0
     9fb:	50                   	push   %eax
     9fc:	e8 8f 02 00 00       	call   c90 <memset>
  cmd->left = left;
     a01:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a04:	83 c4 10             	add    $0x10,%esp
     a07:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a0f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a11:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret    
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseblock>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 10             	sub    $0x10,%esp
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a2f:	68 0c 1b 00 00       	push   $0x1b0c
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	e8 95 fb ff ff       	call   5d0 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	74 4a                	je     a8c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a42:	6a 00                	push   $0x0
     a44:	6a 00                	push   $0x0
     a46:	56                   	push   %esi
     a47:	53                   	push   %ebx
     a48:	e8 23 fa ff ff       	call   470 <gettoken>
  cmd = parseline(ps, es);
     a4d:	58                   	pop    %eax
     a4e:	5a                   	pop    %edx
     a4f:	56                   	push   %esi
     a50:	53                   	push   %ebx
     a51:	e8 ea fe ff ff       	call   940 <parseline>
  if(!peek(ps, es, ")"))
     a56:	83 c4 0c             	add    $0xc,%esp
     a59:	68 48 1b 00 00       	push   $0x1b48
  cmd = parseline(ps, es);
     a5e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a60:	56                   	push   %esi
     a61:	53                   	push   %ebx
     a62:	e8 69 fb ff ff       	call   5d0 <peek>
     a67:	83 c4 10             	add    $0x10,%esp
     a6a:	85 c0                	test   %eax,%eax
     a6c:	74 2b                	je     a99 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a6e:	6a 00                	push   $0x0
     a70:	6a 00                	push   $0x0
     a72:	56                   	push   %esi
     a73:	53                   	push   %ebx
     a74:	e8 f7 f9 ff ff       	call   470 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a79:	83 c4 0c             	add    $0xc,%esp
     a7c:	56                   	push   %esi
     a7d:	53                   	push   %ebx
     a7e:	57                   	push   %edi
     a7f:	e8 cc fb ff ff       	call   650 <parseredirs>
}
     a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a87:	5b                   	pop    %ebx
     a88:	5e                   	pop    %esi
     a89:	5f                   	pop    %edi
     a8a:	5d                   	pop    %ebp
     a8b:	c3                   	ret    
    panic("parseblock");
     a8c:	83 ec 0c             	sub    $0xc,%esp
     a8f:	68 2c 1b 00 00       	push   $0x1b2c
     a94:	e8 d7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a99:	83 ec 0c             	sub    $0xc,%esp
     a9c:	68 37 1b 00 00       	push   $0x1b37
     aa1:	e8 ca f6 ff ff       	call   170 <panic>
     aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	83 ec 04             	sub    $0x4,%esp
     ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aba:	85 db                	test   %ebx,%ebx
     abc:	0f 84 8e 00 00 00    	je     b50 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     ac2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ac5:	77 61                	ja     b28 <nulterminate+0x78>
     ac7:	8b 03                	mov    (%ebx),%eax
     ac9:	ff 24 85 88 1b 00 00 	jmp    *0x1b88(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	push   0x4(%ebx)
     ad6:	e8 d5 ff ff ff       	call   ab0 <nulterminate>
    nulterminate(lcmd->right);
     adb:	58                   	pop    %eax
     adc:	ff 73 08             	push   0x8(%ebx)
     adf:	e8 cc ff ff ff       	call   ab0 <nulterminate>
    break;
     ae4:	83 c4 10             	add    $0x10,%esp
     ae7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aec:	c9                   	leave  
     aed:	c3                   	ret    
     aee:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	ff 73 04             	push   0x4(%ebx)
     af6:	e8 b5 ff ff ff       	call   ab0 <nulterminate>
    break;
     afb:	89 d8                	mov    %ebx,%eax
     afd:	83 c4 10             	add    $0x10,%esp
}
     b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b03:	c9                   	leave  
     b04:	c3                   	ret    
     b05:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b0b:	8d 43 08             	lea    0x8(%ebx),%eax
     b0e:	85 c9                	test   %ecx,%ecx
     b10:	74 16                	je     b28 <nulterminate+0x78>
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b18:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b1b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b1e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b21:	8b 50 fc             	mov    -0x4(%eax),%edx
     b24:	85 d2                	test   %edx,%edx
     b26:	75 f0                	jne    b18 <nulterminate+0x68>
  switch(cmd->type){
     b28:	89 d8                	mov    %ebx,%eax
}
     b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b2d:	c9                   	leave  
     b2e:	c3                   	ret    
     b2f:	90                   	nop
    nulterminate(rcmd->cmd);
     b30:	83 ec 0c             	sub    $0xc,%esp
     b33:	ff 73 04             	push   0x4(%ebx)
     b36:	e8 75 ff ff ff       	call   ab0 <nulterminate>
    *rcmd->efile = 0;
     b3b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b3e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b41:	c6 00 00             	movb   $0x0,(%eax)
    break;
     b44:	89 d8                	mov    %ebx,%eax
}
     b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b49:	c9                   	leave  
     b4a:	c3                   	ret    
     b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b4f:	90                   	nop
    return 0;
     b50:	31 c0                	xor    %eax,%eax
     b52:	eb 95                	jmp    ae9 <nulterminate+0x39>
     b54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b5f:	90                   	nop

00000b60 <parsecmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
  cmd = parseline(&s, es);
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 eb 00 00 00       	call   c60 <strlen>
  cmd = parseline(&s, es);
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
  es = s + strlen(s);
     b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 c0 fd ff ff       	call   940 <parseline>
  peek(&s, es, "");
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 d6 1a 00 00       	push   $0x1ad6
  cmd = parseline(&s, es);
     b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 3f fa ff ff       	call   5d0 <peek>
  if(s != es){
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
  nulterminate(cmd);
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 0c ff ff ff       	call   ab0 <nulterminate>
}
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 4a 1b 00 00       	push   $0x1b4a
     bb5:	6a 02                	push   $0x2
     bb7:	e8 c4 03 00 00       	call   f80 <printf>
    panic("syntax");
     bbc:	c7 04 24 0e 1b 00 00 	movl   $0x1b0e,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax

00000bd0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     bd0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     bd1:	31 c0                	xor    %eax,%eax
{
     bd3:	89 e5                	mov    %esp,%ebp
     bd5:	53                   	push   %ebx
     bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     be0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     be4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     be7:	83 c0 01             	add    $0x1,%eax
     bea:	84 d2                	test   %dl,%dl
     bec:	75 f2                	jne    be0 <strcpy+0x10>
    ;
  return os;
}
     bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bf1:	89 c8                	mov    %ecx,%eax
     bf3:	c9                   	leave  
     bf4:	c3                   	ret    
     bf5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	53                   	push   %ebx
     c04:	8b 55 08             	mov    0x8(%ebp),%edx
     c07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c0a:	0f b6 02             	movzbl (%edx),%eax
     c0d:	84 c0                	test   %al,%al
     c0f:	75 17                	jne    c28 <strcmp+0x28>
     c11:	eb 3a                	jmp    c4d <strcmp+0x4d>
     c13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c17:	90                   	nop
     c18:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     c1c:	83 c2 01             	add    $0x1,%edx
     c1f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c22:	84 c0                	test   %al,%al
     c24:	74 1a                	je     c40 <strcmp+0x40>
    p++, q++;
     c26:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     c28:	0f b6 19             	movzbl (%ecx),%ebx
     c2b:	38 c3                	cmp    %al,%bl
     c2d:	74 e9                	je     c18 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     c2f:	29 d8                	sub    %ebx,%eax
}
     c31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c34:	c9                   	leave  
     c35:	c3                   	ret    
     c36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     c40:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c44:	31 c0                	xor    %eax,%eax
     c46:	29 d8                	sub    %ebx,%eax
}
     c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c4b:	c9                   	leave  
     c4c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     c4d:	0f b6 19             	movzbl (%ecx),%ebx
     c50:	31 c0                	xor    %eax,%eax
     c52:	eb db                	jmp    c2f <strcmp+0x2f>
     c54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c5f:	90                   	nop

00000c60 <strlen>:

uint
strlen(const char *s)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c66:	80 3a 00             	cmpb   $0x0,(%edx)
     c69:	74 15                	je     c80 <strlen+0x20>
     c6b:	31 c0                	xor    %eax,%eax
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
     c70:	83 c0 01             	add    $0x1,%eax
     c73:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c77:	89 c1                	mov    %eax,%ecx
     c79:	75 f5                	jne    c70 <strlen+0x10>
    ;
  return n;
}
     c7b:	89 c8                	mov    %ecx,%eax
     c7d:	5d                   	pop    %ebp
     c7e:	c3                   	ret    
     c7f:	90                   	nop
  for(n = 0; s[n]; n++)
     c80:	31 c9                	xor    %ecx,%ecx
}
     c82:	5d                   	pop    %ebp
     c83:	89 c8                	mov    %ecx,%eax
     c85:	c3                   	ret    
     c86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c8d:	8d 76 00             	lea    0x0(%esi),%esi

00000c90 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c97:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9d:	89 d7                	mov    %edx,%edi
     c9f:	fc                   	cld    
     ca0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ca2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     ca5:	89 d0                	mov    %edx,%eax
     ca7:	c9                   	leave  
     ca8:	c3                   	ret    
     ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cb0 <strchr>:

char*
strchr(const char *s, char c)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 45 08             	mov    0x8(%ebp),%eax
     cb6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     cba:	0f b6 10             	movzbl (%eax),%edx
     cbd:	84 d2                	test   %dl,%dl
     cbf:	75 12                	jne    cd3 <strchr+0x23>
     cc1:	eb 1d                	jmp    ce0 <strchr+0x30>
     cc3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cc7:	90                   	nop
     cc8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     ccc:	83 c0 01             	add    $0x1,%eax
     ccf:	84 d2                	test   %dl,%dl
     cd1:	74 0d                	je     ce0 <strchr+0x30>
    if(*s == c)
     cd3:	38 d1                	cmp    %dl,%cl
     cd5:	75 f1                	jne    cc8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     cd7:	5d                   	pop    %ebp
     cd8:	c3                   	ret    
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     ce0:	31 c0                	xor    %eax,%eax
}
     ce2:	5d                   	pop    %ebp
     ce3:	c3                   	ret    
     ce4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ceb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cef:	90                   	nop

00000cf0 <gets>:

char*
gets(char *buf, int max)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	57                   	push   %edi
     cf4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     cf5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     cf8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     cf9:	31 db                	xor    %ebx,%ebx
{
     cfb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     cfe:	eb 27                	jmp    d27 <gets+0x37>
    cc = read(0, &c, 1);
     d00:	83 ec 04             	sub    $0x4,%esp
     d03:	6a 01                	push   $0x1
     d05:	57                   	push   %edi
     d06:	6a 00                	push   $0x0
     d08:	e8 2e 01 00 00       	call   e3b <read>
    if(cc < 1)
     d0d:	83 c4 10             	add    $0x10,%esp
     d10:	85 c0                	test   %eax,%eax
     d12:	7e 1d                	jle    d31 <gets+0x41>
      break;
    buf[i++] = c;
     d14:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d18:	8b 55 08             	mov    0x8(%ebp),%edx
     d1b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d1f:	3c 0a                	cmp    $0xa,%al
     d21:	74 1d                	je     d40 <gets+0x50>
     d23:	3c 0d                	cmp    $0xd,%al
     d25:	74 19                	je     d40 <gets+0x50>
  for(i=0; i+1 < max; ){
     d27:	89 de                	mov    %ebx,%esi
     d29:	83 c3 01             	add    $0x1,%ebx
     d2c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d2f:	7c cf                	jl     d00 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     d31:	8b 45 08             	mov    0x8(%ebp),%eax
     d34:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     d38:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d3b:	5b                   	pop    %ebx
     d3c:	5e                   	pop    %esi
     d3d:	5f                   	pop    %edi
     d3e:	5d                   	pop    %ebp
     d3f:	c3                   	ret    
  buf[i] = '\0';
     d40:	8b 45 08             	mov    0x8(%ebp),%eax
     d43:	89 de                	mov    %ebx,%esi
     d45:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     d49:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d4c:	5b                   	pop    %ebx
     d4d:	5e                   	pop    %esi
     d4e:	5f                   	pop    %edi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d5f:	90                   	nop

00000d60 <stat>:

int
stat(const char *n, struct stat *st)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	56                   	push   %esi
     d64:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d65:	83 ec 08             	sub    $0x8,%esp
     d68:	6a 00                	push   $0x0
     d6a:	ff 75 08             	push   0x8(%ebp)
     d6d:	e8 f1 00 00 00       	call   e63 <open>
  if(fd < 0)
     d72:	83 c4 10             	add    $0x10,%esp
     d75:	85 c0                	test   %eax,%eax
     d77:	78 27                	js     da0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     d79:	83 ec 08             	sub    $0x8,%esp
     d7c:	ff 75 0c             	push   0xc(%ebp)
     d7f:	89 c3                	mov    %eax,%ebx
     d81:	50                   	push   %eax
     d82:	e8 f4 00 00 00       	call   e7b <fstat>
  close(fd);
     d87:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d8a:	89 c6                	mov    %eax,%esi
  close(fd);
     d8c:	e8 ba 00 00 00       	call   e4b <close>
  return r;
     d91:	83 c4 10             	add    $0x10,%esp
}
     d94:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d97:	89 f0                	mov    %esi,%eax
     d99:	5b                   	pop    %ebx
     d9a:	5e                   	pop    %esi
     d9b:	5d                   	pop    %ebp
     d9c:	c3                   	ret    
     d9d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     da0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     da5:	eb ed                	jmp    d94 <stat+0x34>
     da7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dae:	66 90                	xchg   %ax,%ax

00000db0 <atoi>:

int
atoi(const char *s)
{
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	53                   	push   %ebx
     db4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     db7:	0f be 02             	movsbl (%edx),%eax
     dba:	8d 48 d0             	lea    -0x30(%eax),%ecx
     dbd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     dc0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     dc5:	77 1e                	ja     de5 <atoi+0x35>
     dc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     dd0:	83 c2 01             	add    $0x1,%edx
     dd3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     dd6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     dda:	0f be 02             	movsbl (%edx),%eax
     ddd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     de0:	80 fb 09             	cmp    $0x9,%bl
     de3:	76 eb                	jbe    dd0 <atoi+0x20>
  return n;
}
     de5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     de8:	89 c8                	mov    %ecx,%eax
     dea:	c9                   	leave  
     deb:	c3                   	ret    
     dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000df0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	57                   	push   %edi
     df4:	8b 45 10             	mov    0x10(%ebp),%eax
     df7:	8b 55 08             	mov    0x8(%ebp),%edx
     dfa:	56                   	push   %esi
     dfb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dfe:	85 c0                	test   %eax,%eax
     e00:	7e 13                	jle    e15 <memmove+0x25>
     e02:	01 d0                	add    %edx,%eax
  dst = vdst;
     e04:	89 d7                	mov    %edx,%edi
     e06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e0d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     e10:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e11:	39 f8                	cmp    %edi,%eax
     e13:	75 fb                	jne    e10 <memmove+0x20>
  return vdst;
}
     e15:	5e                   	pop    %esi
     e16:	89 d0                	mov    %edx,%eax
     e18:	5f                   	pop    %edi
     e19:	5d                   	pop    %ebp
     e1a:	c3                   	ret    

00000e1b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e1b:	b8 01 00 00 00       	mov    $0x1,%eax
     e20:	cd 40                	int    $0x40
     e22:	c3                   	ret    

00000e23 <exit>:
SYSCALL(exit)
     e23:	b8 02 00 00 00       	mov    $0x2,%eax
     e28:	cd 40                	int    $0x40
     e2a:	c3                   	ret    

00000e2b <wait>:
SYSCALL(wait)
     e2b:	b8 03 00 00 00       	mov    $0x3,%eax
     e30:	cd 40                	int    $0x40
     e32:	c3                   	ret    

00000e33 <pipe>:
SYSCALL(pipe)
     e33:	b8 04 00 00 00       	mov    $0x4,%eax
     e38:	cd 40                	int    $0x40
     e3a:	c3                   	ret    

00000e3b <read>:
SYSCALL(read)
     e3b:	b8 05 00 00 00       	mov    $0x5,%eax
     e40:	cd 40                	int    $0x40
     e42:	c3                   	ret    

00000e43 <write>:
SYSCALL(write)
     e43:	b8 10 00 00 00       	mov    $0x10,%eax
     e48:	cd 40                	int    $0x40
     e4a:	c3                   	ret    

00000e4b <close>:
SYSCALL(close)
     e4b:	b8 15 00 00 00       	mov    $0x15,%eax
     e50:	cd 40                	int    $0x40
     e52:	c3                   	ret    

00000e53 <kill>:
SYSCALL(kill)
     e53:	b8 06 00 00 00       	mov    $0x6,%eax
     e58:	cd 40                	int    $0x40
     e5a:	c3                   	ret    

00000e5b <exec>:
SYSCALL(exec)
     e5b:	b8 07 00 00 00       	mov    $0x7,%eax
     e60:	cd 40                	int    $0x40
     e62:	c3                   	ret    

00000e63 <open>:
SYSCALL(open)
     e63:	b8 0f 00 00 00       	mov    $0xf,%eax
     e68:	cd 40                	int    $0x40
     e6a:	c3                   	ret    

00000e6b <mknod>:
SYSCALL(mknod)
     e6b:	b8 11 00 00 00       	mov    $0x11,%eax
     e70:	cd 40                	int    $0x40
     e72:	c3                   	ret    

00000e73 <unlink>:
SYSCALL(unlink)
     e73:	b8 12 00 00 00       	mov    $0x12,%eax
     e78:	cd 40                	int    $0x40
     e7a:	c3                   	ret    

00000e7b <fstat>:
SYSCALL(fstat)
     e7b:	b8 08 00 00 00       	mov    $0x8,%eax
     e80:	cd 40                	int    $0x40
     e82:	c3                   	ret    

00000e83 <link>:
SYSCALL(link)
     e83:	b8 13 00 00 00       	mov    $0x13,%eax
     e88:	cd 40                	int    $0x40
     e8a:	c3                   	ret    

00000e8b <mkdir>:
SYSCALL(mkdir)
     e8b:	b8 14 00 00 00       	mov    $0x14,%eax
     e90:	cd 40                	int    $0x40
     e92:	c3                   	ret    

00000e93 <chdir>:
SYSCALL(chdir)
     e93:	b8 09 00 00 00       	mov    $0x9,%eax
     e98:	cd 40                	int    $0x40
     e9a:	c3                   	ret    

00000e9b <dup>:
SYSCALL(dup)
     e9b:	b8 0a 00 00 00       	mov    $0xa,%eax
     ea0:	cd 40                	int    $0x40
     ea2:	c3                   	ret    

00000ea3 <getpid>:
SYSCALL(getpid)
     ea3:	b8 0b 00 00 00       	mov    $0xb,%eax
     ea8:	cd 40                	int    $0x40
     eaa:	c3                   	ret    

00000eab <sbrk>:
SYSCALL(sbrk)
     eab:	b8 0c 00 00 00       	mov    $0xc,%eax
     eb0:	cd 40                	int    $0x40
     eb2:	c3                   	ret    

00000eb3 <sleep>:
SYSCALL(sleep)
     eb3:	b8 0d 00 00 00       	mov    $0xd,%eax
     eb8:	cd 40                	int    $0x40
     eba:	c3                   	ret    

00000ebb <uptime>:
SYSCALL(uptime)
     ebb:	b8 0e 00 00 00       	mov    $0xe,%eax
     ec0:	cd 40                	int    $0x40
     ec2:	c3                   	ret    
     ec3:	66 90                	xchg   %ax,%ax
     ec5:	66 90                	xchg   %ax,%ax
     ec7:	66 90                	xchg   %ax,%ax
     ec9:	66 90                	xchg   %ax,%ax
     ecb:	66 90                	xchg   %ax,%ax
     ecd:	66 90                	xchg   %ax,%ax
     ecf:	90                   	nop

00000ed0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	57                   	push   %edi
     ed4:	56                   	push   %esi
     ed5:	53                   	push   %ebx
     ed6:	83 ec 3c             	sub    $0x3c,%esp
     ed9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     edc:	89 d1                	mov    %edx,%ecx
{
     ede:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     ee1:	85 d2                	test   %edx,%edx
     ee3:	0f 89 7f 00 00 00    	jns    f68 <printint+0x98>
     ee9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     eed:	74 79                	je     f68 <printint+0x98>
    neg = 1;
     eef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     ef6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     ef8:	31 db                	xor    %ebx,%ebx
     efa:	8d 75 d7             	lea    -0x29(%ebp),%esi
     efd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     f00:	89 c8                	mov    %ecx,%eax
     f02:	31 d2                	xor    %edx,%edx
     f04:	89 cf                	mov    %ecx,%edi
     f06:	f7 75 c4             	divl   -0x3c(%ebp)
     f09:	0f b6 92 00 1c 00 00 	movzbl 0x1c00(%edx),%edx
     f10:	89 45 c0             	mov    %eax,-0x40(%ebp)
     f13:	89 d8                	mov    %ebx,%eax
     f15:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     f18:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     f1b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     f1e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     f21:	76 dd                	jbe    f00 <printint+0x30>
  if(neg)
     f23:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     f26:	85 c9                	test   %ecx,%ecx
     f28:	74 0c                	je     f36 <printint+0x66>
    buf[i++] = '-';
     f2a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     f2f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     f31:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     f36:	8b 7d b8             	mov    -0x48(%ebp),%edi
     f39:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     f3d:	eb 07                	jmp    f46 <printint+0x76>
     f3f:	90                   	nop
    putc(fd, buf[i]);
     f40:	0f b6 13             	movzbl (%ebx),%edx
     f43:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     f46:	83 ec 04             	sub    $0x4,%esp
     f49:	88 55 d7             	mov    %dl,-0x29(%ebp)
     f4c:	6a 01                	push   $0x1
     f4e:	56                   	push   %esi
     f4f:	57                   	push   %edi
     f50:	e8 ee fe ff ff       	call   e43 <write>
  while(--i >= 0)
     f55:	83 c4 10             	add    $0x10,%esp
     f58:	39 de                	cmp    %ebx,%esi
     f5a:	75 e4                	jne    f40 <printint+0x70>
}
     f5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f5f:	5b                   	pop    %ebx
     f60:	5e                   	pop    %esi
     f61:	5f                   	pop    %edi
     f62:	5d                   	pop    %ebp
     f63:	c3                   	ret    
     f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     f68:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     f6f:	eb 87                	jmp    ef8 <printint+0x28>
     f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f7f:	90                   	nop

00000f80 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	57                   	push   %edi
     f84:	56                   	push   %esi
     f85:	53                   	push   %ebx
     f86:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
     f8c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
     f8f:	0f b6 13             	movzbl (%ebx),%edx
     f92:	84 d2                	test   %dl,%dl
     f94:	74 6a                	je     1000 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
     f96:	8d 45 10             	lea    0x10(%ebp),%eax
     f99:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     f9c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
     f9f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
     fa1:	89 45 d0             	mov    %eax,-0x30(%ebp)
     fa4:	eb 36                	jmp    fdc <printf+0x5c>
     fa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fad:	8d 76 00             	lea    0x0(%esi),%esi
     fb0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     fb3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
     fb8:	83 f8 25             	cmp    $0x25,%eax
     fbb:	74 15                	je     fd2 <printf+0x52>
  write(fd, &c, 1);
     fbd:	83 ec 04             	sub    $0x4,%esp
     fc0:	88 55 e7             	mov    %dl,-0x19(%ebp)
     fc3:	6a 01                	push   $0x1
     fc5:	57                   	push   %edi
     fc6:	56                   	push   %esi
     fc7:	e8 77 fe ff ff       	call   e43 <write>
     fcc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
     fcf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     fd2:	0f b6 13             	movzbl (%ebx),%edx
     fd5:	83 c3 01             	add    $0x1,%ebx
     fd8:	84 d2                	test   %dl,%dl
     fda:	74 24                	je     1000 <printf+0x80>
    c = fmt[i] & 0xff;
     fdc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
     fdf:	85 c9                	test   %ecx,%ecx
     fe1:	74 cd                	je     fb0 <printf+0x30>
      }
    } else if(state == '%'){
     fe3:	83 f9 25             	cmp    $0x25,%ecx
     fe6:	75 ea                	jne    fd2 <printf+0x52>
      if(c == 'd'){
     fe8:	83 f8 25             	cmp    $0x25,%eax
     feb:	0f 84 07 01 00 00    	je     10f8 <printf+0x178>
     ff1:	83 e8 63             	sub    $0x63,%eax
     ff4:	83 f8 15             	cmp    $0x15,%eax
     ff7:	77 17                	ja     1010 <printf+0x90>
     ff9:	ff 24 85 a8 1b 00 00 	jmp    *0x1ba8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1000:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1003:	5b                   	pop    %ebx
    1004:	5e                   	pop    %esi
    1005:	5f                   	pop    %edi
    1006:	5d                   	pop    %ebp
    1007:	c3                   	ret    
    1008:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100f:	90                   	nop
  write(fd, &c, 1);
    1010:	83 ec 04             	sub    $0x4,%esp
    1013:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1016:	6a 01                	push   $0x1
    1018:	57                   	push   %edi
    1019:	56                   	push   %esi
    101a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    101e:	e8 20 fe ff ff       	call   e43 <write>
        putc(fd, c);
    1023:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1027:	83 c4 0c             	add    $0xc,%esp
    102a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    102d:	6a 01                	push   $0x1
    102f:	57                   	push   %edi
    1030:	56                   	push   %esi
    1031:	e8 0d fe ff ff       	call   e43 <write>
        putc(fd, c);
    1036:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1039:	31 c9                	xor    %ecx,%ecx
    103b:	eb 95                	jmp    fd2 <printf+0x52>
    103d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1040:	83 ec 0c             	sub    $0xc,%esp
    1043:	b9 10 00 00 00       	mov    $0x10,%ecx
    1048:	6a 00                	push   $0x0
    104a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    104d:	8b 10                	mov    (%eax),%edx
    104f:	89 f0                	mov    %esi,%eax
    1051:	e8 7a fe ff ff       	call   ed0 <printint>
        ap++;
    1056:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    105a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    105d:	31 c9                	xor    %ecx,%ecx
    105f:	e9 6e ff ff ff       	jmp    fd2 <printf+0x52>
    1064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1068:	8b 45 d0             	mov    -0x30(%ebp),%eax
    106b:	8b 10                	mov    (%eax),%edx
        ap++;
    106d:	83 c0 04             	add    $0x4,%eax
    1070:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1073:	85 d2                	test   %edx,%edx
    1075:	0f 84 8d 00 00 00    	je     1108 <printf+0x188>
        while(*s != 0){
    107b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    107e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1080:	84 c0                	test   %al,%al
    1082:	0f 84 4a ff ff ff    	je     fd2 <printf+0x52>
    1088:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    108b:	89 d3                	mov    %edx,%ebx
    108d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1090:	83 ec 04             	sub    $0x4,%esp
          s++;
    1093:	83 c3 01             	add    $0x1,%ebx
    1096:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1099:	6a 01                	push   $0x1
    109b:	57                   	push   %edi
    109c:	56                   	push   %esi
    109d:	e8 a1 fd ff ff       	call   e43 <write>
        while(*s != 0){
    10a2:	0f b6 03             	movzbl (%ebx),%eax
    10a5:	83 c4 10             	add    $0x10,%esp
    10a8:	84 c0                	test   %al,%al
    10aa:	75 e4                	jne    1090 <printf+0x110>
      state = 0;
    10ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    10af:	31 c9                	xor    %ecx,%ecx
    10b1:	e9 1c ff ff ff       	jmp    fd2 <printf+0x52>
    10b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    10c0:	83 ec 0c             	sub    $0xc,%esp
    10c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    10c8:	6a 01                	push   $0x1
    10ca:	e9 7b ff ff ff       	jmp    104a <printf+0xca>
    10cf:	90                   	nop
        putc(fd, *ap);
    10d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    10d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    10d6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    10d8:	6a 01                	push   $0x1
    10da:	57                   	push   %edi
    10db:	56                   	push   %esi
        putc(fd, *ap);
    10dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    10df:	e8 5f fd ff ff       	call   e43 <write>
        ap++;
    10e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    10e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10eb:	31 c9                	xor    %ecx,%ecx
    10ed:	e9 e0 fe ff ff       	jmp    fd2 <printf+0x52>
    10f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    10f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    10fb:	83 ec 04             	sub    $0x4,%esp
    10fe:	e9 2a ff ff ff       	jmp    102d <printf+0xad>
    1103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1107:	90                   	nop
          s = "(null)";
    1108:	ba a0 1b 00 00       	mov    $0x1ba0,%edx
        while(*s != 0){
    110d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1110:	b8 28 00 00 00       	mov    $0x28,%eax
    1115:	89 d3                	mov    %edx,%ebx
    1117:	e9 74 ff ff ff       	jmp    1090 <printf+0x110>
    111c:	66 90                	xchg   %ax,%ax
    111e:	66 90                	xchg   %ax,%ax

00001120 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1120:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1121:	a1 84 25 00 00       	mov    0x2584,%eax
{
    1126:	89 e5                	mov    %esp,%ebp
    1128:	57                   	push   %edi
    1129:	56                   	push   %esi
    112a:	53                   	push   %ebx
    112b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    112e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1138:	89 c2                	mov    %eax,%edx
    113a:	8b 00                	mov    (%eax),%eax
    113c:	39 ca                	cmp    %ecx,%edx
    113e:	73 30                	jae    1170 <free+0x50>
    1140:	39 c1                	cmp    %eax,%ecx
    1142:	72 04                	jb     1148 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1144:	39 c2                	cmp    %eax,%edx
    1146:	72 f0                	jb     1138 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1148:	8b 73 fc             	mov    -0x4(%ebx),%esi
    114b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    114e:	39 f8                	cmp    %edi,%eax
    1150:	74 30                	je     1182 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1152:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1155:	8b 42 04             	mov    0x4(%edx),%eax
    1158:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    115b:	39 f1                	cmp    %esi,%ecx
    115d:	74 3a                	je     1199 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    115f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1161:	5b                   	pop    %ebx
  freep = p;
    1162:	89 15 84 25 00 00    	mov    %edx,0x2584
}
    1168:	5e                   	pop    %esi
    1169:	5f                   	pop    %edi
    116a:	5d                   	pop    %ebp
    116b:	c3                   	ret    
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1170:	39 c2                	cmp    %eax,%edx
    1172:	72 c4                	jb     1138 <free+0x18>
    1174:	39 c1                	cmp    %eax,%ecx
    1176:	73 c0                	jae    1138 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1178:	8b 73 fc             	mov    -0x4(%ebx),%esi
    117b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    117e:	39 f8                	cmp    %edi,%eax
    1180:	75 d0                	jne    1152 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1182:	03 70 04             	add    0x4(%eax),%esi
    1185:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1188:	8b 02                	mov    (%edx),%eax
    118a:	8b 00                	mov    (%eax),%eax
    118c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    118f:	8b 42 04             	mov    0x4(%edx),%eax
    1192:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1195:	39 f1                	cmp    %esi,%ecx
    1197:	75 c6                	jne    115f <free+0x3f>
    p->s.size += bp->s.size;
    1199:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    119c:	89 15 84 25 00 00    	mov    %edx,0x2584
    p->s.size += bp->s.size;
    11a2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    11a5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    11a8:	89 0a                	mov    %ecx,(%edx)
}
    11aa:	5b                   	pop    %ebx
    11ab:	5e                   	pop    %esi
    11ac:	5f                   	pop    %edi
    11ad:	5d                   	pop    %ebp
    11ae:	c3                   	ret    
    11af:	90                   	nop

000011b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
    11b5:	53                   	push   %ebx
    11b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    11bc:	8b 3d 84 25 00 00    	mov    0x2584,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11c2:	8d 70 07             	lea    0x7(%eax),%esi
    11c5:	c1 ee 03             	shr    $0x3,%esi
    11c8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    11cb:	85 ff                	test   %edi,%edi
    11cd:	0f 84 9d 00 00 00    	je     1270 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11d3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    11d5:	8b 4a 04             	mov    0x4(%edx),%ecx
    11d8:	39 f1                	cmp    %esi,%ecx
    11da:	73 6a                	jae    1246 <malloc+0x96>
    11dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    11e1:	39 de                	cmp    %ebx,%esi
    11e3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    11e6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    11ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    11f0:	eb 17                	jmp    1209 <malloc+0x59>
    11f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    11fa:	8b 48 04             	mov    0x4(%eax),%ecx
    11fd:	39 f1                	cmp    %esi,%ecx
    11ff:	73 4f                	jae    1250 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1201:	8b 3d 84 25 00 00    	mov    0x2584,%edi
    1207:	89 c2                	mov    %eax,%edx
    1209:	39 d7                	cmp    %edx,%edi
    120b:	75 eb                	jne    11f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    120d:	83 ec 0c             	sub    $0xc,%esp
    1210:	ff 75 e4             	push   -0x1c(%ebp)
    1213:	e8 93 fc ff ff       	call   eab <sbrk>
  if(p == (char*)-1)
    1218:	83 c4 10             	add    $0x10,%esp
    121b:	83 f8 ff             	cmp    $0xffffffff,%eax
    121e:	74 1c                	je     123c <malloc+0x8c>
  hp->s.size = nu;
    1220:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1223:	83 ec 0c             	sub    $0xc,%esp
    1226:	83 c0 08             	add    $0x8,%eax
    1229:	50                   	push   %eax
    122a:	e8 f1 fe ff ff       	call   1120 <free>
  return freep;
    122f:	8b 15 84 25 00 00    	mov    0x2584,%edx
      if((p = morecore(nunits)) == 0)
    1235:	83 c4 10             	add    $0x10,%esp
    1238:	85 d2                	test   %edx,%edx
    123a:	75 bc                	jne    11f8 <malloc+0x48>
        return 0;
  }
}
    123c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    123f:	31 c0                	xor    %eax,%eax
}
    1241:	5b                   	pop    %ebx
    1242:	5e                   	pop    %esi
    1243:	5f                   	pop    %edi
    1244:	5d                   	pop    %ebp
    1245:	c3                   	ret    
    if(p->s.size >= nunits){
    1246:	89 d0                	mov    %edx,%eax
    1248:	89 fa                	mov    %edi,%edx
    124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1250:	39 ce                	cmp    %ecx,%esi
    1252:	74 4c                	je     12a0 <malloc+0xf0>
        p->s.size -= nunits;
    1254:	29 f1                	sub    %esi,%ecx
    1256:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1259:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    125c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    125f:	89 15 84 25 00 00    	mov    %edx,0x2584
}
    1265:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1268:	83 c0 08             	add    $0x8,%eax
}
    126b:	5b                   	pop    %ebx
    126c:	5e                   	pop    %esi
    126d:	5f                   	pop    %edi
    126e:	5d                   	pop    %ebp
    126f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1270:	c7 05 84 25 00 00 88 	movl   $0x2588,0x2584
    1277:	25 00 00 
    base.s.size = 0;
    127a:	bf 88 25 00 00       	mov    $0x2588,%edi
    base.s.ptr = freep = prevp = &base;
    127f:	c7 05 88 25 00 00 88 	movl   $0x2588,0x2588
    1286:	25 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1289:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    128b:	c7 05 8c 25 00 00 00 	movl   $0x0,0x258c
    1292:	00 00 00 
    if(p->s.size >= nunits){
    1295:	e9 42 ff ff ff       	jmp    11dc <malloc+0x2c>
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    12a0:	8b 08                	mov    (%eax),%ecx
    12a2:	89 0a                	mov    %ecx,(%edx)
    12a4:	eb b9                	jmp    125f <malloc+0xaf>
    12a6:	66 90                	xchg   %ax,%ax
    12a8:	66 90                	xchg   %ax,%ax
    12aa:	66 90                	xchg   %ax,%ax
    12ac:	66 90                	xchg   %ax,%ax
    12ae:	66 90                	xchg   %ax,%ax

000012b0 <min_distance_vertex>:

#include "dijkstra.h"
#include "types.h"
#include "user.h"

int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	57                   	push   %edi
    12b4:	56                   	push   %esi
    12b5:	53                   	push   %ebx
    12b6:	83 ec 04             	sub    $0x4,%esp
    12b9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12bc:	8b 7d 08             	mov    0x8(%ebp),%edi
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
    12bf:	85 db                	test   %ebx,%ebx
    12c1:	7e 3d                	jle    1300 <min_distance_vertex+0x50>
    int min_idx = 0;
    12c3:	31 f6                	xor    %esi,%esi
    for (int i = 0; i < num_vertices; i++) {
    12c5:	31 c0                	xor    %eax,%eax
    int min_dist = INF;
    12c7:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    12cc:	89 75 f0             	mov    %esi,-0x10(%ebp)
    12cf:	90                   	nop
        if (dist[i] < min_dist && !visited[i]) {
    12d0:	8b 14 87             	mov    (%edi,%eax,4),%edx
    12d3:	39 ca                	cmp    %ecx,%edx
    12d5:	7d 14                	jge    12eb <min_distance_vertex+0x3b>
    12d7:	8b 75 0c             	mov    0xc(%ebp),%esi
    12da:	8b 34 86             	mov    (%esi,%eax,4),%esi
    12dd:	85 f6                	test   %esi,%esi
    12df:	8b 75 f0             	mov    -0x10(%ebp),%esi
    12e2:	0f 44 ca             	cmove  %edx,%ecx
    12e5:	0f 44 f0             	cmove  %eax,%esi
    12e8:	89 75 f0             	mov    %esi,-0x10(%ebp)
    for (int i = 0; i < num_vertices; i++) {
    12eb:	83 c0 01             	add    $0x1,%eax
    12ee:	39 c3                	cmp    %eax,%ebx
    12f0:	75 de                	jne    12d0 <min_distance_vertex+0x20>
    12f2:	8b 75 f0             	mov    -0x10(%ebp),%esi
            min_idx = i;
        }
    }

    return min_idx;
}
    12f5:	83 c4 04             	add    $0x4,%esp
    12f8:	5b                   	pop    %ebx
    12f9:	89 f0                	mov    %esi,%eax
    12fb:	5e                   	pop    %esi
    12fc:	5f                   	pop    %edi
    12fd:	5d                   	pop    %ebp
    12fe:	c3                   	ret    
    12ff:	90                   	nop
    1300:	83 c4 04             	add    $0x4,%esp
    int min_idx = 0;
    1303:	31 f6                	xor    %esi,%esi
}
    1305:	5b                   	pop    %ebx
    1306:	89 f0                	mov    %esi,%eax
    1308:	5e                   	pop    %esi
    1309:	5f                   	pop    %edi
    130a:	5d                   	pop    %ebp
    130b:	c3                   	ret    
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001310 <dijkstra>:

void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	53                   	push   %ebx
    1316:	83 ec 1c             	sub    $0x1c,%esp
    // --- Initializing distance array and visited array
    int visited[num_vertices];
    1319:	8b 45 0c             	mov    0xc(%ebp),%eax
void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
    131c:	8b 5d 18             	mov    0x18(%ebp),%ebx
    int visited[num_vertices];
    131f:	89 e6                	mov    %esp,%esi
    1321:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
    1328:	8d 41 0f             	lea    0xf(%ecx),%eax
    132b:	89 c2                	mov    %eax,%edx
    132d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    1332:	29 c6                	sub    %eax,%esi
    1334:	83 e2 f0             	and    $0xfffffff0,%edx
    1337:	39 f4                	cmp    %esi,%esp
    1339:	74 12                	je     134d <dijkstra+0x3d>
    133b:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    1341:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
    1348:	00 
    1349:	39 f4                	cmp    %esi,%esp
    134b:	75 ee                	jne    133b <dijkstra+0x2b>
    134d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1353:	29 d4                	sub    %edx,%esp
    1355:	85 d2                	test   %edx,%edx
    1357:	0f 85 ef 00 00 00    	jne    144c <dijkstra+0x13c>
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;
    135d:	8b 45 14             	mov    0x14(%ebp),%eax
    int visited[num_vertices];
    1360:	89 e7                	mov    %esp,%edi
    dist[src] = 0;
    1362:	8d 34 83             	lea    (%ebx,%eax,4),%esi
    for (int i = 0; i < num_vertices; i++) {
    1365:	8b 45 0c             	mov    0xc(%ebp),%eax
    1368:	85 c0                	test   %eax,%eax
    136a:	0f 8e e6 00 00 00    	jle    1456 <dijkstra+0x146>
    1370:	89 d8                	mov    %ebx,%eax
    1372:	89 fa                	mov    %edi,%edx
    1374:	01 d9                	add    %ebx,%ecx
    1376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    137d:	8d 76 00             	lea    0x0(%esi),%esi
        dist[i] = INF;
    1380:	c7 00 ff ff ff 7f    	movl   $0x7fffffff,(%eax)
    for (int i = 0; i < num_vertices; i++) {
    1386:	83 c0 04             	add    $0x4,%eax
    1389:	83 c2 04             	add    $0x4,%edx
        visited[i] = 0;
    138c:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
    for (int i = 0; i < num_vertices; i++) {
    1393:	39 c8                	cmp    %ecx,%eax
    1395:	75 e9                	jne    1380 <dijkstra+0x70>
    dist[src] = 0;
    1397:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    139d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    13a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int min_idx = 0;
    13a8:	31 f6                	xor    %esi,%esi
    int min_dist = INF;
    13aa:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    for (int i = 0; i < num_vertices; i++) {
    13af:	31 c0                	xor    %eax,%eax
    13b1:	eb 07                	jmp    13ba <dijkstra+0xaa>
    13b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13b7:	90                   	nop
    13b8:	89 d0                	mov    %edx,%eax
        if (dist[i] < min_dist && !visited[i]) {
    13ba:	8b 14 83             	mov    (%ebx,%eax,4),%edx
    13bd:	39 ca                	cmp    %ecx,%edx
    13bf:	7d 0a                	jge    13cb <dijkstra+0xbb>
    13c1:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
    13c5:	0f 44 f0             	cmove  %eax,%esi
    13c8:	0f 44 ca             	cmove  %edx,%ecx
    for (int i = 0; i < num_vertices; i++) {
    13cb:	8d 50 01             	lea    0x1(%eax),%edx
    13ce:	39 55 0c             	cmp    %edx,0xc(%ebp)
    13d1:	75 e5                	jne    13b8 <dijkstra+0xa8>
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
    13d3:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
        visited[min_v] = 1;
    13d6:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
        if (dist[min_v] != INF) {
    13dd:	81 39 ff ff ff 7f    	cmpl   $0x7fffffff,(%ecx)
    13e3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    13e6:	75 18                	jne    1400 <dijkstra+0xf0>
    for (int _ = 0; _ < num_vertices; _++) {
    13e8:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    13eb:	8d 56 01             	lea    0x1(%esi),%edx
    13ee:	39 c6                	cmp    %eax,%esi
    13f0:	74 52                	je     1444 <dijkstra+0x134>
    13f2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    13f5:	eb b1                	jmp    13a8 <dijkstra+0x98>
    13f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13fe:	66 90                	xchg   %ax,%ax
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
    1400:	69 f6 20 03 00 00    	imul   $0x320,%esi,%esi
    1406:	89 5d dc             	mov    %ebx,-0x24(%ebp)
    1409:	03 75 08             	add    0x8(%ebp),%esi
            for (int i = 0; i < num_vertices; i++) {
    140c:	31 d2                	xor    %edx,%edx
    140e:	eb 02                	jmp    1412 <dijkstra+0x102>
    1410:	89 ca                	mov    %ecx,%edx
                if (graph[min_v][i] != 0) {
    1412:	8b 0c 96             	mov    (%esi,%edx,4),%ecx
    1415:	85 c9                	test   %ecx,%ecx
    1417:	74 17                	je     1430 <dijkstra+0x120>
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
    1419:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
    141c:	85 db                	test   %ebx,%ebx
    141e:	75 10                	jne    1430 <dijkstra+0x120>
    1420:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    1423:	03 0b                	add    (%ebx),%ecx
    1425:	8b 5d dc             	mov    -0x24(%ebp),%ebx
    1428:	39 0c 93             	cmp    %ecx,(%ebx,%edx,4)
    142b:	7e 03                	jle    1430 <dijkstra+0x120>
                        dist[i] = dist[min_v] + graph[min_v][i];
    142d:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
            for (int i = 0; i < num_vertices; i++) {
    1430:	8d 4a 01             	lea    0x1(%edx),%ecx
    1433:	39 c2                	cmp    %eax,%edx
    1435:	75 d9                	jne    1410 <dijkstra+0x100>
    for (int _ = 0; _ < num_vertices; _++) {
    1437:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    143a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
    143d:	8d 56 01             	lea    0x1(%esi),%edx
    1440:	39 c6                	cmp    %eax,%esi
    1442:	75 ae                	jne    13f2 <dijkstra+0xe2>
                    }
                }
            }
        }
    }
    1444:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1447:	5b                   	pop    %ebx
    1448:	5e                   	pop    %esi
    1449:	5f                   	pop    %edi
    144a:	5d                   	pop    %ebp
    144b:	c3                   	ret    
    int visited[num_vertices];
    144c:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
    1451:	e9 07 ff ff ff       	jmp    135d <dijkstra+0x4d>
    dist[src] = 0;
    1456:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    145c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    145f:	5b                   	pop    %ebx
    1460:	5e                   	pop    %esi
    1461:	5f                   	pop    %edi
    1462:	5d                   	pop    %ebp
    1463:	c3                   	ret    
    1464:	66 90                	xchg   %ax,%ax
    1466:	66 90                	xchg   %ax,%ax
    1468:	66 90                	xchg   %ax,%ax
    146a:	66 90                	xchg   %ax,%ax
    146c:	66 90                	xchg   %ax,%ax
    146e:	66 90                	xchg   %ax,%ax

00001470 <gen_random_digraph>:
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
    1474:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
    1479:	56                   	push   %esi
    147a:	53                   	push   %ebx
    147b:	83 ec 0c             	sub    $0xc,%esp
    147e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    1481:	8b 75 08             	mov    0x8(%ebp),%esi
    *num_vertices = random() % MAX_VERT;
    1484:	e8 f7 00 00 00       	call   1580 <random>
    1489:	89 c1                	mov    %eax,%ecx
    148b:	f7 ef                	imul   %edi
    148d:	89 c8                	mov    %ecx,%eax
    148f:	c1 f8 1f             	sar    $0x1f,%eax
    1492:	c1 fa 06             	sar    $0x6,%edx
    1495:	29 c2                	sub    %eax,%edx
    1497:	69 c2 c8 00 00 00    	imul   $0xc8,%edx,%eax
    149d:	29 c1                	sub    %eax,%ecx
    149f:	83 f9 63             	cmp    $0x63,%ecx
    14a2:	89 ca                	mov    %ecx,%edx
    14a4:	8d 41 64             	lea    0x64(%ecx),%eax
    14a7:	0f 4e d0             	cmovle %eax,%edx
    14aa:	89 13                	mov    %edx,(%ebx)
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
    14ac:	e8 cf 00 00 00       	call   1580 <random>
    14b1:	89 c1                	mov    %eax,%ecx
    14b3:	f7 ef                	imul   %edi
    14b5:	89 c8                	mov    %ecx,%eax
    14b7:	c1 f8 1f             	sar    $0x1f,%eax
    14ba:	c1 fa 07             	sar    $0x7,%edx
    14bd:	29 c2                	sub    %eax,%edx
    14bf:	69 c2 90 01 00 00    	imul   $0x190,%edx,%eax
    14c5:	29 c1                	sub    %eax,%ecx
    14c7:	8d 41 32             	lea    0x32(%ecx),%eax
    14ca:	89 ca                	mov    %ecx,%edx
    14cc:	83 f9 31             	cmp    $0x31,%ecx
    14cf:	0f 4e d0             	cmovle %eax,%edx
    14d2:	8b 45 10             	mov    0x10(%ebp),%eax
    14d5:	89 10                	mov    %edx,(%eax)
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
    14d7:	8b 13                	mov    (%ebx),%edx
    14d9:	85 d2                	test   %edx,%edx
    14db:	7e 38                	jle    1515 <gen_random_digraph+0xa5>
    14dd:	89 f1                	mov    %esi,%ecx
    14df:	31 ff                	xor    %edi,%edi
    14e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < *num_vertices; j++) {
    14e8:	31 c0                	xor    %eax,%eax
    14ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            graph[i][j] = 0;
    14f0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
        for (int j = 0; j < *num_vertices; j++) {
    14f7:	8b 13                	mov    (%ebx),%edx
    14f9:	83 c0 01             	add    $0x1,%eax
    14fc:	39 c2                	cmp    %eax,%edx
    14fe:	7f f0                	jg     14f0 <gen_random_digraph+0x80>
    for (int i = 0; i < *num_vertices; i++) {
    1500:	83 c7 01             	add    $0x1,%edi
    1503:	81 c1 20 03 00 00    	add    $0x320,%ecx
    1509:	39 fa                	cmp    %edi,%edx
    150b:	7f db                	jg     14e8 <gen_random_digraph+0x78>
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
    150d:	81 fa c7 00 00 00    	cmp    $0xc7,%edx
    1513:	7f 22                	jg     1537 <gen_random_digraph+0xc7>
        for (int j = *num_vertices; i < MAX_VERT; i++) {
    1515:	69 c2 c9 00 00 00    	imul   $0xc9,%edx,%eax
    151b:	8d 94 96 00 71 02 00 	lea    0x27100(%esi,%edx,4),%edx
    1522:	8d 04 86             	lea    (%esi,%eax,4),%eax
    1525:	8d 76 00             	lea    0x0(%esi),%esi
            graph[i][j] = -1;
    1528:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
        for (int j = *num_vertices; i < MAX_VERT; i++) {
    152e:	05 20 03 00 00       	add    $0x320,%eax
    1533:	39 d0                	cmp    %edx,%eax
    1535:	75 f1                	jne    1528 <gen_random_digraph+0xb8>
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
    1537:	8b 45 10             	mov    0x10(%ebp),%eax
    153a:	31 c9                	xor    %ecx,%ecx
    153c:	8b 00                	mov    (%eax),%eax
    153e:	85 c0                	test   %eax,%eax
    1540:	7e 31                	jle    1573 <gen_random_digraph+0x103>
    1542:	89 75 08             	mov    %esi,0x8(%ebp)
    1545:	89 ce                	mov    %ecx,%esi
        new_edge_u = random() % *num_vertices;
    1547:	e8 34 00 00 00       	call   1580 <random>
    for (int i = 0; i < *num_edges; i++) {
    154c:	83 c6 01             	add    $0x1,%esi
        new_edge_u = random() % *num_vertices;
    154f:	99                   	cltd   
    1550:	f7 3b                	idivl  (%ebx)
    1552:	89 d7                	mov    %edx,%edi
        new_edge_v = random() % *num_vertices;
    1554:	e8 27 00 00 00       	call   1580 <random>
        graph[new_edge_u][new_edge_v] = 1;
    1559:	69 ff 20 03 00 00    	imul   $0x320,%edi,%edi
    155f:	03 7d 08             	add    0x8(%ebp),%edi
        new_edge_v = random() % *num_vertices;
    1562:	99                   	cltd   
    1563:	f7 3b                	idivl  (%ebx)
    for (int i = 0; i < *num_edges; i++) {
    1565:	8b 45 10             	mov    0x10(%ebp),%eax
        graph[new_edge_u][new_edge_v] = 1;
    1568:	c7 04 97 01 00 00 00 	movl   $0x1,(%edi,%edx,4)
    for (int i = 0; i < *num_edges; i++) {
    156f:	39 30                	cmp    %esi,(%eax)
    1571:	7f d4                	jg     1547 <gen_random_digraph+0xd7>
    }
}
    1573:	83 c4 0c             	add    $0xc,%esp
    1576:	5b                   	pop    %ebx
    1577:	5e                   	pop    %esi
    1578:	5f                   	pop    %edi
    1579:	5d                   	pop    %ebp
    157a:	c3                   	ret    
    157b:	66 90                	xchg   %ax,%ax
    157d:	66 90                	xchg   %ax,%ax
    157f:	90                   	nop

00001580 <random>:
#include "user.h"

int seed = 1;
int random()
{
    seed = (seed * 1664525 + 1013904223)%2000000000;
    1580:	69 0d 14 25 00 00 0d 	imul   $0x19660d,0x2514,%ecx
    1587:	66 19 00 
    158a:	ba a1 2f b8 44       	mov    $0x44b82fa1,%edx
    158f:	81 c1 5f f3 6e 3c    	add    $0x3c6ef35f,%ecx
    1595:	89 c8                	mov    %ecx,%eax
    1597:	f7 ea                	imul   %edx
    1599:	89 d0                	mov    %edx,%eax
    159b:	89 ca                	mov    %ecx,%edx
    159d:	c1 fa 1f             	sar    $0x1f,%edx
    15a0:	c1 f8 1d             	sar    $0x1d,%eax
    15a3:	29 d0                	sub    %edx,%eax
    15a5:	69 d0 00 94 35 77    	imul   $0x77359400,%eax,%edx
    15ab:	89 c8                	mov    %ecx,%eax
    15ad:	29 d0                	sub    %edx,%eax
    15af:	a3 14 25 00 00       	mov    %eax,0x2514
    return seed;
    15b4:	c3                   	ret    
    15b5:	66 90                	xchg   %ax,%ax
    15b7:	66 90                	xchg   %ax,%ax
    15b9:	66 90                	xchg   %ax,%ax
    15bb:	66 90                	xchg   %ax,%ax
    15bd:	66 90                	xchg   %ax,%ax
    15bf:	90                   	nop

000015c0 <permute_line>:
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
    15c0:	55                   	push   %ebp
    15c1:	89 e5                	mov    %esp,%ebp
    15c3:	57                   	push   %edi
    15c4:	56                   	push   %esi
    15c5:	53                   	push   %ebx
    15c6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    15cc:	83 0c 24 00          	orl    $0x0,(%esp)
    15d0:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    15d6:	83 0c 24 00          	orl    $0x0,(%esp)
    15da:	81 ec 64 08 00 00    	sub    $0x864,%esp
    int fp = open(file_path, O_RDONLY);
    15e0:	6a 00                	push   $0x0
    15e2:	ff 75 08             	push   0x8(%ebp)
    15e5:	e8 79 f8 ff ff       	call   e63 <open>
    if (fp < 0 ) {
    15ea:	83 c4 10             	add    $0x10,%esp
    int fp = open(file_path, O_RDONLY);
    15ed:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    if (fp < 0 ) {
    15f3:	85 c0                	test   %eax,%eax
    15f5:	0f 88 99 01 00 00    	js     1794 <permute_line+0x1d4>
    15fb:	8d b5 10 d8 ff ff    	lea    -0x27f0(%ebp),%esi
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
    1601:	31 db                	xor    %ebx,%ebx
    1603:	89 b5 a0 d7 ff ff    	mov    %esi,-0x2860(%ebp)
    if (fp < 0 ) {
    1609:	89 f7                	mov    %esi,%edi
    160b:	89 de                	mov    %ebx,%esi
    160d:	89 c3                	mov    %eax,%ebx
    160f:	eb 12                	jmp    1623 <permute_line+0x63>
    1611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
    1618:	83 c7 66             	add    $0x66,%edi
    161b:	83 fe 64             	cmp    $0x64,%esi
    161e:	74 16                	je     1636 <permute_line+0x76>
        line_idx++;
    1620:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
    1623:	83 ec 04             	sub    $0x4,%esp
    1626:	6a 66                	push   $0x66
    1628:	57                   	push   %edi
    1629:	53                   	push   %ebx
    162a:	e8 0c f8 ff ff       	call   e3b <read>
    162f:	83 c4 10             	add    $0x10,%esp
    1632:	85 c0                	test   %eax,%eax
    1634:	7f e2                	jg     1618 <permute_line+0x58>
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
    1636:	89 f3                	mov    %esi,%ebx
    1638:	8b b5 a0 d7 ff ff    	mov    -0x2860(%ebp),%esi
    163e:	e8 3d ff ff ff       	call   1580 <random>
    1643:	89 c1                	mov    %eax,%ecx
    1645:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    164a:	f7 e9                	imul   %ecx
    164c:	89 c8                	mov    %ecx,%eax
    164e:	c1 f8 1f             	sar    $0x1f,%eax
    1651:	c1 fa 05             	sar    $0x5,%edx
    1654:	29 c2                	sub    %eax,%edx
    1656:	6b c2 64             	imul   $0x64,%edx,%eax
    1659:	29 c1                	sub    %eax,%ecx
    165b:	89 cf                	mov    %ecx,%edi
    int line2 = random() % NUM_STRINGS;
    165d:	e8 1e ff ff ff       	call   1580 <random>
    1662:	89 c1                	mov    %eax,%ecx
    1664:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    1669:	f7 e9                	imul   %ecx
    166b:	89 c8                	mov    %ecx,%eax
    166d:	c1 f8 1f             	sar    $0x1f,%eax
    1670:	c1 fa 05             	sar    $0x5,%edx
    1673:	29 c2                	sub    %eax,%edx
    1675:	6b c2 64             	imul   $0x64,%edx,%eax
    1678:	29 c1                	sub    %eax,%ecx

    // --- Swap lines in memory ---
    if (line1 != line2) {
    167a:	39 cf                	cmp    %ecx,%edi
    167c:	89 8d a0 d7 ff ff    	mov    %ecx,-0x2860(%ebp)
    1682:	74 5f                	je     16e3 <permute_line+0x123>
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
    1684:	6b c7 66             	imul   $0x66,%edi,%eax
    1687:	8d 8d 10 d8 ff ff    	lea    -0x27f0(%ebp),%ecx
    168d:	83 ec 08             	sub    $0x8,%esp
    1690:	01 c1                	add    %eax,%ecx
    1692:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
    1698:	51                   	push   %ecx
    1699:	50                   	push   %eax
    169a:	89 8d 9c d7 ff ff    	mov    %ecx,-0x2864(%ebp)
    16a0:	e8 2b f5 ff ff       	call   bd0 <strcpy>
        strcpy(lines[line1], lines[line2]);
    16a5:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
    16ab:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
    16b1:	6b d2 66             	imul   $0x66,%edx,%edx
    16b4:	01 c2                	add    %eax,%edx
    16b6:	58                   	pop    %eax
    16b7:	59                   	pop    %ecx
    16b8:	8b 8d 9c d7 ff ff    	mov    -0x2864(%ebp),%ecx
    16be:	52                   	push   %edx
    16bf:	89 95 a0 d7 ff ff    	mov    %edx,-0x2860(%ebp)
    16c5:	51                   	push   %ecx
    16c6:	e8 05 f5 ff ff       	call   bd0 <strcpy>
        strcpy(lines[line2], temp);
    16cb:	8b 95 a0 d7 ff ff    	mov    -0x2860(%ebp),%edx
    16d1:	5f                   	pop    %edi
    16d2:	58                   	pop    %eax
    16d3:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
    16d9:	50                   	push   %eax
    16da:	52                   	push   %edx
    16db:	e8 f0 f4 ff ff       	call   bd0 <strcpy>
    16e0:	83 c4 10             	add    $0x10,%esp
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
    16e3:	83 ec 0c             	sub    $0xc,%esp
    16e6:	ff b5 a4 d7 ff ff    	push   -0x285c(%ebp)
    16ec:	e8 5a f7 ff ff       	call   e4b <close>
    fp = open(file_path, O_RDWR);
    16f1:	58                   	pop    %eax
    16f2:	5a                   	pop    %edx
    16f3:	6a 02                	push   $0x2
    16f5:	ff 75 08             	push   0x8(%ebp)
    16f8:	e8 66 f7 ff ff       	call   e63 <open>


    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
    16fd:	59                   	pop    %ecx
    fp = open(file_path, O_RDWR);
    16fe:	89 c7                	mov    %eax,%edi
    fstat(fp, &st);
    1700:	58                   	pop    %eax
    1701:	8d 85 a8 d7 ff ff    	lea    -0x2858(%ebp),%eax
    1707:	50                   	push   %eax
    1708:	57                   	push   %edi
    1709:	e8 6d f7 ff ff       	call   e7b <fstat>
    char *buffer = malloc(0);
    170e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1715:	e8 96 fa ff ff       	call   11b0 <malloc>
    memset(buffer, 0, 0);  
    171a:	83 c4 0c             	add    $0xc,%esp
    171d:	6a 00                	push   $0x0
    171f:	6a 00                	push   $0x0
    1721:	50                   	push   %eax
    1722:	89 85 a4 d7 ff ff    	mov    %eax,-0x285c(%ebp)
    1728:	e8 63 f5 ff ff       	call   c90 <memset>
    write(fp, buffer, 0);
    172d:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
    1733:	83 c4 0c             	add    $0xc,%esp
    1736:	6a 00                	push   $0x0
    1738:	52                   	push   %edx
    1739:	57                   	push   %edi
    173a:	e8 04 f7 ff ff       	call   e43 <write>
    free(buffer);
    173f:	8b 95 a4 d7 ff ff    	mov    -0x285c(%ebp),%edx
    1745:	89 14 24             	mov    %edx,(%esp)
    1748:	e8 d3 f9 ff ff       	call   1120 <free>


    // --- Write the modified content back to the file ---
    if (fp < 0) {
    174d:	83 c4 10             	add    $0x10,%esp
    1750:	85 ff                	test   %edi,%edi
    1752:	78 59                	js     17ad <permute_line+0x1ed>
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
    1754:	85 db                	test   %ebx,%ebx
    1756:	74 26                	je     177e <permute_line+0x1be>
    1758:	6b db 66             	imul   $0x66,%ebx,%ebx
    175b:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
    1761:	01 c3                	add    %eax,%ebx
    1763:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1767:	90                   	nop
        write(fp, lines[i], STRING_SIZE);
    1768:	83 ec 04             	sub    $0x4,%esp
    176b:	6a 66                	push   $0x66
    176d:	56                   	push   %esi
    for (int i = 0; i < line_idx; i++) {
    176e:	83 c6 66             	add    $0x66,%esi
        write(fp, lines[i], STRING_SIZE);
    1771:	57                   	push   %edi
    1772:	e8 cc f6 ff ff       	call   e43 <write>
    for (int i = 0; i < line_idx; i++) {
    1777:	83 c4 10             	add    $0x10,%esp
    177a:	39 de                	cmp    %ebx,%esi
    177c:	75 ea                	jne    1768 <permute_line+0x1a8>
    }

    close(fp);
    177e:	83 ec 0c             	sub    $0xc,%esp
    1781:	57                   	push   %edi
    1782:	e8 c4 f6 ff ff       	call   e4b <close>
    return 0;
    1787:	83 c4 10             	add    $0x10,%esp
    178a:	31 c0                	xor    %eax,%eax
    178c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    178f:	5b                   	pop    %ebx
    1790:	5e                   	pop    %esi
    1791:	5f                   	pop    %edi
    1792:	5d                   	pop    %ebp
    1793:	c3                   	ret    
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
    1794:	83 ec 08             	sub    $0x8,%esp
    1797:	68 14 1c 00 00       	push   $0x1c14
    179c:	6a 01                	push   $0x1
    179e:	e8 dd f7 ff ff       	call   f80 <printf>
        return -1;
    17a3:	83 c4 10             	add    $0x10,%esp
    17a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    17ab:	eb df                	jmp    178c <permute_line+0x1cc>
        printf(1, "Failed to open file for writing in permutation routine.\n");
    17ad:	83 ec 08             	sub    $0x8,%esp
    17b0:	68 5c 1c 00 00       	push   $0x1c5c
    17b5:	6a 01                	push   $0x1
    17b7:	e8 c4 f7 ff ff       	call   f80 <printf>
        return -1;
    17bc:	83 c4 10             	add    $0x10,%esp
    17bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    17c4:	eb c6                	jmp    178c <permute_line+0x1cc>
    17c6:	66 90                	xchg   %ax,%ax
    17c8:	66 90                	xchg   %ax,%ax
    17ca:	66 90                	xchg   %ax,%ax
    17cc:	66 90                	xchg   %ax,%ax
    17ce:	66 90                	xchg   %ax,%ax

000017d0 <add_line>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int add_line(char *file_path, char *new_line) {
    17d0:	55                   	push   %ebp
    17d1:	89 e5                	mov    %esp,%ebp
    17d3:	57                   	push   %edi
    17d4:	56                   	push   %esi
    17d5:	53                   	push   %ebx
    17d6:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    17dc:	83 0c 24 00          	orl    $0x0,(%esp)
    17e0:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    17e6:	83 0c 24 00          	orl    $0x0,(%esp)
    17ea:	81 ec 04 08 00 00    	sub    $0x804,%esp
    int fp = open(file_path, O_RDONLY);  
    17f0:	6a 00                	push   $0x0
    17f2:	ff 75 08             	push   0x8(%ebp)
    17f5:	e8 69 f6 ff ff       	call   e63 <open>
    if (fp < 0) {
    17fa:	83 c4 10             	add    $0x10,%esp
    17fd:	85 c0                	test   %eax,%eax
    17ff:	0f 88 b1 00 00 00    	js     18b6 <add_line+0xe6>
    1805:	89 c3                	mov    %eax,%ebx
    1807:	8d 85 10 d8 ff ff    	lea    -0x27f0(%ebp),%eax
        printf(1, "Failed to open file for reading.\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;
    180d:	31 f6                	xor    %esi,%esi
    180f:	89 85 00 d8 ff ff    	mov    %eax,-0x2800(%ebp)
    if (fp < 0) {
    1815:	89 c7                	mov    %eax,%edi
    1817:	eb 12                	jmp    182b <add_line+0x5b>
    1819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
    1820:	83 c7 66             	add    $0x66,%edi
    1823:	83 fe 64             	cmp    $0x64,%esi
    1826:	74 1c                	je     1844 <add_line+0x74>
        line_idx++;
    1828:	83 c6 01             	add    $0x1,%esi
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
    182b:	83 ec 04             	sub    $0x4,%esp
    182e:	89 bd 04 d8 ff ff    	mov    %edi,-0x27fc(%ebp)
    1834:	6a 66                	push   $0x66
    1836:	57                   	push   %edi
    1837:	53                   	push   %ebx
    1838:	e8 fe f5 ff ff       	call   e3b <read>
    183d:	83 c4 10             	add    $0x10,%esp
    1840:	85 c0                	test   %eax,%eax
    1842:	7f dc                	jg     1820 <add_line+0x50>
    }
    close(fp); 
    1844:	83 ec 0c             	sub    $0xc,%esp
    1847:	53                   	push   %ebx
    1848:	e8 fe f5 ff ff       	call   e4b <close>

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
    184d:	58                   	pop    %eax
    184e:	5a                   	pop    %edx
    184f:	ff 75 0c             	push   0xc(%ebp)
    1852:	ff b5 04 d8 ff ff    	push   -0x27fc(%ebp)
    1858:	e8 73 f3 ff ff       	call   bd0 <strcpy>
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
    185d:	59                   	pop    %ecx
    185e:	5b                   	pop    %ebx
    185f:	6a 01                	push   $0x1
    1861:	ff 75 08             	push   0x8(%ebp)
    1864:	e8 fa f5 ff ff       	call   e63 <open>
    if (fp < 0) {
    1869:	83 c4 10             	add    $0x10,%esp
    fp = open(file_path, O_WRONLY);  
    186c:	89 c3                	mov    %eax,%ebx
    if (fp < 0) {
    186e:	85 c0                	test   %eax,%eax
    1870:	78 5d                	js     18cf <add_line+0xff>
    1872:	6b ce 66             	imul   $0x66,%esi,%ecx
    1875:	8b 85 00 d8 ff ff    	mov    -0x2800(%ebp),%eax
    187b:	8d 78 66             	lea    0x66(%eax),%edi
    187e:	8d 34 0f             	lea    (%edi,%ecx,1),%esi
    1881:	eb 08                	jmp    188b <add_line+0xbb>
    1883:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1887:	90                   	nop
    1888:	83 c7 66             	add    $0x66,%edi
        printf(1, "Failed to open file for writing.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
    188b:	83 ec 04             	sub    $0x4,%esp
    188e:	6a 66                	push   $0x66
    1890:	50                   	push   %eax
    1891:	53                   	push   %ebx
    1892:	e8 ac f5 ff ff       	call   e43 <write>
    for (int i = 0; i < line_idx; i++) {
    1897:	89 f8                	mov    %edi,%eax
    1899:	83 c4 10             	add    $0x10,%esp
    189c:	39 f7                	cmp    %esi,%edi
    189e:	75 e8                	jne    1888 <add_line+0xb8>
    }

    close(fp);
    18a0:	83 ec 0c             	sub    $0xc,%esp
    18a3:	53                   	push   %ebx
    18a4:	e8 a2 f5 ff ff       	call   e4b <close>
    return 0;
    18a9:	83 c4 10             	add    $0x10,%esp
    18ac:	31 c0                	xor    %eax,%eax
}
    18ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18b1:	5b                   	pop    %ebx
    18b2:	5e                   	pop    %esi
    18b3:	5f                   	pop    %edi
    18b4:	5d                   	pop    %ebp
    18b5:	c3                   	ret    
        printf(1, "Failed to open file for reading.\n");
    18b6:	83 ec 08             	sub    $0x8,%esp
    18b9:	68 98 1c 00 00       	push   $0x1c98
    18be:	6a 01                	push   $0x1
    18c0:	e8 bb f6 ff ff       	call   f80 <printf>
        return -1;
    18c5:	83 c4 10             	add    $0x10,%esp
    18c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    18cd:	eb df                	jmp    18ae <add_line+0xde>
        printf(1, "Failed to open file for writing.\n");
    18cf:	83 ec 08             	sub    $0x8,%esp
    18d2:	68 bc 1c 00 00       	push   $0x1cbc
    18d7:	6a 01                	push   $0x1
    18d9:	e8 a2 f6 ff ff       	call   f80 <printf>
        return -1;
    18de:	83 c4 10             	add    $0x10,%esp
    18e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    18e6:	eb c6                	jmp    18ae <add_line+0xde>
    18e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18ef:	90                   	nop

000018f0 <generate_random_string>:


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
    18f0:	55                   	push   %ebp
    18f1:	89 e5                	mov    %esp,%ebp
    18f3:	57                   	push   %edi
    18f4:	56                   	push   %esi
    18f5:	53                   	push   %ebx
    18f6:	83 ec 0c             	sub    $0xc,%esp
    18f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    18fc:	8d 73 64             	lea    0x64(%ebx),%esi
    18ff:	89 f7                	mov    %esi,%edi
    1901:	8b 75 0c             	mov    0xc(%ebp),%esi
    1904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
    1908:	e8 73 fc ff ff       	call   1580 <random>
    190d:	31 d2                	xor    %edx,%edx
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    190f:	83 c3 01             	add    $0x1,%ebx
        int idx_new_char = random() % size_char_set;
    1912:	f7 75 10             	divl   0x10(%ebp)
        s[i] = char_set[idx_new_char];
    1915:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
    1919:	88 43 ff             	mov    %al,-0x1(%ebx)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    191c:	39 fb                	cmp    %edi,%ebx
    191e:	75 e8                	jne    1908 <generate_random_string+0x18>
    }
    s[STRING_SIZE - 2] = '\n';
    1920:	8b 45 08             	mov    0x8(%ebp),%eax
    1923:	ba 0a 00 00 00       	mov    $0xa,%edx
    1928:	66 89 50 64          	mov    %dx,0x64(%eax)
    s[STRING_SIZE - 1] = '\0';
}
    192c:	83 c4 0c             	add    $0xc,%esp
    192f:	5b                   	pop    %ebx
    1930:	5e                   	pop    %esi
    1931:	5f                   	pop    %edi
    1932:	5d                   	pop    %ebp
    1933:	c3                   	ret    
    1934:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    193b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    193f:	90                   	nop

00001940 <write_random_string>:

int write_random_string(char file_path[]) {
    1940:	55                   	push   %ebp
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    1941:	b9 15 00 00 00       	mov    $0x15,%ecx
int write_random_string(char file_path[]) {
    1946:	89 e5                	mov    %esp,%ebp
    1948:	57                   	push   %edi
    1949:	56                   	push   %esi
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    194a:	8d bd 2c ff ff ff    	lea    -0xd4(%ebp),%edi
    1950:	be e0 1c 00 00       	mov    $0x1ce0,%esi
int write_random_string(char file_path[]) {
    1955:	53                   	push   %ebx
        int idx_new_char = random() % size_char_set;
    1956:	bb c1 c0 c0 c0       	mov    $0xc0c0c0c1,%ebx
int write_random_string(char file_path[]) {
    195b:	81 ec cc 00 00 00    	sub    $0xcc,%esp
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    1961:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    1963:	0f b7 06             	movzwl (%esi),%eax
    1966:	8d 75 e6             	lea    -0x1a(%ebp),%esi
    1969:	66 89 07             	mov    %ax,(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    196c:	8d 7d 82             	lea    -0x7e(%ebp),%edi
    196f:	90                   	nop
        int idx_new_char = random() % size_char_set;
    1970:	e8 0b fc ff ff       	call   1580 <random>
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    1975:	83 c7 01             	add    $0x1,%edi
        int idx_new_char = random() % size_char_set;
    1978:	89 c1                	mov    %eax,%ecx
    197a:	f7 e3                	mul    %ebx
    197c:	c1 ea 06             	shr    $0x6,%edx
    197f:	6b d2 55             	imul   $0x55,%edx,%edx
    1982:	29 d1                	sub    %edx,%ecx
        s[i] = char_set[idx_new_char];
    1984:	0f b6 84 0d 2c ff ff 	movzbl -0xd4(%ebp,%ecx,1),%eax
    198b:	ff 
    198c:	88 47 ff             	mov    %al,-0x1(%edi)
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
    198f:	39 f7                	cmp    %esi,%edi
    1991:	75 dd                	jne    1970 <write_random_string+0x30>
    s[STRING_SIZE - 2] = '\n';
    1993:	b8 0a 00 00 00       	mov    $0xa,%eax
    const size_t size_char_set = sizeof(char_set) - 1;
    char s[STRING_SIZE];
   
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
    1998:	83 ec 08             	sub    $0x8,%esp
    s[STRING_SIZE - 2] = '\n';
    199b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    add_line(file_path, s);
    199f:	8d 45 82             	lea    -0x7e(%ebp),%eax
    19a2:	50                   	push   %eax
    19a3:	ff 75 08             	push   0x8(%ebp)
    19a6:	e8 25 fe ff ff       	call   17d0 <add_line>

    return 0;
}
    19ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19ae:	31 c0                	xor    %eax,%eax
    19b0:	5b                   	pop    %ebx
    19b1:	5e                   	pop    %esi
    19b2:	5f                   	pop    %edi
    19b3:	5d                   	pop    %ebp
    19b4:	c3                   	ret    
    19b5:	66 90                	xchg   %ax,%ax
    19b7:	66 90                	xchg   %ax,%ax
    19b9:	66 90                	xchg   %ax,%ax
    19bb:	66 90                	xchg   %ax,%ax
    19bd:	66 90                	xchg   %ax,%ax
    19bf:	90                   	nop

000019c0 <io_bound>:
#include "io-bound.h"
#include "types.h"
#include "user.h"


void io_bound(char file_path[]) {
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    19c3:	56                   	push   %esi
    19c4:	8b 75 08             	mov    0x8(%ebp),%esi
    19c7:	53                   	push   %ebx
    19c8:	bb 64 00 00 00       	mov    $0x64,%ebx
    19cd:	8d 76 00             	lea    0x0(%esi),%esi
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
    19d0:	83 ec 0c             	sub    $0xc,%esp
    19d3:	56                   	push   %esi
    19d4:	e8 67 ff ff ff       	call   1940 <write_random_string>
    for (int i = 0; i < NUM_STRINGS; i++) {
    19d9:	83 c4 10             	add    $0x10,%esp
    19dc:	83 eb 01             	sub    $0x1,%ebx
    19df:	75 ef                	jne    19d0 <io_bound+0x10>
    19e1:	bb 32 00 00 00       	mov    $0x32,%ebx
    19e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    19ed:	8d 76 00             	lea    0x0(%esi),%esi
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
    19f0:	83 ec 0c             	sub    $0xc,%esp
    19f3:	56                   	push   %esi
    19f4:	e8 c7 fb ff ff       	call   15c0 <permute_line>
    for (int i = 0; i < NUM_PERMUT; i++) {
    19f9:	83 c4 10             	add    $0x10,%esp
    19fc:	83 eb 01             	sub    $0x1,%ebx
    19ff:	75 ef                	jne    19f0 <io_bound+0x30>
    }

    if (unlink(file_path) != 0) {
    1a01:	83 ec 0c             	sub    $0xc,%esp
    1a04:	56                   	push   %esi
    1a05:	e8 69 f4 ff ff       	call   e73 <unlink>
    1a0a:	83 c4 10             	add    $0x10,%esp
    1a0d:	85 c0                	test   %eax,%eax
    1a0f:	75 07                	jne    1a18 <io_bound+0x58>
        printf(1,"Error when trying to delete file 'output.txt'\n");
    }
    1a11:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1a14:	5b                   	pop    %ebx
    1a15:	5e                   	pop    %esi
    1a16:	5d                   	pop    %ebp
    1a17:	c3                   	ret    
        printf(1,"Error when trying to delete file 'output.txt'\n");
    1a18:	83 ec 08             	sub    $0x8,%esp
    1a1b:	68 38 1d 00 00       	push   $0x1d38
    1a20:	6a 01                	push   $0x1
    1a22:	e8 59 f5 ff ff       	call   f80 <printf>
    1a27:	83 c4 10             	add    $0x10,%esp
    1a2a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1a2d:	5b                   	pop    %ebx
    1a2e:	5e                   	pop    %esi
    1a2f:	5d                   	pop    %ebp
    1a30:	c3                   	ret    
    1a31:	66 90                	xchg   %ax,%ax
    1a33:	66 90                	xchg   %ax,%ax
    1a35:	66 90                	xchg   %ax,%ax
    1a37:	66 90                	xchg   %ax,%ax
    1a39:	66 90                	xchg   %ax,%ax
    1a3b:	66 90                	xchg   %ax,%ax
    1a3d:	66 90                	xchg   %ax,%ax
    1a3f:	90                   	nop

00001a40 <cpu_bound>:
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound() {
    1a40:	55                   	push   %ebp
    1a41:	89 e5                	mov    %esp,%ebp
    1a43:	57                   	push   %edi
    1a44:	56                   	push   %esi
    1a45:	53                   	push   %ebx
    1a46:	8d 84 24 00 90 fd ff 	lea    -0x27000(%esp),%eax
    1a4d:	81 ec 00 10 00 00    	sub    $0x1000,%esp
    1a53:	83 0c 24 00          	orl    $0x0,(%esp)
    1a57:	39 c4                	cmp    %eax,%esp
    1a59:	75 f2                	jne    1a4d <cpu_bound+0xd>
    1a5b:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
    1a61:	be e8 03 00 00       	mov    $0x3e8,%esi
    1a66:	8d bd c4 8b fd ff    	lea    -0x2743c(%ebp),%edi
    1a6c:	8d 9d e8 8e fd ff    	lea    -0x27118(%ebp),%ebx
    1a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < NUM_GRAPHS; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);
    1a78:	83 ec 04             	sub    $0x4,%esp
    1a7b:	8d 85 c0 8b fd ff    	lea    -0x27440(%ebp),%eax
    1a81:	57                   	push   %edi
    1a82:	50                   	push   %eax
    1a83:	53                   	push   %ebx
    1a84:	e8 e7 f9 ff ff       	call   1470 <gen_random_digraph>

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);
    1a89:	8d 85 c8 8b fd ff    	lea    -0x27438(%ebp),%eax
    1a8f:	89 04 24             	mov    %eax,(%esp)
    1a92:	6a 00                	push   $0x0
    1a94:	ff b5 c4 8b fd ff    	push   -0x2743c(%ebp)
    1a9a:	ff b5 c0 8b fd ff    	push   -0x27440(%ebp)
    1aa0:	53                   	push   %ebx
    1aa1:	e8 6a f8 ff ff       	call   1310 <dijkstra>
    for (int i = 0; i < NUM_GRAPHS; i++) {
    1aa6:	83 c4 20             	add    $0x20,%esp
    1aa9:	83 ee 01             	sub    $0x1,%esi
    1aac:	75 ca                	jne    1a78 <cpu_bound+0x38>
    }
    1aae:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ab1:	5b                   	pop    %ebx
    1ab2:	5e                   	pop    %esi
    1ab3:	5f                   	pop    %edi
    1ab4:	5d                   	pop    %ebp
    1ab5:	c3                   	ret    
