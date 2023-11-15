functor
import
    Browser
    Porta at 'portaslogicas.ozf'
export
    mux:Mux4 
    demux:Demux4
    comparar:Comparador
define
    % Multiplexador de 4 
    fun {Mux4 E C}
        local And0 And1 And2 And3
        in
          And0 =  {Porta.portaAnd E.2.2.2.1|nil {Porta.portaAnd {Porta.portaNot C.1|nil} {Porta.portaNot C.2.1|nil}}}
          And1 =  {Porta.portaAnd E.2.2.1|nil {Porta.portaAnd {Porta.portaNot C.1|nil} C.2.1|nil}}
          And2 =  {Porta.portaAnd E.2.1|nil {Porta.portaAnd C.1|nil {Porta.portaNot C.2.1|nil}}}
          And3 =  {Porta.portaAnd E.1|nil {Porta.portaAnd C.1|nil C.2.1|nil}}
        
                {Porta.portaOr {Porta.portaOr And0 And1} {Porta.portaOr And2 And3}}
        end 
     end
    % Demultiplexador de 4
    fun {Demux4 E C}
        local S0 S1 S2 S3
        in
            S0 = {Porta.portaAnd E {Porta.portaAnd {Porta.portaNot C.1|nil } {Porta.portaNot C.2.1|nil }}}
            S1 = {Porta.portaAnd E {Porta.portaAnd {Porta.portaNot C.1|nil } C.2.1|nil }}
            S2 = {Porta.portaAnd E {Porta.portaAnd C.1|nil {Porta.portaNot C.2.1|nil } }}
            S3 = {Porta.portaAnd E {Porta.portaAnd C.1|nil C.2.1|nil }}
            [S0.1 S1.1 S2.1 S3.1]
        end 
    end 

    % Comparador
    fun {Comparador A B}
        local AndEqual OrMaior And1 And2 And3 And4 Xor1 Xor2 Xor3 Xor4
        in
            Xor1 = {Porta.portaXor A.2.2.2.1|nil {Porta.portaNot B.2.2.2.1|nil}}
            Xor2 = {Porta.portaXor A.2.2.1|nil {Porta.portaNot B.2.2.1|nil}}
            Xor3 = {Porta.portaXor A.2.1|nil {Porta.portaNot B.2.1|nil}}
            Xor4 = {Porta.portaXor A.1|nil {Porta.portaNot B.1|nil}}

            AndEqual = {Porta.portaAnd {Porta.portaAnd Xor1 Xor2 } {Porta.portaAnd Xor3 Xor4 }}

            And1 = {Porta.portaAnd {Porta.portaAnd A.1|nil {Porta.portaNot B.1|nil} } {Porta.portaAnd Xor2 {Porta.portaAnd Xor3 Xor4} }}
            And2 = {Porta.portaAnd {Porta.portaAnd A.2.1|nil {Porta.portaNot B.2.1|nil} } {Porta.portaAnd Xor3 Xor4 }}
            And3 = {Porta.portaAnd {Porta.portaAnd A.2.2.1|nil {Porta.portaNot B.2.2.1|nil} } Xor4 }
            And4 = {Porta.portaAnd A.2.2.2.1|nil {Porta.portaNot B.2.2.2.1|nil} } 
            OrMaior = {Porta.portaOr {Porta.portaOr And1 And2 } {Porta.portaOr And3 And4 }}

            igual(AndEqual.1)#maior(OrMaior.1)
        end
    end

    {Browser.browse {Mux4 [0 1 0 1] [0 1]}}
    {Browser.browse {Demux4 [1] [1 1]}}
    {Browser.browse {Comparador [1 1 1 1] [1 1 1 0]}}


end
    