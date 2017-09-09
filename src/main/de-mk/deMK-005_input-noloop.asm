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
include shell32.inc

includelib user32.lib
includelib kernel32.lib
includelib masm32.lib
includelib shell32.lib
include macro.asm

.data
	myMsg		db "Hello World!$"
	space    db " ",0
	Crlf		db 13,10,0
	zcm   db "10001383"              ;"10001336",0
	
	;test01   dw 08h, 0Ch, 09h, 0Fh, 04h,04h 02h,04h, 01h,01h, 0Dh, 0Fh, 06h, 08h, 07h, 0Eh  
	;test02 dw 2444h , 9f8ch, 7e68h, 0df11h
	mkcode db 24h, 44h, 09fh, 8ch, 7eh, 68h, 0dfh, 11h
	test03 dd 24449f8ch, 7e68df11h
	
	; "0x24449F8C7E68DF11h",0     ;24449F8C 7E68DF11 

;    8C9F4424
;    11DF687E

	
;.data?
;	buffer	db MAX_PATH dup(?)


; char byte_C5EEB8[]

;--------------------------------------
byte_C5EEB8       db 01, 00, 01, 00, 00, 01, 01, 01, 00, 01, 00, 01, 00, 01, 00, 00
byte_C5EEC8       db 00, 01, 00, 00, 01, 00, 01, 00, 01, 00, 01, 01, 01, 00, 00, 01
byte_C5EED8       db 00, 00, 01, 01, 01, 00, 00, 01, 01, 01, 01, 00, 00, 01, 00, 00
byte_C5EEE8       db 01, 01, 01, 00, 00, 01, 00, 00, 00, 01, 00, 01, 01, 00, 00, 01
byte_C5EEF8       db 01, 00, 01, 01, 00, 01, 00, 00, 01, 00, 00, 01, 01, 00, 00, 01
byte_C5EF08       db 00, 01, 00, 00, 01, 00, 01, 01, 01, 00, 00, 01, 00, 01, 01, 00
byte_C5EF18       db 00, 01, 00, 01, 01, 00, 01, 00, 00, 01, 01, 00, 01, 00, 00, 01
byte_C5EF28       db 01, 01, 01, 00, 00, 01, 00, 00, 01, 00, 00, 01, 00, 00, 01, 01
byte_C5EF38       db 01, 00, 01, 01, 00, 00, 01, 00, 00, 01, 01, 00, 01, 00, 00, 01
byte_C5EF48       db 01, 00, 00, 01, 00, 00, 00, 01, 00, 01, 00, 01, 01, 01, 01, 00
byte_C5EF58       db 01, 00, 00, 01, 01, 01, 00, 00, 01, 00, 00, 01, 00, 01, 01, 00
byte_C5EF68       db 00, 01, 01, 00, 00, 01, 01, 00, 00, 01, 01, 00, 01, 00, 00, 01
byte_C5EF78       db 00, 01, 01, 00, 00, 00, 01, 01, 00, 00, 01, 00, 01, 01, 00, 01
byte_C5EF88       db 01, 01, 01, 00, 00, 01, 00, 00, 00, 00, 00, 01, 00, 01, 01, 01
byte_C5EF98       db 01, 00, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 00, 01, 00
byte_C5EFA8       db 00, 01, 00, 00, 01, 00, 01, 01, 01, 00, 00, 01, 01, 00, 00, 01
byte_C5EFB8       db 00, 01, 00, 00, 00, 01, 01, 00, 01, 00, 00, 01, 01, 00, 01, 01
byte_C5EFC8       db 01, 01, 00, 01, 00, 00, 01, 00, 00, 00, 01, 01, 00, 01, 01, 00
byte_C5EFD8       db 00, 00, 00, 01, 01, 01, 00, 01, 01, 01, 01, 00, 00, 00, 00, 01
byte_C5EFE8       db 01, 01, 01, 00, 00, 01, 00, 01, 00, 01, 00, 01, 01, 00, 00, 00
byte_C5EFF8       db 01, 00, 01, 01, 01, 00, 00, 01, 00, 01, 00, 00, 01, 00, 00, 01
byte_C5F008       db 01, 01, 00, 00, 00, 01, 01, 00, 00, 00, 01, 01, 00, 01, 00, 01
byte_C5F018       db 01, 01, 01, 00, 00, 01, 01, 00, 00, 00, 00, 01, 00, 01, 01, 00
byte_C5F028       db 00, 00, 00, 01, 01, 00, 01, 01, 01, 01, 00, 00, 00, 00, 01, 01
byte_C5F038       db 00, 01, 00, 01, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 00
byte_C5F048       db 01, 00, 01, 00, 00, 01, 00, 01, 01, 00, 00, 01, 00, 01, 01, 00
byte_C5F058       db 00, 00, 01, 01, 01, 00, 00, 01, 01, 01, 00, 01, 00, 00, 01, 00
byte_C5F068       db 00, 01, 01, 01, 00, 00, 01, 00, 01, 00, 00, 01, 01, 00, 00, 01
byte_C5F078       db 01, 00, 01, 00, 00, 01, 01, 00, 01, 01, 00, 01, 00, 00, 01, 00
byte_C5F088       db 00, 01, 01, 01, 01, 00, 00, 00, 01, 00, 00, 01, 00, 01, 01, 00
byte_C5F098       db 00, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01, 01, 01, 00, 00, 01
byte_C5F0A8       db 00, 00, 01, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 01
byte_C5F0B8       db 01, 01, 01, 00, 00, 01, 00, 00, 00, 00, 01, 01, 01, 00, 00, 01
byte_C5F0C8       db 00, 01, 01, 01, 01, 00, 01, 00, 00, 01, 01, 00, 00, 01, 00, 00
byte_C5F0D8       db 01, 00, 01, 00, 01, 01, 00, 00, 01, 01, 00, 01, 00, 00, 01, 00
byte_C5F0E8       db 01, 01, 00, 00, 01, 00, 00, 01, 01, 00, 00, 01, 00, 00, 01, 01
byte_C5F0F8       db 01, 00, 00, 01, 01, 00, 00, 01, 00, 01, 00, 01, 01, 00, 01, 00
byte_C5F108       db 00, 01, 01, 01, 01, 00, 00, 01, 01, 00, 00, 00, 01, 00, 00, 01
byte_C5F118       db 00, 01, 01, 00, 00, 01, 01, 00, 01, 00, 01, 01, 00, 00, 00, 01
byte_C5F128       db 01, 00, 00, 00, 00, 01, 01, 00, 00, 01, 01, 01, 00, 01, 01, 00
byte_C5F138       db 00, 00, 00, 01, 01, 00, 01, 01, 00, 01, 01, 01, 00, 01, 00, 00
byte_C5F148       db 01, 01, 00, 00, 00, 01, 01, 00, 00, 00, 01, 01, 01, 00, 01, 00
byte_C5F158       db 01, 01, 01, 00, 00, 01, 00, 00, 00, 00, 00, 01, 01, 00, 01, 01
byte_C5F168       db 00, 00, 01, 00, 01, 00, 00, 01, 01, 01, 01, 00, 00, 01, 00, 01
byte_C5F178       db 01, 01, 01, 00, 00, 01, 00, 00, 00, 00, 00, 01, 00, 01, 01, 01
byte_C5F188       db 01, 00, 00, 01, 01, 01, 00, 00, 01, 01, 00, 01, 00, 00, 01, 00
byte_C5F198       db 00, 01, 00, 00, 01, 00, 01, 01, 01, 00, 00, 01, 01, 00, 00, 01
byte_C5F1A8       db 00, 01, 00, 01, 00, 00, 01, 00, 00, 01, 01, 00, 01, 01, 00, 01
byte_C5F1B8       db 00, 01, 01, 00, 01, 00, 00, 01, 00, 01, 00, 01, 01, 00, 01, 00
byte_C5F1C8       db 01, 00, 00, 01, 01, 01, 01, 00, 01, 00, 01, 00, 00, 00, 00, 01
byte_C5F1D8       db 01, 00, 00, 00, 00, 01, 01, 00, 01, 00, 01, 01, 01, 00, 00, 01
byte_C5F1E8       db 00, 00, 01, 01, 00, 01, 00, 01, 01, 01, 00, 00, 00, 01, 01, 00
byte_C5F1F8       db 01, 00, 00, 01, 00, 00, 01, 00, 00, 01, 00, 01, 01, 01, 01, 00
byte_C5F208       db 00, 01, 01, 00, 01, 01, 00, 01, 01, 00, 01, 01, 00, 00, 00, 00
byte_C5F218       db 00, 01, 01, 01, 00, 00, 01, 00, 01, 00, 01, 00, 00, 01, 00, 01
byte_C5F228       db 01, 00, 00, 01, 00, 01, 01, 00, 00, 01, 00, 01, 01, 00, 00, 01
byte_C5F238       db 01, 00, 00, 01, 01, 00, 00, 01, 00, 01, 00, 01, 01, 00, 01, 00
byte_C5F248       db 01, 00, 00, 01, 01, 00, 00, 00, 01, 00, 01, 01, 00, 01, 00, 01
byte_C5F258       db 00, 01, 00, 01, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 00
byte_C5F268       db 01, 00, 01, 00, 00, 01, 00, 01, 00, 01, 00, 01, 01, 00, 00, 01
byte_C5F278       db 01, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 01, 01
byte_C5F288       db 00, 01, 01, 00, 00, 00, 01, 01, 01, 01, 01, 00, 00, 01, 00, 00
byte_C5F298       db 01, 00, 01, 00, 00, 01, 01, 00, 00, 01, 00, 01, 01, 00, 01, 00
byte_C5F2A8       db 00, 00, 01, 01, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01, 01, 00
byte_C5F2B8       db 01, 00, 00, 00, 01, 01, 01, 00, 01, 01, 01, 00, 00, 00, 00, 01
byte_C5F2C8       db 00, 01, 01, 00, 01, 01, 00, 00, 01, 01, 00, 01, 00, 00, 01, 00
byte_C5F2D8       db 00, 00, 01, 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 01, 00, 00
byte_C5F2E8       db 01, 00, 00, 01, 00, 00, 00, 01, 00, 01, 01, 01, 01, 00, 01, 00
byte_C5F2F8       db 01, 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 00, 00, 00, 00, 01
byte_C5F308       db 01, 00, 00, 01, 01, 01, 00, 01, 00, 00, 00, 01, 01, 00, 01, 00
byte_C5F318       db 00, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 01, 00, 01, 01, 01
byte_C5F328       db 00, 00, 01, 00, 01, 01, 00, 01, 01, 01, 01, 00, 00, 00, 01, 00
byte_C5F338       db 01, 00, 00, 01, 01, 01, 01, 00, 00, 00, 00, 01, 01, 00, 01, 00
byte_C5F348       db 00, 01, 00, 00, 01, 00, 01, 01, 01, 00, 00, 01, 00, 01, 01, 00
byte_C5F358       db 00, 01, 00, 00, 00, 01, 01, 00, 01, 00, 01, 00, 00, 01, 01, 01
byte_C5F368       db 00, 01, 00, 00, 01, 00, 00, 01, 00, 01, 01, 01, 01, 00, 01, 00
byte_C5F378       db 01, 00, 01, 01, 00, 01, 00, 01, 00, 01, 00, 00, 01, 00, 00, 01
byte_C5F388       db 00, 00, 01, 00, 01, 01, 00, 01, 00, 01, 01, 00, 00, 01, 01, 00
byte_C5F398       db 01, 01, 00, 00, 00, 01, 01, 00, 01, 00, 01, 01, 00, 01, 00, 00
byte_C5F3A8       db 01, 01, 00, 01, 01, 00, 00, 00, 00, 00, 00, 01, 00, 01, 01, 01
byte_C5F3B8       db 01, 00, 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 00, 00, 01, 00
byte_C5F3C8       db 01, 01, 01, 00, 00, 01, 00, 00, 00, 00, 01, 01, 01, 00, 00, 01
byte_C5F3D8       db 00, 01, 00, 01, 01, 00, 01, 00, 01, 00, 00, 00, 01, 01, 00, 01
byte_C5F3E8       db 01, 00, 00, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 00, 01
byte_C5F3F8       db 00, 00, 01, 01, 00, 01, 01, 00, 00, 00, 01, 00, 01, 01, 00, 01
byte_C5F408       db 01, 01, 00, 01, 01, 00, 00, 00, 01, 00, 00, 01, 00, 01, 01, 00
byte_C5F418       db 00, 01, 01, 00, 01, 00, 00, 01, 01, 00, 00, 01, 00, 00, 01, 01
byte_C5F428       db 00, 01, 01, 00, 00, 00, 01, 01, 01, 01, 00, 01, 01, 00, 00, 00
byte_C5F438       db 00, 01, 01, 01, 01, 00, 00, 00, 01, 00, 00, 01, 00, 01, 01, 00
byte_C5F448       db 00, 00, 01, 01, 00, 00, 00, 01, 01, 01, 00, 00, 01, 01, 00, 01
byte_C5F458       db 00, 00, 01, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 01
byte_C5F468       db 01, 01, 00, 00, 00, 00, 01, 01, 00, 00, 00, 01, 01, 01, 01, 00
byte_C5F478       db 00, 01, 00, 00, 01, 01, 01, 00, 01, 00, 01, 01, 00, 00, 00, 01
byte_C5F488       db 00, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01, 01, 00, 01, 00, 01
byte_C5F498       db 01, 01, 00, 00, 00, 00, 01, 01, 00, 01, 01, 00, 01, 01, 00, 00
byte_C5F4A8       db 01, 00, 01, 01, 00, 01, 00, 00, 01, 00, 00, 00, 01, 00, 01, 01
byte_C5F4B8       db 00, 00, 01, 01, 00, 01, 01, 00, 01, 00, 00, 00, 01, 01, 00, 01
byte_C5F4C8       db 00, 01, 01, 00, 00, 00, 01, 01, 00, 00, 00, 01, 01, 01, 01, 00
byte_C5F4D8       db 00, 01, 00, 00, 01, 00, 00, 01, 01, 00, 01, 01, 01, 00, 01, 00
byte_C5F4E8       db 01, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 01
byte_C5F4F8       db 01, 01, 00, 00, 00, 01, 01, 00, 01, 01, 00, 01, 00, 00, 01, 00
byte_C5F508       db 01, 01, 00, 01, 01, 00, 00, 00, 00, 00, 01, 00, 00, 01, 01, 01
byte_C5F518       db 00, 00, 01, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01, 01, 00, 01
byte_C5F528       db 01, 00, 00, 01, 01, 01, 00, 00, 01, 00, 01, 00, 00, 01, 00, 01
byte_C5F538       db 00, 00, 01, 00, 00, 01, 01, 01, 01, 01, 00, 01, 01, 00, 00, 00
byte_C5F548       db 01, 01, 00, 01, 01, 00, 00, 00, 00, 00, 01, 00, 00, 01, 01, 01
byte_C5F558       db 01, 00, 00, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 00, 01
byte_C5F568       db 01, 00, 01, 00, 00, 01, 00, 01, 00, 01, 00, 01, 01, 01, 00, 00
byte_C5F578       db 01, 01, 00, 01, 00, 00, 01, 00, 01, 00, 00, 01, 01, 00, 00, 01
byte_C5F588       db 01, 00, 01, 01, 00, 01, 00, 01, 00, 01, 00, 00, 01, 00, 00, 01
byte_C5F598       db 00, 00, 01, 00, 00, 01, 01, 01, 01, 01, 01, 00, 01, 00, 00, 00
byte_C5F5A8       db 01, 01, 00, 00, 00, 01, 01, 00, 01, 00, 01, 01, 00, 01, 00, 00
byte_C5F5B8       db 00, 00, 00, 01, 01, 00, 01, 00, 00, 01, 01, 01, 01, 00, 00, 01
byte_C5F5C8       db 00, 01, 00, 00, 00, 01, 01, 01, 01, 00, 01, 00, 01, 01, 00, 00
byte_C5F5D8       db 00, 00, 01, 01, 00, 01, 01, 00, 01, 01, 00, 01, 00, 01, 00, 00
byte_C5F5E8       db 01, 00, 00, 01, 01, 00, 00, 01, 00, 01, 00, 01, 00, 00, 01, 01
byte_C5F5F8       db 00, 01, 00, 01, 01, 00, 00, 00, 00, 01, 01, 00, 00, 01, 01, 01
byte_C5F608       db 00, 01, 00, 00, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 01, 00
byte_C5F618       db 01, 00, 01, 01, 00, 00, 00, 01, 01, 00, 00, 00, 01, 01, 01, 00
byte_C5F628       db 00, 01, 00, 00, 01, 01, 01, 00, 01, 00, 01, 01, 00, 00, 00, 01
byte_C5F638       db 00, 01, 00, 00, 01, 00, 00, 01, 01, 00, 01, 01, 01, 00, 00, 01
byte_C5F648       db 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 01, 00, 00, 01, 00, 00
byte_C5F658       db 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 00, 00, 01, 01, 00
byte_C5F668       db 00, 01, 01, 00, 01, 00, 00, 01, 01, 01, 00, 01, 00, 00, 01, 00
byte_C5F678       db 01, 00, 00, 00, 00, 01, 01, 01, 00, 01, 01, 00, 01, 00, 00, 01
byte_C5F688       db 01, 01, 01, 00, 00, 01, 01, 00, 00, 01, 00, 01, 00, 00, 01, 00
byte_C5F698       db 01, 01, 00, 01, 01, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 00
byte_C5F6A8       db 00, 01, 00, 01, 00, 00, 00, 01, 01, 00, 01, 00, 01, 01, 00, 01

