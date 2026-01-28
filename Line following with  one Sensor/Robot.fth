."  HIPPODROME"  CR
 
: HI ." Bonjour tout le monde" ;

: robot CR ."           _  " CR ."        __|_|__   " CR ."       |  o o  |  " CR
."      [|   !   |]  " CR    ."     __|  <=>  |__  " CR  ."    |  ^^^^^^^^   | " CR  ."    |  | robot |  |  " CR
."    |  |_______|  |    " CR ."    |__|       |__|    " CR
; 
 
robot CR
HI  CR

( my own return stack - ma propre pile de retour R )
VARIABLE R   
: >R  R ! ;
: R> R @ ;

( timer env. 1 sec )
: MS ( n -- n sec ) 34333 * FOR I DROP NEXT ;
: X 100 FOR DROP NEXT ;


CODE PAGE
    print('\033c')
END-CODE

( primitives Python )

" motor_stop.fth" LOAD 
" forward_left.fth" LOAD
" forward_right.fth" LOAD
" one_sensor.fth" LOAD

( primitives Pygmy Forth )
VARIABLE CENTER
: TURNRIGHT  5 FOR FORWARDLEFT NEXT ;  ( turn RIGHT )
: TURNLEFT  5 FOR FORWARDRIGHT NEXT ;  ( turn LEFT )

: LEFT 0 ;
: RIGHT 1 ;
: TURN ( n-- ) IF TURNRIGHT ELSE TURNLEFT THEN ; ( use RIGHT TURN LEFT TURN )
: 1= 1 = ;   : BOTH-OFF? AND 0= ;
: GOSTRAIGHT FORWARDLEFT FORWARDRIGHT ;
( : SENSOR_VALUES ONESENSOR 100 >  IF TURNRIGHT ELSE GOSTRAIGHT THEN  ONESENSOR 100 <  IF TURNLEFT ELSE GOSTRAIGHT THEN ; )

( The robot is placed in the center of the track )
: CENTER_READ ONESENSOR CENTER ! ; ( the value is read and saved in the variable CENTER )
( Value greater than that of CENTER )
: BIGGEST  ONESENSOR CENTER @ >  IF TURNLEFT ELSE GOSTRAIGHT THEN ; 
( Value smaller than CENTER )
: SMALLEST ONESENSOR CENTER @ <  IF TURNRIGHT ELSE GOSTRAIGHT THEN  ;
: SENSOR_VALUES BIGGEST SMALLEST ; ( CENTER value Between Two other values )
( Do CENTER_READ to read the center value )
( application HIPPODROME )
 : RUN  BEGIN  SENSOR_VALUES   AGAIN ;
: zz RUN ;

( controle )
:  oo ONESENSOR   . CR ; ( sensor test )
: aa 10 FOR GOSTRAIGHT NEXT ; ( motors test )
( biggest and smallest between )

WORDS CR 
