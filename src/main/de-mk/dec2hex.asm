.data
 lpHexString	db "0123456789ABCDEF"
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