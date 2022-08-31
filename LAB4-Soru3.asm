.model small

.data
    
    numbers db 21,42,5,17,8,9,51,12,32,3           
    
    sum db ?        ;+
    avg db ?        ;+
    
    max_num db ?     ;+
    min_num db ?     ;+
        
    amount_of_even db ? ;+
    amount_of_numbers_greater_than_avg db ? ;+
    
           
.code 

main proc
    
FIND_MAX:    
    mov ax,@data
    mov ds,ax
         
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov si,OFFSET numbers 
    mov al,[si]
    
    mov cx,10       ; counter set to 10 because there are 10 numbers in array
    
maxloop1:
    add si,1        ; offset adress goes one by one
    cmp [si],al  
    jb  maxloop2    ; jump if below next value
    mov al,[si]

maxloop2: 
    loop maxloop1
    mov max_num,al        

;-----------------------------------------------------------
    
FIND_MIN:
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov cx,10
    dec cx
    
    mov si,OFFSET numbers
    mov al,[si]     
    
minloop1:
    inc si
    cmp [si],al
    ja minloop2     ; jump if above next value
    mov al,[si]

minloop2:
    loop minloop1        
    
    mov min_num, al

;-----------------------------------------------------------

SUM_OF_ARR:

    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov si,OFFSET numbers
    
    mov cx,10
    
    mov dl,0        ; dl stores sum of numbers tmp
    
sumloop:
    add dl,[si]
    inc si
    loop sumloop
        
    mov sum,dl 

;-----------------------------------------------------------
    
AVG_OF_ARR: 
    mov al,sum      ; move sums to al
    mov bl,10       ; move numbers to bl
    div bl       
    mov avg,al      ; move  avg to avg var

;-----------------------------------------------------------

AMOUNT_OF_EVEN_NUMS:
    
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov si,OFFSET numbers
    
    mov cx,10
    
    mov dl,0        ; stores amount of even nums tmp
    
evenloop:  
    mov al,[si]
    mov bl,2
    xor ah,ah
    div bl
    cmp ah,1        ; if number is odd zero is 1, if number is even carry is 1
    jz odd
    jc even   
    
even:
    add dl,1  

odd:    
    add si,1     
    loop evenloop
    
    mov amount_of_even,dl

;-----------------------------------------------------------

AMOUNT_OF_EVEN_NUMS_GREATER_THAN_AVG:
    
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov si,OFFSET numbers
    
    mov cx,10
    
    mov dl,0        ; stores amount of even nums greater than avg tmp

gr_than_avg:    
    mov al,[si]
    mov bl,avg
    cmp al,bl       ; if number [al] is gr than avg [bl] zero is 1, elif 
                    ; number is less than avg carry is 1, else both are 0
    ja greater                 
    jb less          

greater:
    add dl,1
    
less:
    add si,1
    loop gr_than_avg
       
    mov amount_of_numbers_greater_than_avg,dl
             
    main endp
end
