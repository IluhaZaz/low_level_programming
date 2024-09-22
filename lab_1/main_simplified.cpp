#include <stdio.h>
#include <stdint.h>


void main() {
    uint32_t state[4];

    printf("Enter seed for generator\n");
    uint32_t seed;
    scanf("%u", &seed);

    state[0] = 0;
    state[1] = 0;
    state[2] = 0;
    state[3] = seed;

    int i = 0;

    cycle_start:
        uint32_t t = state[3];
        const uint32_t s = state[0];

        state[3] = state[2];
        state[2] = state[1];
        state[1] = s;

        uint32_t temp = t << 11;

        t ^= temp;
        temp = t >> 8;
        t ^= temp;
        t ^= s;
        temp = s >> 19;
        t ^= temp;

        state[0] = t;
        printf("%u\n", t);
        i += 1;

        if (i != 100)
            goto cycle_start;
}