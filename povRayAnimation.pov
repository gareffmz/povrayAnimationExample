//Creado por Luis S�nchez | https://github.com/gareffmz
//2020


#include "colors.inc"
#include "woods.inc"
#include "textures.inc"
#include "shapes.inc"
#include "skies.inc"
                                            


//C�mara frontal y luz

    
    #if(frame_number<24)
     camera{
        location <frame_number-27,20,-50-(clock+5)> look_at <70-(clock-18),-0-(clock+15),90>
        rotate   <0,-20*(clock-0.01),0>
        } 
    #end
     #if(frame_number>23)
     camera{
        location <frame_number-27,20,-50-(clock+5)> look_at <70-(clock-18),-0-(clock+20),90>
        rotate   <0,-20*(clock-0.01),0>
        } 
    #end
    
     //Vista frontal del personaje
    //camera{location <20,19,0> look_at <-12,5,0>}      
        
         
    light_source {<30, 40, -25> color rgb <1, 1, 1> } 
 
//AMBIENTE 

    sky_sphere { S_Cloud2 }
    
    //Suelo Izquierdo
    object {
     Round_Box(<-200,-20,-100>,<18,2,200>, 1, 0)
     texture{T_Wood19 }
     scale<1,1,1>
     rotate<0,0,0>
     translate<0,0,0>
    }
    
    //Suelo Derecho
    object {
     Round_Box(<50,-20,-100>,<200,2,200>, 0.2, 0)
     texture{ T_Wood19 }
     scale<1,1,1>
     rotate<0,0,0>
     translate<0,0,0>
    }
    
    //Agua
    plane {y,-10 
      texture{ Polished_Chrome }
      normal{ bumps 0.03
         scale <1,0.25,0.25>*1
         turbulence 0.6
       }    
    }  
     
    //soga   
    #declare rama = union{
        cylinder {   <25, 50, 0>,    <25, 14, 0>,  0.2 pigment { Brown} }
        sphere   { <25, 14, 0>, 0.6 pigment { Brown}}
    }
    
    //Trampa en la soga    
    #declare trampaRoja= object {
         Round_Box(<15,34,-5>,<35,35,5>, 1, 0)
         texture{
           pigment{Red}
           finish { phong 1}
         }
         scale<1,1,1>
         rotate<0,0,0>
         translate<0,0,0>
    }  
     

//TEXTURAS PERSONAJE

    #declare texturaCuerpo = pigment {
      image_map {
      jpeg "texturas/textura-camisa.jpg" 
      map_type 0
    }}
    
    #declare texturaPantalon = pigment {
      image_map {
      jpeg "texturas/textura-jean.jpg" 
      map_type 0
    }}
     
    #declare texturaPiel = pigment {
      image_map {
      jpeg "texturas/textura-piel.jpg" 
      map_type 0.1
    }}

 
