.model small                
.stack 100h                  

.data                       

; Request UserInput
user_input_prompt  db 13, 10, 'Please choose an option from the menu showcaseed above: $'

; Visual Separator
_section_separator_ db 13, 10, 'Thanks for utilizing the inventory management system!','$'

; Main Menu
_primary_menu_start db 13, '____________________ -  Inventory - _____________________',13,10
    db 'Abdulrahman Gamil',13, 10                
    db 'TP071012',13, 10
    db '',13,10
_primary_menu_ db 13, '',13,10
    db '',13, 10                
    db '',13, 10
    db '_________________ - System Structure  - _________________',13,10
    db '1. View Commodities ',13,10                      ; Option 1: View Commodities_
    db '2. Add Stock',13,10                       ; Option 2: Add Stock
    db '3. Process Sale',13,10                    ; Option 3: Process Sale
    db '4. Crucial Inventory & Sales Information',13,10     ; Option 4: Crucial Inventory & Sales Information
    db '5. Terminate_program',13,10                            ; Option 5: Terminate_program
    db '_',13,10
    db '$'

; Inventory Summary
inventory_summary_  db 13,'___________________ - Inventory Information - ___________________',13,10
    db '',13,10
    db 'ID', 9,'Commodity  Name   Stock Price   Units Purchased', '$'

; User Decisions within Summary Menu 
summary_menu_Decision_  db 13,'----------------------------------------------------------', 13, 10
    db 'Priority products for refilling are indicated by colour coding.', 13, 10
    db '', 13, 10, 10
    db '1. Return to the Main Menu', 13, 10            ; Option 1: Return to Main Menu
    db 'What is your decision: $'

; Banner Design for Commodity Restocking
Restock__banner_  db 13, '', , 13, 10
    db '          REFILLING STOCK OF Commodities          ', 13, 10
    db '', , 13, 10
    db 'Select Commodity ID: $'

; mssg Design for Commodity Restocking
Restock__prompt_  db 13, 10, 'Please enter the quantity you wish to restock (1 - 9):$'

; Restocking Success mssg
_Restock__success_  db 13, 10, 'Commodity restored!', 13, 10, '$'

; Banner Design for Commodity Sale
sale_banner_  db '', 13, 10
    db 9, 9, 32, 32, 'Conduct Commodity Sale', 13, 10
    db '', 13, 10
    db 'Select Commodity ID: $'

; Select number of Commodities to sell
sale_quantity_prompt_  db 13, 10, 'Kindly indicate how many commodities (1 - 9) you would want to sell. $'


sale_success_ db 13, 10, 'The sale has been successfully processed. Thank you!', 13, 10, '$'

; mssg indicating sale failure
sale_failure_ db 13, 10, 'Lack of inventory caused the sale to fail.', 13, 10, '$'

; Categories 
categories_menu_banner_ db 13, '', 13, 10
    db '1. Sales Information', 13, 10                   ; Option 1: Sales Information
    db '2. Examine Critical Products', 13, 10            ; Option 2: Examine Critical Products
    db '3. Return to the Main Menu', 13, 10            ; Option 3: Return to the Main Menu
    db '', 13, 10
    db 'Your Decision: ', 13, 10
    db '', 13, 10
    db '$'

; Categories Commodities Banner
_category_Commodities__banner_  db 13, '____________ - Sort Commodities Into Categories - ___________', 13, 10
    db '______________________ - Inventory - ______________________', 13, 10
    db '$'

; showcase Commodity Properties
showcase_Commodity_properties_ db 13, 'ID', 9, 'Commodity Name', 9, 'Price in RM', 9, 'Units Purchased', 9, 'Total Profit', 13, 10
    db '----------------------------------------------------------$'
; Explanation of Commodity Properties

; Commodity 1 : Identification Number, Name, Stock, Cost, Priority Level, Number of Commodities Sold
Commodity1_  dw 0             ; Commodity Identification Number: 0
       db 'Shelf     '  ; Commodity Name: Shelf
       dw 4             ; Stock: 4
       dw 11            ; Cost: $11
       dw 2             ; Priority Level: 2
       dw 99            ; Commodities Sold: 99
       db '$'           ; Currency: $

