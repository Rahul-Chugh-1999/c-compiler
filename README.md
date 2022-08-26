# Build
Dependencies
-   Flex
-   Bison
To build compiler.out
```bash
make
```

# Using compiler
To generate assembly of sample-test.c
```bash
./compiler.out sample-test.c sample-quad.out sample-assembly.s
```
To generate machine code
```
gcc sample-assembly.s sample-machine-code.out
```
To execute
```
./sample-machine-code.out
```
