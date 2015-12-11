#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    
    FILE* file = fopen("input", "r");
    if (file == NULL) {
        fprintf(stderr, "File doesn't exist!");
        return 1;
    }
    char* input = malloc(8194);
    fread(input, 8194, 1, file);
    fclose(file);

    char grid[1024][1024];

    int i, x, y;
    for (x = 0; x < 1024; x++) {
        for (y = 0; y < 1024; y++) {
            grid[x][y] = 0;
        }
    }
    grid[512][512] = 1;

    x = y = 0;
    for (i = 0; i < 8192; i++) {
        char c = input[i];
        switch (c) {
            case '^': y++; break;
            case 'v': y--; break;
            case '<': x++; break;
            case '>': x--; break;
        }
        grid[x+512][y+512] = 1;
    }

    int count = 0;
    for (x = 0; x < 1024; x++)
        for (y = 0; y < 1024; y++)
            if (grid[x][y] == 1)
                count++;

    fprintf(stdout, "Santa visited %d houses.\n", count);
    return 0;
}
