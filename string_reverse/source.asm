section .data
  givenString dd 0xa,"Lorem ipsum dolor sit amet, Aaron Burr, Sir!$",0xa
  len: equ $ - givenString
  sepChar dw 0x24

section .text
  global _start

_start:
nop; start
  ;count characters until 0x24 ($)
  mov eax,givenString
  dec eax
  doWhileA:
    inc eax
    mov ecx,[eax]
    cmp ecx,[sepChar]
    jne doWhileA
  
  ;move forwards and backwards through the memory of the string
  ;and swap the first and last positions
  ;eax = endPos ebx = startPos
  mov ebx,givenString
  dec ebx
  doWhileB:
    mov ch,[eax]  ;load last character into Register C
    mov dh,[ebx]  ;load first character into Register D
    xor ch,dh     ;use xor swap algorithm to swap C and D
    xor dh,ch     
    xor ch,dh
    mov [eax],ch  ;move swapped characters back into memory
    mov [ebx],dh
    inc ebx       ;increment begin pointer
    dec eax       ;decrement end pointer
    cmp eax,ebx   ; check if they overlap, if no, repeat
    jg doWhileB

  mov edx,len         ;set length of string
  mov ecx,givenString ;set address of string
  mov ebx,1           ;set output (std::out)
  mov eax,4           ;set call (sys_write)
  int 0x80            ;call interrupt
nop; stop

;exit cleanly (on linux)
mov eax,1
mov ebx,0
int 0x80
