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

includelib user32.lib
includelib kernel32.lib
includelib masm32.lib
include macro.asm



.data

;	myMsg		db "Hello World!$"
;	crlf     db "  "
;	zcm   db "10001383"              ;"10001336",0
	
	;test01   dw 08h, 0Ch, 09h, 0Fh, 04h,04h 02h,04h, 01h,01h, 0Dh, 0Fh, 06h, 08h, 07h, 0Eh  
	;test02 dw 2444h , 9f8ch, 7e68h, 0df11h
;	mkcode db 24h, 44h, 09fh, 8ch, 7eh, 68h, 0dfh, 11h
;	test03 dd 2444h, 9f8ch, 7e68h, 0de11h
	
	; "0x24449F8C7E68DF11h",0     ;24449F8C 7E68DF11 

;    8C9F4424
;    11DF687E

	
;.data?
;	buffer	db MAX_PATH dup(?)
;org 0C5EEB8H

; char byte_C5EEB8[]
byte_C5EEB8     db 1                    ; DATA XREF: sub_5225AC+2F6r
                db 0 ;align 2
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
; char byte_C5EEF8[]
byte_C5EEF8     db 1                    ; DATA XREF: sub_5225AC+3A3r
                db 0 ;align 2
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
; char byte_C5EF38[]
byte_C5EF38     db 1                    ; DATA XREF: sub_5225AC+450r
                db 0 ;align 2
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
; char byte_C5EF78[]
byte_C5EF78     db 0                    ; DATA XREF: sub_5225AC+4FDr
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
; char byte_C5EFB8[]
byte_C5EFB8     db 0                    ; DATA XREF: sub_5225AC+5A9r
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
; char byte_C5EFF8[]
byte_C5EFF8     db 1                    ; DATA XREF: sub_5225AC+656r
                db 0 ;align 2
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
; char byte_C5F038[]
byte_C5F038     db 0                    ; DATA XREF: sub_5225AC+703r
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
; char byte_C5F078[]
byte_C5F078     db 1                    ; DATA XREF: sub_5225AC+7AFr
                db 0 ;align 2
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
; char byte_C5F0B8[]
byte_C5F0B8     db 1                    ; DATA XREF: sub_5225AC+308r
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
; char byte_C5F0F8[]
byte_C5F0F8     db 1                    ; DATA XREF: sub_5225AC+3B5r
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
; char byte_C5F138[]
byte_C5F138     db 0                    ; DATA XREF: sub_5225AC+462r
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
; char byte_C5F178[]
byte_C5F178     db 1                    ; DATA XREF: sub_5225AC+50Fr
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
; char byte_C5F1B8[]
byte_C5F1B8     db 0                    ; DATA XREF: sub_5225AC+5BBr
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
; char byte_C5F1F8[]
byte_C5F1F8     db 1                    ; DATA XREF: sub_5225AC+668r
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
; char byte_C5F238[]
byte_C5F238     db 1                    ; DATA XREF: sub_5225AC+715r
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
; char byte_C5F278[]
byte_C5F278     db 1                    ; DATA XREF: sub_5225AC+7C1r
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
; char byte_C5F2B8[]
byte_C5F2B8     db 1                    ; DATA XREF: sub_5225AC+31Ar
                align 4
                db    1
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
; char byte_C5F2F8[]
byte_C5F2F8     db 1                    ; DATA XREF: sub_5225AC+3C7r
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
; char byte_C5F338[]
byte_C5F338     db 1                    ; DATA XREF: sub_5225AC+474r
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
; char byte_C5F378[]
byte_C5F378     db 1                    ; DATA XREF: sub_5225AC+521r
                db 0 ;align 2
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
; char byte_C5F3B8[]
byte_C5F3B8     db 1                    ; DATA XREF: sub_5225AC+5CDr
                align 4
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
; char byte_C5F3F8[]
byte_C5F3F8     db 0                    ; DATA XREF: sub_5225AC+67Ar
                db 0 ;align 2
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
; char byte_C5F438[]
byte_C5F438     db 0                    ; DATA XREF: sub_5225AC+727r
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
; char byte_C5F478[]
byte_C5F478     db 0                    ; DATA XREF: sub_5225AC+7D3r
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
; char byte_C5F4B8[]
byte_C5F4B8     db 0                    ; DATA XREF: sub_5225AC+32Cr
                db 0 ;align 2
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
; char byte_C5F4F8[]
byte_C5F4F8     db 1                    ; DATA XREF: sub_5225AC+3D9r
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
; char byte_C5F538[]
byte_C5F538     db 0                    ; DATA XREF: sub_5225AC+486r
                db 0 ;align 2
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
; char byte_C5F578[]
byte_C5F578     db 1                    ; DATA XREF: sub_5225AC+533r
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
; char byte_C5F5B8[]
byte_C5F5B8     db 0                    ; DATA XREF: sub_5225AC+5DFr
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
; char byte_C5F5F8[]
byte_C5F5F8     db 0                    ; DATA XREF: sub_5225AC+68Cr
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    1
; char byte_C5F638[]
byte_C5F638     db 0                    ; DATA XREF: sub_5225AC+739r
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
; char byte_C5F678[]
byte_C5F678     db 1                    ; DATA XREF: sub_5225AC+7E5r
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1
                db    1
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    1
                db    1
                db    1
                db    1
                db    0
                db    0
                db    1
                db    0
                db    1
                db    0
                db    0
                db    0
                db    1
                db    1
                db    0
                db    1
                db    0
                db    1
                db    1
                db    0
                db    1

