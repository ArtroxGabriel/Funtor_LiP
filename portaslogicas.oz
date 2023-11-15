functor
export 
   portaNot:NotGate 
   portaAnd:AndG 
   portaOr:OrG 
   portaNand:NandG
   portaNor:NorG
   portaXor:XorG
define
   
   fun {GateMaker F}
      fun {$ Xs Ys}
         fun {GateLoop Xs Ys}
       case Xs#Ys of (X|Xr)#(Y|Yr) then
          {F X Y}|{GateLoop Xr Yr}
       end
         end
      in
         thread {GateLoop Xs Ys} end
      end
   end

   fun {NotGate Xs}
      case Xs of X|Xr then  (1-X)|thread {NotGate Xr} end
      else nil
      end   
   end

   % And logico
   AndG ={GateMaker fun {$ X Y} X*Y end}

   % Org logico
   OrG ={GateMaker fun {$ X Y} X+Y-X*Y end}
   
   % 'Not and' logico
   NandG={GateMaker fun {$ X Y} 1-X*Y end}
   
   % 'Not or' logic
   NorG ={GateMaker fun {$ X Y} 1-X-Y+X*Y end}
   
   % 'or exclusive' logico
   XorG ={GateMaker fun {$ X Y} X+Y-2*X*Y end}



end   




