
_main:

;push_button.c,1 :: 		void main()
;push_button.c,4 :: 		TRISB=0x00;
	CLRF       TRISB+0
;push_button.c,5 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;push_button.c,6 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;push_button.c,8 :: 		portb.f1=0;
	BCF        PORTB+0, 1
;push_button.c,9 :: 		while(1)
L_main0:
;push_button.c,11 :: 		if(portd.f0=1)
	BSF        PORTD+0, 0
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;push_button.c,13 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;push_button.c,14 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;push_button.c,17 :: 		}
L_main2:
;push_button.c,19 :: 		if(portd.f1=0)
	BCF        PORTD+0, 1
	BTFSS      PORTD+0, 1
	GOTO       L_main4
;push_button.c,21 :: 		portb.f1=0;
	BCF        PORTB+0, 1
;push_button.c,22 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;push_button.c,23 :: 		}
	GOTO       L_main6
L_main4:
;push_button.c,26 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;push_button.c,27 :: 		portb.f1=0;
	BCF        PORTB+0, 1
;push_button.c,28 :: 		}
L_main6:
;push_button.c,30 :: 		}
	GOTO       L_main0
;push_button.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
