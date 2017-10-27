;******************************************************************************
;                               LIB
;   Library to make working in x86 ASM better
;   
;   AUTHOR: Marius Schär github.com/martyschaer
;******************************************************************************   
GLOBAL Math_Sum
;******************************************************************************
; Procedure   : Math_Sum
; IN          : RAX -> Number (Upper bound of summation)
; OUT         : RAX -> Number (Result)
; Description : Returns the sum until Upper bound RAX
;******************************************************************************
Math_Sum:
  push RBX      ;save RBX from desctruction
  xor RBX,RBX   ;set RBX to 0
  .doWhile:     ;RAX != 0; RAX--
    add RBX,RAX ;add the counter to RBX
    dec RAX     ;decrement counter
    cmp RAX,0   ;if counter is not 0
    jnz .doWhile;then repeat
  pop RBX       ;restore RBX
ret

GLOBAL Str_Print
;******************************************************************************
; Procedure   : Str_Print
; IN          : RCX -> Address to a printable string
; IN          : RDX -> Length of memory to print
; OUT         : some text is printed to STD:OUT
; Description : Prints a memory location to STD:OUT. Wraps sys_write call
;******************************************************************************
Str_Print:
  push RAX
  push RBX    ;save registers
  mov RBX, 1  ;set output to 1 (STD:OUT)
  mov RAX, 4  ;call sys_write
  int 0x80    ;trigger interrupt
  pop RBX     ;restore registers
  pop RAX
ret
