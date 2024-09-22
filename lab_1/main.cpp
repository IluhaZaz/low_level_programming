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

    for(int i = 0; i < 100; ++i)
    {
        uint32_t t = state[3];
        const uint32_t s = state[0];

        state[3] = state[2];
        state[2] = state[1];
        state[1] = s;

        t ^= t << 11;
        t ^= t >> 8;
        t ^= s;
        t ^= s >> 19;

        state[0] = t;
        printf("%u\n", t);
    }
}