;---------- encode map as below----------
;unk_CA8CF0       db 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 00
;unk_CA8D00       db 00, 01, 01, 00, 01, 01, 01, 00, 01, 00, 00, 00, 00, 01, 01, 00
;unk_CA8D10       db 01, 00, 01, 01, 01, 00, 00, 01, 01, 00, 01, 00, 01, 00, 00, 00
;unk_CA8D20       db 00, 00, 01, 01, 00, 01, 00, 00, 01, 00, 00, 00, 01, 01, 01, 00
;unk_CA8D30       db 01, 00, 01, 01, 00, 01, 00, 00, 00, 00, 00, 00, 01, 01, 00, 01
;unk_CA8D40       db 00, 01, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 01, 00, 01, 01
;unk_CA8D50       db 01, 01, 00, 01, 00, 01, 01, 00, 00, 00, 01, 01, 00, 00, 00, 00
;unk_CA8D60       db 00, 00, 01, 01, 00, 01, 01, 00, 01, 01, 01, 00, 01, 01, 01, 00
;unk_CA8D70       db 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 00, 00, 00, 00, 00, 00
;unk_CA8D80       db 01, 00, 01, 00, 01, 01, 01, 00, 01, 00, 00, 00, 00, 01, 01, 00
;unk_CA8D90       db 00, 01, 01, 01, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00
;unk_CA8DA0       db 01, 01, 00, 00, 00, 00, 01, 01, 00, 01, 01, 00, 01, 01, 01, 00
;unk_CA8DB0       db 01, 01, 00, 00, 01, 01, 01, 00, 00, 01, 00, 01, 00, 00, 01, 00
;unk_CA8DC0       db 00, 00, 01, 00, 01, 01, 01, 00, 01, 00, 00, 01, 00, 01, 00, 00
;unk_CA8DD0       db 01, 00, 00, 01, 01, 01, 01, 00, 01, 00, 00, 00, 00, 00, 00, 00
;unk_CA8DE0       db 01, 00, 01, 00, 01, 00, 01, 00, 01, 00, 00, 01, 00, 00, 01, 01
;unk_CA8DF0       db 00, 01, 01, 01, 01, 00, 00, 00, 01, 01, 00, 01, 01, 00, 00, 00
;unk_CA8E00       db 00, 00, 00, 00, 00, 01, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01
;unk_CA8E10       db 01, 00, 00, 00, 01, 01, 00, 00, 00, 01, 00, 01, 01, 00, 01, 00
;unk_CA8E20       db 00, 01, 01, 00, 01, 00, 01, 01, 00, 00, 00, 01, 01, 00, 01, 01
;unk_CA8E30       db 01, 01, 01, 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 00, 00, 00
;unk_CA8E40       db 01, 00, 01, 00, 00, 00, 01, 01, 00, 01, 01, 01, 01, 00, 01, 01
;unk_CA8E50       db 00, 01, 00, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00
;unk_CA8E60       db 00, 01, 01, 01, 00, 01, 00, 01, 00, 00, 00, 01, 00, 00, 00, 00
;unk_CA8E70       db 00, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 01, 00, 00, 00, 00
;unk_CA8E80       db 01, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 01, 01, 01, 01, 00
;unk_CA8E90       db 00, 00, 00, 01, 01, 00, 00, 00, 01, 00, 00, 01, 00, 01, 00, 01
;unk_CA8EA0       db 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 01
;unk_CA8EB0       db 00, 01, 00, 01, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01
;unk_CA8EC0       db 00, 01, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 01
;unk_CA8ED0       db 00, 00, 00, 00, 01, 01, 01, 00, 00, 01, 00, 00, 01, 00, 00, 00
;unk_CA8EE0       db 01, 00, 01, 01, 01, 01, 00, 01, 00, 00, 00, 01, 00, 00, 01, 01
;unk_CA8EF0       db 01, 00, 01, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 01
;unk_CA8F00       db 01, 00, 00, 01, 01, 01, 01, 01, 00, 00, 01, 00, 00, 00, 00, 01
;unk_CA8F10       db 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01, 00
;unk_CA8F20       db 00, 00, 00, 00, 00, 01, 00, 01, 00, 00, 00, 01, 00, 01, 00, 00
;unk_CA8F30       db 01, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 01, 00
;unk_CA8F40       db 01, 00, 01, 00, 01, 00, 00, 01, 00, 01, 00, 00, 01, 00, 00, 01
;unk_CA8F50       db 00, 00, 01, 00, 00, 00, 01, 01, 01, 00, 00, 00, 01, 01, 01, 00
;unk_CA8F60       db 01, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 01, 01, 00, 01, 00
;unk_CA8F70       db 00, 00, 01, 00, 01, 01, 00, 00, 00, 01, 01, 01, 00, 01, 00, 00
;unk_CA8F80       db 00, 01, 00, 01, 00, 00, 00, 00, 01, 00, 00, 00, 01, 00, 00, 01
;unk_CA8F90       db 01, 00, 00, 00, 01, 00, 00, 00, 01, 00, 01, 01, 01, 01, 01, 00
;unk_CA8FA0       db 01, 01, 00, 00, 01, 00, 00, 00, 00, 01, 00, 00, 00, 00, 01, 00
;unk_CA8FB0       db 00, 00, 00, 01, 00, 00, 00, 00, 00, 01, 01, 00, 01, 01, 01, 01
;unk_CA8FC0       db 01, 01, 01, 01, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00
;unk_CA8FD0       db 01, 00, 00, 01, 00, 01, 01, 00, 00, 01, 01, 00, 01, 00, 00, 00
;unk_CA8FE0       db 01, 01, 00, 00, 00, 01, 00, 01, 01, 00, 00, 01, 00, 00, 01, 00

