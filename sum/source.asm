section .data
  number dd 234
  
section .text
  global _start

_start:
nop; start of program

mov eax,[number]  ;use eax as counter
mov ebx,0x0       ;init sum as 0

cmp eax,0x0
jz end ;skip calculation when sum of 0 is requested
doWhileEAXNotZero: ;run as many times as the value in eax
  add ebx,eax
  dec eax
  cmp eax,0x0
  jnz doWhileEAXNotZero
end:

nop

nop; end of program
;exit program cleanly (on linux)
mov eax,1 ; set sys_exit
mov ebx,0 ; set error code to 0
int 0x80  ; trigger interrupt
