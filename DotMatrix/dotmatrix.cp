#line 1 "C:/Users/Nayeem/Downloads/lab/New folder/DotMatrix/dotmatrix.c"
int i,j;
char col_data[] = {0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01};
char row_dataR[] = {0x00,0xff,0xff,0xcc,0xcc,0xff,0x7b,0x00};
char row_dataA[] = {0x00,0x7f,0xff,0xcc,0xcc,0xff,0x7f,0x00};
char row_dataH[] = {0xff,0xff,0x18,0x18,0x18,0x18,0xff,0xff};
char row_dataT[] = {0xc0,0xc0,0xc0,0xff,0xff,0xc0,0xc0,0xc0};


void offState(){
 portc=0x00;
 portd=0x00;
 delay_ms(1000);
}

void main()

{
 TRISC=0x00;
 TRISD=0x00;
 while(1)
 {
 offState();

 for(i=1;i<=100;i++){
 for(j=0;j<8;j++){
 PORTD=col_data[j];
 PORTC=row_dataR[j];
 delay_ms(1);
 }
 }
 offState();


 for(i=1;i<=100;i++){
 for(j=0;j<8;j++){
 PORTD=col_data[j];
 PORTC=row_dataA[j];
 delay_ms(1);
 }
 }
 offState();


 for(i=1;i<=100;i++){
 for(j=0;j<8;j++){
 PORTD=col_data[j];
 PORTC=row_dataH[j];
 delay_ms(1);
 }
 }
 offState();


 for(i=1;i<=100;i++){
 for(j=0;j<8;j++){
 PORTD=col_data[j];
 PORTC=row_dataA[j];
 delay_ms(1);
 }
 }
 offState();


 for(i=1;i<=100;i++){
 for(j=0;j<8;j++){
 PORTD=col_data[j];
 PORTC=row_dataT[j];
 delay_ms(1);
 }
 }
 offState();
 }
}
