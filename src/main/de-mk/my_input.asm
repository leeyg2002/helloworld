;#Mode=CON
;MASMPlus ���ļ�����ģ�� - ����̨����
;--------------------------------------------------------------------
;�����ļ���Ҫָ������ģʽ,����Ĭ����EXE��ʽ,��ϵͳ�����п�������Ĭ����DOS����Windows.
;����ģʽ�Դ���DOS/COM/CON/EXE/DLL/LIB�⼸��,����б�Ҫ,���Ը���ide.ini����µı���ģʽ
;��Ȼ,���õ��Ǵ���Ϊһ������.�����㼰���ڹ���,ʹ�÷���:��Ctrl��ѡ->��������.�����ж���ļ�

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
mynum3		db '009F95AF63F48586',0   ;'b78e',0
mynum4		db  'abcdef0123456789',0
mynum5		db  '009F95AF63F48586B44F132B1D5D7B5F',0

.data?
	buffer	db 100 dup(?)
Temp				db 10 dup(?)
OutString	 db 600 dup(?)
iResult      db MAX_PATH dup(?)
iResult2      db MAX_PATH dup(?)
	
.CODE


START:
	
	invoke StdOut,CTXT("Hello World!")
	
;start:
		invoke GetCommandLine				;ok +7					 ;ȡ�����в���
		mov esi,eax
		invoke lstrcat,addr OutString,eax			 ;�ϲ��ַ���
		invoke lstrcat,addr OutString,addr Crlf
		invoke lstrlen,esi											;ȡ�ַ�������
		mov ecx,eax
		cld
		

;-------------
	;invoke StdOut, offset OutString
	invoke htodw, offset mynum2;OutString	; ok +4 this htodw deal with 'ABCDEF' and 0-9 
	mov esi, offset iResult   		; ok 
	mov [esi], eax						; ok
	invoke StdOut, offset iResult	; ok
;---------
;convertHex:  ;  loop test not ok, 
;	push ecx
;
;	;invoke atoi, offset mynum1
;	mov esi, offset mytestnum
;	add esi, ecx
;	invoke atoi, esi  ;offset mytestnum 
;	
;
;	mov esi, offset iResult
;	add esi, ecx
;	mov [esi], eax
;
;	pop ecx
;	dec cl
;	jnz convertHex
	
;	invoke strtol, 16,iResult ,  mynum2		
;-------------
;	invoke atoi, offset mynum1	; ok +4 this atoi cannot deal with 'ABCDEF' only work 0-9
;	mov esi, offset iResult   	; ok 
;	mov [esi], eax					; ok
;---------

	

;;-------------
;	invoke htodw, offset mynum2	; ok +4 this htodw deal with 'ABCDEF' and 0-9 
;	mov esi, offset iResult   		; ok 
;	mov [esi], eax						; ok
;	invoke StdOut, offset iResult	; ok
;;---------


;---------------- try1 not finished -------------
;			invoke lstrlen, offset mynum3
;			mov ecx, eax
;			mov esi, offset mynum3
;loop4str:
;			mov eax, [esi]
;			invoke htodw, eax
;			dec cl
;			jnz loop4str
;-------------- end of try1 , not finished yet ------------
	
	
;-----------  try2  ----------
;		move esi, addr munum3
;L10:
;		push ecx
;		xor eax,eax
;		lodsb
;		invoke htodw, eax
;		
;		pop ecx
;		loop L10
;-------------- end of try2 , not finished yet-------------

	
	;invoke lstrcat,addr iResult, eax			; failed, while it is not a char, just a hex(07h)
	;invoke lstrcat,addr iResult, addr Crlf	; fail
	


	;invoke StdOut, offset iResult2
	
	;��ͣ��ʾ,�س����ر�
	invoke StdIn,addr buffer,sizeof buffer
	
	invoke StdOut, offset buffer
	
	invoke ExitProcess,0
	
end START