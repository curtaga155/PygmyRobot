."  OmniwheelsRobot"  CR
 
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

: bye BYE ;

CODE PAGE
    print('\033c')
END-CODE

( primitives Python )
" motor_stop.fth" LOAD 
" left_ahead_forward.fth" LOAD
" right_ahead_forward.fth" LOAD
" right_bottom_forward.fth" LOAD 
" left_bottom_forward.fth" LOAD
" right_ahead_backward.fth" LOAD
" left_ahead_backward.fth" LOAD
" right_bottom_backward.fth" LOAD
" left_bottom_backward.fth" LOAD
" tempo.fth" LOAD

( primitives Pygmy Forth )
: sec ( n - - ) TEMPO ;
: forward_wheel-1 LEFTAHEADFORWARD ;
: forward_wheel-2 RIGHTAHEADFORWARD ;
: forward_wheel-3 RIGHTBOTTOMFORWARD ;
: forward_wheel-4  LEFTBOTTOMFORWARD        ;

: backward_wheel-1 LEFTAHEADBACKWARD ;
: backward_wheel-2 RIGHTAHEADBACKWARD ;
: backward_wheel-3 RIGHTBOTTOMBACKWARD ;
: backward_wheel-4 LEFTBOTTOMBACKWARD ;



( applications spin)
: HalfSpin>Right 375  FOR forward_wheel-1 forward_wheel-4 backward_wheel-2 backward_wheel-3 NEXT ;
: HalfSpin>Left 395  FOR backward_wheel-1 backward_wheel-4  forward_wheel-2 forward_wheel-3 NEXT ;

( applications oblique )
: Oblique>Right 100 FOR forward_wheel-1 forward_wheel-3 NEXT ;
forward_wheel-2 
: Oblique>Left 100 FOR forward_wheel-2 forward_wheel-4  NEXT ;

( applications rotate around rear center )
: RearCenter>Right 130 FOR forward_wheel-1 backward_wheel-2 NEXT ;
: RearCenter>Left 130 FOR backward_wheel-1 forward_wheel-2  NEXT ;

( applications rotate around corner )
: AroundCorner>Right 110 FOR forward_wheel-1 forward_wheel-4 NEXT ;
: AroundCorner>Left 110 FOR forward_wheel-2 forward_wheel-3 NEXT ;

( applications square)
: Left>Right 100  FOR forward_wheel-1 backward_wheel-4 backward_wheel-2 forward_wheel-3 NEXT ;
: GoStraight 50 FOR forward_wheel-1 forward_wheel-2 forward_wheel-3 forward_wheel-4  NEXT ;
: Back 50 FOR backward_wheel-1 backward_wheel-2 backward_wheel-3 backward_wheel-4 NEXT ;
: Right>Left 100 FOR backward_wheel-1 forward_wheel-4  backward_wheel-3 forward_wheel-2 NEXT ;

: Square>Right GoStraight Left>Right Back  Right>Left ;
: Square>Left GoStraight Right>Left  Back Left>Right ;

 ( application facing_the_wall )
: testus US . ; 
: Check_US US DUP 400 <  IF Back  Back THEN ; ( sensor ultrasonic )
: facing_the_wall 5 FOR Square>Right GoStraight Check_US NEXT ;

WORDS CR 


