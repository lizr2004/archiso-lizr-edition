PROB=main
CXX=g++
CXXFLAGS=-g -lm -Wall -Wextra -D DEBUG
DEBUGGER=gdb
RM=rm

$(PROB).bin: $(PROB).cpp
	$(CXX) $(PROB).cpp -o $(PROB).bin $(CXXFLAGS)

run: $(PROB).bin
	@echo '------$(PROB).bin started------'
	@bash -c "time ./$(PROB).bin"
	@echo '------$(PROB).bin end------'

pipein: $(PROB).in $(PROB).bin
	@echo '------$(PROB).bin started------'
	@bash -c "time ./$(PROB).bin < $(PROB).in"
	@echo '------$(PROB).bin end------'

pipeio: $(PROB).in $(PROB).bin
	@echo '------$(PROB).bin started------'
	@bash -c "time ./$(PROB).bin < $(PROB).in > $(PROB).out"
	@echo '------$(PROB).bin end------'

clip: $(PROB).cpp
	xclip -selection c $(PROB).cpp

debug: $(PROB).bin
	$(DEBUGGER) $(PROB).bin

clean: 
	$(RM) *.bin

.PHONY: defualt run debug pipein pipeio clean
