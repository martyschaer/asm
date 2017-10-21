section .data
  number dd 5
  
section .text
  global _start

_start:
nop; start of program

mov ecx,[number]  ;use eax as counter
mov eax,[eax]       ;init sum as 0

cmp ecx,0x0
jz end ;skip calculation when sum of 0 is requested
.doWhile: ;run as many times as the value in eax
  dec ecx
  mul ecx
  mov eax,edx
  cmp ecx,0x0
  jnz .doWhile
end:

nop

nop; end of program
;exit program cleanly (on linux)
mov eax,1 ; set sys_exit
mov ebx,0 ; set error code to 0
int 0x80  ; trigger interrupt