; Commodity 2 : Identification Number, Name, Stock, Cost, Priority Level, Commodities Sold
Commodity2_  dw 1             ; Commodity Identification Number: 1
       db 'Panel     '  ; Commodity Name: Panel
       dw 1             ; Stock: 1
       dw 35            ; Cost: $35
       dw 5             ; Priority Level: 5
       dw 88            ; Commodities Sold: 88
       db '$'           ; Currency: $

; Commodity 3 : Identification Number, Name, Stock, Cost, Priority Level, Commodities Sold
Commodity3_  dw 2             ; Commodity Identification Number: 2
       db 'Brush     '  ; Commodity Name: Brush
       dw 55            ; Stock: 55
       dw 10            ; Cost: $10
       dw 5             ; Priority Level: 5
       dw 77            ; Commodities Sold: 77
       db '$'           ; Currency: $

; Commodity 4 : Identification Number, Name, Stock, Cost, Priority Level, Commodities Sold
Commodity4_  dw 3             ; Commodity Identification Number: 3
       db 'Box       '  ; Commodity Name: Box
       dw 80            ; Stock: 80
       dw 5             ; Cost: $5
       dw 1             ; Priority Level: 1
       dw 66            ; Commodities Sold: 66
       db '$'           ; Currency: $

; Commodity 5 : Identification Number, Name, Stock, Cost, Priority Level, Commodities Sold
Commodity5_  dw 4             ; Commodity Identification Number: 4
       db 'Jars      '  ; Commodity Name: Jars
       dw 34            ; Stock: 34
       dw 18            ; Cost: $18
       dw 3             ; Priority Level: 3
       dw 55            ; Commodities Sold: 55
       db '$'           ; Currency: $

       
.code
showcaseCommodity_ Macro Commodity
    call _PrintaNewLine__      ; Print a new line
    mov bp, 0              ; Set up the base pointer
    lea si, Commodity        ; Load the offset of the Commodity

    mov ax, [si]           ; Load Commodity name
    call ConvertStringToIntegers_  
    call PrintSpace_        ; Print space
    mov dx, offset Commodity+2  ; Load offset of Commodity name
    add dx, bp             ; Add base pointer to get the full name
    call showcasemssg_    ; showcase the Commodity name

    mov ax, [si+12]        ; Load Commodity stock
    call SmallStockCheck_     ; Check if stock is low
    mov ax, [si+12]        ; Load Commodity stock
    call ConvertStringToIntegers_  ; Convert stock to integer
    call PrintSpace_        ; Print space
    mov ax, [si+14]        ; Load Commodity price
    call ConvertStringToIntegers_  ; Convert price to integer
    call PrintSpace_        ; Print space
    mov ax, [si+18]        ; Load Commodity sales
    call ConvertStringToIntegers_  ; Convert sales to integer
EndM

; Restock Commodity 
Restock_ Macro Commodity
    lea dx, Restock__prompt_   ; Place the Restock prompt mssg into the DX register
    mov ah, 09h            ; Write String Function
    int 21h                ; showcase mssg
    mov ah, 01h            ; Read Character
    int 21h                ; Receive input character from the user

    sub al, 30h            ; Convert the Information Interchange Standard Code for America >> (ASCII) digit 
    sub ax, 256            ; Subtract 256 for Restock amount (Information Interchange Standard Code for America >> (ASCII) formula)
    mov cx, ax             ; Save the restock amount into the CX register

    lea si, Commodity        ; Load the offset of the "inventory" array into SI
    add cx, [si + 12]      ; Update stock via amount
    mov word ptr [si+12], cx  ; Store updated value
    call DisplayLine_         ; Print line
    lea dx, _Restock__success_   ; Load Restock success mssg
    mov ah, 09h            ; Write String Function
    int 21h                ; showcase success mssg
    call _PrintaNewLine__      ; Print new line
    call DisplayLine_         ; Print line
    call _PrintaNewLine__      ; Print new line
    call InventoryMenu_     ; Return to inventory menu