;---------- decode map as below----------
; 
unk_CA8CF0       db 01, 01, 01, 01, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00
unk_CA8D00       db 01, 00, 00, 01, 00, 01, 01, 00, 00, 01, 01, 00, 01, 00, 00, 00
unk_CA8D10       db 01, 01, 00, 00, 00, 01, 00, 01, 01, 00, 00, 01, 00, 00, 01, 00
unk_CA8D20       db 01, 00, 00, 00, 01, 00, 00, 00, 01, 00, 01, 01, 01, 01, 01, 00
unk_CA8D30       db 01, 01, 00, 00, 01, 00, 00, 00, 00, 01, 00, 00, 00, 00, 01, 00
unk_CA8D40       db 00, 00, 00, 01, 00, 00, 00, 00, 00, 01, 01, 00, 01, 01, 01, 01
unk_CA8D50       db 01, 01, 00, 01, 01, 00, 01, 01, 00, 00, 01, 01, 01, 00, 01, 00
unk_CA8D60       db 00, 00, 01, 00, 01, 01, 00, 00, 00, 01, 01, 01, 00, 01, 00, 00
unk_CA8D70       db 00, 01, 00, 01, 00, 00, 00, 00, 01, 00, 00, 00, 01, 00, 00, 01
unk_CA8D80       db 01, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 01, 00
unk_CA8D90       db 01, 00, 01, 00, 01, 00, 00, 01, 00, 01, 00, 00, 01, 00, 00, 01
unk_CA8DA0       db 00, 00, 01, 00, 00, 00, 01, 01, 01, 00, 00, 00, 01, 01, 01, 00
unk_CA8DB0       db 01, 00, 00, 01, 01, 01, 01, 01, 00, 00, 01, 00, 00, 00, 00, 01
unk_CA8DC0       db 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01, 00
unk_CA8DD0       db 00, 00, 00, 00, 00, 01, 00, 01, 00, 00, 00, 01, 00, 01, 00, 00
unk_CA8DE0       db 00, 00, 00, 00, 01, 01, 01, 00, 00, 01, 00, 00, 01, 00, 00, 00
unk_CA8DF0       db 01, 00, 01, 01, 01, 01, 00, 01, 00, 00, 00, 01, 00, 00, 01, 01
unk_CA8E00       db 01, 00, 01, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 01
unk_CA8E10       db 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 01
unk_CA8E20       db 00, 01, 00, 01, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01
unk_CA8E30       db 00, 01, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 01
unk_CA8E40       db 00, 00, 01, 01, 00, 01, 01, 00, 00, 01, 00, 01, 00, 00, 00, 00
unk_CA8E50       db 01, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 01, 01, 01, 01, 00
unk_CA8E60       db 00, 00, 00, 01, 01, 00, 00, 00, 01, 00, 00, 01, 00, 01, 00, 01
unk_CA8E70       db 01, 00, 01, 00, 00, 00, 01, 01, 00, 01, 01, 01, 01, 00, 01, 01
unk_CA8E80       db 00, 01, 00, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00
unk_CA8E90       db 00, 01, 01, 01, 00, 01, 00, 01, 00, 00, 00, 01, 00, 00, 00, 00
unk_CA8EA0       db 01, 00, 00, 00, 01, 01, 00, 00, 00, 01, 00, 01, 01, 00, 01, 00
unk_CA8EB0       db 00, 01, 01, 00, 01, 00, 01, 01, 00, 00, 00, 01, 01, 00, 01, 01
unk_CA8EC0       db 01, 01, 01, 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 00, 00, 00
unk_CA8ED0       db 01, 00, 01, 00, 01, 00, 01, 00, 01, 00, 00, 01, 00, 00, 01, 01
unk_CA8EE0       db 00, 01, 01, 01, 01, 00, 00, 00, 01, 01, 00, 01, 01, 00, 00, 00
unk_CA8EF0       db 00, 00, 00, 00, 00, 01, 01, 00, 00, 01, 01, 01, 00, 00, 00, 01
unk_CA8F00       db 01, 01, 00, 00, 01, 01, 01, 00, 00, 01, 00, 01, 00, 00, 01, 00
unk_CA8F10       db 00, 00, 01, 00, 01, 01, 01, 00, 01, 00, 00, 01, 00, 01, 00, 00
unk_CA8F20       db 01, 00, 00, 01, 01, 01, 01, 00, 01, 00, 00, 00, 00, 00, 00, 00
unk_CA8F30       db 01, 00, 01, 00, 01, 01, 01, 00, 01, 00, 00, 00, 00, 01, 01, 00
unk_CA8F40       db 00, 01, 01, 01, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00
unk_CA8F50       db 01, 01, 00, 00, 00, 00, 01, 01, 00, 01, 01, 00, 01, 01, 01, 00
unk_CA8F60       db 01, 01, 00, 01, 00, 01, 01, 00, 00, 00, 01, 01, 00, 00, 00, 00
unk_CA8F70       db 00, 00, 01, 01, 00, 01, 01, 00, 01, 01, 01, 00, 01, 01, 01, 00
unk_CA8F80       db 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 00, 00, 00, 00, 00, 00
unk_CA8F90       db 00, 00, 01, 01, 00, 01, 00, 00, 01, 00, 00, 00, 01, 01, 01, 00
unk_CA8FA0       db 01, 00, 01, 01, 00, 01, 00, 00, 00, 00, 00, 00, 01, 01, 00, 01
unk_CA8FB0       db 00, 01, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 01, 00, 01, 01
unk_CA8FC0       db 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 00
unk_CA8FD0       db 00, 01, 01, 00, 01, 01, 01, 00, 01, 00, 00, 00, 00, 01, 01, 00
unk_CA8FE0       db 01, 00, 01, 01, 01, 00, 00, 01, 01, 00, 01, 00, 01, 00, 00, 00

