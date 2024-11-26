#include <cmath>
#include <iostream>


namespace var5 {
    struct S {
        const float c = 6312.0;

        bool check(bool res) {
            if (res)
                std::cout << "Access granted";
            else
                std::cout << "Access denied";
            return res;
        }
    };

    extern "C" void access5(int a, double b, int c, float d) {
        S s;
        bool res = false;
        if (a >> 20 == a) {
            if (std::isinf(b)) {
                res = (float(c) - d) == s.c;
            }
        }
        s.check(res);
    }
}


int main() {
    var5::access5(0, std::numeric_limits<double>::infinity(), 6312, 0);
    return 0;
}