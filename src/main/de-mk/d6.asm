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
		invoke GetCommandLine				;ok +7					 ;ȡ�����в���
		mov esi,eax
		invoke lstrcat,addr OutString,eax			 ;�ϲ��ַ���
		invoke lstrcat,addr OutString,addr Crlf
		invoke lstrlen,esi											;ȡ�ַ�������
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
	
	;��ͣ��ʾ,�س����ر�
	invoke StdIn,addr buffer,sizeof buffer
	
	invoke StdOut, offset buffer
	
	invoke ExitProcess,0
	
end START