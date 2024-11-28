#include <cmath>
#include <iostream>


namespace var5 {
    struct S {
        const float c = 6312.0;

        void check(bool res) {
            if (res)
                puts("Access granted");
            else
                puts("Access denied");
        }
    };

    extern "C" void access5(int r8, double r8_8, int edx, float xmm0) {
        S s;
        bool res = false;
        if (r8 >> 20 == r8) {
            if (std::isinf(r8_8)) {
                res = (float(edx) - xmm0) == s.c;
            }
        }
        s.check(res);
    }
}


int main() {
    var5::access5(0, std::numeric_limits<double>::infinity(), 6312, 0);
    return 0;
}