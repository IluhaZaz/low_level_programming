#include <iostream>
#include <cmath>


namespace var5 {

    void check(bool res) {
        if (res)
            puts("Access granted");
        else
            puts("Access denied");
        exit(0);
    }

    struct S {
        /**/
    };

    class C {
    public:
        bool hard_check(int rax, float* arr, float r_13, int* r12) {
            int res = 0;
            int esi;
            if ((rax & rax) == 0) {
                esi = 0;
            }
            else {
                esi = 0;
                float* start = arr;
                float* end = arr + 4;
                while (start < end) {
                    if (std::isnan(*start)) {
                        esi = 1;
                    }
                    start ++;
                }
            }
            if (r12[0] == esi) {
                res = std::isinf(r_13);
                if (r12[1] == res)
                    res = 1;
                else
                    res = 0;
            }
            return res;
        }

    };

    void access5(int* rcx, int rdx, float* arr) {
        rcx[0] *= rcx[1];
        if ((rcx[0] & rcx[0]) == 0) {
            rcx[0] ^ rcx[0];
            check(rcx[0]);
        }
        C _class;
        bool res = _class.hard_check(rdx, arr, *arr, rcx);
        check(res);
    }
}

void main() {
    int rcx[2] = { 1, 1 };
    float arr[4] = { std::numeric_limits<float>::infinity(), 0,std::numeric_limits<double>::quiet_NaN(), 0 };
    var5::access5(rcx, 4, arr);
}