EndM



SalesStatistics_ Macro Commodity
    call _PrintaNewLine__      ; Print a new line
    mov bp, 0              ; Initialize base pointer
    lea si, Commodity        ; Load the offset of the Commodity

    mov ax, [si]           ; Load Commodity name
    call ConvertStringToIntegers_  ; Convert string to integer
    call PrintSpace_        ; Print space

    mov dx, offset Commodity+2  ; Load offset of Commodity name
    add dx, bp             ; Add base pointer to get the full name
    call showcasemssg_    ; showcase the Commodity name
    call PrintSpace_        ; Print space

    mov ax, [si+14]        ; Load Commodity price
    call ConvertStringToIntegers_  ; Convert price to integer
    call PrintSpace_        ; Print space
    call PrintSpace_        ; Print another space

    mov ax, [si+18]        ; Load Commodity sales
    call ConvertStringToIntegers_  ; Convert sales to integer
    call PrintSpace_        ; Print space
    call PrintSpace_        ; Print another space

    mov cx, [si+14]        ; Load Commodity price to CX
    mov ax, [si+18]        ; Load Commodity sales to AX
    mul cx                 ; Multiply price by sales
    call ConvertStringToIntegers_  ; Convert result to integer
EndM

;Macro Function, Process Sale
ProcessTransaction_ Macro Commodity
    lea dx, sale_quantity_prompt_   
    mov ah, 09h            
    int 21h                ; showcase mssg
    mov ah, 01h            
    int 21h                ; Receive input character from the user

    sub al, 30h            ; Convert Information Interchange Standard Code for America >> (ASCII) digit to actual number
    sub ax, 256            ; Subtract 256 for Restock_ amount (Information Interchange Standard Code for America >> (ASCII) formula)
    mov cx, ax             ; Store sell amount in CX

    lea si, Commodity        ; Load the offset of the "inventory" array into SI
    mov ax, [si]           ; Load current sales into AX
    mov bx, [si+12]        ; Load current stock into BX
    sub bx, cx             ;Deduct the sales quantity from the available stock.
    call CompareWithZero_          
    mov word ptr [si+12], bx  ; Store updated stock
    TransactionSuccessful_ Commodity    
EndM


TransactionSuccessful_ Macro Commodity
    call ClearTheWindow      ; Cleanse the display area
    lea si, Commodity       ; Load sales array into SI

    mov ax, [si+18]       ; Load current sales quantity
    add cx, ax            ; Add sell quantity
    mov word ptr [si+18], cx  ; Store updated value in array

    call _PrintaNewLine__     ; Print a new line
    call DisplayLine_        
    lea dx, sale_success_   
    mov ah, 09h            
    int 21h               ; showcase successful msg

    call _PrintaNewLine__     
    call DisplayLine_       
    call _PrintaNewLine__     ; Print new line
    call Commodities_         ; showcase Commodities_
    call UserinputDecision_  ; Prompt user for input
EndM
; Macro to showcase a sale failure mssg when stock is insufficient
SaleReset_ Macro
    call ClearTheWindow       ; Cleanse the display area
    mov bx, [si+12]       ; Load current stock into BX
    mov word ptr [si+12], bx  ; Restore original stock value
    call _PrintaNewLine__     ; Print a new line
    call DisplayLine_        
    lea dx, sale_failure_  ; Load the sale failure mssg into DX
    mov ah, 09h           ; Write String Function
    int 21h               ; showcase the failure mssg
    call _PrintaNewLine__     ; Print a new line
    call Commodities_         ; showcase Commodities_
    call UserinputDecision_  ; Prompt the user for input
    ret                   ; Return

EndM

