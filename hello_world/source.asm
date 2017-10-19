section .data
  givenString db "Lorem Ipsum, dolor sit amet!$",0xa
  len: equ $ - givenString
  sepChar dw 0x24

section .text
  global _start

_start:
nop; start
  mov edx,len
  mov ecx,givenString
  mov ebx,1
  mov eax,4
  int 0x80
nop; stop

;exit cleanly (on linux)
mov eax,1
mov ebx,0
int 0x80