;======
unk_CA8CF0      db    0                 ; DATA XREF: sub_5222D8+24Fo
                                        ; sub_5225AC+28Bo
unk_CA8CF1      db    0                 ; DATA XREF: sub_5222D8+28Do
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
                db    0
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


	myMsg		db "Hello World!$"
	crlf     db "  "
	zcm   db "10001383"              ;"10001336",0
	
	;test01   dw 08h, 0Ch, 09h, 0Fh, 04h,04h 02h,04h, 01h,01h, 0Dh, 0Fh, 06h, 08h, 07h, 0Eh  
	;test02 dw 2444h , 9f8ch, 7e68h, 0df11h
	mkcode db 24h, 44h, 09fh, 8ch, 7eh, 68h, 0dfh, 11h
	test03 dd 2444h, 9f8ch, 7e68h, 0de11h

.data?
	buffer	db MAX_PATH dup(?)
	myret1 db MAX_PATH dup(?)
	myret2 db MAX_PATH dup(?)
;.data?
;	buffer	db 100 dup(?)
;	myret1   db 100 dup(?)
;	myret2   db 100 dup(?)

.CODE

org 005225ACh
;assume  cs:CODE, ds:DATA 
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


	
;.CODE
START:

   invoke locate, 3,1
	;--zcm --> mkcode  unk_CA8CF0==00
	lea edx, offset myret1
	lea eax, offset zcm
	call sub_5225AC
	lea ebx, offset myret1
	invoke StdOut, offset myret1
	
	
	;--mkcode --> zcm  unk_CA8CF0==00
	lea edx, offset myret2
	lea eax, offset mkcode
	call sub_5225AC
	invoke StdOut, offset myret2
	
	invoke locate,3,3
	
	
	mov [unk_CA8CF0], 01
	
	;--zcm --> mkcode  unk_CA8CF0==01
	lea edx, offset myret1
	lea eax, offset zcm
	call sub_5225AC
	lea ebx, offset myret1
	invoke StdOut, offset myret1
	
	
	;--mkcode --> zcm  unk_CA8CF0==01
	lea edx, offset myret2
	lea eax, offset mkcode
	call sub_5225AC
	invoke StdOut, offset myret2
	
	invoke locate, 3,5
	
	;invoke StdOut,CTXT("Hello World! _ ")
	invoke StdOut, offset myMsg
	
	
	;invoke StdOut, offset myret1
	
	;invoke StdOut, offset myret2

	;暂停显示,回车键关闭
	invoke StdIn,addr buffer,sizeof buffer
	invoke ExitProcess,0
	
end START