; Macro to showcase Commodities_ with low stock
LowStockMonitor_ Macro
    call ClearTheWindow   ; Cleanse the display area

    mov ah, 09h        ; showcase all the Commodities_
    lea dx, inventory_summary_  
    int 21h 

    mov bp, 0          ; Initialize base pointer
    lea si, Commodity1_  

    ; Iterate through each Commodity to check if stock is low
    mov ax, [si+12]    ; Load current stock
    cmp ax, 3          ; Compare with threshold
    jge next1          ; Jump if stock is not low
    showcaseCommodity_ Commodity1_  ; showcase the Commodity
next1:
    lea si, Commodity2_            
    mov ax, [si+12]
    cmp ax, 3
    jge next2
    showcaseCommodity_ Commodity2_
next2:
    lea si, Commodity3_            
    mov ax, [si+12]
    cmp ax, 3
    jge next3
    showcaseCommodity_ Commodity3_
next3:
    lea si, Commodity4_            
    mov ax, [si+12]
    cmp ax, 3
    jge next4
    showcaseCommodity_ Commodity4_
next4:
    lea si, Commodity5_            
    mov ax, [si+12]
    cmp ax, 3
    jge last
    showcaseCommodity_ Commodity5_
    call SmallStockC  
last:    
    call SmallStockC    ; showcase updated Commodities_
    ret                ; Return

EndM

MAIN PROC
    mov ax, @data          
    mov ds, ax             
    call ClearTheWindow       ; Cleanse the display area
    lea dx, _primary_menu_start  ; Load the Main Menu into DX
    mov ah, 09h            ; showcase the mainMenu
    int 21h                

    lea dx, user_input_prompt    ; Load the User Input prompt into DX
    mov ah, 09h            ; Write String Function
    int 21h                ; showcase the User Input prompt

    ; Read a single character from the keyboard
    mov ah, 01h            ; Read Character
    int 21h                ; Read character from the user

    ; Compare the character in AL with '1' - '5'
    ; Perform the corresponding action based on user input

    cmp al, '1'            
    je InventoryMenu_       ; If the user chooses option 1, proceed to the Restock Menu.

    cmp al, '2'            
    je Restock_Menu_       ;If the user chooses option 2, proceed to the Restock Menu.

    cmp al, '3'            
    je SalesMenu_           ; If the user chooses option 3, proceed to the Restock Menu.

    cmp al, '4'            
    je _CategScreen_         ; If the user chooses option 4, proceed to the Restock Menu.

    cmp al, '5'            
    je Terminate                ; If the user chooses option 5, proceed to Terminate the program.

    jmp main               ; If none of the previous conditions are met, return to the main menu.

; Code for handling each user Decision

; Routine to showcase inventory details and execute selected actions
InventoryMenu_:
    call ClearTheWindow       ; Cleanse the display area
    call Commodities_          ; showcase Commodities_
    call UserinputDecision_   ; request UserInput
    ret                    

; Function to Restock_ Commodities_
Restock_Menu_:
    call ClearTheWindow       ; Cleanse the display area
    call Commodities_          ; showcase Commodities_
    call RestockMenuBanner_     ; showcase the Restock_ banner
    ret                    ; Return

; Function to process sales
SalesMenu_:
    call ClearTheWindow       ; Cleanse the display area
    call Commodities_          ; showcase Commodities_
    call SalesMenuBanner_       ; showcase the sales banner
    ret                    ;

; Function categ Commodities_
_CategScreen_:              ; If the user chooses to categorize Commodities_
    call ClearTheWindow       ; Cleanse the display area
    call CategCommodities__     ; showcase categorized Commodities_
    call CategoryMenu_         ; showcase the category menu
    ret                    ; Return

; Function end the program
Terminate:
    call ClearTheWindow       ; Cleanse the display area
    call TerminateSys_           ; Terminate the program
    ret                    ; Return

; TerminateSys_ Function: Terminates the program gracefully
TerminateSys_:
    call DisplayLine_         ; Draw a line separator
    mov ah, 4ch            ; DOS function to Terminate the program
    int 21h                ; innvoke DOS interrupt

