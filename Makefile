CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra
TARGET = palindromer
SOURCES = palindrome.cpp cmdLine.cpp trie.cpp
OBJECTS = $(SOURCES:.cpp=.o)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

install: $(TARGET)
	cp $(TARGET) /usr/local/bin/

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all     - Build the palindromer executable"
	@echo "  clean   - Remove compiled files"
	@echo "  install - Install to /usr/local/bin (requires sudo)"
	@echo "  help    - Show this help message"
