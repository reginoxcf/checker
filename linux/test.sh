g++ a.cpp -std=c++17 -lm -O2 -o a  || { echo "Compile Error"; exit 1; }
# /usr/bin/time -f "Time: %Us" ./a < test.inp > test.out
ts=$(date +%s%N)
./a < test.inp > test.out
echo $'Time:' $((($(date +%s%N) - $ts)/1000000)) $'ms'
