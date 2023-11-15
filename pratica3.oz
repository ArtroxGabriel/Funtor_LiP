functor
import
    Browser
    Porta at '/media/artroxgabriel/Selene/UFC/2023.2/LiP/oz/portaslogicas.ozf'
export
    multiplexador:Mux4 %demultiplexador:Demultplexador 
define
    fun {Mux4 Entrada Controle} 
        And1 And2 And3 And4 Saida
        E1 = Entrada.1
        E2 = Entrada.2.1
        E3 = Entrada.2.2.1 
        E4 = Entrada.2.2.2.1 
        C1 = Controle.1
        C2 = Controle.2.1
    in  
        And1 = {Porta.portaAnd {Porta.portaNot C1 } {Porta.portaAnd {Porta.portaNot C2} E1 }}
        And2 = {Porta.portaAnd C1 {Porta.portaAnd {Porta.portaNot C2} E2 }}
        And3 = {Porta.portaAnd {Porta.portaNot C1 } {Porta.portaAnd C2 E3}}
        And4 = {Porta.portaAnd C1 {Porta.portaAnd C2 E4 }}
        
        Saida = {Porta.portaOr {Porta.portaOr And1 And2} {Porta.portaOr And3 And4 }}
    end 

    
    {Browser.browse {Mux4 0|0|0|1 1|1}}
end
    