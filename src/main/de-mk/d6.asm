;#Mode=CON
;MASMPlus 单文件代码模板 - 控制台程序
;--------------------------------------------------------------------
;单个文件需要指定编译模式,否则默认是EXE方式,在系统设置中可以设置默认是DOS还是Windows.
;编译模式自带了DOS/COM/CON/EXE/DLL/LIB这几种,如果有必要,可以更改ide.ini添加新的编译模式
;当然,更好的是创建为一个工程.更方便及易于管理,使用方法:按Ctrl多选->创建工程.必须有多个文件

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
mynum3		db '95AF63F48586',0   ;'b78e',0
mynum4		db  'abcdef0123456789',0
mynum5		db  '009F95AF63F48586B44F132B1D5D7B5F',0

.data?
	buffer	db 100 dup(?)
Temp				db 10 dup(?)
Temp2				db 10 dup(?)
iResult2      db MAX_PATH dup(?)
OutString	 db 600 dup(?)
iResult      db MAX_PATH dup(?)
	
.CODE

;------------------------------------------------------
sub_convert proc near

		push ecx
		push esi
		push edi
	
		mov edi, edx  					; my _OUT ptr supposed in edx
		mov esi, eax
		invoke lstrlen, [eax]		; my _IN  ptr supposed in eax
		mov ecx, eax 
		cld


;
				mov edx, eax
LC01:		
				push edx
				
				
				
				
				invoke htodw, eax    		   ; ok +4 this htodw deal with 'ABCDEF' and 0-9 ; 00 cannot convert
				mov [edi], eax						; ok
				inc edi
		
				pop ecx
				dec edx
;				jnz LC01       ;loop LC01
		


		pop edi
		pop esi
		pop ecx
		retn
sub_convert endp
;--------------------------------------------------

START:
	
	invoke StdOut,CTXT("Hello World!  $")
	
;start:
		invoke GetCommandLine				;ok +7					 ;取命令行参数
		mov esi,eax
		invoke lstrcat,addr OutString,eax			 ;合并字符串
		invoke lstrcat,addr OutString,addr Crlf
		invoke lstrlen,esi											;取字符串长度
		mov ecx,eax
		cld
		
;		lea eax, offset OutString
;		lea edx, offset iResult2
;		call sub_convert

;-----------------------------------run ok-----------------
;;	invoke StdOut, offset OutString
;	invoke lstrlen, offset OutString
;	mov esi, offset OutString 
;	add esi, eax 
;	add esi, -7
;	invoke htodw, esi    ;offset  OutString   ;mynum3	; ok +4 this htodw deal with 'ABCDEF' and 0-9 ; 00 cannot convert
;	mov esi, offset iResult   		; ok 
;	mov [esi], eax						; ok
;	invoke StdOut, offset iResult	; ok
;-------------------------------------run ok------------	

;;-------------
;	invoke htodw, offset mynum2	; ok +4 this htodw deal with 'ABCDEF' and 0-9 
;	mov esi, offset iResult   		; ok 
;	mov [esi], eax						; ok
;	invoke StdOut, offset iResult	; ok
;;---------
 
;;----------------- try4 -------------; running but logic error on list of string and count need to half
;				mov edx, offset iResult
;				sub eax, offset Temp2
;				
;				invoke lstrlen , offset mynum3 
;				mov ecx, eax
;;----------------- try3 -------------;
;				lea esi, offset mynum3
;				lea edi, offset Temp2   		; ok 
;				push edi								; to synchornize with output result( iResult ?)
;;				xor eax, eax						; clear eax
;;				xor edx, edx
;L100:
;				push ecx
;				movsw
;				;xor eax, eax
;				invoke htodw,  offset Temp2		; ok, this works fine with movsw,  (CANNOT use edx/eax)
;				;mov edi, offset iResult   		; ok 
;				mov [edi+100], eax					; to synchornize Temp2 and result (iResult?) the value 100 just a guess number
;				;invoke StdOut, offset iResult	
;;----------------end of try3--------------ok on try3-------------------
;				pop ecx
;				dec ecx
;				jnz L100
;				pop edi
;				add edi ,100
;				invoke StdOut, edi ;offset iResult
;;---------------- end of try4 --------------------------
	
	;暂停显示,回车键关闭
	invoke StdIn,addr buffer,sizeof buffer
	
	invoke StdOut, offset buffer
	
	invoke ExitProcess,0
	
end START