;======

              
; _BYTE byte_CA8FF0[32]
byte_CA8FF0     db 20h dup(0)           ; DATA XREF: sub_5225AC+17o
; _BYTE byte_CA9010[32]
byte_CA9010     db 20h dup(0)           ; DATA XREF: sub_5225AC+12o
byte_CA9030     db 0                    ; DATA XREF: sub_5225AC+53Bw
                                        ; sub_5225AC+803o
byte_CA9031     db 0                    ; DATA XREF: sub_5225AC+3D0w
byte_CA9032     db 0                    ; DATA XREF: sub_5225AC+5E8w
byte_CA9033     db 0                    ; DATA XREF: sub_5225AC+65Fw
byte_CA9034     db 0                    ; DATA XREF: sub_5225AC+7B8w
byte_CA9035     db 0                    ; DATA XREF: sub_5225AC+48Fw
byte_CA9036     db 0                    ; DATA XREF: sub_5225AC+742w
byte_CA9037     db 0                    ; DATA XREF: sub_5225AC+5B2w
byte_CA9038     db 0                    ; DATA XREF: sub_5225AC+2FFw
byte_CA9039     db 0                    ; DATA XREF: sub_5225AC+52Aw
byte_CA903A     db 0                    ; DATA XREF: sub_5225AC+683w
byte_CA903B     db 0                    ; DATA XREF: sub_5225AC+71Ew
byte_CA903C     db 0                    ; DATA XREF: sub_5225AC+3ACw
byte_CA903D     db 0                    ; DATA XREF: sub_5225AC+5C4w
byte_CA903E     db 0                    ; DATA XREF: sub_5225AC+7DCw
byte_CA903F     db 0                    ; DATA XREF: sub_5225AC+46Bw
byte_CA9040     db 0                    ; DATA XREF: sub_5225AC+311w
byte_CA9041     db 0                    ; DATA XREF: sub_5225AC+3E2w
byte_CA9042     db 0                    ; DATA XREF: sub_5225AC+695w
byte_CA9043     db 0                    ; DATA XREF: sub_5225AC+518w
byte_CA9044     db 0                    ; DATA XREF: sub_5225AC+7EEw
byte_CA9045     db 0                    ; DATA XREF: sub_5225AC+730w
byte_CA9046     db 0                    ; DATA XREF: sub_5225AC+323w
byte_CA9047     db 0                    ; DATA XREF: sub_5225AC+459w
byte_CA9048     db 0                    ; DATA XREF: sub_5225AC+5D6w
byte_CA9049     db 0                    ; DATA XREF: sub_5225AC+506w
byte_CA904A     db 0                    ; DATA XREF: sub_5225AC+7CAw
byte_CA904B     db 0                    ; DATA XREF: sub_5225AC+3BEw
byte_CA904C     db 0                    ; DATA XREF: sub_5225AC+671w
byte_CA904D     db 0                    ; DATA XREF: sub_5225AC+47Dw
byte_CA904E     db 0                    ; DATA XREF: sub_5225AC+335w
byte_CA904F     db 0                    ; DATA XREF: sub_5225AC+70Cw
; _BYTE byte_CA9050[56]
byte_CA9050     db 38h dup(0)           ; DATA XREF: sub_5222D8+12o
;=========================
;-----------------per params , input-----------
;Fg					db ' ',0								;绌烘牸锛堝垎闅旂锛?
;Crlf				db 13,10,0							;鍥炶溅鎹㈣