//PERSONAJE 

    #declare cabeza = union { 
      //Sombrero
      cylinder {<0,17.4,0>,<0,18,0>,1.6 pigment {Black}}
      cylinder {<0,17.2,0>,<0,17.4,0>,2.5 pigment {Black}}
    
    
      sphere   { <0, 16, 0>, 2 }
      cylinder { <0, 16, 0>, <0, 15.5, 0>, 2 }
      sphere   { <0, 16, 0>, 2 }
      
      
      
      //Ojo Derecho
      sphere   { <1.6, 16.6, 0.5>, 0.4 pigment {White}}
      sphere   { <1.84, 16.65, 0.55>, 0.2 pigment {Black}}
      
      //Ojo Izquierdo
      sphere   { <1.6, 16.6, -0.5>, 0.4 pigment {White}}
      sphere   { <1.84, 16.65, -0.55>, 0.2 pigment {Black}}
      
      
    }
    
    #declare cuello = union {
      cylinder { <0, 14, 0>, <0, 13, 0>, 0.5 }
      sphere   { <0, 14, 0>, 0.5 }
      sphere   { <0, 13,   0>, 0.5 }
    }
    
    #declare cuerpo = union {
      cylinder { <0, 12.2, 0>, <0, 9.5, 0>, 1.5 }
      sphere   { <0, 12.2, 0>, 1.5 }
      sphere   { <0,  9.7, 0>, 1.5 }
    }
    
    #declare brazoDerecho = union {
      cylinder { <0, 12.8, 1.8>,<2.3, 12.8,1.8>, 0.4 }
      sphere   { <0, 12.8, 1.8>, 0.4 }
      sphere   { <2.3, 12.8, 1.8>, 0.4 }    
       pigment {texturaCuerpo}
     
    }      
     
    #declare brazoDerechoLargo = union {
      cylinder { <2.8, 12.8, 1.8>,<6, 12.8, 1.8>, 0.4 }
      sphere   { <2.8, 12.8, 1.8>, 0.4 }
      sphere   { <6, 12.8, 1.8>, 0.4 }
      sphere   { <6.7, 12.8, 1.8>, 0.6 } 
      
       pigment {texturaPiel}
    }
    
    #declare brazoIzquierdo = union {
      cylinder { <0, 12.8, -1.8>,<2.3, 12.8,-1.8>, 0.4 }
      sphere   { <0, 12.8, -1.8>, 0.4 }
      sphere   { <2.3, 12.8,-1.8>, 0.4 } 
      
       pigment {texturaCuerpo}
     
    }      
     
    #declare brazoIzquierdoLargo = union {
      cylinder { <2.8, 12.8, -1.8>,<6, 12.8, -1.8>, 0.4 }
      sphere   { <2.8, 12.8, -1.8>, 0.4 }
      sphere   { <6, 12.8, -1.8>, 0.4 }
      sphere   { <6.7, 12.8, -1.8>, 0.5 }    
      
       pigment {texturaPiel}
    }
     
    #declare piernaDerecha = union {
      cylinder { <0, 8, 0.6>,<0, 5.5,0.6>, 0.6 }
      sphere   { <0, 8,0.6>, 0.6 }
      sphere   { <0, 5.5,0.6>, 0.6 }
      
       pigment {texturaPantalon}
    }  
    
    #declare piernaDerechaLargo = union {
      cylinder { <0, 5, 0.6>,<0, 1.3,0.6>, 0.6 }
      sphere   { <0, 5,0.6>, 0.6 }
      sphere   { <0, 1.3,0.6>, 0.6 }
      
      cylinder { <0, 1.3,0.6>,<1, 1.3,0.6>, 0.6 pigment{Black}}
      sphere   { <0, 1.3,0.6>, 0.6 pigment{Black}}
      sphere   { <1, 1.3,0.6>, 0.6 pigment{Black}}
      
      pigment {texturaPantalon}
    }   
     
    #declare piernaIzquierda = union {
      cylinder { <0, 8, -0.6>,<0, 5.5,-0.6>, 0.6 }
      sphere   { <0, 8,-0.6>, 0.6 }
      sphere   { <0, 5.5,-0.6>, 0.6 }    
      
      pigment {texturaPantalon} 
    }
    #declare piernaIzquierdaLargo = union {
      cylinder { <0, 5, -0.6>,<0, 1.3,-0.6>, 0.6 }
      sphere   { <0, 5,-0.6>, 0.6 }
      sphere   { <0, 1.3,-0.6>, 0.6 }
      
      cylinder { <0, 1.3,-0.6>,<1, 1.3,-0.6>, 0.6 pigment{Black}}
      sphere   { <0, 1.3,-0.6>, 0.6 pigment{Black}}
      sphere   { <1, 1.3,-0.6>, 0.6 pigment{Black}}
      
      pigment {texturaPantalon}
    }           
  

//-----------------------------
//--- COMIENZO DE ANIMACI�N --
//-----------------------------
    
    #declare cabezaCuelloCuerpo = union{
        object { cabeza pigment {texturaPiel} }
        object { cuello pigment {texturaPiel}}
        object { cuerpo pigment {texturaCuerpo} }
    } 
    
    
    //Movimiento de  piernas al caer
    //Utilizado desde el frame 20 en adelante
      #declare piernasCaida = union{
          object { piernaDerecha
            rotate <0,0,-10>  
            translate -2*x
            translate 0*y
        }
        object { piernaDerechaLargo 
            rotate <0,0,-70>  
            translate -5.8*x
            translate 3.5*y
        }
        object { piernaIzquierda
            rotate <0,0,40>  
            translate 5*x
            translate 1.8*y
        }
        object { piernaIzquierdaLargo 
            rotate <0,0,25>  
            translate 3.5*x
            translate 1.8*y
            
        }
 
 
    };
    
    //Rama est�tica hasta el frame 18  
     #if(frame_number<19)
         object { rama }
         object { trampaRoja }
         
     #end 
    
    
    #declare loopframe=0; 
     
    #if(frame_number=7 | frame_number = 13)
        #declare loopframe=1;
    #end     
    
    #if(frame_number=6 | frame_number = 8 | frame_number = 12)
        #declare loopframe=2;
    #end
    
    #if(frame_number=5 | frame_number = 9 | frame_number=11)
        #declare loopframe=3;
    #end 
    
    #if(frame_number=10)
        #declare loopframe=4;
    #end 
    
    
