


.386
.model flat, stdcall
option casemap :none

include windows.inc
include user32.inc
include kernel32.inc
include masm32.inc

include libc.inc

includelib user32.lib
includelib kernel32.lib
includelib masm32.lib
include macro.asm

includelib libc.lib
.data
szCaption	 db "deMK",0
Fg					db ' ',0	
Crlf				db 13,10,0
mytestnum      db '789abcdef',0
mynum1      db '7',0
mynum2		db 'b7',0

.data?
	buffer	db 100 dup(?)
Temp				db 10 dup(?)
OutString	 db 600 dup(?)
iResult      db MAX_PATH dup(?)
iResult2      db MAX_PATH dup(?)
;------------------------ Dec2Hex------------------------
;.data   ;--- modified this line
 lpHexString	db '0123456789ABCDEF',0
 
.code
 
Dec2Hex proc dwValue:DWORD, lpBuffer:DWORD
 
  mov edi, lpBuffer
  mov eax, dwValue
  mov ecx, 8
 
  .repeat
   mov esi, eax
   and esi, 0F0000000h
   shr esi, 28
   movzx edx, byte ptr [lpHexString+esi]
   mov byte ptr [edi], dl
   
   shl eax, 4
   inc edi
  .untilcxz
 
  ret
 
 Dec2Hex endp
 
;------------------------------ Dec2Hex  ended  --------------
start:
	invoke GetCommandLine									 ;取命令行参数
	mov esi,eax
	invoke lstrcat,addr OutString,eax			 ;合并字符串
	invoke lstrcat,addr OutString,addr Crlf
	invoke lstrlen,esi											;取字符串长度
	mov ecx,eax
	cld
					
	invoke Dec2Hex, 1337C0DEh,  addr iResult  ;addr lpBuffer
	
	invoke StdOut, offset iResult
	
	;��ͣ��ʾ,�س����ر�
	invoke StdIn,addr buffer,sizeof buffer
	
	invoke StdOut, offset buffer
	
	invoke ExitProcess,0
	
end start