.data?
argvCount			dw 10h dup(?)
Temp				db 10h dup(?)
Temp2				db 20h dup(?)
Temp3				db 20h dup(?)
Temp4				db 20h dup(?)
OutString	 db 600 dup(?)
iResult      db MAX_PATH dup(?)
iResult2      db MAX_PATH dup(?)
iResult3      db MAX_PATH dup(?)
iResult4      db MAX_PATH dup(?)	
iResult5      db MAX_PATH dup(?)
iResult6      db MAX_PATH dup(?)
;.data?
	buffer db 100h dup(?)	;MAX_PATH dup(?)
	myret1 db 40h dup(?)	;MAX_PATH dup(?)
	myret2 db 40h dup(?)	;MAX_PATH dup(?)
	myret3 db 40h dup(?)	;MAX_PATH dup(?)
	myret4 db 40h dup(?)	;MAX_PATH dup(?)
	myret5 db 80h dup(?)	;MAX_PATH dup(?)
	
szBuffer1     db    40h dup (?)
szBuffer2     db    40h dup (?)
szOutput      db    80h dup (?)
	
;.data?
;	buffer	db 100 dup(?)
;	myret1   db 100 dup(?)
;	myret2   db 100 dup(?)

.CODE

; =============== S U B R O U T I N E =======================================


sub_5225AC      proc near               ; CODE XREF: sub_52305C+A8p
                                        ; sub_523188+103p

