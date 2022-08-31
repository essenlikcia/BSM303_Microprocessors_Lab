.model small

.data
     
    number1 db 10
    number2 db 2
    
    sum_result db 0
    sub_result db 0
    mul_result db 0
    div_result db 0
     
.code            

main proc        
    
    mov ax,@data
    mov ds,ax
    
    mov al, number1
    add al, number2
    mov sum_result, al
    
    mov al, number1
    sub al, number2
    mov sub_result, al
    
    mov al, number1
    mov bl, number2
    mul bl
    mov mul_result, al
    
    mov al, number1
    mov bl, number2
    div bl
    mov div_result, al
    
    main endp
end
