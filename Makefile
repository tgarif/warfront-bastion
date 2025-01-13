# Compiler and tools
CC_LINUX = gcc
CC_WINDOWS = x86_64-w64-mingw32-gcc
WINDRES = x86_64-w64-mingw32-windres

# Flags
CFLAGS_LINUX = -Wall -Wextra -std=c11 -Iinclude -Iraylib/include
CFLAGS_WINDOWS = -Wall -Wextra -std=c11 -Iinclude -Iraylib/include

# Linker flags (for raylib and its dependencies)
LDFLAGS_LINUX = -L./raylib/lib_linux -Wl,-rpath,./raylib/lib_linux -lraylib -lGL -lpthread -ldl -lrt -lX11 -lm
LDFLAGS_WINDOWS = -L./raylib/lib_windows -lraylib -lopengl32 -lgdi32 -lwinmm

# Source files and output
SRCDIR = src
OBJDIR_LINUX = build_linux/obj
OBJDIR_WINDOWS = build_windows/obj
SRC = $(wildcard $(SRCDIR)/*.c)
OBJ_LINUX = $(SRC:$(SRCDIR)/%.c=$(OBJDIR_LINUX)/%.o)
OBJ_WINDOWS = $(SRC:$(SRCDIR)/%.c=$(OBJDIR_WINDOWS)/%.obj)
OUT_LINUX = build_linux/warfront-bastion
OUT_WINDOWS = build_windows/warfront-bastion.exe

# Icon resource for Windows
ICON_RC = resources/icons/warfront-bastion.rc
ICON_RES = build_windows/warfront-bastion.res

# Build target
all: linux windows

# Linux build
linux: $(OUT_LINUX)

$(OBJDIR_LINUX)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR_LINUX)
	$(CC_LINUX) $(CFLAGS_LINUX) -c $< -o $@

$(OUT_LINUX): $(OBJ_LINUX)
	$(CC_LINUX) $(CFLAGS_LINUX) $^ -o $@ $(LDFLAGS_LINUX)

# Windows build
windows: $(OUT_WINDOWS)

$(OBJDIR_WINDOWS)/%.obj: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR_WINDOWS)
	$(CC_WINDOWS) $(CFLAGS_WINDOWS) -c $< -o $@

$(OUT_WINDOWS): $(OBJ_WINDOWS)
	$(CC_WINDOWS) $(CFLAGS_WINDOWS) $^ -o $@ $(LDFLAGS_WINDOWS) -mwindows

# Compile resource file for Windows
$(ICON_RES): $(ICON_RC)
	$(WINDRES) $(ICON_RC) -O coff -o $(ICON_RES)

# Run targets
run_linux:
	./$(OUT_LINUX)

run_windows:
	wine ./$(OUT_WINDOWS)

# Clean targets
clean:
	rm -rf build_linux build_windows

rebuild: clean all

.PHONY: all linux windows clean rebuild run_linux run_windows