var_1C          = byte ptr -1Ch
var_14          = dword ptr -14h

                push    ebx
                push    esi
                push    edi
                push    ebp
                add     esp, 0FFFFFFF4h
                mov     esi, eax
                lea     edi, [esp+1Ch+var_1C]
                movsd
                movsd
                mov     [esp+1Ch+var_14], edx
                mov     esi, offset byte_CA9010
                mov     edi, offset byte_CA8FF0
                mov     ebp, esp
                mov     dl, [ebp+7]
                test    dl, 40h
                setnbe  al
                mov     [edi], al
                test    dl, 80h
                setnbe  al
                mov     [esi], al
                mov     cl, [ebp+6]
                test    cl, 40h
                setnbe  al
                mov     [edi+1], al
                test    cl, 80h
                setnbe  al
                mov     [esi+1], al
                mov     al, [ebp+5]
                test    al, 40h
                setnbe  bl
                mov     [edi+2], bl
                test    al, 80h
                setnbe  bl
                mov     [esi+2], bl
                test    byte ptr [ebp+4], 40h
                setnbe  bl
                mov     [edi+3], bl
                test    byte ptr [ebp+4], 80h
                setnbe  bl
                mov     [esi+3], bl
                test    byte ptr [ebp+3], 40h
                setnbe  bl
                mov     [edi+4], bl
                test    byte ptr [ebp+3], 80h
                setnbe  bl
                mov     [esi+4], bl
                test    byte ptr [ebp+2], 40h
                setnbe  bl
                mov     [edi+5], bl
                test    byte ptr [ebp+2], 80h
                setnbe  bl
                mov     [esi+5], bl
                test    byte ptr [ebp+1], 40h
                setnbe  bl
                mov     [edi+6], bl
                test    byte ptr [ebp+1], 80h
                setnbe  bl
                mov     [esi+6], bl
                test    byte ptr [ebp+0], 40h
                setnbe  bl
                mov     [edi+7], bl
                test    byte ptr [ebp+0], 80h
                setnbe  bl
                mov     [esi+7], bl
                test    dl, 10h
                setnbe  bl
                mov     [edi+8], bl
                test    dl, 20h
                setnbe  dl
                mov     [esi+8], dl
                test    cl, 10h
                setnbe  dl
                mov     [edi+9], dl
                test    cl, 20h
                setnbe  dl
                mov     [esi+9], dl
                test    al, 10h
                setnbe  dl
                mov     [edi+0Ah], dl
                test    al, 20h
                setnbe  al
                mov     [esi+0Ah], al
                test    byte ptr [ebp+4], 10h
                setnbe  al
                mov     [edi+0Bh], al
                test    byte ptr [ebp+4], 20h
                setnbe  al
                mov     [esi+0Bh], al
                test    byte ptr [ebp+3], 10h
                setnbe  al
                mov     [edi+0Ch], al
                test    byte ptr [ebp+3], 20h
                setnbe  al
                mov     [esi+0Ch], al
                test    byte ptr [ebp+2], 10h
                setnbe  al
                mov     [edi+0Dh], al
                test    byte ptr [ebp+2], 20h
                setnbe  al
                mov     [esi+0Dh], al
                test    byte ptr [ebp+1], 10h
                setnbe  al
                mov     [edi+0Eh], al
                test    byte ptr [ebp+1], 20h
                setnbe  al
                mov     [esi+0Eh], al
                test    byte ptr [ebp+0], 10h
                setnbe  al
                mov     [edi+0Fh], al
                test    byte ptr [ebp+0], 20h
                setnbe  al
                mov     [esi+0Fh], al
                test    byte ptr [ebp+7], 4
                setnbe  al
                mov     [edi+10h], al
                test    byte ptr [ebp+7], 8
                setnbe  al
                mov     [esi+10h], al
                test    byte ptr [ebp+6], 4
                setnbe  al
                mov     [edi+11h], al
                test    byte ptr [ebp+6], 8
                setnbe  al
                mov     [esi+11h], al
                test    byte ptr [ebp+5], 4
                setnbe  al
                mov     [edi+12h], al
                test    byte ptr [ebp+5], 8
                setnbe  al
                mov     [esi+12h], al
                test    byte ptr [ebp+4], 4
                setnbe  al
                mov     [edi+13h], al
                test    byte ptr [ebp+4], 8
                setnbe  al
                mov     [esi+13h], al
                test    byte ptr [ebp+3], 4
                setnbe  al
                mov     [edi+14h], al
                test    byte ptr [ebp+3], 8
                setnbe  al
                mov     [esi+14h], al
                test    byte ptr [ebp+2], 4
                setnbe  al
                mov     [edi+15h], al
                test    byte ptr [ebp+2], 8
                setnbe  al
                mov     [esi+15h], al
                test    byte ptr [ebp+1], 4
                setnbe  al
                mov     [edi+16h], al
                test    byte ptr [ebp+1], 8
                setnbe  al
                mov     [esi+16h], al
                test    byte ptr [ebp+0], 4
                setnbe  al
                mov     [edi+17h], al
                test    byte ptr [ebp+0], 8
                setnbe  al
                mov     [esi+17h], al
                mov     al, [ebp+7]
                and     al, 1
                mov     [edi+18h], al
                test    byte ptr [ebp+7], 2
                setnbe  al
                mov     [esi+18h], al
                mov     al, [ebp+6]
                and     al, 1
                mov     [edi+19h], al
                test    byte ptr [ebp+6], 2
                setnbe  al
                mov     [esi+19h], al
                mov     al, [ebp+5]
                and     al, 1
                mov     [edi+1Ah], al
                test    byte ptr [ebp+5], 2
                setnbe  al
                mov     [esi+1Ah], al
                mov     al, [ebp+4]
                and     al, 1
                mov     [edi+1Bh], al
                test    byte ptr [ebp+4], 2
                setnbe  al
                mov     [esi+1Bh], al
                mov     al, [ebp+3]
                and     al, 1
                mov     [edi+1Ch], al
                test    byte ptr [ebp+3], 2
                setnbe  al
                mov     [esi+1Ch], al
                mov     al, [ebp+2]
                and     al, 1
                mov     [edi+1Dh], al
                test    byte ptr [ebp+2], 2
                setnbe  al
                mov     [esi+1Dh], al
                mov     al, [ebp+1]
                and     al, 1
                mov     [edi+1Eh], al
                test    byte ptr [ebp+1], 2
                setnbe  al
                mov     [esi+1Eh], al
                mov     al, [ebp+0]
                and     al, 1
                mov     [edi+1Fh], al
                test    byte ptr [ebp+0], 2
                setnbe  al
                mov     [esi+1Fh], al
                mov     dl, 10h
                mov     eax, offset unk_CA8CF0