; DisplayLine_ Function: showcases a line separator on the screen
DisplayLine_:
    lea dx, _section_separator_  
    mov ah, 09h             ; showcase string function
    int 21h                 ; innvoke DOS_interrupt
    ret                     

; ClearTheWindow func
ClearTheWindow:
    mov ah, 06h     
    mov al, 0       
    mov bh, 07h     
    mov cx, 0       
    mov dx, 184Fh   
    int 10h         
    ret             

; UserinputDecision_ Func
UserinputDecision_:
    lea dx, summary_menu_Decision_  ; Load summary_menu_Decision_ into DX
    mov ah, 09h                  ; showcase string function
    int 21h                      ; innvoke DOS interrupt

    mov ah, 01h                  
    int 21h                      

    cmp al, '1'                  
    je skipInvalidInput1_       

    cmp al, '0'                  
    je Terminate                      ; If=0, Terminate

    jmp InventoryMenu_            
    ret                           ; Return


skipInvalidInput1_:
    jmp main                      ; Jump to main

; RestockMenuBanner_ Func 
RestockMenuBanner_:
    lea dx, Restock__banner_       ; Load Restock__banner_ into DX
    mov ah, 09h                  ; showcase string function
    int 21h                      ; innvoke DOS interrupt

    mov ah, 01h                  ; Read character function
    int 21h                      ; Read character from the user

    cmp al, '0'                 
    je RS1_                      

    cmp al, '1'                  
    je RS2_                    

    cmp al, '2'               
    je RS3_                       

    cmp al, '3'                  
    je RS4_                       

    cmp al, '4'                  
    je RS5_                       

    jmp main                    
    ret                          


RS1_:
    call Restock_1_  ; innvoke Restock_1_ subprocess
    ret            ; Return from RS1_

RS2_:
    call Restock_2_  ; innvoke Restock_2_ subprocess
    ret            ; Return from RS2_

RS3_:
    call Restock_3_  ; innvoke Restock_3_ subprocess
    ret            ; Return from RS3_

RS4_:
    call Restock_4_  ; innvoke Restock_4_ subprocess
    ret            ; Return from RS4_

RS5_:
    call Restock_5_  ; innvoke Restock_5_ subprocess
    ret            ; Return from RS5_

; subprocess to restock Commodity 1
Restock_1_:
    Restock_ Commodity1_  ; innvoke the Restock_ macro for Commodity 1
    ret                ; Return from Restock_1_

; subprocess to restock Commodity 2
Restock_2_:
    Restock_ Commodity2_  ; innvoke the Restock_ macro for Commodity 2
    ret                ; Return from Restock_2_

; subprocess to restock Commodity 3
Restock_3_:
    Restock_ Commodity3_  ; innvoke the Restock_ macro for Commodity 3
    ret                ; Return from Restock_3_

; subprocess to restock Commodity 4
Restock_4_:
    Restock_ Commodity4_  ; innvoke the Restock_ macro for Commodity 4
    ret                ; Return from Restock_4_

; subprocess to restock Commodity 5
Restock_5_:
    Restock_ Commodity5_  ; innvoke the Restock_ macro for Commodity 5
    ret                ; Return from Restock_5_

; SalesMenuBanner_ Function: showcases the sales banner and handles user input
SalesMenuBanner_:
    lea dx, sale_banner_  
    mov ah, 09h         
    int 21h             ; showcase the sale_banner_ mssg

    mov ah, 01h         ; 
    int 21h             ; Read a character from input

    cmp al, '0'         ; Check if the input is equal to '0'
    je SI1_              

    cmp al, '1'        ; Check if the input is equal to '1'
    je SI2_              

    cmp al, '2'         ;; Check if the input is equal to '2'
    je SI3_              

    cmp al, '3'         ; Check if the input is equal to '3'
    je SI4_              

    cmp al, '4'         ; Check if the input is equal to '4'
    je SI5_              

    jmp main            
    ret                 
; subprocess for Sales Input 1
SI1_:
    call Commodities_ale1_   ; Invoke the subprocess for Commodity 1 sale
    ret                 ; Return from SI1_

