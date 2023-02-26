void main()

{
      TRISB=0x00;
      TRISD=0xff;
      portb.f0=0;
      
      portb.f1=0;
      while(1)
      {
       if(portd.f0=1)
        {
           portb.f0=1;
           delay_ms(100);


       }
       
        if(portd.f1=0)
       { 
           portb.f1=0;
           delay_ms(100);
           }
       else
       {
          portb.f0=0;
          portb.f1=0;
       }

      }
}