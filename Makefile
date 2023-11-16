# Makefile for programa Oz

# Lista de arquivos fonte
SRCS = portaslogicas.oz pratica3.oz main.oz

# Lista de arquivos objeto
OBJS = $(SRCS:.oz=.ozf)

# Nome do executável
EXEC = main.ozf

# Comando para compilar os arquivos .oz para .ozf
OZC = ozc -c

# Comando para executar o programa Oz
OZENGINE = ozengine

.PHONY: all run clean cleanall

all: $(EXEC)

# Regra padrão para compilar arquivos .oz para .ozf
%.ozf: %.oz
	$(OZC) $< -o $@

# Regra para compilar todos os arquivos
$(EXEC): $(OBJS)

# Regra para executar o programa Oz
run: $(EXEC)
	$(OZENGINE) $(EXEC)

# Regra para limpar os arquivos objeto e executável
clean:
	rm -f $(OBJS)

# Regra para limpar todos os arquivos .ozf, exceto main.ozf
cleanall:
	rm -f $(filter-out $(EXEC), $(OBJS))