loc_52283C:                             ; CODE XREF: sub_5225AC+816j
                mov     cl, [esi+1Fh]
                xor     cl, [eax]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi+4]
                xor     bl, [eax+5]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi]
                xor     bl, [eax+1]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+1]
                xor     bl, [eax+2]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+2]
                xor     bl, [eax+3]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+3]
                xor     bl, [eax+4]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5EEB8[ebx]
                xor     bl, [edi+8]
                mov     ds:byte_CA9038, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F0B8[ebx]
                xor     bl, [edi+10h]
                mov     ds:byte_CA9040, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F2B8[ebx]
                xor     bl, [edi+16h]
                mov     ds:byte_CA9046, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F4B8[ecx]
                xor     cl, [edi+1Eh]
                mov     ds:byte_CA904E, cl
                mov     cl, [esi+3]
                xor     cl, [eax+6]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi+8]
                xor     bl, [eax+0Bh]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi+4]
                xor     bl, [eax+7]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+5]
                xor     bl, [eax+8]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+6]
                xor     bl, [eax+9]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+7]
                xor     bl, [eax+0Ah]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5EEF8[ebx]
                xor     bl, [edi+0Ch]
                mov     ds:byte_CA903C, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F0F8[ebx]
                xor     bl, [edi+1Bh]
                mov     ds:byte_CA904B, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F2F8[ebx]
                xor     bl, [edi+1]
                mov     ds:byte_CA9031, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F4F8[ecx]
                xor     cl, [edi+11h]
                mov     ds:byte_CA9041, cl
                mov     cl, [esi+7]
                xor     cl, [eax+0Ch]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi+0Ch]
                xor     bl, [eax+11h]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi+8]
                xor     bl, [eax+0Dh]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+9]
                xor     bl, [eax+0Eh]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+0Ah]
                xor     bl, [eax+0Fh]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+0Bh]
                xor     bl, [eax+10h]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5EF38[ebx]
                xor     bl, [edi+17h]
                mov     ds:byte_CA9047, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F138[ebx]
                xor     bl, [edi+0Fh]
                mov     ds:byte_CA903F, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F338[ebx]
                xor     bl, [edi+1Dh]
                mov     ds:byte_CA904D, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F538[ecx]
                xor     cl, [edi+5]
                mov     ds:byte_CA9035, cl
                mov     cl, [esi+0Bh]
                xor     cl, [eax+12h]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi+10h]
                xor     bl, [eax+17h]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi+0Ch]
                xor     bl, [eax+13h]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+0Dh]
                xor     bl, [eax+14h]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+0Eh]
                xor     bl, [eax+15h]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+0Fh]
                xor     bl, [eax+16h]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5EF78[ebx]
                xor     bl, [edi+19h]
                mov     ds:byte_CA9049, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F178[ebx]
                xor     bl, [edi+13h]
                mov     ds:byte_CA9043, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F378[ebx]
                xor     bl, [edi+9]
                mov     ds:byte_CA9039, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F578[ecx]
                xor     cl, [edi]
                mov     ds:byte_CA9030, cl
                mov     cl, [esi+0Fh]
                xor     cl, [eax+18h]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi+14h]
                xor     bl, [eax+1Dh]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi+10h]
                xor     bl, [eax+19h]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+11h]
                xor     bl, [eax+1Ah]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+12h]
                xor     bl, [eax+1Bh]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+13h]
                xor     bl, [eax+1Ch]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5EFB8[ebx]
                xor     bl, [edi+7]
                mov     ds:byte_CA9037, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F1B8[ebx]
                xor     bl, [edi+0Dh]
                mov     ds:byte_CA903D, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F3B8[ebx]
                xor     bl, [edi+18h]
                mov     ds:byte_CA9048, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F5B8[ecx]
                xor     cl, [edi+2]
                mov     ds:byte_CA9032, cl
                mov     cl, [esi+13h]
                xor     cl, [eax+1Eh]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi+18h]
                xor     bl, [eax+23h]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi+14h]
                xor     bl, [eax+1Fh]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+15h]
                xor     bl, [eax+20h]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+16h]
                xor     bl, [eax+21h]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+17h]
                xor     bl, [eax+22h]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5EFF8[ebx]
                xor     bl, [edi+3]
                mov     ds:byte_CA9033, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F1F8[ebx]
                xor     bl, [edi+1Ch]
                mov     ds:byte_CA904C, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F3F8[ebx]
                xor     bl, [edi+0Ah]
                mov     ds:byte_CA903A, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F5F8[ecx]
                xor     cl, [edi+12h]
                mov     ds:byte_CA9042, cl
                mov     cl, [esi+17h]
                xor     cl, [eax+24h]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi+1Ch]
                xor     bl, [eax+29h]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi+18h]
                xor     bl, [eax+25h]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+19h]
                xor     bl, [eax+26h]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+1Ah]
                xor     bl, [eax+27h]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+1Bh]
                xor     bl, [eax+28h]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5F038[ebx]
                xor     bl, [edi+1Fh]
                mov     ds:byte_CA904F, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F238[ebx]
                xor     bl, [edi+0Bh]
                mov     ds:byte_CA903B, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F438[ebx]
                xor     bl, [edi+15h]
                mov     ds:byte_CA9045, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F638[ecx]
                xor     cl, [edi+6]
                mov     ds:byte_CA9036, cl
                mov     cl, [esi+1Bh]
                xor     cl, [eax+2Ah]
                and     ecx, 0FFh
                shl     ecx, 5
                mov     bl, [esi]
                xor     bl, [eax+2Fh]
                and     ebx, 0FFh
                shl     ebx, 4
                or      cx, bx
                mov     bl, [esi+1Ch]
                xor     bl, [eax+2Bh]
                and     ebx, 0FFh
                shl     ebx, 3
                or      cx, bx
                mov     bl, [esi+1Dh]
                xor     bl, [eax+2Ch]
                and     ebx, 0FFh
                shl     ebx, 2
                or      cx, bx
                mov     bl, [esi+1Eh]
                xor     bl, [eax+2Dh]
                and     ebx, 0FFh
                add     ebx, ebx
                or      cx, bx
                mov     bl, [esi+1Fh]
                xor     bl, [eax+2Eh]
                and     ebx, 0FFh
                or      cx, bx
                movzx   ebx, cx
                mov     bl, ds:byte_C5F078[ebx]
                xor     bl, [edi+4]
                mov     ds:byte_CA9034, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F278[ebx]
                xor     bl, [edi+1Ah]
                mov     ds:byte_CA904A, bl
                movzx   ebx, cx
                mov     bl, ds:byte_C5F478[ebx]
                xor     bl, [edi+0Eh]
                mov     ds:byte_CA903E, bl
                movzx   ecx, cx
                mov     cl, ds:byte_C5F678[ecx]
                xor     cl, [edi+14h]
                mov     ds:byte_CA9044, cl
                push    esi
                push    edi
                mov     ecx, 8
                rep movsd
                pop     edi
                pop     esi
                push    esi
                push    edi
                mov     edi, esi
                mov     esi, offset byte_CA9030
                mov     ecx, 8
                rep movsd
                pop     edi
                pop     esi
                add     eax, 30h
                dec     dl
                jnz     loc_52283C
                mov     al, [edi+7]
                shl     eax, 7
                mov     dl, [esi+7]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+0Fh]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+0Fh]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+17h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+17h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+1Fh]
                add     edx, edx
                or      al, dl
                or      al, [esi+1Fh]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx], al
                mov     al, [edi+6]
                shl     eax, 7
                mov     dl, [esi+6]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+0Eh]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+0Eh]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+16h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+16h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+1Eh]
                add     edx, edx
                or      al, dl
                or      al, [esi+1Eh]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx+1], al
                mov     al, [edi+5]
                shl     eax, 7
                mov     dl, [esi+5]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+0Dh]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+0Dh]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+15h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+15h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+1Dh]
                add     edx, edx
                or      al, dl
                or      al, [esi+1Dh]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx+2], al
                mov     al, [edi+4]
                shl     eax, 7
                mov     dl, [esi+4]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+0Ch]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+0Ch]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+14h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+14h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+1Ch]
                add     edx, edx
                or      al, dl
                or      al, [esi+1Ch]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx+3], al
                mov     al, [edi+3]
                shl     eax, 7
                mov     dl, [esi+3]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+0Bh]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+0Bh]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+13h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+13h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+1Bh]
                add     edx, edx
                or      al, dl
                or      al, [esi+1Bh]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx+4], al
                mov     al, [edi+2]
                shl     eax, 7
                mov     dl, [esi+2]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+0Ah]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+0Ah]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+12h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+12h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+1Ah]
                add     edx, edx
                or      al, dl
                or      al, [esi+1Ah]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx+5], al
                mov     al, [edi+1]
                shl     eax, 7
                mov     dl, [esi+1]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+9]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+9]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+11h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+11h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+19h]
                add     edx, edx
                or      al, dl
                or      al, [esi+19h]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx+6], al
                mov     al, [edi]
                shl     eax, 7
                mov     dl, [esi]
                shl     edx, 6
                or      al, dl
                mov     dl, [edi+8]
                shl     edx, 5
                or      al, dl
                mov     dl, [esi+8]
                shl     edx, 4
                or      al, dl
                mov     dl, [edi+10h]
                shl     edx, 3
                or      al, dl
                mov     dl, [esi+10h]
                shl     edx, 2
                or      al, dl
                mov     dl, [edi+18h]
                add     edx, edx
                or      al, dl
                or      al, [esi+18h]
                mov     edx, [esp+1Ch+var_14]
                mov     [edx+7], al
                add     esp, 0Ch
                pop     ebp
                pop     edi
                pop     esi
                pop     ebx
                retn
sub_5225AC      endp
;-----------------------------------------------------



; =============== S U B R O U T I N E =======================================
sub_convert proc near                    ; to convert String to hex, 

		push ecx
		push esi
		push edi
		push edx
		push ebp
		push esp
		
		mov edi, edx  					; my _OUT ptr supposed in edx , hex
		mov esi, eax
		
		invoke lstrlen, eax		; my _IN  ptr supposed in eax , String
		mov ecx, eax 
		cld
		test eax , eax
		je j_skip00
