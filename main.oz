functor
import
    Browser 
    Circuito at 'pratica3.ozf'
    Portas at 'portaslogicas.ozf'
define
    A = [1 0 0 1]
    B = [1 0 1 0]
    C = [1 1]

    {Browser.browse 'A#B'}
    {Browser.browse A#B}

    % Portas logicas basicas:
    {Browser.browse 'Porta Not'}
    {Browser.browse {Portas.portaNot A}}

    {Browser.browse 'Porta And'}
    {Browser.browse {Portas.portaAnd A B}}

    {Browser.browse 'Porta Or'}
    {Browser.browse {Portas.portaOr A B}}

    {Browser.browse 'Porta Nand'}
    {Browser.browse {Portas.portaNand A B}}

    {Browser.browse 'Porta Nor'}
    {Browser.browse {Portas.portaNor A B}}

    {Browser.browse 'Porta Xor'}
    {Browser.browse {Portas.portaXor A B}}

    {Delay 10000}
    % Funtores criados a partir do funtor de porta logica
    {Browser.browse 'Multiplexador de 4 entradas'}
    {Browser.browse {Circuito.mux A C}}
    
    {Browser.browse 'Demultiplexador de 4 saidas'} 
    {Browser.browse {Circuito.demux [1] C}}

    {Browser.browse 'Comparador de magnitude e igualdade'} 
    {Browser.browse {Circuito.comparar A B}}

    
end 
 