//Inicio animaci�n de caminar
//4 movimientos que se repiten hasta el frame 13    

#if(frame_number=1 | loopframe=1)
  
    #declare personaje = union {   
    
        object{ cabezaCuelloCuerpo }
        
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho
            rotate <0,0,20>  
            translate 1.9*x
            translate -0.2*y
        }
        object { brazoDerechoLargo
            rotate <0,0,205>  
              translate -5.5*x
            translate 24.5*y
        }
        object { piernaDerecha
            rotate <0,0,-10>  
            translate -2*x
            translate 0*y
        }
        object { piernaDerechaLargo 
            rotate <0,0,-70>  
            translate -5.8*x
            translate 3.5*y
        }
        object { piernaIzquierda
            rotate <0,0,40>  
            translate 5*x
            translate 1.8*y
        }
        object { piernaIzquierdaLargo 
            rotate <0,0,25>  
            translate 3.5*x
            translate 1.8*y
            
        }

    };                                           
 
#end
          
          
#if( frame_number=2 | loopframe=2)
  
    #declare personaje = union { 
    
        object{ cabezaCuelloCuerpo } 
                
        object { brazoIzquierdo
            rotate <0,0,-50>  
            translate -9.8*x
            translate 4.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-30>  
            translate -7.5*x
            translate 1.4*y
         }
        object { brazoDerecho
            rotate <0,0,50>  
            translate 8*x
            translate 2.5*y
        }
        object { brazoDerechoLargo
          rotate <0,0,238>  
            translate -11.2*x
            translate 19.8*y
        }
        object { piernaDerecha}
        object { piernaDerechaLargo}
        object { piernaIzquierda}
        object { piernaIzquierdaLargo}
        
        translate 1.5*y
    }; 
                                         
 
#end          
          
          
          
#if( frame_number=3 | loopframe=3)
  
    #declare personaje = union {
    
        object{ cabezaCuelloCuerpo } 
        
         object { brazoIzquierdo
            rotate <0,0,50>  
            translate 8*x
            translate 2.5*y
        }
        object { brazoIzquierdoLargo
          rotate <0,0,238>  
            translate -11.2*x
            translate 19.8*y
        }
 
        object { brazoDerecho
            rotate <0,0,-50>  
            translate -9.8*x
            translate 4.5*y
        }
        object { brazoDerechoLargo
            rotate <0,0,-30>  
            translate -7.5*x
            translate 1.4*y
         }

        object { piernaIzquierda
            rotate <0,0,-10>  
            translate -2*x
            translate 0*y
        }
        object { piernaIzquierdaLargo 
            rotate <0,0,-70>  
            translate -5.8*x
            translate 3.5*y
        }
        object { piernaDerecha
            rotate <0,0,40>  
            translate 5*x
            translate 1.8*y
        }
        object { piernaDerechaLargo 
            rotate <0,0,25>  
            translate 3.5*x
            translate 1.8*y
            
        }
    }; 

#end        

#if(frame_number=4 | loopframe=4)
  
    #declare personaje = union {
       
        object{ cabezaCuelloCuerpo }
       
        object { brazoDerecho
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoDerechoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoIzquierdo
            rotate <0,0,20>  
            translate 1.9*x
            translate -0.2*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,205>  
            translate -5.5*x
            translate 24.5*y
        }
        object { piernaDerecha
            rotate <0,0,-10>  
            translate -2*x
            translate 0*y
        }
        object { piernaDerechaLargo 
            rotate <0,0,-70>  
            translate -5.8*x
            translate 3.5*y
        }
        object { piernaIzquierda
            rotate <0,0,40>  
            translate 5*x
            translate 1.8*y
        }
        object { piernaIzquierdaLargo 
            rotate <0,0,25>  
            translate 3.5*x
            translate 1.8*y
            
        }
    }; 
                                         
#end //Fin de animaci�n de caminar


//Animaci�n al saltar
 #if(frame_number>13 & frame_number<19)
  
    #declare personaje = union { 
    
        object{ cabezaCuelloCuerpo }
         
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho  
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
        }
        object { piernaDerecha
            rotate <0,0,-10>  
            translate -2*x
            translate 0*y
        }
        object { piernaDerechaLargo 
            rotate <0,0,-70>  
            translate -5.8*x
            translate 3.5*y
        }
        object { piernaIzquierda
            rotate <0,0,20>  
            translate 2.5*x
            translate 0.5*y
        }
        object { piernaIzquierdaLargo 
            rotate <0,0,25>  
            translate 2.8*x
            translate 1*y
            
        }
         translate (frame_number-12)*y
    }; 

