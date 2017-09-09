CHAR_BLANK     equ    20h    ;定义空格分隔符
CHAR_DELI      equ    '"'    ;定义双引号分隔符
;####################################################################
; 取命令行参数个数 (arg count)
; 参数个数必定大于等于 1, 第1个参数为当前执行文件名
;####################################################################
_argc        proc
                 local  @dwArgc        ;需要返回的结果
 
                pushad
                 mov    @dwArgc,0
                 invoke GetCommandLine
                 mov    esi,eax
                 cld
_argc_loop:
                 lodsb
                 or    al,al
                 jz    _argc_end      ;如果到字符串尾则结束
                 cmp    al,CHAR_BLANK
                 jz    _argc_loop    ;如果是空格则忽略
;********************************************************************
; 遇到一个非空格字符表示一个参数开始
;********************************************************************
                 dec esi
                 inc    @dwArgc        ;增加参数个数的计数
_argc_loop1:
                 lodsb
                 or    al,al
                jz    _argc_end      ;如果到字符串尾则结束
                 cmp    al,CHAR_BLANK
                   jz     _argc_loop     ;再遇到一个空格表示参数结束
                 cmp    al,CHAR_DELI
                   jnz    _argc_loop1    ;如果遇到双引号则忽略空格
                 @@:
                 lodsb
                 or    al,al
                 jz    _argc_end
                 cmp    al,CHAR_DELI       ;直到遇到另一个双引号为止
                 jnz    @B
                 jmp    _argc_loop1
_argc_end:
                 popad
                 mov    eax,@dwArgc
                 ret
   
_argc        endp
;####################################################################
; 取指定位置的命令行参数
; argv 0 = 执行文件名
; argv 1 = 参数1 ...
;####################################################################
_argv        proc      _dwArgv,_lpReturn,_dwSize
                 local  @dwArgv,@dwFlag



 
                 pushad
                 inc    _dwArgv
                 mov    @dwArgv,0
                 mov    edi,_lpReturn
 
                invoke GetCommandLine
                 mov    esi,eax
                 cld
_argv_loop:
                 lodsb
                 or    al,al
                 jz    _argv_end
                cmp    al,CHAR_BLANK
                 jz    _argv_loop
;********************************************************************
; 一个参数开始
; 如果和要求的参数符合,则开始复制到返回缓冲区
;********************************************************************
                 dec    esi
                 inc    @dwArgv
                 mov    @dwFlag,FALSE
                 mov    eax,_dwArgv
                 cmp    eax,@dwArgv
                 jnz    @F
                 mov    @dwFlag,TRUE           ;表示需要将字符返回
                @@:
_argv_loop1:
                 lodsb
                 or    al,al
                 jz    _argv_end
                 cmp    al,CHAR_BLANK
                   jz     _argv_loop         ;参数结束
                 cmp    al,CHAR_DELI
                 jz    _argv_loop2
                 cmp    _dwSize,1          ;如果返回缓存区满则忽略
                 jle    @F
                 cmp    @dwFlag,TRUE
                 jne    @F
                 stosb
                 dec _dwSize
                 @@:
                   jmp _argv_loop1            ;继续处理参数内容
 
_argv_loop2:
                 lodsb
                 or    al,al
                 jz    _argv_end
                 cmp    al,CHAR_DELI
                 jz    _argv_loop1
                 cmp    _dwSize,1          ;如果返回缓存区满则忽略
                 jle    @F
                 cmp    @dwFlag,TRUE
                 jne    @F
                 stosb
                 dec    _dwSize
                 @@:
                 jmp    _argv_loop2
_argv_end:
                 xor    al,al
                 stosb
                 popad
                 ret
 
_argv        endp