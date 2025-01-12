# Warfront Bastion

> [!WARNING]
> This game is under activate development. Anything can change at any moment without any notice!

A 2D stronghold defense game with strategic weapon upgrades and intense battles.

## Overview

This is a 2D game where players defend their stronghold against waves of enemies.
Players can upgrade their arsenal and adapt their strategy to overcome increasing challenges.
The game combines fast-paced action with strategic decision-making.

## Features

- Dynamic Gameplay: Defend against waves of enemies with increasing difficulty.
- Upgrade System: Unlock and deploy new weapons or enhancements as you progress.
- Tactical Choices: Strategically build your arsenal to suit your playstyle.

## Technologies

- **C**: Core programming language for game logic.
- **raylib**: Library for graphics, audio and input handling.

## Getting Started

#### Prerequisites

- [Make](https://www.gnu.org/software/make/)
- [C Compiler](https://gcc.gnu.org/) (e.g., GCC or Clang)
- [MinGW](https://www.mingw-w64.org/) for corss-compilation to Windows on Linux

#### Setup

1. Clone the repository:

```bash
git clone https://github.com/tgarif/warfront-bastion.git
cd warfront-bastion
```

2. Build the project for your platform:

- Linux:

  ```bash
  make linux
  ```

- Windows:

  ```bash
  make windows
  ```

Or build for both platforms:

```bash
make
```

3. Run the game:

- On Linux, you can simply run the game inside the `./build_linux` directory.

```bash
./build_linux/warfront-bastion # On Linux
```

- On Windows, you need to copy the dll files inside `./raylib/lib_windows/*.dll` and copy the executable inside `./build_windows` into your game directory in windows before running it.

```bash
<windows-game-dir>/warfront-bastion.exe # On Windows
```

## License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) for details.
