
;�ļ��� 14.asm
;文件名：14.asm
;取命令行参数并显示，用于分析命令行参数可能出现的情况
					.386
					.model flat,stdcall
					Option CaseMap:none
include windows.inc
include kernel32.inc
include user32.inc
include masm32.inc
includelib kernel32.lib
includelib user32.lib
includelib masm32.lib
					.data
szCaption	 db "GetCommandLine",0
Fg					db ' ',0								;空格（分隔符）
Crlf				db 13,10,0							;回车换行
					.data?
Temp				db 10 dup(?)						;用来临时存放数据
OutString	 db 600 dup(?)					 ;存放输出字符串

temp2nd		 db 10 dup(?)
out2ndStr	 db 600 dup(?)

					.code
start:
					invoke GetCommandLine									 ;取命令行参数
					mov esi,eax
					invoke lstrcat,addr OutString,eax			 ;合并字符串
					invoke lstrcat,addr OutString,addr Crlf
					invoke lstrlen,esi											;取字符串长度
					mov ecx,eax
					cld
L1:
					push ecx
					xor eax,eax
					lodsb
					;invoke dw2hex,eax,addr Temp  ;ok output = 22 45 ...
					;invoke dw2ah,eax,addr Temp   ;ok output = 22H 45H ... 
					;invoke dwtoa,eax,addr Temp   ; nothing out
					invoke dw2ah,eax,addr Temp					
					invoke lstrcat,addr OutString,addr Temp+6
					invoke lstrcat,addr OutString,addr Fg
					pop ecx
					loop L1
					
					invoke StdOut, addr OutString    ;addr OutString
					invoke MessageBox,NULL,addr OutString,addr szCaption,MB_OK
					invoke ExitProcess,NULL
					end start