#end //Fin de animaci�n al saltar

 #if(frame_number=18)
        #declare personaje = union {
        
        object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { piernaDerecha}
        object { piernaDerechaLargo}
        object { piernaIzquierda}
        object { piernaIzquierdaLargo}
            rotate<0,0,0>
        translate (frame_number-12)*y
    }; 
 
 #end
 
  #if(frame_number=19)
        #declare personaje = union {
        
        object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { piernaDerecha}
        object { piernaDerechaLargo}
        object { piernaIzquierda}
        object { piernaIzquierdaLargo}
        translate (frame_number-12)*y
    };
       
       object { trampaRoja }
       
       object { rama 
         rotate<0,0,10>
         translate 4.8*x
         translate -1*y
      } 

 #end
 
  //Movimmiento de rama en diagonal
  #if(frame_number>19 & frame_number<24)
     object { rama 
        rotate<0,0,25>
         translate 14*x
         translate -6*y
     } 
  #end 
 
  
   #if(frame_number=20)
        #declare personaje = union {
        
        object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { piernasCaida}
        
            rotate<0,0,30>
            translate (frame_number-15)*y
            translate (frame_number-10)*x
    };
        
    object { trampaRoja 
             translate -5*y
    } 
 
 #end 
 
 
  #if(frame_number=21)
        #declare personaje = union {
        
        object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { piernasCaida}
        
        rotate<0,0,40>
        translate (frame_number-15)*y
        translate (frame_number-10)*x
    };
    
    object { trampaRoja 
             translate -11.5*y
             translate 2*x
    }      
  #end

  #if(frame_number=22)
        #declare personaje = union {
        
        object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        } 
        
        object { piernasCaida}               
            
        rotate<0,0,40>
        translate (frame_number-20)*y
        translate (frame_number-11)*x
    };
    
    object { trampaRoja 
             translate -14*y
             translate 2.5*x
    }
      
  #end 
  
  
 
  #if(frame_number=23)
        #declare personaje = union {
        
        object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }  
        
        object { piernasCaida}
        
        rotate<0,0,60>
        translate (frame_number-25)*y
        translate (frame_number-11)*x
    };
    
    object { trampaRoja 
             translate -18*y
             translate 4*x
    }
 #end
 
   #if(frame_number=24)
        #declare personaje = union {
        
        object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }                       
        
        object { piernasCaida } 
        
        rotate<0,0,60>
        translate (frame_number-35)*y
        translate (frame_number-11)*x
    };
    
    
     //Rama
     object { rama 
        rotate<0,0,10>
         translate 5.2*x
         translate -2.5*y
     } 
    
    object { trampaRoja 
             translate -19*y
             translate 3*x
    }
    
      
 #end
 
  //rama est�tica hasta el final
  #if(frame_number>24)
     object { rama } 
 #end  
 
   #if(frame_number=25)
        #declare personaje = union {
       
       object{ cabezaCuelloCuerpo } 
        
        object { brazoIzquierdo
            rotate <0,0,-30>  
            translate -6.5*x
            translate 1.5*y
        }
        object { brazoIzquierdoLargo
            rotate <0,0,-15>  
            translate 1.5*(-2.8*x)
           translate -0.1*y
         }
        object { brazoDerecho  
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
        object { brazoDerechoLargo 
            rotate <0,0,20>  
            translate 4.5*x
            translate 0.5*y
        }
       object { piernasCaida }
       
        rotate<0,0,70>
        translate (frame_number-45)*y
        translate (frame_number-11)*x
    };
    
    object { trampaRoja 
             translate -24*y
             translate 4*x
    }
      
 #end
 
 
 
//Caida de trampa roja
 
#if(frame_number=26)         
    object { trampaRoja 
       translate -28*y
       translate 4*x
    }   
      
#end

#if(frame_number=27)          
    object { trampaRoja 
       translate -33*y
       translate 4*x
    }         
#end

#if(frame_number=28)          
    object { trampaRoja 
       translate -39*y
       translate 4*x
    }         
#end         

#if(frame_number=29)          
    object { trampaRoja 
       translate -44*y
       translate 4*x
    }         
#end      
 
#if(frame_number>0 & frame_number<26)      
  object { personaje
  translate (frame_number+1)*x
 }

#end 

