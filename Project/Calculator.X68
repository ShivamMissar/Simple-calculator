*-----------------------------------------------------------
* Title      : Simple Calculator
* Written by :Shivam
* Date       :
* Description:Simple calculator with common functionailties
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
     
        
Again:  LEA    Menu,A1 *This first load up the Menu where the user can choose what they'd like to do
        MOVE.B  #14,D0
        TRAP    #15
        MOVE.B  #4,D0
        TRAP    #15
        CMP.L   #1,D1
        BLT     invaild
        CMP.L   #6,D1
        BHI     invaild
        BRA     AddNum
        
        
invaild:    LEA     InvaildString,A1
            MOVE.B  #14,D0
            TRAP    #15
            BRA Again
        
        
AddNum: CMP.B #1,D1 *This will check to see if the user has entered 1 for addition if not it will go to number2 which is subtract as shown in the Line below
        BNE Subtract


        LEA          Input1,A1 *This will allow the user to enter the first number
        MOVE.B       #14,D0
        TRAP         #15
        MOVE.B       #4,D0 *This will be used for input
        TRAP         #15
        MOVE.L       D1,D5 *This will move whatever the user has entered from D1.L into D5
        
        LEA          Input2,A1
        MOVE.B       #14,D0
        TRAP         #15
        MOVE.B       #4,D0
        TRAP         #15
        MOVE.L       D1,D3
        ADD.L        D3,D5 *This will then ADD the two numbers entered by the user
        MOVE.L       D5,D1 *Whatever is in D5 will go back into D1 and then will be displayed
        MOVE.B       #3,D0 *This will display the output of the value stored in D1
        TRAP         #15
        BSR          Again *This will then go back to Again where the user can select a different option from the menu
        
        
        
Subtract: CMP.B #2,D1
          BNE Multiply

          LEA       SUBT1,A1
          MOVE.B    #14,D0
          TRAP      #15
          MOVE.B    #4,D0
          TRAP      #15
          MOVE.L    D1,D3
          
          LEA       SUBT2,A1
          MOVE.B    #14,D0
          TRAP      #15
          MOVE.B    #4,D0
          TRAP      #15
          MOVE.L    D1,D4
          SUB.L     d4,d3
          MOVE.L    D3,d1
          MOVE.B    #3,D0
          TRAP      #15
          BSR      Again
          
        
          
          
          
Multiply: CMP.B #3,D1
          BNE   Divide
          


          LEA       TIMES,A1
          MOVE.B    #14,D0
          TRAP      #15
          MOVE.B    #4,D0
          TRAP      #15
          MOVE.L    D1,D2
          
          LEA       Multi2,A1
          MOVE.B    #14,D0
          TRAP      #15
          MOVE.B    #4,D0   
          TRAP      #15
          MOVE.L    D1,D3
          
          MULU      D2,D3
          
          MOVE.L    D3,D1
          MOVE.B    #3,D0 
          TRAP      #15
          BSR       Again      

Divide: CMP.B      #4,D1
        BNE        SquareR
        
        LEA        SRoot1,A1  
        MOVE.B     #14,D0
        TRAP       #15
        MOVE.B     #4,D0
        TRAP       #15
        MOVE.L     D1,D2
        
        LEA        SRoot2,A1
        MOVE.B     #14,D0
        TRAP       #15
        MOVE.B     #4,D0
        TRAP       #15
        MOVE.L     D1,D3
        Divu.W       D3,D2
        MOVE.L     D2,D1
        MOVE.B     #3,D0
        TRAP       #15
        BSR         Again       
    
SquareR:  CMP.B   #5,D1
          BNE     Finish
          
          LEA     SQR1,A1
          MOVE.B  #14,D0
          TRAP    #15
          MOVE.B  #4,D0
          TRAP    #15
          MOVE.L  D1,D2
          MULU    D2,D2
          MOVE.L  D2,D1
          MOVE.B  #3,D0
          TRAP  #15
          BSR   Again
              
    
FINISH: CMP.L   #6,D1
        MOVE.B  #9,D0
        TRAP    #15
        


CR     EQU      $0D
LF     EQU      $0A 
    SIMHALT             ; halt simulator

* Put variables and constants here
InvaildString dc.b  'Entered a invaild input,try again',CR,LF,0

 
Menu:   
        dc.b               '     __  __     '  ,CR,LF   
        DC.b               '    | \  / | ___ _ __  _   _ ',cr,lf
        dc.b               '    | |\/| |/ _ \  _ \| | | |',cr,lf
        dc.b               '    | |  | |  __/ | | | |_| |',cr,lf
        dc.b               '    |_|  |_|\___|_| |_|\__,_ |'     ,cr,lf
                               
                          
                                             
        dc.b   '1.Addition',CR,LF
        DC.B   '2.Subtraction',CR,LF
        dc.b   '3.Multiplication',CR,LF
        dc.b   '4.Division',CR,LF
        dc.b   '5.Square of a Number',CR,LF    
        dc.b   '6 END',CR,LF,0
             
*for addition, user will enter 2 numbers to add togther            
Input1:      DC.B   'Input your first number',CR,LF,0
Input2:      DC.B   'Input your second number',CR,LF,0
    

*For Subtraction, user will enter 2 numbers to subtract
SUBT1:       DC.B   'Enter the first number: ',CR,LF,0
SUBT2:       DC.B   'Enter the second number:',CR,LF,0

*For Multiplication,user will be required to enter 2 numbers to multiply togther
 TIMES:     DC.B    'Enter thr first number for multiplication',CR,LF,0
 Multi2:     DC.B    'Enter the second number for multiplication',CR,LF,0 
   

*For Division ,user will be required to enter 2 numbers to divide togther
SRoot1:     DC.B    'Enter the first number to divide: ',CR,LF,0
SRoot2:     DC.B     'Enter the second number to divide:',CR,LF,0 

*For Square of a number, user wil be required to enter a number
SQR1:       DC.B    'Enter a number to be squared',CR,LF,0  
    END    START        ; last line of source










*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
