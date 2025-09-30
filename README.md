
## Sorting Algorithms (C)

This repository contains C implementations of classic sorting algorithms with an interactive command‑line interface (CLI). The program supports:
- integer arrays
- singly linked lists of words
- 5x5 matrices of strings

For each run, the program prints intermediate states and tracks the number of comparisons (`nbComp`) and permutations (`nbPerm`).

### Repository Structure
```
les-algorithmes-de-tri/
  ├─ algoo/
  │   └─ tri            # C source file (no extension)
  └─ README.md
```

### Prerequisites
- C compiler: GCC or Clang
- Windows PowerShell (or any POSIX‑compatible shell on Linux/macOS)

### Build
The source file has no extension. Pass the language explicitly to the compiler, or rename it to `tri.c`.

- GCC (Windows/MinGW, Linux, macOS):
```
gcc -x c -std=c11 -O2 -Wall -Wextra -o tri.exe algoo/tri
```

- Clang:
```
clang -x c -std=c11 -O2 -Wall -Wextra -o tri.exe algoo/tri
```

Alternative (after renaming `algoo/tri` to `algoo/tri.c`):
```
gcc -std=c11 -O2 -Wall -Wextra -o tri.exe algoo/tri.c
```

### Run
```
./tri.exe
```
You will see a menu:
```
1. Array
2. Linked List
3. Matrix
4. Exit
```
Choose a data structure, then select a sorting algorithm. The program prints intermediate states and final totals for comparisons and permutations.

### Implemented Algorithms
- Arrays (`int[]`):
  - Selection Sort
  - Bubble Sort
  - Insertion Sort
  - Quick Sort
  - Merge Sort
  - Comb Sort

- Linked Lists (`Node*` of words):
  - Insertion Sort
  - Bubble Sort

- Matrices (`char[MAX_ROWS][MAX_COLS]`, default 5x5):
  - Bubble Sort
  - Merge Sort

### Implementation Notes
- Source file: `algoo/tri`
- Defaults: `MAX_ROWS = 5`, `MAX_COLS = 5`
- Random data uses `rand()`; to vary results between runs, initialize the seed (e.g., `srand(time(NULL));`).
- Global counters `nbComp` and `nbPerm` track comparisons and permutations.

### Limitations and Future Work
- Fixed matrix size and a small predefined word set (demonstration purposes)
- No file I/O or automated tests yet
- Potential enhancements: alternative Quick Sort pivots, Comb Sort gap variants, non‑interactive benchmarking mode

### Contributing
1. Fork the repository
2. Create a branch: `git checkout -b feature/your-feature`
3. Commit: `git commit -m "feat: add <your-feature>"`
4. Push: `git push origin feature/your-feature`
5. Open a Pull Request

### License
MIT (add a `LICENSE` file if needed).

