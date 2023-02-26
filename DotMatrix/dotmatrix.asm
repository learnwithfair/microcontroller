
_offState:

;dotmatrix.c,9 :: 		void offState(){
;dotmatrix.c,10 :: 		portc=0x00;    // Initialize PortC  as off state
	CLRF       PORTC+0
;dotmatrix.c,11 :: 		portd=0x00;    // Initialize PortD  as off state
	CLRF       PORTD+0
;dotmatrix.c,12 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_offState0:
	DECFSZ     R13+0, 1
	GOTO       L_offState0
	DECFSZ     R12+0, 1
	GOTO       L_offState0
	DECFSZ     R11+0, 1
	GOTO       L_offState0
	NOP
	NOP
;dotmatrix.c,13 :: 		}
L_end_offState:
	RETURN
; end of _offState

_main:

;dotmatrix.c,15 :: 		void main()
;dotmatrix.c,18 :: 		TRISC=0x00;  // PortC set as Output
	CLRF       TRISC+0
;dotmatrix.c,19 :: 		TRISD=0x00;  // PortD set as Output
	CLRF       TRISD+0
;dotmatrix.c,20 :: 		while(1)
L_main1:
;dotmatrix.c,22 :: 		offState(); //Function Call
	CALL       _offState+0
;dotmatrix.c,24 :: 		for(i=1;i<=100;i++){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main3:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       _i+0, 0
	SUBLW      100
L__main40:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;dotmatrix.c,25 :: 		for(j=0;j<8;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main6:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      8
	SUBWF      _j+0, 0
L__main41:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;dotmatrix.c,26 :: 		PORTD=col_data[j];   // Column Data
	MOVF       _j+0, 0
	ADDLW      _col_data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dotmatrix.c,27 :: 		PORTC=row_dataR[j];  // Row Data
	MOVF       _j+0, 0
	ADDLW      _row_dataR+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;dotmatrix.c,28 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;dotmatrix.c,25 :: 		for(j=0;j<8;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;dotmatrix.c,29 :: 		}
	GOTO       L_main6
L_main7:
;dotmatrix.c,24 :: 		for(i=1;i<=100;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dotmatrix.c,30 :: 		}
	GOTO       L_main3
L_main4:
;dotmatrix.c,31 :: 		offState(); //Function Call
	CALL       _offState+0
;dotmatrix.c,34 :: 		for(i=1;i<=100;i++){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main10:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVF       _i+0, 0
	SUBLW      100
L__main42:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
;dotmatrix.c,35 :: 		for(j=0;j<8;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main13:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      8
	SUBWF      _j+0, 0
L__main43:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;dotmatrix.c,36 :: 		PORTD=col_data[j];   // Column Data
	MOVF       _j+0, 0
	ADDLW      _col_data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dotmatrix.c,37 :: 		PORTC=row_dataA[j];  // Row Data
	MOVF       _j+0, 0
	ADDLW      _row_dataA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;dotmatrix.c,38 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
	NOP
;dotmatrix.c,35 :: 		for(j=0;j<8;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;dotmatrix.c,39 :: 		}
	GOTO       L_main13
L_main14:
;dotmatrix.c,34 :: 		for(i=1;i<=100;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dotmatrix.c,40 :: 		}
	GOTO       L_main10
L_main11:
;dotmatrix.c,41 :: 		offState(); //Function Call
	CALL       _offState+0
;dotmatrix.c,44 :: 		for(i=1;i<=100;i++){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main17:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVF       _i+0, 0
	SUBLW      100
L__main44:
	BTFSS      STATUS+0, 0
	GOTO       L_main18
;dotmatrix.c,45 :: 		for(j=0;j<8;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main20:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      8
	SUBWF      _j+0, 0
L__main45:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;dotmatrix.c,46 :: 		PORTD=col_data[j];   // Column Data
	MOVF       _j+0, 0
	ADDLW      _col_data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dotmatrix.c,47 :: 		PORTC=row_dataH[j];  // Row Data
	MOVF       _j+0, 0
	ADDLW      _row_dataH+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;dotmatrix.c,48 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	NOP
	NOP
;dotmatrix.c,45 :: 		for(j=0;j<8;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;dotmatrix.c,49 :: 		}
	GOTO       L_main20
L_main21:
;dotmatrix.c,44 :: 		for(i=1;i<=100;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dotmatrix.c,50 :: 		}
	GOTO       L_main17
L_main18:
;dotmatrix.c,51 :: 		offState(); //Function Call
	CALL       _offState+0
;dotmatrix.c,54 :: 		for(i=1;i<=100;i++){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main24:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       _i+0, 0
	SUBLW      100
L__main46:
	BTFSS      STATUS+0, 0
	GOTO       L_main25
;dotmatrix.c,55 :: 		for(j=0;j<8;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main27:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      8
	SUBWF      _j+0, 0
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;dotmatrix.c,56 :: 		PORTD=col_data[j];   // Column Data
	MOVF       _j+0, 0
	ADDLW      _col_data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dotmatrix.c,57 :: 		PORTC=row_dataA[j];  // Row Data
	MOVF       _j+0, 0
	ADDLW      _row_dataA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;dotmatrix.c,58 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	NOP
	NOP
;dotmatrix.c,55 :: 		for(j=0;j<8;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;dotmatrix.c,59 :: 		}
	GOTO       L_main27
L_main28:
;dotmatrix.c,54 :: 		for(i=1;i<=100;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dotmatrix.c,60 :: 		}
	GOTO       L_main24
L_main25:
;dotmatrix.c,61 :: 		offState(); //Function Call
	CALL       _offState+0
;dotmatrix.c,64 :: 		for(i=1;i<=100;i++){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main31:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       _i+0, 0
	SUBLW      100
L__main48:
	BTFSS      STATUS+0, 0
	GOTO       L_main32
;dotmatrix.c,65 :: 		for(j=0;j<8;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main34:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      8
	SUBWF      _j+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main35
;dotmatrix.c,66 :: 		PORTD=col_data[j];   // Column Data
	MOVF       _j+0, 0
	ADDLW      _col_data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dotmatrix.c,67 :: 		PORTC=row_dataT[j];  // Row Data
	MOVF       _j+0, 0
	ADDLW      _row_dataT+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;dotmatrix.c,68 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	NOP
	NOP
;dotmatrix.c,65 :: 		for(j=0;j<8;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;dotmatrix.c,69 :: 		}
	GOTO       L_main34
L_main35:
;dotmatrix.c,64 :: 		for(i=1;i<=100;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dotmatrix.c,70 :: 		}
	GOTO       L_main31
L_main32:
;dotmatrix.c,71 :: 		offState(); //Function Call
	CALL       _offState+0
;dotmatrix.c,72 :: 		}
	GOTO       L_main1
;dotmatrix.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
