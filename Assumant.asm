.MODEL SMALL 
.STACK 100H
.DATA 
MSG DB 0AH, 0DH,"ENTER THE 8-BIT NUMBER:$"
RESULT DB "SERIES SUM=$"
NEWLINE DB 0AH,0DH,"$"
NUM DB ?    
SUM DW ?      
SER DW ?  
CNT DB 0   
C DB ?

PRINT MACRO NUM    ;MACRO TO PRINT THE NUMBERS
LOCAL W     
LOCAL NE    ; TO MAKE ALL THE LABELS LOCAL
LOCAL E 

PUSH CX
LEA SI,NUM
MOV AX,[SI]
MOV CX,1
MOV DX,0
MOV BX,10
DIV BX
PUSH DX

W:   
CMP AX,0 
JNE NE
JE E
  
NE:
MOV DX,0
DIV BX
PUSH DX
INC CX ; TO DETERMINE THE NUMBER OF DIGITS
JMP W

E: 
POP DX
ADD DX,30H ; TO CONVERGE THE  REAL TO THE NUMBERS VALUE TO THE ASSCII VALUR
MOV AH,02
INT 21H 
LOOP E 
POP CX
ENDM
;----------------------------------------------------------
.CODE 
MAIN: 
MOV AX,@DATA 
MOV DS,AX 

NUMBER: 
LEA DX,MSG 
MOV AH,09H 
INT 21H

CALL READ     ; READ AND CONVERT THE NUMBER
MOV NUM,BL
LEA DX,NEWLINE 
MOV AH,09H 
INT 21H       ; SAVE NUMBER 

LEA DX,RESULT ;PRINT RESULT
MOV AH,09H 
INT 21H    
 
MOV SER,2 
MOV AH,02H ;FUNCTION PRINT CHARCTER   
  
MOV DL,'1'
INT 21H
MOV DL,'+'
INT 21H

MOV CL, NUM 
MOV C,CL 
MOV CH,0   
MOV SUM,0
SM:
CALL SPSUM
ADD SUM, AX 
DEC NUM
CMP CX,2
JE FIN  
CMP CX,1
JE FIN   
MOV AH,02H ;FUNCTION PRINT CHARCTER
MOV DL,')'
INT 21H  
CMP CX,3
JE FIN
MOV DL,'+'
INT 21H 
  
FIN: 
LOOP SM 

MOV DL,'='
MOV AH,02H 
INT 21H
ADD SUM,1
PRINT SUM

MOV AH,4CH 
INT 21H

;READING A BINARY NUMBER
READ PROC NEAR
MOV BX, 0
MOV CX, 8
MOV AH, 01H

L:INT 21H
CMP AL,"0"
JNZ O5
SHL BL,1  
JMP LL

O5:
ADD AL,0FFH
RCL BL,1 
 
LL:
LOOP L
RET
ENDP   
                        
SPSUM PROC NEAR   
INC CNT     
MOV AL,NUM  
MOV BH,NUM
INC BH  
MUL BH
SHR AX,1 
MOV BL,CNT
CMP C,BL
JE RR  
CMP CX,1
JE RR          
PUSH CX  
PUSH AX   
MOV AH,02H ;FUNCTION PRINT CHARCTER
MOV DL,'('
INT 21H  
MOV BL,NUM 
MOV BH,0
MOV CX,SER
MOV DX,1  
MOV SER,DX

PR: 
PRINT SER  
CMP CX,1
JE PP
MOV DL,'+'
INT 21H

PP:   
INC SER
LOOP PR  
POP CX 
POP AX
     
RR:RET
ENDP