; subprocess for Sales Input 2
SI2_:
    call Commodities_ale2_   ; Invoke the subprocess for Commodity 2 sale
    ret                 ; Return from SI2_

; subprocess for Sales Input 3
SI3_:
    call Commodities_ale3_   ; Invoke the subprocess for Commodity 3 sale
    ret                 ; Return from SI3_

; subprocess for Sales Input 4
SI4_:
    call Commodities_ale4_   ; Invoke the subprocess for Commodity 4 sale
    ret                 ; Return from SI4_

; subprocess for Sales Input 5
SI5_:
    call Commodities_ale5_   ; Invoke the subprocess for Commodity 5 sale
    ret                 ; Return from SI5_

; subprocess to process sales for Commodity 1
Commodities_ale1_:
    ProcessTransaction_ Commodity1_   ; Process sales for Commodity 1
    ret                    ; Return from Commodities_ale1_

; subprocess to process sales for Commodity 2
Commodities_ale2_:
    ProcessTransaction_ Commodity2_   ; Process sales for Commodity 2
    ret                    ; Return from Commodities_ale2_

; subprocess to process sales for Commodity 3
Commodities_ale3_:
    ProcessTransaction_ Commodity3_   ; Process sales for Commodity 3
    ret                    ; Return from Commodities_ale3_

; subprocess to process sales for Commodity 4
Commodities_ale4_:
    ProcessTransaction_ Commodity4_   ; Process sales for Commodity 4
    ret                    ; Return from Commodities_ale4_

; subprocess to process sales for Commodity 5
Commodities_ale5_:
    ProcessTransaction_ Commodity5_   ; Process sales for Commodity 5
    ret                    ; Return from Commodities_ale5_

; subprocess to compare with zero
CompareWithZero_:
    cmp bx, 0         
    js ResetStock_      
    ret               

; subprocess to reset stock when it goes below zero
ResetStock_:
    SaleReset_          ; Reset stock
    ret                ; Return from ResetStock_
; Macro for showcaseing category Commodities_
CategCommodities__:
    mov ah, 09h         
    lea dx, _category_Commodities__banner_  ; Load _category_Commodities__banner_ mssg into DX
    int 21h             ; showcase the _category_Commodities__banner_ mssg

    mov ah, 09h         ; Set AH to 09h again for another mssg
    lea dx, showcase_Commodity_properties_  ; Load showcase_Commodity_properties_ mssg into DX
    int 21h             ; showcase the showcase_Commodity_properties_ mssg

    ; innvoke SalesStatistics_ macro for each Commodity_
    SalesStatistics_ Commodity1_  
    SalesStatistics_ Commodity2_  
    SalesStatistics_ Commodity3_  
    SalesStatistics_ Commodity4_  
    SalesStatistics_ Commodity5_  

    call _PrintaNewLine__  ; innvoke _PrintaNewLine__ subprocess
    ret                 

CategoryMenu_:
    mov ah, 09h         ; Set AH to 09h for DOS "Write String" function
    lea dx, categories_menu_banner_  ; Load categories_menu_banner_ mssg into DX
    int 21h             ; showcase the categories_menu_banner_ mssg

    mov ah, 01h         ; Set AH to 01h for DOS "Read Character" function
    int 21h             ; Read a character from input

    cmp al, '1'         
    je FullInventoryshowcase_        

    cmp al, '2'         
    je Commodities_tockL_   

    cmp al, '3'         
    je skipInvalidInput2_  

    jmp _CategScreen_     
    ret                 

skipInvalidInput2_:
    ; showcase an error mssg and prompt for valid input
    ; Jump back to the main menu
    jmp main            
    ret                

FullInventoryshowcase_:                
    ; Cleanse the display area and showcase all Commodities_
    call ClearTheWindow   
    call CategCommodities__
    call CategoryMenu_     
    ret                 