;----------------- try4 -------------; running fine for now
				;invoke lstrlen , offset mynum3 
				;mov ecx, eax
;----------------- try3 -------------;
				;lea esi, offset mynum3
				;lea edi, offset iResult   		; ok 
				
				
LCON001:
				push ecx
				xor  eax, eax
				lodsw
				
				mov edx, offset Temp
				mov [edx], eax
				invoke htodw,  edx ;offset Temp2		; ok, this works fine with movsw,  (CANNOT use edx/eax)
				mov [edi], eax					; to synchornize Temp2 and result (iResult?) the value 100 just a guess number
				inc edi
				;invoke StdOut, offset iResult	
;----------------end of try3--------------ok on try3-------------------
				pop ecx
				dec ecx
				dec ecx
				jnz LCON001
				
				;invoke StdOut, edi ;offset iResult
;---------------- end of try4 --------------------------
j_skip00:		
		pop esp
		pop ebp
		pop edx
		pop edi
		pop esi
		pop ecx
		retn
sub_convert endp
;--------------------------------------------------



; =============== S U B R O U T I N E =======================================
sub_split proc near
		push eax
		push ecx
		push edx
		push edi
		push esi
		push ebp
		push esp
		

		mov esi , eax
	invoke lstrlen, eax   ; my _IN  ptr supposed in eax

	.if eax > 16
		mov ecx, 16
		mov edi, offset Temp3
		rep movsb
		mov ecx, 16
		mov edi, offset Temp4   ;  -- more byte
		rep movsb
	.else
		mov ecx, 16
		mov edi, offset Temp3
		rep movsb
	.endif

		pop esp
		pop ebp
		pop esi
		pop edi
		pop edx
		pop ecx
		pop eax
		retn
sub_split endp
;------------------------------------------------------



; =============== S U B R O U T I N E =======================================
sub_clearz proc near   ; clear the memory from addr in eax to length in edx
	push esi
	push edi
	push ecx
	push ebx
	push ebp
	push esp
	

	mov esi, eax
	mov ecx, edx
	xor eax, eax
bk_loop:
	;rep stosb
	mov [esi], eax
	inc esi
	dec ecx
	jnz bk_loop
	
	pop esp
	pop ebp
	pop ebx
	pop ecx
	pop edi
	pop esi
	retn
sub_clearz endp
;----------------------------------------------------------------------------





; =============== S U B R O U T I N E =======================================
sub_clearz_mem proc near
		push esi
		push edi
		push ecx
		push ebx
		push ebp
		push esp
		
		;		;--------- clearz mem -----------
		mov eax, offset buffer
		mov edx, 100h
		call sub_clearz
		mov eax, offset Temp
		mov edx, 10h
		call sub_clearz
		mov eax, offset Temp2
		mov edx, 20h
		call sub_clearz
		mov eax, offset Temp3
		mov edx, 20h
		call sub_clearz
		mov eax, offset Temp4
		mov edx, 20h
		call sub_clearz
		mov eax, offset myret1
		mov edx, 40h
		call sub_clearz
		mov eax, offset myret2
		mov edx, 40h
		call sub_clearz
		mov eax, offset myret3
		mov edx, 40h
		call sub_clearz
		mov eax, offset myret4
		mov edx, 40h
		call sub_clearz
		mov eax, offset myret5
		mov edx, 80h
		call sub_clearz	
		
		pop esp
		pop ebp
		pop ebx
		pop ecx
		pop edi
		pop esi
		retn

sub_clearz_mem endp
; --------------------------------------------------------------------------


; =============== S U B R O U T I N E =======================================
sub_decode proc near
		push esi
		push edi
		push ecx
		push ebx
		push ebp
		push esp
		
		
		;lea eax, buffer
		call sub_split
		
		;if len Temp3=0  ignore00
		invoke lstrlen , offset Temp3
	.if eax == 00 
		jmp j_ignore00
	.else
		lea eax, offset Temp3
		lea edx, offset myret1
		call sub_convert	
	.endif	
	
		;if len Temp4=0  ignore01
		invoke lstrlen , offset Temp4
	.if eax == 00 
		jmp j_ignore01
	.else	
		lea eax, offset Temp4
		lea edx, offset myret2
		call sub_convert
	.endif
	
j_ignore01:	
		;if length myret1 =0 ,ignore00
		invoke lstrlen , offset myret1
;	.if eax == 00 
;		jmp j_ignore00
;	.else
		lea eax, offset myret1
		lea edx, offset myret3
		call sub_5225AC
;	.endif
	
		;if len myret2 =0, ignore00
		invoke lstrlen , offset myret2
	.if eax == 00 
		jmp j_ignore00
	.else
		lea eax, offset myret2
		lea edx, offset myret4
		call sub_5225AC
	.endif
		
j_ignore00:		
		
		invoke lstrcat,addr myret5, addr myret3
		invoke lstrcat,addr myret5, addr myret4
		
		;invoke lstrcat,addr myret5, addr Crlf
		;invoke StdOut, offset myret5
		pop esp
		pop ebp
		pop ebx
		pop ecx
		pop edi
		pop esi
		retn
sub_decode endp
;-----------------------------------------------------------------------------

	
;.CODE
include       _Cmdline.asm 
START:

;----------------
					invoke GetCommandLine									 ;鍙栧懡浠よ鍙傛暟
					mov esi,eax
					invoke lstrcat,addr OutString,eax			 ;鍚堝苟瀛楃涓?
;					invoke lstrcat,addr OutString,addr Crlf
					invoke lstrlen,esi											;鍙栧瓧绗︿覆闀垮害
					mov ecx,eax
					cld

;----------------
					invoke _argc
				.if eax > 0
					invoke _argv, 1 , addr szBuffer2, sizeof szBuffer2
				.else
					jmp Loop_on_key_input
				.endif
					;invoke StdOut, offset szBuffer2
					lea eax, szBuffer2
					call sub_decode
					invoke StdOut, offset myret5
					call sub_clearz_mem
					
;----------------					
Loop_on_key_input	:
	;--------------test on keyboard input ----------
;		invoke StdIn,addr buffer,sizeof buffer
;		
;		invoke lstrlen, offset buffer
;
;		;invoke StripLF, offset buffer
;		invoke StdOut, offset buffer
;		invoke StripLF, offset buffer
;
;
;		lea eax, buffer
;		call sub_decode
;		
;		;invoke lstrcat, addr myret5,  addr Crlf    ; print it out on the screen
;		invoke StdOut, CTXT("    ")             ; 4 space
;		invoke StdOut, offset myret5
;		
;		invoke StdOut, offset Crlf
;;		invoke StdOut, CTXT("    ")             ; 4 space
;;		invoke StdOut, offset myret3
;;		invoke StdOut, CTXT("    ")             ; 4 space
;;		invoke StdOut, offset myret4
;		call sub_clearz_mem


;	;--------------------	
_toEnd:	
;		jmp Loop_on_key_input
	
	;暂停显示,回车键关闭
	;invoke StdIn,addr buffer,sizeof buffer
	
	invoke ExitProcess,0
	
end START