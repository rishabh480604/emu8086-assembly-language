
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
;Cyan color text on the output screen at row 20, column 15, page no. 0 using interrupt

org 100h

MOV CX, 20     ; Initialize array length*2 to 20
MOV BX, 0      ; Initialize array index to 0
MOV AX, 9999h  ; Initialize search value  

SMALLEST:
  CMP BX, CX   ; Compare array index with array length
  JE END_LOOP  ; End loop if index equals length
  MOV SI, BX   ; Load array index into SI register
  MOV DI, ARRAY ; Load array address into DI register
  ADD DI, SI   ; Add index to address to get element address
  MOV DL,[DI]; 
  
  INC BX
  MOV SI, BX   ; Load array index into SI register
  MOV DI, ARRAY ; Load array address into DI register
  ADD DI, SI   ; Add index to address to get element address
  MOV DH,[DI];
  
  CMP AX,DX ; Compare search value with array element 
  JG GREAT     ; JUMP WHEN GREATER
  MOV AX,DX ;    


GREAT:
  INC BX       ; Increment array index
  JMP SMALLEST ; Jump to next iteration

END_LOOP: 
   ADD ax,7638 ;add reg no
   mov [7000h],ah
   mov [7001h],al
   
   push 0h;t
   
   ;OUTPUT IN stack

jmp loop_val1;

;print dx
loop_val1: 

    mov bx,0010;
    xor dx,dx
    div bx
    mov cx,ax    
    ;mov ah,2
    add dl,48
    push dx;
    ;int 21h
    mov ax,cx
    cmp ax,0; 
    jne loop_val1;  
  
    
mov 700h,15 

    
output: 

     
    mov ah, 2h 
    ;mov al, 34h    ;color 
    mov bh, 0     ;page
    mov dh, 20    ;row
    mov dl, [700h]    ;column
    inc dl
    mov [700h],dl
    int 10h
    
    
    pop ax  
    cmp ax,0
    je quit 
    mov ah,09h
    mov bl,01h ;colour
    mov cx,01h
    int 10h 
    
   
    
    jmp output  
    
   
   
ARRAY:
  DW 1486h, 2374h, 3459h, 4743h, 5589h, 6E43h, 7098h,1234h, 8623h, 8799h ; Data array

quit:
    ret 
    