; Check for low stock in a specific category
SmallStockC:
    ; Print line and showcase category options
    call DisplayLine_     
    mov ah, 09h                 
    lea dx, categories_menu_banner_  ; Load the mssg about categoriess
    int 21h                     ; showcase the mssg     

    ; Read the user's choice of category
    mov ah, 01h        
    int 21h            ; Receive input character from the user      

    cmp al, '1'                 ; if option 1  
    je FullInventoryshowcase_    ; Jump         
    cmp al, '2'                 ; if option 2
    je Commodities_tockL_       ; Jump   
    cmp al, '3'                 ;if option 3
    je skipInvalidInput3_     ; Jump 

     ; If the input is not valid, redirect to the default option
    jmp Commodities_tockL_     
skipInvalidInput3_: 
    ; showcase an error mssg and back to the MainMenu
    jmp main            ; Jump back to the main menu
    ret                 ; Return from the subroutine
                   
; Call macro to filter Commodities_ with stock lower than 5
Commodities_tockL_:
    LowStockMonitor_            ; innvoke LowStockMonitor_ macro
    ret                

Commodities_:
    lea dx, inventory_summary_  ; Load inventory summary mssg into DX
    mov ah, 09h                ; Set AH to 09h for DOS "Write String" function
    int 21h                    ; showcase the inventory summary mssg

    ; showcase details of each Commodity
    showcaseCommodity_ Commodity1_  
    showcaseCommodity_ Commodity2_  
    showcaseCommodity_ Commodity3_  
    showcaseCommodity_ Commodity4_  
    showcaseCommodity_ Commodity5_  

    call _PrintaNewLine__        
    ret                         ; Return from Commodities_

; Function to print a new line
_PrintaNewLine__:
    mov dl, 0ah      ; Set DL to Information Interchange Standard Code for America >> (ASCII) value of newline character
    mov ah, 02h      ; Set AH to 02h for DOS "showcase Character" function
    int 21h          ; showcase the newline character
    ret              ; Return from _PrintaNewLine__ function


SmallStockCheck_:
    mov bx, ax       
    cmp bx, 2       
    jle StatusRed_   
    jmp StatusGreen_ 

StatusRed_:
    ; showcase content at memory location pointed by BX in red with blink effect
    mov dl, [bx]    
    mov ah, 09h      ; "Write Character" 
    mov al, dl       
    mov bl, 04h      
    or bl, 80h       
    mov cx, 2        
    int 10h          
    ret              ; back to StatusRed_

StatusGreen_:
    ; showcase content at memory location pointed by BX in green
    mov dl, [bx]     
    mov ah, 09h     
    mov al, dl       
    mov bl, 02h      
    mov cx, 2        
    int 10h         
    ret              ; back to StatusGreen_

; String to Int Conversion Function
ConvertStringToIntegers_:
    push bx           
    mov bx, 10        
    xor cx, cx        

convert_loop_:
    xor dx, dx        
    div bx            
    add dl, '0'        ; Convert remainder to Information Interchange Standard Code for America >> (ASCII)
    push dx            ; Push the Information Interchange Standard Code for America >> (ASCII) character onto the stack
    inc cx             ; Increment CX counter
    cmp ax, 0          ; Compare quotient with 0
    jne convert_loop_   ; Continue loop if quotient is not zero
; Function to print an integer
PrintInteger_:
    pop dx             ; Pop the Information Interchange Standard Code for America >> (ASCII) character from the stack
    mov ah, 02h        
    int 21h         
    dec cx           
    cmp cx, 0        
    jne PrintInteger_     
    pop bx          
    ret              


showcasemssg_:
    push ax            
    push bx            
    push cx            
    mov bx, dx         
    mov cx, 10         
StringIterationLoop_:
    mov dl, [bx]      
    int 21h            
    inc bx             
    loop StringIterationLoop_   
string_done_:
    pop cx             
    pop bx             
    pop ax            
    ret               

; Function to print a tab character
PrintSpace_:
    mov dl, 09         ; Information Interchange Standard Code for America >> (ASCII) value for tab character
    mov ah, 02h       
    int 21h            
    ret               

MAIN ENDP
END MAIN
